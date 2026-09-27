; Say "Hey Claude" instead of pressing a button
;
; Listens in the background for "Hey Claude" using Windows' built-in speech recognizer, which
; runs offline on this PC. When it hears it, it does what the claude-voice-on-off-send.ahk button
; does to start things: voice mode on the Chat and Cowork page, or dictation that sends itself on
; the Code page. If voice mode or dictation is already on, it leaves them alone, so saying
; "Hey Claude" in the middle of a voice conversation won't hang up.
;
; Say "Hey Claude", pause, and start talking at the beep.
;
; On the Code page, each "Hey Claude" is one message: it dictates, sends, and that's it. (For a
; back-and-forth that listens again after each reply, use the claude-voice-on-off-send.ahk button.)
;
; On the Chat and Cowork page, while voice mode is on (however it was started), it ends voice mode
; when you say a goodbye, like "Bye", "Okay, I'm done" or "See you later", once Claude has finished
; saying its reply (at most 5 seconds after your goodbye is caught). If you say something new after
; the goodbye instead, voice mode stays on. It goes by
; Claude's own transcript: during voice mode Claude adds what you say to the chat as "You said: ..."
; messages, and the newest one is checked about once a second. Only goodbyes are noted in the log.
; While voice mode is on, "Hey Claude" is ignored, so saying it to Claude can't disturb voice mode.
; Voice mode also ends once it has just been sitting on "Listening" for 5 seconds: nobody talking,
; nothing in the message box, and Claude not working on or reading out a reply.
;
; "Hey Claude" also has to be about as loud as you normally say it, so talk in the background
; (a TV, other people) doesn't set it off. "Teach it my voice" sets that level from your voice.
; And it gets a second check against look-alike phrases (see LOOK_ALIKES), so a loud chant like
; "Oh yeah, let's go!" doesn't count as "Hey Claude".
;
; Running this file is an on/off toggle: the first time turns listening on, the next time turns it
; off (a double-click or a Stream Deck System > Open button both work). A note by the mouse
; pointer says which. Its icon sits in the corner of the taskbar while it listens.
; Right-click the icon for:
;   Pause listening            - stops listening and lets go of the mic
;   Teach it my voice          - say "Hey Claude" a few times so it learns how you say it
;   Windows voice training     - Windows' own read-aloud training, which helps it understand you in general
;   Exit
; To have it start with Windows, put a shortcut to this file in your Startup folder
; (press Win+R and type shell:startup).
; What it hears is noted in claude-hey-claude-log.txt, including near misses.

#Requires AutoHotkey v2.0 64-bit
; Uses the voice button's own code, so it starts right away instead of launching another script.
#Include %A_LineFile%\..\claude-voice-on-off-send.ahk
#SingleInstance Off   ; after the #Include, so it wins over the voice button's setting; ListenerMain handles a second copy

; ---- Settings ---------------------------------------------------------------
WAKE_PHRASE     := "hey claude"
MIN_CONFIDENCE  := 0.85   ; how sure the recognizer must be (0 to 1). "Teach it my voice" sets this for you
MIN_LOUDNESS    := 0.02   ; how loud "Hey Claude" must be (0 to 1), so background talk doesn't set it off. "Teach it my voice" sets this too
; While another program is using the mic (like Discord in a voice chat), "Hey Claude" has to be said
; on its own, since talking to friends about Claude ("the Claude…") can sound a lot like it:
VOICE_CHAT_MAX_SECONDS := 1.2   ; ...no longer than this ("Hey Claude" on its own is usually 0.5 to 0.8 s)
VOICE_CHAT_PAUSE_MS := 400      ; ...followed by a pause at least this long, the way you wait for the beep (ms),
                                ; and heard by Windows' free dictation as something like "Hey Claude" too
GOODBYE_QUIET_MS := 1000  ; after a goodbye, end voice mode once Claude's voice has been quiet this long (ms)
GOODBYE_MAX_MS  := 5000   ; ...but never later than this after the goodbye was caught, even if Claude is still talking
VOICE_IDLE_MS   := 5000   ; end voice mode once it has just been "Listening" this long, with nobody talking (ms). 0 turns it off
; "Hey Claude" has to beat these in a second check, so chants like "Oh yeah, let's go!" don't set
; it off. None of them share a word with "Hey Claude", which would let the recognizer split it in two.
LOOK_ALIKES := ["oh yeah", "yeah", "let's go", "okay", "alright", "come on", "what's up", "oh no", "no way",
    "nice", "wow", "yes", "cool", "okay cool", "oh cool", "so cool", "come on let's go",
    "is cool", "was cool", "this is cool", "that was cool", "that's cool", "that is cool", "it's cool", "it was cool",
    "pretty cool", "really cool", "very cool", "super cool", "how cool", "looks cool",
    "caught", "caught it", "i caught it", "got", "got it", "i got it", "call", "called", "called it",
    "because", "cold", "god", "oh god"]
