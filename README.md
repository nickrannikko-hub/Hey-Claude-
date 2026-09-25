# Claude Stream Deck Voice Controls (unofficial)

Stream Deck buttons (or keyboard shortcuts) and a hands-free **"Hey Claude"** wake word for the
Claude desktop app on Windows, built with [AutoHotkey v2](https://www.autohotkey.com/).

> **Unofficial.** Not made by or affiliated with Anthropic. These scripts work by finding and
> pressing buttons in Claude's app by their names, so a Claude update that renames a button can
> break them until the scripts are updated.

**On a Mac?** There's an **experimental, untested** Mac version in the [`mac`](mac) folder, built on
[Hammerspoon](https://www.hammerspoon.org/). See [mac/README.md](mac/README.md). Everything below is
for Windows.

## What's included

| Script | What it does |
|---|---|
| `claude-open.ahk` | Opens Claude (or brings it to the front) on the **Chat and Cowork** page. |
| `claude-close.ahk` | Quits Claude completely, using Claude's own **Menu → File → Exit**. |
| `claude-switch-page.ahk` | Flips Claude between the **Chat and Cowork** and **Code** pages. |
| `claude-open-chat.ahk` | Opens one of your chats by name. Make a copy per chat. |
| `claude-voice-on-off.ahk` | **Chat page:** voice mode on/off. **Code page:** dictation on/off (types what you say; you send it). |
| `claude-voice-on-off-send.ahk` | Like the one above, but dictation **sends itself** when you stop talking, then listens again after Claude replies, for a back-and-forth conversation. |
| `claude-hey-claude.ahk` | Listens for **"Hey Claude"**. On the Chat page it starts voice mode; on the Code page it takes one dictated message and sends it. Running it again turns it off. |
| `claude-hotkeys.ahk` | Keyboard shortcuts for all of the above, for use **without a Stream Deck**. |
| `claude-setup-check.ahk` | Checks everything the scripts need and tells you what's missing. Run it first. |

## Requirements

- Windows 10 or 11
- The Claude desktop app, set to **English** (the scripts find buttons by their English names)
- [AutoHotkey v2](https://www.autohotkey.com/) (the 64-bit version it installs by default)
- An Elgato Stream Deck is **optional**: `claude-hotkeys.ahk` gives you keyboard shortcuts instead,
  and you can also just double-click the scripts
- For "Hey Claude": Windows' built-in English (US) speech recognizer. It comes with Windows; the
  listener shows a message if it can't start.

## Setup

1. **Install AutoHotkey v2.**
2. **Put this folder somewhere permanent**, like `Documents\claude-stream-deck-voice`. Logs and
   settings are saved next to the scripts.
3. **Run the setup check:** open Claude, then double-click `claude-setup-check.ahk`. It checks
   AutoHotkey, the Claude app, that Claude is in English, "Hold to record", Windows' speech
   recognizer and your microphone, and tells you exactly what (if anything) to fix. It doesn't
   change anything, so run it again whenever you like.
4. **In Claude, turn off "Hold to record":** on the Code page, click the small arrow next to the
   microphone (Dictation settings) and untick **Hold to record**. The voice buttons need dictation
   to switch on and off with a click. If it's on, they'll show a message saying so.
5. **Pick your chat:** open `claude-open-chat.ahk` in Notepad and change `CHAT_NAME` to the exact
   title of one of your chats as it shows in Claude's sidebar (capitals matter). For more chats,
   copy the file (for example `claude-open-chat-work.ahk`) and set a different `CHAT_NAME` in each.
   Pinning those chats keeps them in the sidebar where the script can find them.
6. **Buttons or shortcuts,** whichever you have:
   - **Stream Deck:** for each button you want, drag **System → Open** onto a key and choose the
     `.ahk` file. A layout that works well:

     | | | | |
     |---|---|---|---|
     | Open Claude | Close Claude | Switch page | Hey Claude on/off |
     | Open chat | Voice on/off | Voice on/off + send | |

   - **No Stream Deck:** double-click `claude-hotkeys.ahk` for keyboard shortcuts (see
     [Keyboard shortcuts](#keyboard-shortcuts) below).
7. **"Hey Claude":** double-click `claude-hey-claude.ahk` (or give it a button or shortcut; it's an
   on/off toggle). A small AutoHotkey icon appears near the clock while it listens. Right-click it
   and choose **Teach it my voice...**, then say "Hey Claude" six times. That tunes it to your voice.
8. **Optional, start things with Windows:** press Win+R, type `shell:startup`, and put shortcuts to
   `claude-hey-claude.ahk` and/or `claude-hotkeys.ahk` in the folder that opens.

## Keyboard shortcuts

No Stream Deck? Double-click `claude-hotkeys.ahk` and these work anywhere in Windows (left Ctrl and
left Alt, so the AltGr key on some keyboards doesn't set them off):

| Shortcut | Does |
|---|---|
| Ctrl + Alt + O | Open Claude |
| Ctrl + Alt + P | Switch between the Chat and Code pages |
| Ctrl + Alt + C | Open your chat |
| Ctrl + Alt + V | Voice mode or dictation, on/off |
| Ctrl + Alt + S | Voice mode or dictation, on/off, sending by itself |
| Ctrl + Alt + H | "Hey Claude" listening, on/off |
| Ctrl + Alt + Shift + Q | Quit Claude (Shift added so it's hard to hit by accident) |

Its icon sits near the clock while it runs; right-click it to see the list or exit. To change a
shortcut, edit the `SHORTCUTS` list at the top of the file.

## How it behaves

**Voice buttons**
- On the **Chat and Cowork** page they toggle Claude's voice mode.
- On the **Code** page (or wherever voice mode isn't available) they toggle dictation. Dictation
  ends by itself after 2 seconds of quiet, or if you haven't started talking within 7 seconds.

**Voice + send button** (`claude-voice-on-off-send.ahk`)
- After dictation ends, it waits for your words to land in the message box and presses Enter.
- Then it waits for Claude to finish replying, beeps, and listens for your next message.
- The conversation ends when you finish a message with a goodbye ("bye", "I'm done", "that's all",
  "see you later"...), stay quiet for 7 seconds after the beep, press the button again, or switch
  to another page or chat. A message that's only a goodbye isn't sent.

**"Hey Claude"** (`claude-hey-claude.ahk`)
- Say "Hey Claude", pause, and start talking at the beep.
- **Code page:** one dictated message, sent when you stop talking. That's it until the next "Hey Claude".
- **Chat page:** starts voice mode. Voice mode ends once Claude finishes answering a goodbye from you,
  or after it has just been sitting on "Listening" for 5 seconds with nobody talking.
- It ignores "Hey Claude" said too quietly (background talk) and checks each one against look-alike
  phrases ("oh yeah", "let's go", "caught it"...) so everyday speech doesn't set it off. Very close
  phrases like "hey caught" can still get through now and then.
- Right-click the tray icon to **pause listening** (this frees the mic), run **Teach it my voice**,
  open **Windows voice training**, or exit.

## Settings

Each script has a Settings block near the top. The most useful ones:

| Script | Setting | What it's for |
|---|---|---|
| voice scripts | `SILENCE_MS` | How much quiet ends dictation (default 2 s) |
| voice scripts | `FIRST_WORDS_MS`, `NEXT_WORDS_MS` | How long to wait for you to start talking (7 s) |
| voice scripts | `VOICE_LEVEL` | Mic level that counts as talking. Raise it if background noise keeps dictation going |
| voice + send | `SIGN_OFFS` | The goodbyes that end a conversation |
| voice + send | `KEEP_GOING_MS` | Set to 0 for one message per press instead of a back-and-forth |
| Hey Claude | `MIN_CONFIDENCE`, `MIN_LOUDNESS` | How sure and how loud "Hey Claude" must be. **Teach it my voice** sets both and saves them in `claude-hey-claude.ini` |
| Hey Claude | `LOOK_ALIKES` | Phrases "Hey Claude" must beat. Add any word that keeps setting it off |
| Hey Claude | `VOICE_IDLE_MS` | How long voice mode can sit on "Listening" before it ends (5 s; 0 turns it off) |

## Privacy

- "Hey Claude" detection runs **offline on your PC** with Windows' speech recognizer. The scripts
  don't send anything anywhere; only Claude's own dictation and voice mode, once started, send audio
  to Anthropic the way they normally do.
- While the listener runs, Windows shows AutoHotkey as using the microphone.
- Log files are saved next to the scripts (`...-log.txt`). The voice + send log includes the text of
  messages it sent, and the "Hey Claude" log notes goodbyes. **Teach it my voice** saves your
  recordings in `hey-claude-voice-samples`. Keep those to yourself; `.gitignore` leaves them out.

## Troubleshooting

- **Start with the setup check:** double-click `claude-setup-check.ahk`. It covers most problems
  below and says what to do about each.
- **A message popped up:** it names a log file. The log lists what the script saw, including every
  button name Claude showed, which usually points straight at the problem.
- **"Hold to record" message:** see setup step 4.
- **"Hey Claude" misses you or starts by mistake:** each attempt is in `claude-hey-claude-log.txt`
  with how sure it was and how loud. Run **Teach it my voice** again, or adjust `MinConfidence` /
  `MinLoudness` in `claude-hey-claude.ini`.
- **The buttons can't start Claude:** your install may use a different app ID. The setup check
  shows the exact `CLAUDE_APP` value to put at the top of each script.
- **A script can't find a button:** check Claude is in English. If Claude just updated, a button may
  have been renamed; the log's list of button names shows what it's called now.

## License

MIT. See [LICENSE](LICENSE).
