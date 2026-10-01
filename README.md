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
  unread messages, rocks while Claude works and spins when it's done.
- **Scroll back** through the conversation with the real time of each message (a **NEW** mark on
  each paragraph you haven't read yet), switch between Chat & Cowork and Code in an instant, and
  open any chat or session from the **☰** list. **Clear box** starts the box fresh whenever you like.
- **Claude's model and effort** at the bottom of the **☰** list: pick a model (More models and
  Haiku's Extended switch included), set the effort on the Code page, see your usage limits, and
  click the context ring to compact a Code session.
- **Links** in Claude's replies open in a page attached right under the box, lined up with it.
  Minimize the page and it tucks into a tab of its own on the box; drag it anywhere out of the way,
  and drop it back on its outline to snap it on again.
- **Extras:** Code replies read out loud, typing sounds (soft clicks, Animal Crossing or Undertale
  style), text that types itself out letter by letter, chat bubbles.
- **Make it yours:** themes or your own colors, any font and size, a see-through background,
  animations, a gently floating box, and any monitor at any scaling (4K included).
- **Made for gaming:** it shows over full-screen games (use the game's borderless mode), and
  **Gaming mode** keeps it light while you play. The **Claude key** (Pause, or a Stream Deck
  button) hands the box the mouse and keyboard in the middle of a game: the game blurs softly
  behind it until you go back. And in games that draw their own pointer in their menus, the box
  answers it like any other window, with nothing to set up.

**"Hey Claude" wake word**
- Say "Hey Claude" from anywhere to start voice mode (Chat page) or a dictated message that sends
  itself (Code page). No tabbing out, no clicking.
- **In a game, you keep playing:** Claude works from behind it, so you never lose your mouse or the
  keys you're holding.
- Recognition runs offline on your PC and ignores everyday look-alikes like "oh yeah", "okay cool"
  and "that was cool".
- **The new ear (optional):** a small offline speech model that only wakes on "Hey Claude" said on
  its own, so talking *about* Claude doesn't set it off. It needs Python (see
  [The new "Hey Claude" ear](#the-new-hey-claude-ear)); without it, Windows' own recognizer listens,
  and can be taught your voice.
- **Works in voice chats:** while Discord (or another program) is using your mic, it still hears
  your "Hey Claude" but not your conversation with friends.

**Voice and dictation in one press**
- Voice mode on the Chat page, or dictation on the Code page, from a single button or shortcut.
- A back-and-forth mode sends your message when you stop talking (it gives you time to think in a
  longer message), listens again after Claude replies, and ends when you say goodbye.

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
| `claude-cursor.ahk` | **The Claude key** as a Stream Deck button: brings the captions box up with the pointer on it. In a game, the box takes the mouse and keyboard until you press it again (turns the captions on first if they're off). |
| `claude-hotkeys.ahk` | Keyboard shortcuts for all of the above, for use **without a Stream Deck**. |
| `claude-setup-check.ahk` | Checks everything the scripts need and tells you what's missing. Run it first. |
| `hey-claude-ear\` | **Optional:** the new "Hey Claude" ear. See [The new "Hey Claude" ear](#the-new-hey-claude-ear). |

## Requirements

- Windows 10 or 11
- The Claude desktop app, set to **English** (the scripts find buttons by their English names)
- [AutoHotkey v2](https://www.autohotkey.com/) (the 64-bit version it installs by default)
- An Elgato Stream Deck is **optional**: `claude-hotkeys.ahk` gives you keyboard shortcuts instead,
  and you can also just double-click the scripts
- For "Hey Claude": Windows' built-in English (US) speech recognizer. It comes with Windows; the
  listener shows a message if it can't start.
- **Optional,** for the new "Hey Claude" ear: [Python](https://www.python.org/) 3.10 or newer
  (tested with 3.14) and about 700 MB of space for it and its models.

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

     | | | | | |
     |---|---|---|---|---|
     | Open Claude | Close Claude | Switch page | Hey Claude on/off | Claude key |
     | Open chat | Voice on/off | Voice on/off + send | Captions on/off | |

     (**Claude key** is `claude-cursor.ahk`.)

   - **No Stream Deck:** double-click `claude-hotkeys.ahk` for keyboard shortcuts (see
     [Keyboard shortcuts](#keyboard-shortcuts) below).
7. **"Hey Claude":** double-click `claude-hey-claude.ahk` (or give it a button or shortcut; it's an
   on/off toggle). A small AutoHotkey icon appears near the clock while it listens. With Windows'
   recognizer, right-click it and choose **Teach it my voice...**, then say "Hey Claude" six times.
   That tunes it to your voice. For the new ear instead, see
   [The new "Hey Claude" ear](#the-new-hey-claude-ear).
8. **Captions (optional):** double-click `claude-captions.ahk` (it's an on/off toggle too). A box
   shows up in the top right corner of your main monitor as you talk with Claude. Point at it and
   click the cog to change how it looks.
9. **Optional, start things with Windows:** press Win+R, type `shell:startup`, and put shortcuts to
   `claude-hey-claude.ahk`, `claude-captions.ahk` and/or `claude-hotkeys.ahk` in the folder that opens.

### The new "Hey Claude" ear

Optional, and worth it if "Hey Claude" ever goes off while you're only talking *about* Claude. The
ear listens offline on your PC: it only counts "Hey Claude" said on its own, with a pause before
and after it, and a small speech model (Whisper) has to write it down as just "Hey Claude". While
you talk, it also tells voice mode you're still talking, even in a noisy game.

1. Install [Python](https://www.python.org/) 3.10 or newer.
2. Open a command prompt in the `hey-claude-ear` folder and run:
   ```
   py -m venv venv
   venv\Scripts\python -m pip install -r requirements.txt
   venv\Scripts\python -c "from openwakeword.utils import download_models; download_models()"
   ```
3. Download `hey_claude.onnx` from [huggingface.co/gdiamos/hey-claude](https://huggingface.co/gdiamos/hey-claude)
   and put it in `hey-claude-ear\models` (make the folder).
4. Turn "Hey Claude" off and on again. `claude-hey-claude-log.txt` says "Listening for 'hey claude'
   with the new ear". The first time, the ear downloads Whisper's small English model (about
   75 MB) into `models` by itself.

Its notes are in `hey-claude-ear\ear-log.txt`. To go back to Windows' recognizer, set
`USE_NEW_EAR := false` at the top of `claude-hey-claude.ahk` (or delete the `venv` folder).

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
- Once you've been talking a while (6 seconds), dictation waits for 3.5 seconds of quiet instead of
  2 before it ends, so a pause to think in a longer message doesn't cut you off. In a voice chat
  (while Discord or another program is using your mic) it's always 2 seconds, so what you say to
  your friends after a pause isn't picked up.
- After dictation ends, it waits for your words to land in the message box and presses Enter.
- Then it waits for Claude to finish replying, beeps, and listens for your next message.
- The conversation ends when you finish a message with a goodbye ("bye", "I'm done", "that's all",
  "see you later"...), stay quiet for 7 seconds after the beep, press the button again, or switch
  to another page or chat. A message that's only a goodbye isn't sent.

**"Hey Claude"** (`claude-hey-claude.ahk`)
- Say "Hey Claude", pause, and start talking at the beep.
- **Code page:** one dictated message, sent when you stop talking. That's it until the next "Hey Claude".
- **Chat page:** starts voice mode. Voice mode ends once Claude finishes answering a goodbye from you,
  or after it has just been sitting on "Listening" for 3 seconds with nobody talking (never while
  Claude is still talking).
- **With the new ear** (see [The new "Hey Claude" ear](#the-new-hey-claude-ear)), only "Hey Claude"
  said on its own counts: "So Claude, what do you think" or "I said hey Claude and it..." don't.
- **With Windows' recognizer,** it ignores "Hey Claude" said too quietly (background talk) and checks
  each one against look-alike phrases ("oh yeah", "let's go", "caught it"...) so everyday speech
  doesn't set it off. Very close phrases like "hey caught" can still get through now and then.
- **In a voice chat** (while Discord or another program is using your mic), "Hey Claude" has to be
  said on its own: short, followed by a moment's pause (the way you wait for the beep), and heard by
  Windows' own dictation as something like "Hey Claude" too. Talking to friends ("this is like
  1.6", "it did it again, Claude") doesn't set it off, and it starts about half a second after you
  say it. Saying the words "Hey Claude" to your friends and then stopping will still start it.
- Right-click the tray icon to **pause listening** (this frees the mic) or exit, and with Windows'
  recognizer, to run **Teach it my voice** or open **Windows voice training**.

**Captions** (`claude-captions.ahk`)
- A small box in the top right corner of your main monitor shows what you say and Claude's reply as
  they happen, laid out like Claude's window: paragraphs, lists, `code`, and on the Code page the
  steps Claude takes and what it's doing ("2m 5s · 1.3k tokens · Thinking…"). It fades in when
  something is said and away once things go quiet.
- **Tabs** on top show which page Claude is on, **Chat & Cowork** or **Code**; click the other one
  to switch Claude over (the box goes back to the chat you last had open there). The **☰** tab
  lists your chats (or Code sessions) like Claude's sidebar does; click one to open it.
- **At the bottom of the ☰ list:** Claude's model (click it to pick another, More models and
  Haiku's Extended switch included), and on the Code page the effort slider, your usage limits,
  and a ring showing how full the session's context is. Click the ring to compact the session (it
  waits until Claude isn't working).
- **Clear box**, at the top of the ☰ list, empties the box for a fresh start (Claude's chat itself
  isn't touched). Click it again within 5 seconds to undo.
- On the Chat page your words sit on the right and Claude's on the left (bubbles are an option).
  Each page, and each chat or session, keeps its own conversation in the box.
- **Is Claude done?** Claude's newest reply has Claude's spark by its name, and one line at the
  end says what it's doing ("1m 12s · 3.4k tokens · Thinking…"). The spark moves while Claude is
  working and settles when it's done, and the line turns into **Finished · 2m 12s · 5.1k tokens**.
- **Voice mode:** the names say **LISTENING · YOU** while Claude listens and **CLAUDE · SPEAKING**
  while it talks, and a light at the bottom of the box glows in your color while Claude is
  listening to you and in Claude's while Claude talks. The box stays up the whole time voice mode
  is on. Words can also light up as Claude says them (an option in the settings, off at first).
- **Type to Claude:** click the **Message Claude…** box at the bottom and type; Enter sends it,
  Shift+Enter starts a new line, and Esc puts it away (keeping what you typed).
- **Read replies out loud (Code page):** an option in the settings reads Claude's replies in a
  Windows voice, with the words showing as they're read.
- Scroll the mouse wheel over the box to read back through the conversation. While you do, the
  name of who's talking stays pinned at the top and each message's time fades in. Scroll to the
  top and the box fetches older messages from Claude's window. A small arrow at the top means
  there's something above you haven't seen yet, and each paragraph you haven't read says **NEW**
  until you've read it. Point at
  the box to drag it by the grip at the top or resize it from a corner; "Put the box back in its
  corner" in its tray menu undoes a move. It works on any monitor, at any display scaling.
- **Message times:** Code sessions get their times from Claude Code's own session files on your
  PC. Chats aren't kept on your PC, so for those the captions note the time of each message they
  see from then on.
- **Tuck it away:** point at the box and click the **–** next to the cog, at the top right. The
  box (and the settings, if they're open) shrinks into a little tab with Claude's logo peeking out
  from the side of your screen. Drag the tab to any edge. Point at it and it pops out a bit; click
  it and everything comes back. While it's tucked away, the logo rocks while Claude works, spins
  when it's done, and counts the messages you haven't read (blue for Code, red for Chat & Cowork).
  "Hey Claude", or the mic turning on, brings the box back out.
- **Code while you're on Chat & Cowork:** the Code tab shows a dot while a Code session is working,
  and a count of its new replies.
- **Links:** when Claude's reply links to a website, small pills show at the bottom of the box
  (like "youtube.com"); scrolled back, they're the links in the replies you're looking at. Click
  one to open the page in a window attached right under the box, as wide as the box and lined up
  with it. Its pill says "youtube.com…" while it opens and gets a **✕** once it's there: click it
  again to close the page. Clicking another link swaps the page for that one. Pages open in
  Microsoft Edge (or your usual browser if Edge isn't there).
  - **Minimize the page** and it doesn't go to the taskbar: it tucks into a tab on the box, with a
    globe and the site's name (the Chat & Cowork and Code tabs go down to just their icons to make
    room if they need to). Click that tab to bring the page back.
  - **Drag the page** by its title bar to move it out of the way: it comes off the box and stays
    where you put it. Drag it back near its place and an outline shows where it'll snap back on;
    let go there and it does.
  - **In a game**, the page opens without taking the front from the game, and stays on top of it.
    You can click its links and buttons, scroll, and pick out text without being tabbed out of the
    game (typing into the page needs the game out of the way). If dragging, minimizing or closing
    the page does pull you out, the game is put right back in front. With the Claude key, the page
    shows through the blur.
- Clicks go straight through the box to whatever is underneath (only its handles and tabs take
  clicks), and it never takes the keyboard from what you're typing in.
- **Games:** the captions start themselves with AutoHotkey's UI Access version when it's installed
  (the standard installer includes it), which lets the box show over full-screen games. Set games
  to their **borderless** (windowed full screen) mode: in exclusive full screen, a game can drop to
  the desktop when anything is drawn over it. While a game is in front, **Gaming mode** keeps the
  box still and light, hides the Claude tab until there's something new, and stops other programs
  from pulling themselves in front of the game.
- **The pointer in a game:** where the game shows Windows' own pointer (as many do in their menus),
  the box answers it as usual. Games that draw a pointer of their own in their menus (like The Last
  of Us Part I) are learned the first time you play them: once the box has seen the game hold its
  pointer still while you play, it answers that game's menu pointer too, with nothing to set up.
  Games whose pointer wanders about while you play (like The Witcher 3) need the Claude key, so a
  stray pointer can't grab your clicks in the middle of a fight.
- **The Claude key** (Pause, changed on the **GAMING** tab of the settings, or the `claude-cursor.ahk`
  Stream Deck button) brings the box up with the pointer on it. In a game, the box takes the mouse
  and keyboard: the game softly blurs behind it and the box glows, and you can click, scroll, type
  and use the page under the box without tabbing out. Press it again, press Esc, or click the game
  to go back to playing, with the pointer where the game had it.
- **"Hey Claude" in a game:** it notices the game and works from behind it, clicking Claude's
  buttons without bringing Claude to the front, so the game keeps your mouse and the keys you're
  holding.

## Settings

Each script has a Settings block near the top. The most useful ones:

| Script | Setting | What it's for |
|---|---|---|
| voice scripts | `SILENCE_MS` | How much quiet ends dictation (default 2 s) |
| voice + send | `LONG_SILENCE_MS`, `LONG_TALK_MS` | The longer quiet that ends dictation once you've been talking a while (3.5 s, after 6 s of talking), so a pause to think doesn't cut you off. Not in a voice chat, where it's always `SILENCE_MS` |
| voice scripts | `FIRST_WORDS_MS`, `NEXT_WORDS_MS` | How long to wait for you to start talking (7 s) |
| voice scripts | `VOICE_LEVEL` | Mic level that counts as talking. Raise it if background noise keeps dictation going |
| voice + send | `SIGN_OFFS` | The goodbyes that end a conversation |
| voice + send | `KEEP_GOING_MS` | Set to 0 for one message per press instead of a back-and-forth |
| Hey Claude | `MIN_CONFIDENCE`, `MIN_LOUDNESS` | How sure and how loud "Hey Claude" must be. **Teach it my voice** sets both and saves them in `claude-hey-claude.ini` |
| Hey Claude | `LOOK_ALIKES` | Phrases "Hey Claude" must beat. Add any word that keeps setting it off |
| Hey Claude | `VOICE_CHAT_MAX_SECONDS`, `VOICE_CHAT_PAUSE_MS` | In a voice chat: how long "Hey Claude" can be (1.2 s) and the pause it needs after it (0.4 s). Raise the first if it misses you, the second if friends' chatter still sets it off |
| Hey Claude | `VOICE_IDLE_MS` | How long voice mode can sit on "Listening" before it ends (3 s; 0 turns it off) |
| Hey Claude | `USE_NEW_EAR` | Listen with the new ear when it's set up (`true`), or always with Windows' recognizer (`false`) |
| voice + send | `MAX_TALK_MS` | Dictation sends itself after this long, even if it still hears noise (3 minutes) |
| Captions | the **cog** on the box | A settings window with tabs: **GENERAL** (how long the box stays up, tucking away, unread alerts, the typing box, opening links by themselves), **LOOK** (themes like Midnight, Ocean, Forest, Sunset, Paper, Rosé and Mono, or your own colors, which stay readable; how see-through it is; chat bubbles; font and size), **LAYOUT** (corner, width, height), **ANIMATION** (Off, Smooth or Extra smooth, which draws as often as your screen refreshes; a gently floating box; how the box shows up and hides; how Claude's words come in, fading in or typed out letter by letter, and their speed; words lighting up in voice mode and its timing), **SOUND** (typing sounds, soft clicks, Animal Crossing or Undertale style, and their volume; hearing Claude in voice mode; reading Code replies out loud) and **GAMING** (**Gaming mode**: the box draws less often and holds still while a full-screen game is in front, for more FPS; the **Claude key**). Point at a **?** to see what a setting does, and changing how words come in shows a short test message. **Reset to defaults** puts it all back. Saved in `claude-captions.ini` |
| Captions | the **version** by the title | Switch to an earlier version of the captions kept in a `captions-versions\<version>` folder next to the script. To come back, turn the captions off and on again |
| Captions | **Glow timing** (same window) | If the lit-up word runs ahead of Claude's voice (common with sound mixers like Voicemeeter, or wireless headphones), slide it right |

## Privacy

- "Hey Claude" detection runs **offline on your PC**, with Windows' speech recognizer or the new
  ear. The scripts don't send anything anywhere; only Claude's own dictation and voice mode, once
  started, send audio to Anthropic the way they normally do. (The new ear's one-time setup
  downloads its models, and nothing after that.)
- While the listener runs, Windows shows AutoHotkey as using the microphone.
- The captions only read Claude's window, and Claude Code's session files, on your PC. For the
  lit-up words and the listening light in voice mode they check how loud Claude's app and your
  microphone are, but they don't record or send anything. Reading replies out loud uses a Windows
  voice on your PC.
- Log files are saved next to the scripts (`...-log.txt`). The voice + send log includes the text of
  messages it sent, and the "Hey Claude" log notes goodbyes and, in a voice chat, the few words
  it heard whenever it ignores something. **Teach it my voice** saves your
  recordings in `hey-claude-voice-samples`. The new ear keeps its last 40 "Hey Claude" recordings in
  `hey-claude-ear\clips` and its notes in `hey-claude-ear\ear-log.txt`. The captions keep
  `claude-captions-times.txt`, noting when each message was sent by its words;
  `claude-captions-cleared.txt`, noting where you cleared each chat from the box (by its last
  words); `claude-captions-games.txt`, the games it learned; and `claude-captions-log.txt`, noting
  which program took the front whenever a game (or anything full screen) lost it, and anything that
  went wrong. Keep those to yourself; `.gitignore` leaves them out.

## Troubleshooting

- **Start with the setup check:** double-click `claude-setup-check.ahk`. It covers most problems
  below and says what to do about each.
- **A message popped up:** it names a log file. The log lists what the script saw, including every
  button name Claude showed, which usually points straight at the problem.
- **"Hold to record" message:** see setup step 4.
- **"Hey Claude" misses you or starts by mistake:** each attempt is in `claude-hey-claude-log.txt`
  with how sure it was and how loud (and in a voice chat, how long it was and what dictation heard).
  Run **Teach it my voice** again, or adjust `MinConfidence` / `MinLoudness` in
  `claude-hey-claude.ini`.
- **The buttons can't start Claude:** your install may use a different app ID. The setup check
  shows the exact `CLAUDE_APP` value to put at the top of each script.
- **The captions' lit-up words run ahead of (or behind) Claude's voice:** point at the box, click
  the cog, and move **Glow timing** while Claude talks.
- **The captions' ☰ list is empty:** it reads Claude's sidebar, so keep the sidebar open in Claude.
- **The captions' words are hard to read with your own colors:** click the cog, and on the
  **LOOK** tab click **Default** (twice) beside your colors, or **Reset to defaults** at the bottom
  for every setting.
- **A game drops to the desktop, or the captions don't show over it:** switch the game to its
  borderless (windowed full screen) mode. If a game ever loses the front, `claude-captions-log.txt`
  says which program took it.
- **The box doesn't answer the pointer in a game's menu:** if the game draws its own pointer, play
  for a moment first (moving the camera), so the box can learn it; `claude-captions-log.txt` notes
  it ("… holds its hidden pointer still while you play"). Or use the Claude key, which works in
  every game.
- **The captions did something odd:** they never show an error box (not over your game); anything
  that went wrong is in `claude-captions-log.txt`, on a line starting with `ERROR:`.
- **The new ear doesn't start:** `claude-hey-claude-log.txt` says which ear is listening, and
  `hey-claude-ear\ear-log.txt` says why the new one stopped (most often, `hey_claude.onnx` missing
  from `hey-claude-ear\models`). Meanwhile, set `USE_NEW_EAR := false` at the top of
  `claude-hey-claude.ahk` to listen with Windows' recognizer.
- **The captions won't close from Task Manager:** running with UI Access, Windows protects them from
  other programs. Turn them off the usual way: their button, shortcut, or **Exit** in the tray menu.
- **The captions' box disappeared:** it may be tucked away. Look for the little Claude tab at the
  side of your screen and click it, or pick "Tuck the box into the side (or bring it back)" in its
  tray menu.
- **A script can't find a button:** check Claude is in English. If Claude just updated, a button may
  have been renamed; the log's list of button names shows what it's called now.

## License

MIT. See [LICENSE](LICENSE).