TEACH_COUNT     := 6      ; how many times "Teach it my voice" asks you to say it
BEEP_WHEN_READY := false  ; Claude plays its own double beep when dictation starts listening, so ours (a loud one) is off
KEEP_GOING_MS   := 0      ; one message per "Hey Claude": no listening again afterwards (the send button does the back-and-forth)
HEY_LOG_FILE    := A_ScriptDir "\claude-hey-claude-log.txt"
HEY_SETTINGS    := A_ScriptDir "\claude-hey-claude.ini"        ; where "Teach it my voice" saves its result
SAMPLES_DIR     := A_ScriptDir "\hey-claude-voice-samples"     ; your recordings from "Teach it my voice"
; -----------------------------------------------------------------------------

HeyLogLines := []
Listener := ""
Paused := false
Busy := false
LastDone := 0
TalkStarts := []                            ; where in the audio the recognizer last started hearing someone talk
Teaching := ""                              ; the "Teach it my voice" window while it's open
VoiceListening := false                     ; true while voice mode is on and it's watching for a goodbye
LastSaid := ""                              ; the newest "You said" message already checked
Candidate := ""                             ; a new "You said" message waiting to settle
PendingGoodbye := ""                        ; set after a goodbye, while waiting for Claude to finish replying
VoiceSession := ""                          ; while voice mode is on: when anyone last talked, and so on
WakeAction := () => RunVoiceButton(true)    ; what "Hey Claude" does
GoodbyeAction := EndVoiceFromGoodbye        ; what a goodbye during voice mode does

if (A_LineFile = A_ScriptFullPath)
    ListenerMain()

ListenerMain() {
    global Listener, MIN_CONFIDENCE, MIN_LOUDNESS
    ; Running it again while it's already listening turns it off.
    if (running := OtherListener()) {
        WinClose(running)   ; asks the running copy to exit
        ToolTip('"Hey Claude" is off')
        Sleep 2000
        ExitApp
    }
    Persistent
    OnExit(StopConversation)
    A_IconHidden := false   ; the voice button's code hides the tray icon; this script wants it
    A_IconTip := 'Listening for "Hey Claude"'
    A_TrayMenu.Delete()
    A_TrayMenu.Add("Pause listening", TogglePause)
    A_TrayMenu.Add("Teach it my voice...", (*) => TeachMyVoice())
    A_TrayMenu.Add("Windows voice training...", (*) => WindowsVoiceTraining())
    A_TrayMenu.Add()
    A_TrayMenu.Add("Exit", (*) => ExitApp())

    ; Keep the log from earlier runs.
    try {
        for line in StrSplit(RTrim(FileRead(HEY_LOG_FILE, "UTF-8"), "`r`n"), "`n", "`r")
            HeyLogLines.Push(line)
    }
    MIN_CONFIDENCE := Number(IniRead(HEY_SETTINGS, "voice", "MinConfidence", MIN_CONFIDENCE))
    MIN_LOUDNESS := Number(IniRead(HEY_SETTINGS, "voice", "MinLoudness", MIN_LOUDNESS))
    try {
        Listener := StartListening()
    } catch as err {
        MsgBox("Couldn't start listening for 'Hey Claude':`n" err.Message, "Hey Claude", "Icon!")
        ExitApp
    }
    HeyLog(Format("Listening for '{}' on {} (needs {:.2f} sure, loudness {:.3f})", WAKE_PHRASE, Listener.reco.AudioInput.GetDescription(), MIN_CONFIDENCE, MIN_LOUDNESS))
    ToolTip('"Hey Claude" is on')
    SetTimer(() => ToolTip(), -2000)
    SetTimer(VoiceWatch, 1000)
}

; When listening is turned off mid-conversation, switch Claude's mic off too, so it doesn't stay on
; with nothing watching it. Your words stay in the message box.
StopConversation(*) {
    if !Busy
        return
    try IniDelete(STATE_FILE, "conversation")
    try {
        hwnd := FindClaudeWindow()
        if (stopBtn := FindButton(hwnd, IsDictationStop))
            PressButton(stopBtn.el)
    }
}

; The window of another copy of this script that's already running, if there is one.
OtherListener() {
    DetectHiddenWindows true
    for hwnd in WinGetList(A_ScriptFullPath " ahk_class AutoHotkey")
        if (hwnd != A_ScriptHwnd)
            return hwnd
    return 0
}

