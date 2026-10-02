"""The new ear for "Hey Claude": listens to the mic and tells claude-hey-claude.ahk when you say
"Hey Claude" on its own.

The old ear (Windows' speech recognizer, told to listen for just "Hey Claude") squeezed everything
you said into "Hey Claude", so ordinary talk kept setting it off. This one has two checks, both
offline on this PC:
  1. Your talking is cut into bits at the pauses (Silero's voice detector). Only a short bit with a
     pause before and after it counts, the way you say "Hey Claude" and wait for the beep. So
     "So Claude, what do you think" or "I said hey Claude and it..." never gets further.
  2. Whisper writes down what that short bit said, and it has to be just "Hey Claude".
openWakeWord's "hey claude" model scores each bit too, for the log, and when it's sure but Whisper
wrote down something else, Whisper listens again, told to expect "Hey Claude" (see HINT_AT).

  --shadow        only note what it would have done, in ear-log.txt, without waking anything
  --parent <pid>  exit when that program does (claude-hey-claude.ahk passes its own)
  --file <wav>    listen to a recording (16 kHz mono) instead of the mic, for testing

When it hears "Hey Claude", it broadcasts the window message "ClaudeHeyClaude.Ear". And while it
hears someone talking, it tells the program that started it (--parent) with "ClaudeHeyClaude.Talking"
a few times a second, so voice mode knows you're still talking even in a noisy room (a game, a fan),
where the mic's loudness alone can't tell.
"""
import argparse, concurrent.futures, ctypes, os, queue, re, sys, threading, time, traceback, wave
from collections import deque
from datetime import datetime

HERE = os.path.dirname(os.path.abspath(__file__))
LOG_FILE = os.path.join(HERE, "ear-log.txt")
CLIPS_DIR = os.path.join(HERE, "clips")                     # each "Hey Claude" it heard, for checking later
MODELS = os.path.join(HERE, "models")

# ---- Settings ----------------------------------------------------------------
RATE = 16000
CHUNK = 1280               # 80 ms, what openWakeWord takes
SPEECH = 0.5               # how sure the voice detector must be that a bit of sound is talking (0 to 1)
PAUSE_MS = 400             # the quiet that ends a bit of talking, before and after "Hey Claude"
MIN_MS, MAX_MS = 250, 2000 # how long "Hey Claude" on its own can be (just the talking part)
LEAD_MS = 320              # audio kept from before the talking started, so Whisper hears the start
WHISPER = "tiny.en"        # the Whisper model: tiny.en (fastest) or base.en
HEY = {"hey", "hay", "hi", "hei"}
CLAUDE = {"claude", "claud", "clyde", "clod", "clawed", "klaud"}   # how Whisper writes it down in your voice
CLOUD = {"cloud"}          # ...and ones that also need the "hey claude" model to agree (it gives "hey cloud" 0)
HINT_AT = 0.5              # how sure the model must be for Whisper to listen again, told to expect "Hey Claude"
KEEP_CLIPS = 40
# -------------------------------------------------------------------------------

log_lines = []   # (what's in ear-log.txt, see log)
try:
    with open(LOG_FILE, encoding="utf-8") as f:
        log_lines.extend(line.rstrip("\n") for line in f)
except OSError:
    pass


def log(msg):
    """Adds a line to ear-log.txt, which keeps the last 300 or so: added to the end, and once there are
    400 the file is written again with just the newest 300."""
    line = datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "  " + msg
    log_lines.append(line)
    try:
        if len(log_lines) <= 400:
            with open(LOG_FILE, "a", encoding="utf-8") as f:
                f.write(line + "\n")
        else:
            del log_lines[:-300]
            with open(LOG_FILE, "w", encoding="utf-8") as f:
                f.write("\n".join(log_lines) + "\n")
    except OSError:
        pass


def gave_up(why):
    """Notes in ear-log.txt why the ear couldn't keep going, with the whole error, and exits. Run as
    pythonw (as claude-hey-claude.ahk runs it) there's no window to print an error to, so without
    this a broken install (after a Python, numpy or onnxruntime update, say) just died with nothing
    said anywhere, and "Hey Claude" stopped working with no clue why."""
    log(why + "; stopping:\n" + traceback.format_exc().rstrip())
    sys.exit(1)


# (Loaded here, after log and gave_up, rather than with the others at the top: if it's broken, that's
# the first thing to fail, and it can still be noted in the log.)
try:
    import numpy as np
except Exception:
    gave_up("Couldn't load numpy")


def is_wake(text, peak):
    words = re.findall(r"[a-z']+", text.lower())
    return len(words) == 2 and words[0] in HEY and (words[1] in CLAUDE or words[1] in CLOUD and peak >= 0.5)


