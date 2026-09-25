# Claude voice controls for Mac (experimental, untested)

> **Untested.** This is a port of the Windows scripts to [Hammerspoon](https://www.hammerspoon.org/),
> written without access to a Mac, so it hasn't been run yet. Expect some rough edges. If you try it,
> feedback is very welcome: see [Reporting problems](#reporting-problems). Not affiliated with Anthropic.

Everything lives in one file, `claude.lua`. It gives you a ✳ menu bar icon, keyboard shortcuts,
links a Stream Deck can trigger, and "Hey Claude" through macOS Voice Control.

## What it does

| Shortcut | Does |
|---|---|
| ⌃⌥⌘O | Open Claude on the **Chat and Cowork** page |
| ⌃⌥⌘P | Switch between the **Chat and Cowork** and **Code** pages |
| ⌃⌥⌘1 ... 9 | Open your chats (set their names in the settings) |
| ⌃⌥⌘V | **Chat page:** voice mode on/off. **Code page:** dictation on/off |
| ⌃⌥⌘S | Same, but dictation **sends itself**, then listens again after Claude replies (a back-and-forth) |
| ⌃⌥⌘H | "Hey Claude": starts voice mode (Chat page) or one dictated message that sends itself (Code page) |
| ⌃⌥⇧⌘Q | Quit Claude |

- **Dictation** ends once your words stop changing in the message box for 2 seconds, or if nothing
  shows up within 7 seconds.
- **The back-and-forth** ends when a message finishes with a goodbye ("bye", "I'm done", "see you
  later"...), when you're quiet for 7 seconds after the beep, when you press the shortcut again, or
  when you switch page or chat. A message that's only a goodbye isn't sent.
- **Voice mode**, once started by this script, ends when you say a goodbye (after Claude's reply has
  had time to be read out, at most 5 seconds), or after it has just been "Listening" for 5 seconds.

## Setup

1. **Install Hammerspoon** from [hammerspoon.org](https://www.hammerspoon.org/) (or
   `brew install --cask hammerspoon`) and open it.
2. **Give Hammerspoon Accessibility permission:** System Settings → Privacy & Security →
   Accessibility → turn on Hammerspoon. (It needs this to press Claude's buttons.)
3. **Add the script:** copy `claude.lua` into `~/.hammerspoon/`. Then open `~/.hammerspoon/init.lua`
   (create it if it doesn't exist) and add this line:
   ```lua
   require("claude")
   ```
   Click the Hammerspoon menu bar icon → **Reload Config**. A ✳ icon appears in the menu bar.
4. **Set your chats:** at the top of `claude.lua`, change `chats = { "My chat" }` to the exact titles
   of your chats as they show in Claude's sidebar, for example `chats = { "General chat", "Work" }`.
   Reload Hammerspoon after editing.
5. **In Claude, turn off "Hold to record":** on the Code page, click the small arrow next to the
   microphone (Dictation settings) and untick **Hold to record**.
6. **Run the setup check:** ✳ menu → **Setup check**. It tells you what (if anything) to fix.
7. **Stream Deck (optional):** use the **Hotkey** action with the shortcuts above, or the
   **Website** action with a link like `hammerspoon://claude?do=voice`. Links: `do=open`, `do=page`,
   `do=chat&name=My%20chat`, `do=voice`, `do=send`, `do=hey`, `do=quit`, `do=check`.

### "Hey Claude"

macOS doesn't give Hammerspoon a wake word, so this uses Voice Control, which is built into macOS:

1. System Settings → Accessibility → **Voice Control** → turn it on.
2. Click **Commands...** → **+**. Set **When I say** to `Hey Claude`, **While using** to Any
   Application, and **Perform** to **Press Keyboard Shortcut**, then press ⌃⌥⌘H. Click **Done**.
3. Voice Control normally also types what you say into whatever text box is active. To stop that,
   say **"Command mode"** so it only listens for commands like "Hey Claude". (Say "Dictation mode"
   to switch back.)

Say "Hey Claude", pause, and start talking at the beep (Code page) or once voice mode starts
(Chat page).

## Settings

Near the top of `claude.lua`: `chats`, `silenceSeconds`, `firstWordsSeconds`, `nextWordsSeconds`,
`keepGoing` (false = one message per ⌃⌥⌘S), `voiceIdleSeconds` (0 turns it off), `goodbyeMaxSeconds`,
`signOffs` and `hotkeyMods`. Reload Hammerspoon after changing them.

## How it differs from the Windows version

- **No mic level meter:** dictation ends when your words stop changing in the message box. If Claude
  on Mac only fills in your words once dictation stops, dictation will stop after 7 seconds
  (`firstWordsSeconds`) and then send what arrives, so raise that setting for longer messages.
- **Goodbyes in voice mode:** instead of listening to Claude's voice, it waits for Claude's reply to
  appear plus about as long as reading it out takes (2.5 words a second), never more than 5 seconds.
- **Voice mode is only watched when this script started it** (⌃⌥⌘V, ⌃⌥⌘S or ⌃⌥⌘H).
- **"Hey Claude"** uses Voice Control, so there's no loudness cutoff, look-alike check or
  "Teach it my voice". Voice Control has its own speech settings.

## Reporting problems

The most likely problem is a button being called something slightly different on Mac. To help fix it:

1. ✳ menu → **Save Claude's button names (for bug reports)**. That saves
   `~/.hammerspoon/claude-button-names.txt`, the names of Claude's buttons and switches. It includes
   your chat titles but not what's in your chats.
2. ✳ menu → **Open log** (`~/.hammerspoon/claude-log.txt`). It lists what the script did and why.
3. Open an issue on this project's GitHub page with what you tried, what happened, and those two files.