; Sets up Windows' speech recognizer to listen for just the wake phrase.
; audioFile is only for testing; normally it listens to the microphone.
StartListening(audioFile := "") {
    reco := ComObject("SAPI.SpInProcRecognizer")
    stream := ""
    if (audioFile != "") {
        stream := ComObject("SAPI.SpFileStream")
        stream.Open(audioFile, 0)
        reco.AudioInputStream := stream
    } else {
        reco.AudioInput := reco.GetAudioInputs().Item(0)   ; the first microphone on the list, which is Windows' default
    }
    ctx := reco.CreateRecoContext()
    ctx.EventInterests := 8 | 16 | 512   ; talking starting, recognitions, and near misses the recognizer wasn't sure about
    ctx.RetainedAudio := 1           ; keep the audio of each one, so "Teach it my voice" can save it
    grammar := ctx.CreateGrammar()
    rule := grammar.Rules.Add("wake", 0x1 | 0x20)   ; top-level rule that can be built here in code
    rule.InitialState.AddWordTransition(ComValue(9, 0), WAKE_PHRASE)   ; ComValue(9, 0) marks the end of the phrase
    grammar.Rules.Commit()
    grammar.CmdSetRuleState("wake", 1)   ; active
    TalkStarts.Length := 0   ; (positions in the old audio don't count in the new)
    ComObjConnect(ctx, WakeEvents)
    if (audioFile = "")
        reco.State := 1   ; start listening
    return {reco: reco, ctx: ctx, grammar: grammar, stream: stream}
}

class WakeEvents {
    ; Recognition(StreamNumber, StreamPosition, RecognitionType, Result, context)
    static Recognition(params*) => OnHeard(params[4], params[2])
    ; FalseRecognition(StreamNumber, StreamPosition, Result, context): heard something, but not sure it was the phrase
    static FalseRecognition(params*) => OnHeard(params[3], params[2])
    ; PhraseStart(StreamNumber, StreamPosition, context): started hearing someone talk
    static PhraseStart(params*) => NoteTalking(params[2])
}

NoteTalking(pos) {
    TalkStarts.Push(pos)
    if (TalkStarts.Length > 20)
        TalkStarts.RemoveAt(1)
}

; Another program that's using the microphone right now (like Discord, in a voice chat), by the name
; of its program, or "" if none is: Windows notes which programs are using it. Claude and these
; scripts themselves don't count.
VoiceChat() {
    static base := "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone"
    for where in [base "\NonPackaged", base] {
        loop reg, where, "K" {
            name := RegExReplace(A_LoopRegName, "^.*#")   ; (C:#Users#...#Discord.exe: just Discord.exe)
            if (name = "NonPackaged" || name ~= "i)^(autohotkey.*|claude)(\.exe)?$|^Claude_")
                continue
            key := RegExReplace(A_LoopRegKey, "i)^(HKEY_CURRENT_USER|HKCU)\\") "\" A_LoopRegName
            if (MicTime(key, "LastUsedTimeStart") && MicTime(key, "LastUsedTimeStop") = 0)   ; started, and not stopped yet
                return RegExReplace(name, "i)\.exe$")
        }
    }
    return ""
}

; One of the times Windows notes when a program starts or stops using the microphone (a 64-bit
; number, which RegRead can't read), or "" if there isn't one.
MicTime(key, name) {
    if DllCall("advapi32\RegGetValueW", "ptr", 0x80000001, "wstr", key, "wstr", name, "uint", 0x48, "ptr", 0, "int64*", &when := 0, "uint*", &size := 8) = 0   ; HKEY_CURRENT_USER, RRF_RT_QWORD
        return when
    return ""
}

; pos: where in the recognizer's audio the phrase ended.
OnHeard(result, pos := 0) {
    global Busy, LastDone
    info := result.PhraseInfo
    if (info.GetText() != WAKE_PHRASE)
        return
    confidence := info.Rule.EngineConfidence
    heard := Format("'Hey Claude' ({:.2f} sure)", confidence)
    if Teaching {
        TeachSample(result, confidence, PhraseLoudness(result))
        return
    }
    heardAt := A_TickCount
    if (confidence < MIN_CONFIDENCE) {
        if (confidence >= 0.3)   ; note near misses, but not every bit of ordinary talking
            HeyLog("Ignored " heard Format(": needs {:.2f}", MIN_CONFIDENCE))
        return
    }
    chat := VoiceChat()
    loudness := PhraseLoudness(result), audio := PhraseAudio(result), seconds := audio.bytes / audio.perSecond
    heard := Format("'Hey Claude' ({:.2f} sure, loudness {:.3f}, {:.2f} s)", confidence, loudness, seconds)
    if (chat != "" && seconds > VOICE_CHAT_MAX_SECONDS) {
        HeyLog("Ignored " heard Format(": too long to be just 'Hey Claude' while {} is using the mic, needs {:.1f} s or less", chat, VOICE_CHAT_MAX_SECONDS))
        return
    }
    if (loudness < MIN_LOUDNESS) {
        HeyLog("Ignored " heard Format(": too quiet, needs {:.3f}", MIN_LOUDNESS))
        return
    }
    if VoiceListening {   ; voice mode is already on; don't touch it, even if you say "Hey Claude" to it
        HeyLog("Ignored " heard ": voice mode is already on")
        return
    }
    if (Busy || A_TickCount - LastDone < 1500) {
        HeyLog("Ignored " heard ": already starting or dictating")
        return
    }
    Busy := true   ; also keeps other sounds from starting a second check meanwhile
    if (chat != "") {
        ; Windows' free dictation writes down what was actually said, which covers the look-alikes
        ; below and much more.
        said := DictatedText(result)
        if !SoundsLikeWake(said) {
            Busy := false
            HeyLog("Ignored " heard ": it was '" said "', while " chat " is using the mic")
            return
        }
        ; Then the pause after it, waited for outside this event: the recognizer holds back its next
        ; ones (like hearing you carry on talking) until this one is done.
        pos := Number(pos), perMs := audio.perSecond / 1000
        reco := ""
        try reco := result.RecoContext.Recognizer
        heard .= ", heard as '" said "'"
        SetTimer(() => AfterPause(reco, heard, chat, pos, pos + VOICE_CHAT_PAUSE_MS * perMs, pos + (VOICE_CHAT_PAUSE_MS + 100) * perMs, heardAt), -1)
        return
    }
    if !BeatsLookAlikes(result, &picked) {
        Busy := false
        HeyLog("Ignored " heard ": next to look-alike phrases it sounded like '" (picked = "" ? "none of them" : picked) "'")
        return
    }
    Wake(heard)
}

; After "Hey Claude" (heard, ending at pos in the recognizer's audio) while another program is
; using the mic: once reco has heard up to enough (a little past limit, since it notices talking
; starting a moment late), starts if nobody started talking again before limit. You stop and wait
; for the beep, while talking to friends just carries on.
AfterPause(reco, heard, chat, pos, limit, enough, heardAt) {
    global Busy
    heardTo := 0
    try heardTo := Number(reco.Status.CurrentStreamPosition)
    waited := A_TickCount - heardAt
    ; (going by the clock instead when it can't say, as with a recording: it reads 0 there)
    if (heardTo > 0 ? heardTo < enough && waited < VOICE_CHAT_PAUSE_MS + 1000 : waited < VOICE_CHAT_PAUSE_MS + 100) {   ; (not that far yet; checks again shortly)
        SetTimer(() => AfterPause(reco, heard, chat, pos, limit, enough, heardAt), -20)
        return
    }
    for start in TalkStarts {
        if (Number(start) > pos && Number(start) <= limit) {
            Busy := false
            HeyLog("Ignored " heard ": you kept talking right after it, while " chat " is using the mic")
            return
        }
    }
    Wake(heard Format(", with a pause after it ({:.2f} s after hearing it), while {} is using the mic", (A_TickCount - heardAt) / 1000, chat))
}

; What Windows' free dictation makes of the recognized phrase: the words, in lowercase, or "?" if
; it couldn't tell. Listening for just "Hey Claude", the recognizer squeezes all sorts of talking
; into it, but dictation writes down what you actually said ("this is like 1.6"), and "Hey Claude"
; as a couple of words like "they clawed" or "a client".
DictatedText(result) {
    path := A_Temp "\hey-claude-dictate.wav"
    text := "?"
    try {
        SaveAudio(result, path)
        reco := ComObject("SAPI.SpInProcRecognizer")
        stream := ComObject("SAPI.SpFileStream")
        stream.Open(path, 0)
        reco.AudioInputStream := stream
        ctx := reco.CreateRecoContext()
        ctx.EventInterests := 1 | 16   ; end of the recording, recognitions
        grammar := ctx.CreateGrammar()
        sink := DictateEvents()
        ComObjConnect(ctx, sink)
        grammar.DictationLoad("", 0)
        grammar.DictationSetState(1)
        deadline := A_TickCount + 3000
        while (!sink.done && A_TickCount < deadline)
            Sleep 20
        ComObjConnect(ctx)
        stream.Close()
        text := StrLower(Trim(sink.text))
    }
    try FileDelete(path)
    return text
}

class DictateEvents {
    done := false
    text := ""
    Recognition(params*) {
        try this.text .= " " params[4].PhraseInfo.GetText()
    }
    EndStream(params*) => this.done := true
}

; Whether dictated words could be "Hey Claude": nothing heard, or at most three words with one
; starting like "Claude" does ("they clawed", "a client", "date closed", "hey cloud").
SoundsLikeWake(text) {
    if (text = "?")   ; couldn't check; don't block it
        return true
    text := Trim(RegExReplace(text, "[^a-z0-9']+", " "))
    if (text = "")
        return true
    return StrSplit(text, " ").Length <= 3 && RegExMatch(text, "(^|\s)[ckg]l")
}

; Does what "Hey Claude" does, once it has passed every check (heard: what was heard, for the log).
Wake(heard) {
    global Busy, LastDone
    HeyLog("Heard " heard ", starting")
    TellCaptions()
    started := A_TickCount
    try WakeAction()
    ; What the voice button did, each step with its time, so a slow or failed start shows up here.
    for line in LogLines
        HeyLog("  voice button " line)
    HeyLog(Format("Done after {:.1f} s", (A_TickCount - started) / 1000))
    Busy := false, LastDone := A_TickCount
}

; Lets claude-captions.ahk, if it's running, show right away that Claude is listening. The message
; goes out to every window at once, which never waits on anything. (Looking for the captions'
; hidden window by its title instead means asking every hidden window for its title, and the
; speech recognizer's own windows in this script can take many seconds to answer while it's busy
; hearing you, which held up "Hey Claude".)
TellCaptions() {
    static msg := DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.HeyClaude", "uint")
    DllCall("PostMessage", "ptr", 0xFFFF, "uint", msg, "ptr", 0, "ptr", 0)   ; HWND_BROADCAST
}

; A second check on the same recording. Listening for just "Hey Claude", the recognizer squeezes
; any short burst of speech into it, so a chant like "Oh yeah, let's go!" can pass. Here it also
; gets LOOK_ALIKES to choose from, and "Hey Claude" has to win.
BeatsLookAlikes(result, &picked) {
    picked := ""
    try {
        path := A_Temp "\hey-claude-check.wav"
        SaveAudio(result, path)
        picked := PickPhrase(path)
        try FileDelete(path)
    } catch {
        return true   ; couldn't check; don't block it
    }
    return picked = WAKE_PHRASE
}

; Which phrase a short recording sounds most like: the wake phrase, one of LOOK_ALIKES, or "" for none.
PickPhrase(path) {
    reco := ComObject("SAPI.SpInProcRecognizer")
    stream := ComObject("SAPI.SpFileStream")
    stream.Open(path, 0)
    reco.AudioInputStream := stream
    ctx := reco.CreateRecoContext()
    ctx.EventInterests := 1 | 16   ; end of the recording, recognitions
    grammar := ctx.CreateGrammar()
    wake := grammar.Rules.Add("wake", 0x1 | 0x20)
    wake.InitialState.AddWordTransition(ComValue(9, 0), WAKE_PHRASE)
    other := grammar.Rules.Add("other", 0x1 | 0x20)
    for phrase in LOOK_ALIKES
        other.InitialState.AddWordTransition(ComValue(9, 0), phrase)
    grammar.Rules.Commit()
    sink := PickEvents()
    ComObjConnect(ctx, sink)
    grammar.CmdSetRuleState("wake", 1)
    grammar.CmdSetRuleState("other", 1)
    deadline := A_TickCount + 3000
    while (!sink.done && A_TickCount < deadline)
        Sleep 20
    ComObjConnect(ctx)
    stream.Close()
    return sink.picked
}

class PickEvents {
    done := false
    picked := ""
    Recognition(params*) {
        if (this.picked = "")   ; the first phrase recognized
            try this.picked := params[4].PhraseInfo.GetText()
    }
    EndStream(params*) => this.done := true
}

; How loud the recognized phrase was: the loudest 20 ms of it, from 0 (silent) to 1 (as loud as
; the mic goes). Someone talking into the mic is much louder than talk in the background.
PhraseLoudness(result) {
    try {
        audio := result.Audio()
        wave := audio.Format.GetWaveFormatEx()
        data := audio.GetData()   ; the recording, as an array of bytes
        return Loudness(NumGet(ComObjValue(data), 16, "ptr"), data.MaxIndex() + 1, wave.SamplesPerSec, wave.Channels, wave.BitsPerSample)
    }
    return 1   ; couldn't measure; don't block it
}

; The recognized phrase's recording: how many bytes long it is, and how many bytes make a second.
PhraseAudio(result) {
    try {
        audio := result.Audio()
        wave := audio.Format.GetWaveFormatEx()
        return {bytes: audio.GetData().MaxIndex() + 1, perSecond: wave.SamplesPerSec * wave.Channels * wave.BitsPerSample // 8}
    }
    return {bytes: 0, perSecond: 32000}   ; (couldn't tell: 16 kHz, 16-bit, one channel, what the recognizer usually hears in)
}

; The loudest 20 ms of 16-bit audio at ptr, from 0 to 1.
Loudness(ptr, bytes, rate, channels, bits) {
    if (bits != 16)
        return 1
    frame := rate * channels // 50, loudest := 0.0, sum := 0.0, n := 0
    loop bytes // 2 {
        s := NumGet(ptr, (A_Index - 1) * 2, "short")
        sum += s * s, n++
        if (n = frame)
            loudest := Max(loudest, Sqrt(sum / n) / 32768), sum := 0.0, n := 0
    }
    return loudest
}

; ---- Goodbye during voice mode --------------------------------------------------

; Every second: while voice mode is on, check the newest thing you said for a goodbye.
; During voice mode Claude adds what you say to the chat as "You said: ..." messages.
VoiceWatch() {
    global VoiceListening, LastSaid, Candidate
    if (Busy || Paused || Teaching || !Listener)
        return
    ; Voice mode is on when its microphone button shows, however voice mode was started.
    on := false, hwnd := 0
    try {
        hwnd := FindClaudeWindow()
        on := (hwnd && OnChatPage(hwnd) && FindButton(hwnd, IsVoiceModeControl)) ? true : false
    }
    if (on != VoiceListening) {
        VoiceListening := on
        if on {
            try LastSaid := Candidate := NewestYouSaid(hwnd)   ; only what you say from now on counts
            StartVoiceSession()
        } else {
            CancelGoodbye()
            StopVoiceSession()
        }
        HeyLog(on ? "Voice mode is on: watching for a goodbye" : "Voice mode is off")
        return
    }
    if !on
        return
    try msgs := NewestMessages(hwnd)
    catch
        return
    s := VoiceSession
    ; Claude writing its reply counts as activity, and so does reading it out: allow about
    ; 2.5 words a second from the last time the reply grew.
    if (s && msgs.reply != s.lastReply) {
        s.lastReply := msgs.reply, s.lastActivity := A_TickCount, s.awaitingReply := false
        s.busyUntil := A_TickCount + StrSplit(RegExReplace(msgs.reply, "^[^|]*\|"), " ").Length * 400
    }
    ; While you talk, your words show up in the message box.
    try {
        if (s && PromptText(hwnd) != "")
            s.lastActivity := A_TickCount
    }
    said := msgs.said
    if (s && said != LastSaid)
        s.lastActivity := A_TickCount
    ; Judge a new message only once it has stayed the same for a second, in case Claude is still
    ; writing it down (so "I'll see you in the code" isn't cut off at "I'll see you").
    if (said != LastSaid && said = Candidate) {
        LastSaid := said
        if s
            s.awaitingReply := true, s.awaitingSince := A_TickCount
        OnYouSaid(said)
    } else {
        Candidate := said
    }
    CheckVoiceIdle()
}

; ---- Ending voice mode when nothing's happening -----------------------------------

; While voice mode is on, keeps track of the last time anyone said anything. Sound is checked five
; times a second (your mic, and the sound Claude's app plays); the chat is checked by VoiceWatch.
StartVoiceSession() {
    global VoiceSession
    VoiceSession := {start: A_TickCount, lastActivity: A_TickCount, awaitingReply: false, awaitingSince: 0,
        busyUntil: 0, lastReply: "", mic: "", claude: [], claudeAt: 0}
    try VoiceSession.mic := OpenMicMeter()
    try VoiceSession.lastReply := NewestMessages(FindClaudeWindow()).reply
    SetTimer(VoiceSoundWatch, 200)
}

StopVoiceSession() {
    global VoiceSession
    VoiceSession := ""
    SetTimer(VoiceSoundWatch, 0)
}

VoiceSoundWatch() {
    s := VoiceSession
    if !s
        return
    now := A_TickCount
    if (now - s.claudeAt > 2000) {   ; Claude's sound streams come and go; look again every 2 seconds
        try s.claude := ClaudeSoundMeters()
        s.claudeAt := now
    }
    for meter in s.claude {
        try {
            ComCall(3, meter, "float*", &peak := 0)   ; GetPeakValue
            if (peak > 0.01)
                s.lastActivity := now, s.awaitingReply := false
        }
    }
    if s.mic {
        try {
            ComCall(3, s.mic, "float*", &peak := 0)
            if (peak >= VOICE_LEVEL)
                s.lastActivity := now
        }
    }
}

; Ends voice mode once it has just been "Listening" for VOICE_IDLE_MS: nobody talking, nothing in
; the message box, and Claude not working on or reading out a reply. After you say something,
; Claude gets up to 15 seconds to start replying before that counts as idle.
CheckVoiceIdle() {
    s := VoiceSession
    if (!s || !VOICE_IDLE_MS || PendingGoodbye)
        return
    now := A_TickCount
    if ((s.awaitingReply && now - s.awaitingSince < 15000) || now < s.busyUntil)
        return
    if (now - s.lastActivity < VOICE_IDLE_MS)
        return
    HeyLog("Voice mode was just listening for " VOICE_IDLE_MS // 1000 " seconds with nobody talking, so it was ended")
    StopVoiceSession()
    GoodbyeAction()
}

; Handles a new or updated "You said" message, given as "Message 41|<full text>".
OnYouSaid(said) {
    message := RegExReplace(said, "\|.*$"), text := RegExReplace(said, "^[^|]*\|")
    if (PendingGoodbye && message = PendingGoodbye.message)
        return   ; the goodbye message itself got updated (Claude finished writing it down); keep going
    if IsVoiceSignOff(text) {
        if !PendingGoodbye {
            HeyLog("You said '" text "' during voice mode; ending voice mode once Claude finishes replying")
            StartGoodbye(message)
        }
    } else {
        if PendingGoodbye {
            CancelGoodbye()
            HeyLog("You kept talking after the goodbye, so voice mode stays on")
        }
        HeyLog("You said something during voice mode (" StrSplit(Trim(text), " ").Length " words, not a goodbye)")
    }
}

; The newest message shows when it was sent ("just now", "5 seconds ago", "1 minute ago"). That label
; isn't part of what you said, so it's left out; otherwise "See ya." would read as "See ya. 5 seconds ago".
IsTimeLabel(text) => Trim(text) = ""
    || text ~= "i)^\s*(just now|now|yesterday|a moment ago|an? (second|minute|hour|day|week|month|year) ago|\d+ (seconds?|minutes?|hours?|days?|weeks?|months?|years?) ago|\d{1,2}:\d{2}\s*([ap]m)?)\s*$"

StartGoodbye(message) {
    global PendingGoodbye
    PendingGoodbye := {message: message, since: A_TickCount, heardClaude: false, lastSound: 0, meters: [], metersAt: 0}
    SetTimer(GoodbyeWatch, 100)
}

CancelGoodbye() {
    global PendingGoodbye
    PendingGoodbye := ""
    SetTimer(GoodbyeWatch, 0)
}

; After a goodbye: wait for Claude to finish saying its reply out loud, then end voice mode.
; Claude counts as finished once its sound has been quiet for GOODBYE_QUIET_MS after it started
; talking. Either way it never waits longer than GOODBYE_MAX_MS.
GoodbyeWatch() {
    g := PendingGoodbye
    if !g
        return CancelGoodbye()
    now := A_TickCount
    if (now - g.metersAt > 1000) {   ; Claude's sound streams come and go; look again every second
        try g.meters := ClaudeSoundMeters()
        g.metersAt := now
    }
    level := 0.0
    for meter in g.meters {
        try {
            ComCall(3, meter, "float*", &peak := 0)   ; GetPeakValue
            level := Max(level, peak)
        }
    }
    if (level > 0.01)
        g.heardClaude := true, g.lastSound := now
    finished := g.heardClaude && now - g.lastSound >= GOODBYE_QUIET_MS
    if (!finished && now - g.since < GOODBYE_MAX_MS)
        return
    CancelGoodbye()
    HeyLog(finished ? "Claude finished replying" : g.heardClaude ? "Claude was still talking; ending anyway" : "Didn't hear Claude reply out loud")
    GoodbyeAction()
}

NewestYouSaid(hwnd) => NewestMessages(hwnd).said

; The newest thing you said and Claude's newest reply in the chat showing, each as its message
; number and full text (like "Message 38|Okay, thanks, Claude. We'll see you later."), so saying
; the same thing twice still counts as new. Each message is a group named like "Message 38 of 40",
; holding a short "You said: ..." or "Claude responded: ..." label, which is only the first
; sentence, followed by the full text. The "of 40" part is left off, since it changes whenever a
; message is added.
NewestMessages(hwnd) {
    said := "", reply := ""
    groups := GetElements(hwnd, UIA_GROUP)
    i := groups.Length
    while (i >= 1 && (said = "" || reply = "")) {
        g := groups[i--]
        if !(g.name ~= "^Message \d+ of \d+")
            continue
        texts := ElementsUnder(g.el, UIA_TEXT)
        if !texts.Length
            continue
        label := texts[1].name
        mine := StartsWith(label, "You said: ")
        if (mine ? said != "" : (!StartsWith(label, "Claude responded: ") || reply != ""))
            continue
        full := ""
        for t in texts
            if (A_Index > 1 && !IsTimeLabel(t.name))
                full .= (full = "" ? "" : " ") t.name
        text := RegExReplace(g.name, " of \d+.*$") "|" (full != "" ? full : RegExReplace(label, "^(You said|Claude responded): "))
        if mine
            said := text
        else
            reply := text
    }
    return {said: said, reply: reply}
}

; The same goodbyes that end a dictation conversation, plus short phrases with "bye" in them,
; since the recognizer tends to mishear those (like "Goodbye, Claude" as "Goodbye to clog").
IsVoiceSignOff(text) {
    if EndsWithSignOff(text)
        return true
    words := PlainWords(text)
    return StrSplit(words, " ").Length <= 4 && words ~= "\b(goodbye|good bye|bye|bibi)\b"
}

EndVoiceFromGoodbye() {
    global Busy
    if Busy
        return
    Busy := true
    LogLines.Length := 0
    try {
        hwnd := FindClaudeWindow()
        if (hwnd && OnChatPage(hwnd) && VoiceIsOn(hwnd)) {
            ; (from behind a game, Claude isn't brought to the front: see OpenClaude)
            global CameFrom, Behind, ClaudeHwnd
            CameFrom := WinExist("A"), Behind := CameFrom && CameFrom != hwnd && CoversScreen(CameFrom), ClaudeHwnd := hwnd
            if !Behind {
                WinActivate(hwnd)
                WinWaitActive(hwnd, , 2)
            }
            StopVoice(hwnd)
            HeyLog("Ended voice mode")
        } else {
            SaveState(false)
            HeyLog("Voice mode was already off")
        }
    } catch as err {
        HeyLog("Couldn't end voice mode: " err.Message)
    }
    WriteLog()
    Busy := false
    VoiceWatch()   ; back to listening for "Hey Claude"
}

; ---- Teach it my voice --------------------------------------------------------

; Records you saying "Hey Claude" a few times, keeps the recordings, and sets how sure the
; recognizer must be and how loud "Hey Claude" must be, based on your voice.
TeachMyVoice() {
    global Teaching
    if Teaching {
        Teaching.gui.Show()
        return
    }
    if Paused
        TogglePause("Pause listening")
    g := Gui("+AlwaysOnTop", "Teach it my voice")
    g.SetFont("s11")
    g.Add("Text", "w400", 'Say "Hey Claude" ' TEACH_COUNT ' times, the way you normally would, with a short pause after each one.')
    status := g.Add("Text", "w400 h50", "Heard 0 of " TEACH_COUNT ".")
    g.Add("Button", "w100", "Cancel").OnEvent("Click", (*) => FinishTeaching(false))
    g.OnEvent("Close", (*) => FinishTeaching(false))
    Teaching := {gui: g, status: status, scores: [], levels: []}
    DirCreate(SAMPLES_DIR)
    g.Show()
    HeyLog("Teaching started")
}

TeachSample(result, confidence, loudness) {
    Teaching.scores.Push(confidence)
    Teaching.levels.Push(loudness)
    n := Teaching.scores.Length
    try SaveAudio(result, SAMPLES_DIR "\hey-claude-" FormatTime(, "yyyyMMdd-HHmmss") "-" n ".wav")
    Teaching.status.Text := Format("Heard {} of {}. That one scored {:.2f}, loudness {:.3f}.", n, TEACH_COUNT, confidence, loudness)
    HeyLog(Format("Teaching sample {}: {:.2f} sure, loudness {:.3f}", n, confidence, loudness))
    if (n >= TEACH_COUNT)
        FinishTeaching(true)
}

FinishTeaching(done) {
    global Teaching, MIN_CONFIDENCE, MIN_LOUDNESS
    if !Teaching
        return
    scores := Teaching.scores, levels := Teaching.levels
    Teaching.gui.Destroy()
    Teaching := ""
    if !done {
        HeyLog("Teaching cancelled")
        return
    }
    ; Accept anything a bit below your lowest score, but never so low that other talk gets through
    ; (the worst false match in testing was 0.73) and never stricter than 0.85, so it doesn't miss you.
    MIN_CONFIDENCE := Round(Max(0.75, Min(0.85, Min(scores*) - 0.1)), 2)
    IniWrite(MIN_CONFIDENCE, HEY_SETTINGS, "voice", "MinConfidence")
    ; Anything less than half as loud as your quietest "Hey Claude" is treated as background.
    MIN_LOUDNESS := Round(Min(levels*) / 2, 3)
    IniWrite(MIN_LOUDNESS, HEY_SETTINGS, "voice", "MinLoudness")
    list := ""
    for s in scores
        list .= Format("{:.2f}  ", s)
    HeyLog(Format("Teaching done. Scores: {}-> now needs {:.2f} sure and loudness {:.3f}", list, MIN_CONFIDENCE, MIN_LOUDNESS))
    MsgBox(Format('Got it. Your "Hey Claude" scored:`n{}`n`nFrom now on it needs {:.2f} to start, and anything under half '
        . 'as loud as your quietest try is ignored as background. Your recordings are in:`n{}',
        Trim(list), MIN_CONFIDENCE, SAMPLES_DIR), "Teach it my voice", "Iconi T30")
}

; Saves the audio the recognizer kept for one result as a .wav file.
SaveAudio(result, path) {
    audio := result.Audio()
    file := ComObject("SAPI.SpFileStream")
    file.Format.Type := audio.Format.Type
    file.Open(path, 3)   ; create for writing
    file.Write(audio.GetData())
    file.Close()
}

; ---- Tray menu ------------------------------------------------------------------

TogglePause(itemName, *) {
    global Paused
    Paused := !Paused
    Listener.reco.State := Paused ? 0 : 1   ; 0 lets go of the microphone
    A_TrayMenu.ToggleCheck(itemName)
    A_IconTip := Paused ? 'Paused: not listening for "Hey Claude"' : 'Listening for "Hey Claude"'
    HeyLog(Paused ? "Paused" : "Listening again")
}

; Windows' own voice training: you read sentences aloud and it adapts to your voice.
; Listening pauses while it's open, so the training sentences can't set it off.
WindowsVoiceTraining() {
    Listener.reco.State := 0
    try Listener.reco.DisplayUI(A_ScriptHwnd, "Voice training", "UserTraining", "")
    catch as err
        MsgBox("Windows voice training didn't open:`n" err.Message, "Hey Claude", "Icon!")
    if !Paused
        Listener.reco.State := 1
}

; Keeps the last 300 lines in claude-hey-claude-log.txt.
HeyLog(msg) {
    HeyLogLines.Push(FormatTime(, "yyyy-MM-dd HH:mm:ss") "  " msg)
    while (HeyLogLines.Length > 300)
        HeyLogLines.RemoveAt(1)
    text := ""
    for line in HeyLogLines
        text .= line "`n"
    try FileOpen(HEY_LOG_FILE, "w", "UTF-8").Write(text)
}