def loudness(audio):
    """The loudest 20 ms, from 0 (silent) to 1 (as loud as the mic goes), as the old ear measured it."""
    frames = audio[: len(audio) // 320 * 320].astype(np.float64).reshape(-1, 320)
    return float(np.sqrt((frames ** 2).mean(axis=1)).max() / 32768) if len(frames) else 0.0


def save_clip(audio):
    os.makedirs(CLIPS_DIR, exist_ok=True)
    path = os.path.join(CLIPS_DIR, datetime.now().strftime("%Y%m%d-%H%M%S") + ".wav")
    with wave.open(path, "wb") as w:
        w.setnchannels(1), w.setsampwidth(2), w.setframerate(RATE)
        w.writeframes(audio.tobytes())
    clips = sorted(os.listdir(CLIPS_DIR))
    for old in clips[:-KEEP_CLIPS]:
        try:
            os.remove(os.path.join(CLIPS_DIR, old))
        except OSError:
            pass


def script_window(pid):
    """The hidden main window of the AutoHotkey script with this process id, or 0."""
    found = []
    user32 = ctypes.windll.user32

    @ctypes.WINFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p)
    def each(hwnd, _):
        owner = ctypes.c_ulong()
        user32.GetWindowThreadProcessId(ctypes.c_void_p(hwnd), ctypes.byref(owner))
        if owner.value == pid:
            name = ctypes.create_unicode_buffer(64)
            user32.GetClassNameW(ctypes.c_void_p(hwnd), name, 64)
            if name.value == "AutoHotkey":
                found.append(hwnd)
                return False
        return True

    user32.EnumWindows(each, None)
    return found[0] if found else 0


