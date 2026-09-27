# Hey, Claude! (unofficial)

**A plugin for the Claude desktop app on Windows.** It gives Claude a floating captions window
that follows your conversation over whatever you're doing, a hands-free **"Hey Claude"** wake
word, one-press voice and dictation, and shortcuts (or Stream Deck buttons) for getting around
Claude. Built with [AutoHotkey v2](https://www.autohotkey.com/).

**[Download the latest release](https://github.com/nickrannikko-hub/Hey-Claude-/releases/latest)**,
unzip it, and follow [Setup](#setup).

> **Unofficial.** Not made by or affiliated with Anthropic. These scripts work by reading Claude's
> window and pressing its buttons by their names, so a Claude update that renames a button can
> break them until the scripts are updated.

## Features

**Captions: your Claude conversation in a floating window**
- What you say and Claude's reply show up as they happen, in a small box that stays on top of your
  game, browser or other monitor, laid out like Claude's own window (paragraphs, lists, code, and
  on the Code page each step Claude takes).
- **Know when Claude is done:** a spark moves while Claude works, and a line at the end of the reply
  shows the time, tokens and what it's doing, then says **Finished**.
- **Talk or type:** voice mode shows **LISTENING**, **THINKING** or **SPEAKING** with a glowing light,
  or type into the box and send without switching windows.
- **Tuck it away:** the box shrinks into a little Claude tab at the edge of your screen that counts
  new messages, rocks while Claude works and spins when it's done.
- **Scroll back** through the conversation with the real time of each message, switch between
  Chat & Cowork and Code, and open any chat or session from the **☰** list.
- **Links** in Claude's replies open in a page attached right under the box.
- **Extras:** Code replies read out loud, typing sounds (soft clicks, Animal Crossing or Undertale
  style), text that types itself out letter by letter.
- **Make it yours:** themes or your own colors, any font and size, a see-through background,
  animations, a gently floating box, High FPS, and any monitor at any scaling (4K included).

**"Hey Claude" wake word**
- Say "Hey Claude" from anywhere to start voice mode (Chat page) or a dictated message that sends
  itself (Code page). No tabbing out, no clicking.
- Recognition runs offline on your PC, can be taught your voice, and ignores everyday look-alikes
  like "oh yeah", "okay cool" and "that was cool".

**Voice and dictation in one press**
- Voice mode on the Chat page, or dictation on the Code page, from a single button or shortcut.
- A back-and-forth mode sends your message when you stop talking, listens again after Claude
  replies, and ends when you say goodbye.

**Getting around Claude**
- Open or quit Claude, switch between its pages, or open a chat by name, from keyboard shortcuts,
  Stream Deck buttons, or a double-click.

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
| `claude-captions.ahk` | **On-screen captions:** a small box in the corner of your screen showing what you say and what Claude says back, as it happens. It can tuck away into a little Claude tab at the side of the screen, and open links from Claude's replies in a page right under it. Running it again turns it off. |
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
     | Open chat | Voice on/off | Voice on/off + send | Captions on/off |

   - **No Stream Deck:** double-click `claude-hotkeys.ahk` for keyboard shortcuts (see
     [Keyboard shortcuts](#keyboard-shortcuts) below).
7. **"Hey Claude":** double-click `claude-hey-claude.ahk` (or give it a button or shortcut; it's an
   on/off toggle). A small AutoHotkey icon appears near the clock while it listens. Right-click it
   and choose **Teach it my voice...**, then say "Hey Claude" six times. That tunes it to your voice.
8. **Captions (optional):** double-click `claude-captions.ahk` (it's an on/off toggle too). A box
   shows up in the top right corner of your main monitor as you talk with Claude. Point at it and
   click the cog to change how it looks.
9. **Optional, start things with Windows:** press Win+R, type `shell:startup`, and put shortcuts to
   `claude-hey-claude.ahk`, `claude-captions.ahk` and/or `claude-hotkeys.ahk` in the folder that opens.

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
| Ctrl + Alt + T | On-screen captions, on/off |
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

**Captions** (`claude-captions.ahk`)
- A small box in the top right corner of your main monitor shows what you say and Claude's reply as
  they happen, laid out like Claude's window: paragraphs, lists, `code`, and on the Code page the
  steps Claude takes and what it's doing ("2m 5s · 1.3k tokens · Thinking…"). It fades in when
  something is said and away once things go quiet.
- **Tabs** on top show which page Claude is on, **Chat & Cowork** or **Code**; click the other one
  to switch Claude over. The **☰** tab lists your chats (or Code sessions) like Claude's sidebar
  does; click one to open it.
- On the Chat page your words sit on the right and Claude's on the left (bubbles are an option).
  Each page, and each chat or session, keeps its own conversation in the box.
- **Is Claude done?** Claude's newest reply has Claude's spark by its name, and one line at the
  end says what it's doing ("1m 12s · 3.4k tokens · Thinking…"). The spark moves while Claude is
  working and settles when it's done, and the line turns into **Finished · 2m 12s · 5.1k tokens**.
- **Voice mode:** a pill at the top says **LISTENING**, **THINKING** or **SPEAKING**, like Claude's
  own voice mode. A light at the bottom of the box glows orange while Claude is listening to you
  and blue while Claude talks. A **VOICE MODE** tag sits by your words. Words can also light up as
  Claude says them (an option in the settings, off at first).
- **Type to Claude:** click the **Message Claude…** box at the bottom and type; Enter sends it,
  Shift+Enter starts a new line, and Esc puts it away (keeping what you typed).
- **Read replies out loud (Code page):** an option in the settings reads Claude's replies in a
  Windows voice, with the words showing as they're read.
- Scroll the mouse wheel over the box to read back through the conversation. While you do, the
  name of who's talking stays pinned at the top and each message's time fades in. Scroll to the
  top and the box fetches older messages from Claude's window. A small arrow at the top means
  there's something above you haven't seen yet, and a **NEW** line marks where it starts. Point at
  the box to drag it by the grip at the top or resize it from a corner; "Put the box back in its
  corner" in its tray menu undoes a move. It works on any monitor, at any display scaling.
- **Message times:** Code sessions get their times from Claude Code's own session files on your
  PC. Chats aren't kept on your PC, so for those the captions note the time of each message they
  see from then on.
- **Tuck it away:** point at the box and click the **–** next to the cog, at the top right. The
  box (and the settings, if they're open) shrinks into a little tab with Claude's logo peeking out
  from the side of your screen. Drag the tab to any edge. Point at it and it pops out a bit; click
  it and everything comes back. While it's tucked away, the logo rocks while Claude works, spins
  when it's done, and counts each new message (blue for Code, red for Chat & Cowork).
- **Links:** when Claude's reply links to a website, small pills show at the bottom of the box
  (like "youtube.com"). Click one to open the page in a window attached right under the box; click
  it again to close it. Pages open in Microsoft Edge (or your usual browser if Edge isn't there).
- Clicks go straight through the box to whatever is underneath (only its handles and tabs take
  clicks), and it never takes the keyboard from what you're typing in.

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
| voice + send | `MAX_TALK_MS` | Dictation sends itself after this long, even if it still hears noise (3 minutes) |
| Captions | the **cog** on the box | A settings window with tabs (**LOOK**, **TEXT**, **SOUND**, **MOTION**, **BOX**, **TUCK & LINKS**); point at a **?** to see what a setting does. Font and size, colors (Dark, Light, Match Windows, themes like Midnight, Ocean, Forest, Sunset, Paper, Rosé and Mono, or your own with **Custom**, which keeps them readable and has a **Default** button), how see-through it is (down to just the words), corner, width and height, how Claude's words come in (fading in, or typed out letter by letter), their speed, scroll smoothness, how the box appears and tucks away, how long it stays up, whether words light up in voice mode, bubbles on the Chat page, a gently floating box, **High FPS** (drawn as often as your screen refreshes), typing sounds (soft clicks, Animal Crossing or Undertale style) and their volume, hearing Claude in voice mode, reading Code replies out loud (voice and speed), the typing box, the Claude tab's count and wiggle, and opening links by themselves. **Reset to defaults** puts it all back. Saved in `claude-captions.ini` |
| Captions | the **version** by the title | Switch to an earlier version of the captions kept in a `captions-versions\<version>` folder next to the script. To come back, turn the captions off and on again |
| Captions | **Glow timing** (same window) | If the lit-up word runs ahead of Claude's voice (common with sound mixers like Voicemeeter, or wireless headphones), slide it right |

## Privacy

- "Hey Claude" detection runs **offline on your PC** with Windows' speech recognizer. The scripts
  don't send anything anywhere; only Claude's own dictation and voice mode, once started, send audio
  to Anthropic the way they normally do.
- While the listener runs, Windows shows AutoHotkey as using the microphone.
- The captions only read Claude's window, and Claude Code's session files, on your PC. For the
  lit-up words and the listening light in voice mode they check how loud Claude's app and your
  microphone are, but they don't record or send anything. Reading replies out loud uses a Windows
  voice on your PC.
- Log files are saved next to the scripts (`...-log.txt`). The voice + send log includes the text of
  messages it sent, and the "Hey Claude" log notes goodbyes. **Teach it my voice** saves your
  recordings in `hey-claude-voice-samples`. The captions keep `claude-captions-times.txt`, noting
  when each message was sent by its words. Keep those to yourself; `.gitignore` leaves them out.

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
- **The captions' lit-up words run ahead of (or behind) Claude's voice:** point at the box, click
  the cog, and move **Glow timing** while Claude talks.
- **The captions' ☰ list is empty:** it reads Claude's sidebar, so keep the sidebar open in Claude.
- **The captions' words are hard to read with your own colors:** click the cog, and on the
  **LOOK** tab click **Default** (twice) beside your colors, or **Reset to defaults** at the bottom
  for every setting.
- **The captions' box disappeared:** it may be tucked away. Look for the little Claude tab at the
  side of your screen and click it, or pick "Tuck the box into the side (or bring it back)" in its
  tray menu.
- **A script can't find a button:** check Claude is in English. If Claude just updated, a button may
  have been renamed; the log's list of button names shows what it's called now.

## License

MIT. See [LICENSE](LICENSE).