def watch_parent(pid):
    """Exits once the program that started this one has."""
    k32 = ctypes.windll.kernel32
    handle = k32.OpenProcess(0x100000, False, pid)   # SYNCHRONIZE
    if not handle:
        os._exit(0)
    k32.WaitForSingleObject(handle, 0xFFFFFFFF)
    os._exit(0)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--shadow", action="store_true")
    ap.add_argument("--parent", type=int, default=0)
    ap.add_argument("--file", default="")
    args = ap.parse_args()
    if sys.stdout is None or sys.stderr is None:   # (run without a window, as pythonw: nowhere to print)
        sys.stdout = sys.stderr = open(os.devnull, "w")
    if args.file:   # (a test: its notes go to the screen, not the log)
        global log
        log = lambda msg: print(msg, flush=True)

    # One at a time.
    if not args.file:
        ctypes.windll.kernel32.CreateMutexW(None, False, "ClaudeHeyClaudeEar" + ("Shadow" if args.shadow else ""))
        if ctypes.windll.kernel32.GetLastError() == 183:   # ERROR_ALREADY_EXISTS
            return
    ctypes.windll.kernel32.SetPriorityClass(ctypes.windll.kernel32.GetCurrentProcess(), 0x4000)   # below normal, so games come first
    if args.parent:
        threading.Thread(target=watch_parent, args=(args.parent,), daemon=True).start()

    try:
        import sounddevice as sd
        from faster_whisper import WhisperModel
        from openwakeword.model import Model
        from openwakeword.vad import VAD

        t0 = time.perf_counter()
        oww = Model(wakeword_models=[os.path.join(MODELS, "hey_claude.onnx")], inference_framework="onnx")
        vad = VAD()
        whisper = WhisperModel(WHISPER, device="cpu", compute_type="int8", cpu_threads=4, download_root=MODELS)
    except Exception:
        gave_up("Couldn't load the voice detector, the \"hey claude\" model or Whisper")
    wake_msg = ctypes.windll.user32.RegisterWindowMessageW("ClaudeHeyClaude.Ear")
    talk_msg = ctypes.windll.user32.RegisterWindowMessageW("ClaudeHeyClaude.Talking")
    listener = {"hwnd": 0, "sent": 0.0}
    pool = concurrent.futures.ThreadPoolExecutor(max_workers=1)

    def tell_talking():
        """Tells the listener you're talking, at most 4 times a second."""
        now = time.monotonic()
        if not args.parent or now - listener["sent"] < 0.25:
            return
        listener["sent"] = now
        if not listener["hwnd"] or not ctypes.windll.user32.PostMessageW(ctypes.c_void_p(listener["hwnd"]), talk_msg, 0, 0):
            listener["hwnd"] = script_window(args.parent)   # (found the first time, or again if it changed)
            if listener["hwnd"]:
                ctypes.windll.user32.PostMessageW(ctypes.c_void_p(listener["hwnd"]), talk_msg, 0, 0)
                if not listener.get("told"):
                    listener["told"] = True
                    log("Telling claude-hey-claude.ahk when someone's talking")

    def transcribe(audio, hint=None):
        start = time.perf_counter()
        segs, _ = whisper.transcribe(audio.astype(np.float32) / 32768, language="en", beam_size=1,
                                     without_timestamps=True, condition_on_previous_text=False, initial_prompt=hint)
        return " ".join(s.text.strip() for s in segs).strip(), (time.perf_counter() - start) * 1000

    chunks = queue.Queue()

    def heard(indata, frames, when, status):
        chunks.put(indata[:, 0].copy())

    pause_chunks = PAUSE_MS * RATE // 1000 // CHUNK
    lead = deque(maxlen=LEAD_MS * RATE // 1000 // CHUNK)
    talk = None   # the bit of talking going on: its audio, how many chunks were talking, the quiet after it, and so on

    if args.file:
        with wave.open(args.file, "rb") as w:
            recording = np.frombuffer(w.readframes(w.getnframes()), dtype=np.int16)
        for i in range(0, len(recording) - CHUNK + 1, CHUNK):
            chunks.put(recording[i:i + CHUNK])
        chunks.put(None)   # the end

    while True:
        if args.file:
            stream, name = None, os.path.basename(args.file)
        else:
            try:
                stream = sd.InputStream(samplerate=RATE, channels=1, dtype="int16", blocksize=CHUNK, callback=heard)
                stream.start()
            except Exception as e:
                log(f"Couldn't open the mic ({e}); trying again in 5 s")
                time.sleep(5)
                continue
            name = sd.query_devices(stream.device)["name"] if isinstance(stream.device, int) else "the default mic"
        log(f"Listening on {name}{' (shadow: only noting what it would do)' if args.shadow else ''}, ready in {time.perf_counter() - t0:.1f} s")
        try:
            while True:
                chunk = chunks.get(timeout=5)
                if chunk is None:
                    return
                score = float(oww.predict(chunk)["hey_claude"])
                talking = vad.predict(chunk, frame_size=640) >= SPEECH
                if talking:
                    tell_talking()
                if talk is None:
                    if talking:
                        talk = {"audio": list(lead) + [chunk], "spoken": 1, "quiet": 0, "peak": score, "guess": None}
                    else:
                        lead.append(chunk)
                    continue
                talk["audio"].append(chunk)
                talk["peak"] = max(talk["peak"], score)
                if talking:
                    talk["spoken"] += talk["quiet"] + 1
                    talk["quiet"] = 0
                    talk["guess"] = None   # (kept talking: any early guess is about the wrong audio)
                    continue
                talk["quiet"] += 1
                ms = talk["spoken"] * CHUNK * 1000 // RATE
                short = MIN_MS <= ms <= MAX_MS
                # Whisper starts as soon as it goes quiet, so its answer is ready by the end of the pause.
                if short and talk["quiet"] == 2 and talk["guess"] is None:
                    talk["guess"] = pool.submit(transcribe, np.concatenate(talk["audio"]))
                if talk["quiet"] < pause_chunks:
                    continue
                # The pause is long enough: that bit of talking is over.
                done, talk = talk, None
                lead.clear()
                if not short:
                    if done["peak"] >= 0.5:
                        log(f"Not on its own ({ms / 1000:.1f} s of talking), though the model alone scored {done['peak']:.2f}")
                    continue
                audio = np.concatenate(done["audio"])
                guess = done["guess"] or pool.submit(transcribe, audio)
                text, took = guess.result()
                wrote = f"'{text}'"
                # The model's sure it was "Hey Claude", and Whisper wrote down something else: most
                # often it missed the start of "Hey" ("Take a look", "a quad"), and you had to say it
                # again. Whisper listens once more, told to expect "Hey Claude": with the start cut off
                # your own "Hey Claude"s it writes that every time, and "Take a look", "Okay, cool" or
                # "Hey, Kyle" said as such it still writes as they were.
                if not is_wake(text, done["peak"]) and done["peak"] >= HINT_AT:
                    again, more = transcribe(audio, "Hey Claude.")
                    took += more
                    wrote += f", told to expect it '{again}'"
                    if is_wake(again, done["peak"]):
                        text = again
                what = f"{wrote} ({ms / 1000:.2f} s, model {done['peak']:.2f}, loudness {loudness(audio):.3f}, Whisper {took:.0f} ms)"
                if not is_wake(text, done["peak"]):
                    if args.file or done["peak"] >= 0.5 or re.search(r"cl(au|y|aw|ou|o)d", text.lower()):
                        log("Not it: " + what)
                    continue
                # Straight away (with how long it was, in ms, and the model's score out of 1000); the
                # note and the clip come after, so they never hold it up.
                if not args.shadow and not args.file:
                    ctypes.windll.user32.PostMessageW(0xFFFF, wake_msg, ms, int(done["peak"] * 1000))   # HWND_BROADCAST
                log(("Would wake: " if args.shadow else "Heard 'Hey Claude': ") + what)
                if not args.file:
                    save_clip(audio)
        except queue.Empty:
            log("The mic stopped sending sound; opening it again")
        except Exception as e:
            log(f"Something went wrong ({type(e).__name__}: {e}); starting over")
            time.sleep(1)
        if stream:
            try:
                stream.close()
            except Exception:
                pass
        talk = None
        lead.clear()


if __name__ == "__main__":
    try:
        main()
    except Exception:   # (anything else that stops it: noted in the log too, see gave_up)
        gave_up("Something went wrong")
