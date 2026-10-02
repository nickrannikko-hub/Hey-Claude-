; On-screen captions for Claude (its version is CAPTIONS_VERSION, below)
;
; Shows a small box in the top right corner of your main monitor with what you're saying to Claude
; and what Claude is saying back, so you can follow a voice conversation without looking at
; Claude's window. It works alongside claude-hey-claude.ahk and the voice buttons, or on its own:
; it only reads Claude's window, the same way the "Hey Claude" listener watches for a goodbye.
;
; It reads like a little chat: what you said, then Claude's reply under it, laid out the way
; Claude's window shows it, with its paragraphs, bullet points, headings and `code`. While Claude
; is thinking, before its first words come, its spark moves and "Thinking…" shows under its name.
; While it works on the Code page, a
; small line under the reply shows what it's doing, like the Code page does: "2m 5s · 1.3k tokens ·
; Thinking…" or "Running tools…". Its steps show in the reply where they happen, small, like
; "Read claude-captions.ahk" or "Ran a command", with a dot that breathes while one is still going.
; Claude's new messages (its first words, or new words after a pause, like after some steps) get a
; little "new message" badge with the time, which pops in at the top of the box and fades away; the
; label keeps the reply's time. As a reply grows past
; the box, the box keeps up with its newest whole sections (paragraphs, list items), sized to fit
; them, so nothing cut off hangs at the top, and your message moves up out of the way. When you
; say something new, the last exchange slides up and the new one takes its place. If you say it
; while Claude is still busy with its reply, Claude only gets to it at its next stopping point (on
; the Code page, between its steps), so until then it waits at the bottom of the box, marked QUEUED.
;
; Scroll the mouse wheel over the box to go back through the whole reply and the earlier exchanges
; in the conversation (up to HISTORY_KEEP of them; what was said before captions saw it is read
; from Claude's window, which scrolls up for a moment to load more as you get to the oldest), two
; whole lines a notch, gliding to
; a stop as smoothly as the Scroll smoothness setting says, or drag the scroll bar on its right.
; Scroll back down past the newest, or move the mouse away, to return to the live captions, and
; "LIVE" shows at the bottom for a moment. While you scroll back, the name of whose words you're
; reading stays in a strip at the top, and each message's time shows, fading a few seconds after
; you stop (the one you're pointing at stays). To start over, click "Clear box" at the top of the ☰
; list: the conversation clears from the box (not from Claude), and stays clear, scrolling back and
; after captions restart too, until something new is said. Click it again straight away to bring it
; all back.
;
; When words of Claude's you haven't seen yet are above what the box shows (the box keeps up with
; the reply's newest sections), a small arrow at the top of the box says there's more up there to
; read. Words count as seen once they've been in the box for a moment. The arrow nudges upward a
; few times as it shows up, then rests, and goes away once you've seen them. Scrolled back, a thin
; line marked NEW shows where the words you haven't seen start, and fades once you have.
;
; In voice mode, where Claude reads its replies out loud, each word lights up as Claude says it:
; a soft glow in Claude's color hugs the letters Claude is on and sweeps along them, fading away
; behind. The captions can't hear the words themselves, only how loud Claude's app is, so the glow
; moves at Claude's pace while it talks and lines back up with the words at each pause (at the end
; of a sentence, or sometimes a phrase), learning Claude's pace as it goes. It runs a moment behind
; the sound (Glow timing, in the settings), since Claude's voice takes a moment to reach your ears,
; more so through sound mixers or wireless headphones. If the reply shows up faster than Claude
; says it, the box follows along, showing the paragraph Claude is on. Claude doesn't talk on the
; Code page, so there, the words don't light up.
;
; Tabs on top of the box show which of Claude's pages it's following, CHAT & COWORK or CODE: the
; one Claude is on joins the box. Click the other to switch Claude over. The ☰ tab opens a list
; beside the box of your sessions (on the Code page) or chats (on the Chat and Cowork page), as in
; Claude's sidebar; click one to go to it. At its bottom are the model (click it to pick another,
; from Claude's own menu, More models and Effort included, and switches like Haiku's Extended), on
; the Code page the effort slider, and a ring for how full the session's context is: once Claude's
; done, click the ring to compact the session (it then shows in the box like any message, "Compacted
; session · saved …", and counts on the Code tab if you're on the other page). On the Chat and Cowork page, what you say goes on the
; right and Claude's replies on the left, like a chat (put what you say in bubbles in the
; settings, if you like); on the Code page, they go one under the other. Each page, and each
; session or chat, keeps its own conversation in the box: going to another slides it in, and
; coming back brings back what was there. While voice mode is on, your name says LISTENING while
; it's your turn, and Claude's says SPEAKING while it talks, and a soft light rises from the bottom
; of the box in whoever's talking's color: your blue while it's listening to you, breathing and
; swelling as you talk, and Claude's orange while Claude talks, pulsing with its voice. In voice
; mode the box stays up while someone is talking, and goes away once things go quiet.
;
; Claude's words come in at a steady pace, however they arrive: fading in a word at a time, or
; typed out a letter at a time (with the Animal Crossing and Undertale sounds, or if you pick it),
; with the typing sounds following the letters. If a lot arrives at once, they speed up to keep up.
;
; When the box hides, it tucks away into Claude's logo, peeking out from the edge of the screen (or
; point at the box and click the – up by the tabs to tuck it away yourself, with its settings and
; any page open under it). Point at the logo and it slides out; click it and everything comes back
; where it was, the box growing out of the logo in the tuck animation you pick (Swoosh: slowly, then
; rushing out, landing with a little jiggle). Drag the logo to any edge of any screen, and the box
; opens from there, laid out for that side. While it's tucked away, the logo rocks back and forth
; while Claude works, does a full spin when Claude finishes a reply, and counts the replies that
; finished (blue for Code, red for Chat and Cowork, including other sessions in Claude's sidebar).
;
; Along the bottom of the box is a typing box, like Claude's own: click it to type to Claude
; instead of talking. Enter sends (Claude comes to the front for a moment to take it), Shift+Enter
; starts a new line, and Esc stops, keeping what you typed for later.
;
; When Claude's reply links to web pages, the first three show as small pills along the bottom of
; the box, each saying where it goes ("youtube.com"); scrolled back, the links in the replies in view
; do, coming and going as you scroll. Click one to open the page in a browser
; window attached to the box (under it, or above or beside it if there isn't room), which moves
; with the box, as the box does with it if you move the page; click the pill again to close it.
; While a page is open, the box stays up. In the settings, the first link in each reply can open
; by itself. (The page opens in Edge, as a bare window with no tabs or address bar, exactly as wide
; as the box; without Edge, in your default browser, in a new window of its own.)
;
; On the Code page, Claude's replies can be read out loud in a Windows voice, a paragraph at a
; time, with the words showing up as they're read. In voice mode on the Chat page, Claude's own
; voice can be muted, to read along instead.
;
; At the end of Claude's newest reply, Claude's spark says whether it's still going (moving, with
; what it's doing: "1m 12s · 3.4k tokens · Running tools…") or finished ("Finished").
;
; The box is sized for the monitor it's on (sharp on a 4K screen at 150%, too), and with High FPS on
; it's drawn as often as the screen refreshes, for the smoothest motion.
;
; Point at the box and its handles show: drag the grip at the top middle to move it, or a corner
; to resize it. Only the handles take clicks; everywhere else, clicks go through to what's
; underneath. "Put the box back in its corner" in the tray menu undoes a move.
;
; New words fade in and drift into place as they arrive, like in Claude's own chat. The box pops in
; out of its corner (or slides or fades in, as you choose), with its words flowing in after it, and
; goes away the same way, including when you turn it off. When you turn it on with no conversation
; to show yet, it pops in a short note saying captions are on, which then floats away. Right after
; "Hey Claude", it shows "I'm listening…" until you start talking. While voice mode or dictation is
; listening, your words are checked ten times a second, so they show up almost as soon as Claude
; writes them down. The box shows up when something new is said and fades away once nothing has
; changed for a while. Clicks go straight through it to whatever is underneath, and it never takes
; the keyboard away from the window you're typing in.
;
; Point at the box and a settings cog shows up by the tabs. Click it for the settings, drawn like
; the box itself, with a tab for each group: GENERAL (how long the box stays up, tucking away, unread
; alerts, the typing box, links), LOOK (the colors, with themes like Midnight, Ocean, Paper or Rosé
; or your own, how solid the background is, chat bubbles, the font and size), LAYOUT (its corner,
; width and height), ANIMATION (how smooth, floating, how the box shows and hides, how Claude's words
; appear and how fast, the word glow in voice mode), SOUND (the typing sounds and how loud, Claude's
; voice, reading Code replies out loud) and GAMING (Gaming mode, the Claude key). Point at a
; setting's little ? to see what it does. Changes show
; right away and are saved in claude-captions.ini next to this file. Click the version number at
; the top to switch to an earlier version (kept in captions-versions next to this file); to come
; back, turn captions off and on again.
;
; Running this file is an on/off toggle, like claude-hey-claude.ahk: the first time turns captions
; on, the next time turns them off (a double-click or a Stream Deck System > Open button both work).
; Its icon sits in the corner of the taskbar while it's on. Right-click the icon for:
;   Settings...     - the same as the cog (double-clicking the icon opens it too)
;   Tuck the box into the side (or bring it back) - the same as the – by the cog, or Claude's logo
;   Hide captions   - stops showing the box until you pick it again
;   Exit
; To have it start with Windows, put a shortcut to this file in your Startup folder
; (press Win+R and type shell:startup).

#Requires AutoHotkey v2.0 64-bit
CAPTIONS_VERSION := "1.8.0"   ; shown in the tray icon's tooltip and the settings window's title
; Uses the voice button's code for finding and reading Claude's window.
#Include %A_LineFile%\..\claude-voice-on-off-send.ahk
#SingleInstance Off   ; after the #Include, so it wins over the voice button's setting; CaptionsMain handles a second copy

; ---- Settings ---------------------------------------------------------------
; How the box starts out. The settings window (the cog on the box) changes these, and your choices
; are saved in claude-captions.ini, which wins over what's here. "Reset to defaults" comes back here.
FONT           := "Segoe UI"
FONT_SIZE      := 12            ; in points
THEME          := "Dark"        ; "Dark", "Light", "Match Windows", one of the other THEMES below, or "Custom"
BACKGROUND     := 90            ; how solid the background is: 0 (just the words) to 100 (solid)
CORNER         := "Top right"   ; corner of the main monitor: "Top right", "Top left", "Bottom right" or "Bottom left"
BOX_WIDTH      := 460           ; how wide the box is (at 100% display scaling)
BOX_LINES      := 10            ; how many lines tall the box can grow; scroll for the rest
ANIMATE        := true          ; words fade in and the box moves smoothly. false: everything changes at once
WORD_SPEED     := 7             ; how quickly new words fade in, from 1 (slowest) to 10 (fastest)
SCROLL_SMOOTH  := 6             ; how long scrolling back glides, from 1 (snappiest) to 10 (floatiest)
APPEAR         := "Pop"         ; how the box shows up and goes away: "Pop" (grows out of its corner),
                                ; "Slide" (glides in from the edge of the screen) or "Fade"
HIDE_AFTER     := 15            ; hide the box once nothing has changed for this many seconds. 0 keeps it showing
FOLLOW_VOICE   := false         ; in voice mode, each word lights up as Claude says it
BUBBLES        := false         ; on the Chat page, what you say sits in a bubble on the right (otherwise it's just on the right)
GLOW_DELAY     := 250           ; how long after Claude's sound the glow follows it (ms): the sound takes a moment to reach your ears
FLOAT_BOX      := false         ; the box drifts gently, and leans a little toward the mouse
HIGH_FPS       := true          ; draw as often as the screen refreshes (144 times a second on a 144 Hz screen), not 60
GAME_MODE      := true          ; while a game (or anything full screen) is in front, the box keeps still and draws only when
                                ; something changes, at most 60 times a second, and the Claude tab hides (see Gaming)
CLAUDE_KEY     := "Pause"       ; the key that brings the box up with a pointer on it, and in a game hands it the mouse and
                                ; keyboard (see ClaudeKey); one of CLAUDE_KEYS, which games leave alone
TYPING_SOUND   := "Off"         ; little sounds as Claude's words appear: "Off", "Soft clicks", "Animal Crossing" or "Undertale"
SOUND_VOLUME   := 40            ; how loud those are, from 0 to 100
TEXT_REVEAL    := "Match the sound"   ; how Claude's words appear: "Fade in" (a word at a time), "Letter by letter", or
                                ; "Match the sound" (letters for Animal Crossing and Undertale, fading in otherwise)
TYPE_BOX       := true          ; a box at the bottom for typing to Claude instead of talking
CLAUDE_VOICE   := true          ; hear Claude talk in voice mode (false mutes Claude's app while voice mode is on)
READ_CODE      := false         ; read Claude's replies out loud on the Code page, in a Windows voice
READ_VOICE     := ""            ; which Windows voice ("" for the first one)
READ_SPEED     := 5             ; how fast it reads, from 1 to 10
CUSTOM_COLORS  := "1F1E1D,F5F4EE,8AB4F8,E08A6D,F2C4A8"   ; the "Custom" colors: background, words, you, Claude, code
TUCK           := true          ; when the box hides by itself, it tucks into a tab with Claude's logo at the edge of the screen (the – beside the cog always does)
TUCK_STYLE     := "Swoosh"      ; how it tucks away and comes back out: "Swoosh", "Bouncy", "Smooth" or "Quick"
TUCK_COUNT     := true          ; ...which counts the replies that come in while it's tucked away
TUCK_WIGGLE    := true          ; ...and wiggles when Claude has something new
AUTO_LINKS     := false         ; open the first link in each of Claude's replies under the box by itself
; These aren't in the settings window:
LABEL_FONT     := "Segoe UI"    ; the labels and little indicators (YOU, CLAUDE, times, the badge) stay in this font
LISTENING_TEXT := "I'm listening…"   ; shown (softly) after "Hey Claude", until you start talking
SENT_WAIT_MS   := 4000          ; after you speak, how long to wait for your message to show up in Claude's window (ms)
NEW_BADGE_MS   := 2600          ; how long the "new message" badge shows, fading out at the end (ms)
NEW_AFTER_MS   := 3000          ; Claude's words after it's been quiet (or taking steps) this long count as a new message (ms)
LIVE_BADGE_MS  := 2200          ; how long "LIVE" shows at the bottom after you scroll back to the live captions (ms)
SEEN_MS        := 600           ; how long Claude's words have to be in view to count as seen (ms)
TIMES_MS       := 5000          ; how long the messages' times stay after you stop scrolling (ms)
APPEAR_MS      := 450           ; how long the box takes to show up (ms)
DISAPPEAR_MS   := 320           ; how long it takes to go away (ms)
HISTORY_KEEP   := 150           ; how many earlier exchanges you can scroll back to
CLEAR_UNDO_MS  := 5000          ; after clearing the box, how long a second click on "Clear box" brings it all back (ms)
MARGIN         := 16            ; space between the box and the edges of the screen
CHECK_EVERY_MS := 400           ; how often Claude's window is read (ms)
IDLE_CHECK_MS  := 1200          ; ...and while the box is hidden and nobody's talking, to go easy on Claude's window
TALKING_CHECK_MS := 1200        ; ...and while Claude reads out a reply that has all come in
YOUR_WORDS_MS  := 100           ; while voice mode or dictation is listening, how often the message box is read (ms)
VOICE_CHECK_MS := 30            ; while voice mode is on, how often Claude's voice is listened to (ms)
PANEL_ROWS     := 12            ; how many sessions or chats the list beside the box shows
SIDEBAR_ROW    := "w-full shrink-0 border-none text-left"   ; how a session or chat in Claude's sidebar starts its class
SETTINGS_FILE  := A_ScriptDir "\claude-captions.ini"
TIMES_FILE     := A_ScriptDir "\claude-captions-times.txt"   ; when each message the box saw was sent and replied to (see NoteTime)
CLEARED_FILE   := A_ScriptDir "\claude-captions-cleared.txt" ; where you cleared each conversation from the box (see ClearChat)
GAMES_FILE     := A_ScriptDir "\claude-captions-games.txt"   ; games seen holding their hidden pointer still while you play (see GamePointer)
POINTER_WATCH_TICKS := 72000    ; how long a game is watched to see if it holds its pointer, in looks at it (25 ms each) while the mouse moves: half an hour (see GamePointer)
FOCUS_LOG      := A_ScriptDir "\claude-captions-log.txt"     ; when a game (or anything full screen) lost the foreground, and to what (see WatchForeground), how smoothly the box moves (see NoteSmoothness), and what it did about new messages (see NoteEvent)
CODE_SESSIONS  := EnvGet("USERPROFILE") "\.claude\projects"   ; where Code sessions' transcripts are kept (see WatchCodeSessions, ReadTranscripts)
TRANSCRIPT_TAIL := 4 << 20      ; how much of the end of each of them is read for when older messages were sent, as captions start (bytes, see ReadTranscripts)
; -----------------------------------------------------------------------------

THEMES := ["Dark", "Light", "Match Windows", "Midnight", "Ocean", "Forest", "Sunset", "Paper", "Rosé", "Mono", "Custom"]
TYPING_SOUNDS := ["Off", "Soft clicks", "Animal Crossing", "Undertale"]
REVEALS := ["Match the sound", "Fade in", "Letter by letter"]
SETTINGS_TABS := ["GENERAL", "LOOK", "LAYOUT", "ANIMATION", "SOUND", "GAMING"]
; Your colors (the Custom theme), in the order they're kept: what each is called, and what it colors.
COLOR_NAMES := ["Box", "Words", "You", "Claude", "Code"]
COLOR_TIPS := ["The box's background (and its tab and the settings).", "What you and Claude say.",
    "Your name, the Code page's tab, and voice mode's light while Claude talks.",
    "Claude's name and spark, the Chat page's tab, links, and voice mode's light while it listens.", "Code in Claude's replies."]
VERSIONS_DIR := A_ScriptDir "\captions-versions"   ; earlier versions you can switch to from the settings (see RunVersion)
TUCK_STYLES := ["Swoosh", "Bouncy", "Smooth", "Quick"]
CORNERS := ["Top right", "Top left", "Bottom right", "Bottom left"]
APPEAR_STYLES := ["Pop", "Slide", "Fade"]
HIDE_CHOICES := ["5 seconds", "10 seconds", "15 seconds", "30 seconds", "1 minute", "Never"]
HIDE_SECONDS := [5, 10, 15, 30, 60, 0]
; The keys the Claude key can be (see ClaudeKey), and each one's name to AutoHotkey. They're keys
; games don't use: a game still sees a key pressed for the box (see ClaudeKey), so a letter could
; open its map.
CLAUDE_KEYS := ["Pause", "Scroll Lock", "Insert", "Menu key", "Off"]
CLAUDE_KEY_NAMES := Map("Pause", "Pause", "Scroll Lock", "ScrollLock", "Insert", "Insert", "Menu key", "AppsKey")
; How a reply's layout is written down after reading it from Claude's window: one line per
; paragraph, with these at the start of list items, headings and code blocks, and TICK around code.
TICK := Chr(96)
BULLET := "• ", HEADING := "# ", CODE_BLOCK := TICK TICK TICK " "
STEP := Chr(1) " ", STEP_RUNNING := Chr(2) " "   ; a step Claude took (read a file, ran a command), and one it's taking
; Shown while the settings are open and there's no conversation to show, so you can see your changes.
SAMPLE := {you: "Hey Claude, what's a good name for a coffee shop by the river?",
    claude: "How about Riverbend Roasters? It's easy to remember and says where you are. A few more:`n"
        . BULLET "The Landing, short and easy to read on a sign`n" BULLET "Bankside Beans, with a nod to the " TICK "river" TICK,
    live: false, streaming: false, thinking: false, work: ""}
UIA_HYPERLINK := 50005, UIA_LISTITEM := 50007, UIA_LIST := 50008, UIA_TOOLBAR := 50021

Settings := ""                  ; the settings in use
Look := ""                      ; sizes, fonts and colors, worked out from Settings
Canvas := ""                    ; the picture of the box: drawn here, then put on screen
FrameNow := 0                   ; the time the frame being drawn is drawn at (see MsNow)
Measurer := ""                  ; a tiny canvas for measuring words
Brush := 0, TextFormat := 0, CenterFormat := 0
BoxGui := ""
Page := ""                      ; which of Claude's pages it's on: "chat" (Chat and Cowork) or "code" ("" until known)
SeenPage := {page: "", at: 0}   ; the page the reads of Claude's window last said it's on, and when
ClaudeConvo := ""               ; the conversation Claude's window last showed (with a title), whatever the box shows (see OpenedYet)
ListPick := {title: "", at: 0}  ; the chat or session you last picked in the list beside the box, and when (see SetReopen)
Unhid := {hwnd: 0, at: 0, since: 0, front: 0}   ; Claude's window, if the box restored it unseen from minimized to click in: when it last did, when it restored it, and what was in front then (see ReadyToClick)
UNHID_MS := 3000                ; how long after that it's minimized again (see HideClaudeAgain)
UNHID_MAX_MS := 30000           ; ...and the longest after that, whatever else it's kept restored for (see HideClaudeAgain)
; Where Claude's page switches were last seen (from the reads, see PageOf): {hwnd, chat: {x, y},
; code: {x, y}, w, h, key}, so switching pages clicks one straight away (see ClickTab) instead of first
; looking for it in Claude's window, which takes most of a second in a long conversation. (key: all
; of that as one, to tell whether they've moved, see Digest.)
TabSpots := ""
PressPageSwitch := ClickTabSlowly   ; what presses Claude's page switch the slow way (see SwitchedYet; a test puts a stand-in here)
PageNow := PageOf               ; what asks Claude's window which page it's on (see SwitchedYet; a test puts a stand-in here)
QuickMisses := 0                ; how often the quick switch at Claude's page switch's spot hasn't taken (see SwitchedYet)
TabSpotsClicked := ""           ; where Claude's page switches were (TabSpots' key) when the last quick switch clicked one (see ClickTab)
; What Claude's buttons under its message box say on each page (see ModelBarOf), for the list beside
; the box (see Bar): the model, the effort (Code page) and the usage (Code page: context and plan
; limits); and when you last changed one from there (setAt), so a read from just before doesn't undo it.
; ModelMenu: the list of models (or efforts) dropped down in the list while you pick (see OpenModelMenu).
ModelBars := {code: {model: "", effort: "", usage: ""}, chat: {model: "", effort: "", usage: ""}, setAt: 0}
ModelMenu := ""
MenuReader := MenuChoices   ; (how Claude's open menus are read, which a test can stand in for)
EFFORT_TOP := 5   ; the Code page's Effort slider goes from 0 (Faster) to 5 (Smarter)
; Which step of the Effort slider each effort Claude names is (learned as you set them, see FinishEffort).
EffortSteps := Map("Max", 4, "Ultracode", 5)
PageAt := 0                     ; when that was last checked
VoiceMode := false              ; voice mode is on
VoiceMicLive := false           ; ...with its mic on (not muted)
Sessions := {list: [], current: "", key: "", unread: true}   ; the sessions or chats in Claude's sidebar, and the one showing
; ...as last read on each page ("chat" or "code"), so going to a page shows its list at once (see
; NoteSidebar), and when a read last found Claude on another page than the read before (SidebarPage).
SidebarLists := Map(), SidebarPage := {page: "", at: 0}
PanelGui := "", PanelCanvas := ""   ; the list of them beside the box
ClaudeWorking := false          ; Claude's Stop button showed in the last read: it's working on a reply
; Compacting the Code session from the ring in the list (see CompactSession): since when (at, 0 when
; not), how full the context was then (from), and how (CompactAction, which a test can stand in for).
Compacting := {at: 0, from: ""}
CompactAction := CompactSession
; Each chat and session keeps its own history (see SwitchConversation): the one showing (ConvKey,
; like "chat|General chat"), and the others put away, each as {current, history}.
ConvKey := "", Conversations := Map()
Minimized := false              ; you tucked the box away (with its –), so it stays in its tab until you click it
PeekGui := "", PeekCanvas := "" ; the tab with Claude's logo the box tucks into
; The page from Claude's reply open under the box, if there is one: its window, address, which side
; of the box it's on (side), where the box last put it (set), the size you gave it (w, h; 0 until
; you do), whether it's down on the taskbar (min), and what notices you moving it (hook, and
; dragging while you have hold of it).
Browser := NoPage()
PageExe := "msedge.exe"         ; the program of the browser the last page opened in (see OpenPage)
PageWidths := Map()             ; how narrow each browser's window goes, by its program, once seen (see MoveBrowser)
Perf := NewPerf()               ; how long the box spent on what isn't drawing lately (see NoteSmoothness)
; Lines for the logs (FOCUS_LOG, TIMES_FILE) noted while a read of Claude's window is being taken in
; (HoldingLogs, see TakeRead): held back meanwhile, each as [file, line], and written just after it
; (see AddToLog).
HeldLogs := [], HoldingLogs := false
Opened := false                ; you opened the box from its Claude tab, so it shows even with nothing to show
LoadingEarlier := false         ; Claude's window is scrolled up for a moment, to read older messages (see LoadOlder)
OlderJob := ""                  ; ...and what LoadOlder's doing meanwhile, with where Claude's list was
Composing := false              ; you're typing to Claude in the box at the bottom (see StartTyping)
EditGui := "", EditBox := ""    ; the real text box laid over it while you type
Typed := "", TypedFrom := 0     ; what you've typed but not sent yet, and the window you were in before
; Reading Claude's replies out loud on the Code page (see ReadAloud): whether it's talking, which
; exchange it's reading, how many of its lines it has read (or passed over), and for each line
; handed to the voice, which of the voice's streams it is (0 for lines that aren't read out, like
; code) and how long it is.
Reader := {speaking: false, ex: "", said: 0, lines: Map()}
; A setting's test message showing in the box, in the settings (see ShowPreview): the exchange it
; stands in for (saved), which setting it's about (key), and whether Claude's window said something
; new meanwhile (missed).
Preview := {saved: "", key: "", missed: false}
; Opening the conversation you had open last on a page again, when Claude opens another as you go
; there (see StillReopening): which (key), since when (at), whether it's been asked for (asked), and
; how (ReopenAction, which a test can stand in for).
Reopen := {key: "", at: 0, asked: false}
ReopenAction := OpenSession
HELD := 1 << 50                 ; when a word shows up, while it waits to be read out loud (see ReadFollow)
Current := NewExchange()        ; the exchange showing now
History := []                   ; earlier exchanges this session, oldest first
; What part of the conversation the box shows: its bottom edge and height (both easing toward
; where they're headed), whether it's scrolled back and from which line (topLine, in spans), where
; every line of the conversation is (spans), and how tall it all is (total).
View := {bottom: 0.0, h: 0.0, bottomSpeed: 0.0, hSpeed: 0.0, scrolled: false, topLine: 1, spans: [], total: 0}
; The box's animation: how far it has shown up (p, from 0 hidden to 1 fully there), whether you're
; pointing at it (hover) and at which of its handles (hot: "cog", "move", "scroll" or a corner
; like "resize-br"), where it is on screen, where its scroll bar is (bar), how much the arrow
; saying there's more above is showing (above, since aboveAt), where the tab joined to the box is
; (tabLeft, tabRight, gliding to the page Claude is on), how open the list beside the box is
; (panel, heading for panelTarget), which of its rows you're pointing at (panelHot) and where it
; is (panelX, panelY, panelH), how much voice mode's blue light shows (listen), when the box last
; slid over to another conversation and from which side (switchAt, switchDir), how open the strip
; at the top that holds a name while you scroll back is (sticky), how much the messages' times
; show (times), where the mouse is over the box (mouseY), when the last NEW line began to fade
; (lineGoneAt), how far it leans toward the mouse with Float on (leanX, leanY), whether it's going
; into or coming out of the Claude tab at the side (tucking), how much that tab shows (peek), how
; much you're pointing at it (peekHover, peekHot), whether it lets clicks through (peekThrough, in a
; game, see WatchPeek), where it is (peekX, peekY, peekW, peekH), how many
; new messages on each page you haven't read yet (peekCounts, on the logo and the page tabs) and when
; one was last counted, and on which (badgeAt, badgePage), when it last wiggled and spun (wiggleAt, spinAt), when the box last
; jiggled landing out of it (jiggleAt), how much the row of links at the
; bottom shows (links) and where each is (linkSpots), voice mode's light's color (tone: 0 your blue
; while it listens to you, 1 Claude's orange while Claude talks; think: toward a soft neutral while
; it thinks), and whether something changed that needs drawing (dirty).
Anim := {running: false, looping: false, loopAt: 0, quick: 0, driftX: 0.0, driftY: 0.0, last: 0, lastDraw: 0, p: 0.0, target: 0, hover: 0.0, hoverTarget: 0,
    hot: "", shown: false, x: 0, y: 0, h: 0, bar: "", liveAt: 0, above: 0.0, aboveAt: 0,
    through: true, pageAt: 0, tabLeft: 0.0, tabRight: 0.0, tabSpeedL: 0.0, tabSpeedR: 0.0, panel: 0.0, panelTarget: 0, panelHot: 0,
    panelX: 0, panelY: 0, panelH: 0, listen: 0.0, switchAt: 0, switchDir: 0, sticky: 0.0, times: 0.0, mouseY: "",
    lineGoneAt: 0, leanX: 0.0, leanY: 0.0, leanSX: 0.0, leanSY: 0.0, floatK: 0.0, baseX: 0, baseY: 0, tucking: false, peek: 0.0, peekHover: 0.0,
    peekHot: false, peekThrough: false, handed: 0.0, peekX: 0, peekY: 0, peekW: 0, peekH: 0, peekCounts: {code: 0, chat: 0}, codeWorking: false, badgeAt: 0, badgePage: "", wiggleAt: 0, spinAt: 0, tuckedAt: 0, jiggleAt: 0, links: 0.0,
    linkSpots: [], tone: 0.0,
    inputLines: 1, inputRect: "", think: 0.0, dirty: false}
; Dragging a handle with the mouse: which (mode), where it started, and the box as it was then.
Drag := {mode: "", resizing: false}
; Following Claude's voice (see FollowClaudesVoice): whether it is (on), which of the reply's
; spoken words (list, from the reply's laid-out part) Claude is on (word, counting from 0, with how
; far through it as a fraction, and pos, which glides after it), Claude's pace (rate, in words a
; second while it talks), how loud it is (env) and has been lately (level), how long it has talked
; (talkMs), where it has been lately (trail, for the glow to follow a moment behind), and how bright
; the glow on the words is (shown, glow). Also when Claude was last heard (loudAt), and how loud
; Claude (claudeLevel) and your mic (mic) are, for voice mode's blue light. A pretend voice (fake) can stand in for Claude's, to show
; what it looks like (demo).
Voice := {on: false, ticking: false, fake: "", demo: false, ex: "", parts: "", part: "", list: [], word: 0.0,
    pos: 0.0, posSpeed: 0.0, rate: 4.0, env: 0.0, level: 0.0, at: 0, loudMs: 0, quietMs: 0, heldMs: 0,
    talkMs: 0, paused: true, finished: false, snapTo: "", passed: 0, phraseStart: 0.0, phraseMs: 0,
    shown: 0.0, glow: 0.0, trail: [], loudAt: 0, claudeLevel: 0.0, mic: 0.0, micMeter: "", micTried: false}
VoiceModeAt := 0                ; when voice mode was last seen on
ScrollAt := 0                   ; when you last scrolled, to hold off reading Claude's window meanwhile
Shown := NothingRead()   ; what was last read from Claude's window
LastChange := 0
Hidden := false                 ; "Hide captions" is ticked
LastHwnd := 0
Listening := false              ; voice mode or dictation is listening, so your words are checked more often
Waiting := false                ; showing "I'm listening…" until you start talking
HeyClaudeAt := 0                ; when claude-hey-claude.ahk last heard "Hey Claude", till Claude's listening (see HeardHeyClaude)
Reads := 0
Started := A_TickCount          ; when captions started, so the conversation already there isn't "new"
SettledAt := 0                  ; until when what Claude's window shows counts as already there (after going to another conversation)
SettingsGui := "", SetUI := ""   ; the settings window, and how it's doing (see OpenSettings)
Times := Map()                  ; when your messages were sent and replied to, by their words (see GiveTimes)
Cleared := Map()                ; where you cleared each conversation from the box, by its key (see ClearChat)
ClearUndo := ""                 ; what the box had before you last cleared it, for a moment (see ClearChat)
GameFront := false              ; a game (or anything full screen) is in front (see Gaming)
PageAsked := {page: "", at: 0}  ; the page of Claude's you just switched to from the box, until Claude's window shows it (see SelectPage)
PageConvs := Map()              ; the conversation the box last showed on each page ("chat" or "code"), by its key
SnapGui := "", SnapCanvas := "" ; the outline showing where the page snaps back on (see ShowSnapSpot)
Catcher := ""                   ; lies over the page in a game, passing your clicks on to it (see CatchPage)
LastGame := 0, GameSeenAt := 0  ; the game last seen in front, and when (see ReturnToGame)
HoldingGames := Map()           ; games (by program) that hold their hidden pointer still while you play (see GamePointer)
; The pointer in a game (see GamePointer): the game in front, whether the mouse's own movement is being
; watched and how much it's moved since the last look, where the pointer was, whether it was following
; the mouse or held still by the game and when, and what's been seen of the game so far.
GamePtr := {game: "", sink: false, raw: 0, x: "", y: "", mode: "", modeAt: 0, run: 0, heldTicks: 0, watched: 0, gaveUp: Map()}
; The Claude key (see ClaudeKey): whether it handed the box the mouse and keyboard, the window over
; the game meanwhile and its picture (the game, softly blurred), where the pointer was and the game (0
; outside a game) before, and the glow behind the box meanwhile and its picture.
Handed := false, Veil := "", VeilCanvas := "", Took := {x: 0, y: 0, game: 0}, GlowGui := "", GlowCanvas := ""
; The fetcher: a helper that reads Claude's window in a program of its own, so the box never waits for
; it (see StartFetcher): its script window and program, when it last sent a read, when it was started,
; what it sent that hasn't been gone through yet (a read, and your words), how often it reads, and
; when it was last asked for a read because it had gone quiet.
Fetcher := {hwnd: 0, pid: 0, at: 0, startedAt: 0, read: "", said: "", every: CHECK_EVERY_MS, askedAt: 0}
; ...and in the fetcher itself: the captions' script window, how often it reads, Claude's window and
; when it last checked Claude's page (see ReadClaude), and whether (and what) you're saying.
FetchState := {owner: 0, every: CHECK_EVERY_MS, lastHwnd: 0, pageAt: 0, listening: false, said: ""}

if (A_LineFile = A_ScriptFullPath)
    CaptionsMain()

; Something going wrong in the box never shows as an error box: once, 30 of them piled up over a game,
; from something that went wrong each time it ran, the game and all behind them. It's noted in
; FOCUS_LOG instead (the same thing once a minute at most), with where it went wrong, and what was
; running stops there, as it would have after the error box. whose says where, if it wasn't the box
; itself (like "in the fetcher", see FetchFailed).
BoxFailed(e, mode, whose := "") {
    static noted := Map()
    where := ""
    try where := " at line " e.Line " (" e.What ")"
    key := e.Message where
    if (!noted.Has(key) || A_TickCount - noted[key] > 60000) {
        noted[key] := A_TickCount
        extra := ""
        try extra := e.Extra != "" ? " [" e.Extra "]" : ""
        try FileAppend(FormatTime(, "yyyy-MM-dd HH:mm:ss") "  ERROR" (whose != "" ? " " whose : "") ": " e.Message extra where "`n", FOCUS_LOG, "UTF-8")
    }
    return 1
}

; Keeps FOCUS_LOG from growing without end, as it's only ever added to (about 900 lines a day): past
; 500 KB as captions start, it's written again with just its newest 200 KB or so, from the start of a
; line.
TrimFocusLog() {
    try {
        if (FileGetSize(FOCUS_LOG) <= 500 << 10)
            return
        f := FileOpen(FOCUS_LOG, "r", "UTF-8")
        f.Pos := f.Length - (200 << 10)
        f.ReadLine()   ; (the rest of the line it landed in the middle of)
        text := f.Read()
        f.Close()
        FileDelete(FOCUS_LOG)
        FileAppend(text, FOCUS_LOG, "UTF-8")
    }
}

CaptionsMain() {
    ; Started as the fetcher (see StartFetcher): it reads Claude's window for the captions, and that's all.
    if (A_Args.Length >= 2 && A_Args[1] = "fetcher")
        return FetchMain(Integer(A_Args[2]))
    ; Started again by itself with UI Access (see below): it's the copy that stays on.
    relaunched := A_Args.Length && A_Args[1] = "uia"
    ; Running it again while it's already on turns it off (or an earlier version you switched to).
    if (!relaunched && ((running := OtherCaptions()) || (running := OlderCaptions()))) {
        WinClose(running)   ; asks the running copy to exit
        ToolTip("Captions are off")
        Sleep 2000
        ExitApp
    }
    ; Over games and other full-screen windows: AutoHotkey's UI Access version (installed with it, as
    ; AutoHotkey64_UIA.exe) puts the box's windows in the layer Windows keeps above everything else,
    ; like the on-screen keyboard's, so the box shows over a game instead of the game covering it. So
    ; captions start themselves again with it, if it's there (and just carry on without it if not).
    uiaExe := RegExReplace(A_AhkPath, "i)(?<!_UIA)\.exe$", "_UIA.exe")
    if (!relaunched && !HasUIAccess() && uiaExe != A_AhkPath && FileExist(uiaExe)) {
        try {
            Run('"' uiaExe '" "' A_ScriptFullPath '" uia', A_ScriptDir)
            ExitApp
        }
    }
    ; Other scripts (and turning captions off) can still reach a copy running with UI Access.
    DllCall("ChangeWindowMessageFilter", "uint", 0x10, "uint", 1)   ; WM_CLOSE, MSGFLT_ADD
    DllCall("ChangeWindowMessageFilter", "uint", DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.HeyClaude", "uint"), "uint", 1)
    DllCall("ChangeWindowMessageFilter", "uint", ClaudeKeyMessage(), "uint", 1)   ; (the Stream Deck button, see ClaudeKey)
    DllCall("ChangeWindowMessageFilter", "uint", SwitchPageMessage(), "uint", 1)   ; (the page switch button, see SwitchPagePressed)
    Persistent
    OnError(BoxFailed)   ; (never an error box over your game: see BoxFailed)
    TrimFocusLog()
    ; Claude's window left see-through (the box closed while it had it restored unseen, see
    ; ReadyToClick, and didn't get to minimize it again): seen again.
    try if ((hwnd := FindClaudeWindow()) && WinGetTransparent(hwnd) = 0)
        WinSetTransparent("Off", hwnd)
    A_MaxHotkeysPerInterval := 5000   ; (a fast wheel or a touchpad fires the wheel's shortcuts many times a second: no "hotkeys received" box)
    ; Each monitor's own scaling (like 150% on a 4K screen), so the box is sharp on any of them rather
    ; than stretched by Windows (see MonitorDpi).
    try DllCall("SetThreadDpiAwarenessContext", "ptr", -4, "ptr")   ; DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2
    A_IconHidden := false   ; the voice button's code hides the tray icon; this script wants it
    A_IconTip := "Claude captions " CAPTIONS_VERSION
    A_TrayMenu.Delete()
    A_TrayMenu.Add("Settings...", (*) => OpenSettings())
    A_TrayMenu.Add("Hide captions", ToggleHidden)
    A_TrayMenu.Add("Put the box back in its corner", (*) => PutBack())
    A_TrayMenu.Add("Tuck the box into the side (or bring it back)", (*) => Minimized ? OpenFromPeek() : Minimize())
    A_TrayMenu.Add()
    A_TrayMenu.Add("Exit", (*) => ExitApp())
    A_TrayMenu.Default := "Settings..."
    LoadSettings()
    ; Windows' clock normally ticks every 15.6 ms; asking for 1 ms ticks (for this script only) makes
    ; short waits (Sleep) come out right. Timers still only fire every 15.6 ms or so, which is why
    ; frames keep step with the screen instead (see FrameLoop), timed by MsNow.
    DllCall("winmm\timeBeginPeriod", "uint", 1)
    StartDrawing()
    OnMessage(0x201, BoxMouseDown)   ; WM_LBUTTONDOWN
    OnMessage(0x200, BoxMouseMove)   ; WM_MOUSEMOVE
    OnMessage(0x202, BoxMouseUp)     ; WM_LBUTTONUP
    OnMessage(0x215, BoxMouseUp)     ; WM_CAPTURECHANGED: something else took the mouse mid-drag
    OnMessage(0x20, BoxCursor)       ; WM_SETCURSOR
    OnMessage(0x20A, CatcherWheel)   ; WM_MOUSEWHEEL (on the page, in a game: see CatchPage)
    OnMessage(0x20A, BoxWheel)       ; ...and on the box itself, from a touchpad (see HasTouchpad)
    OnMessage(0x20E, CatcherWheel)   ; WM_MOUSEHWHEEL
    OnMessage(0x203, CatcherDoubleClick)   ; WM_LBUTTONDBLCLK
    OnMessage(0xFF, RawMouse)        ; WM_INPUT (the mouse's own movement, in a game: see GamePointer)
    OnExit(GoAway)
    ; claude-hey-claude.ahk sends this the moment it hears "Hey Claude".
    OnMessage(DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.HeyClaude", "uint"), HeardHeyClaude)
    OnMessage(ClaudeKeyMessage(), ClaudeKeyPressed)
    OnMessage(SwitchPageMessage(), SwitchPagePressed)
    ; What the fetcher reads comes in as WM_COPYDATA (and it isn't running with UI Access, so this
    ; copy, which is, has to let that through).
    DllCall("ChangeWindowMessageFilter", "uint", 0x4A, "uint", 1)
    OnMessage(0x4A, TookRead)
    StartFetcher()
    SetTimer(UpdateCaptions, CHECK_EVERY_MS)
    LoadNotedTimes()
    LoadCleared()
    LoadHoldingGames()
    WatchForeground()
    SetTimer(ReadTranscripts, -2000)   ; when older messages were sent, for scrolling back
    SetTimer(WatchCodeSessions, 2000)   ; Code replies finishing, while you're on the other page
    ; If there's no conversation to show, a note says captions are on. It waits a moment, since
    ; Claude's window can take a read or two to answer.
    SetTimer(SayCaptionsAreOn, -1000)
    ; Last, a first look at Claude's window and the Code sessions, straight away. (Once the box starts
    ; moving, its frames can hold up whatever was still to come here until it stops, see FrameLoop.)
    SetTimer(FirstLook, -1)
}

FirstLook() {
    UpdateCaptions()
    WatchCodeSessions()
}

SayCaptionsAreOn() {
    if (HasConversation() || Hidden)
        return
    Critical
    Current.note := "They'll show up here as you talk with Claude."
    LayOutExchange(Current), Place()
    Critical "Off"
    Kick()
    UpdateVisibility()
    SetTimer(ClearNote, -3500)
}

ClearNote() {
    if (Current.note = "")
        return
    Critical
    Current.note := ""
    LayOutExchange(Current), Place()
    Critical "Off"
    Kick()
    UpdateVisibility()
}

; On the way out, the box animates away instead of vanishing (and Claude's voice is back on, and
; reading out loud stops). The page open under it closes too; the rest (the list beside it, the
; settings) goes with the script.
GoAway(*) {
    WriteHeldLogs()   ; (any lines for the logs still held back from the last read, see AddToLog)
    ; First, nothing more from Windows about windows coming in front or the page moving: as captions
    ; close, what that looks at goes ("Browser has not been assigned a value", once).
    WatchForeground(false)
    UnhookPage()
    if (claudeWin := Unhid.hwnd) {   ; (Claude's window, restored unseen to click in: minimized again, and seen)
        if (DllCall("IsWindow", "ptr", claudeWin) && DllCall("GetForegroundWindow", "ptr") != claudeWin)
            DllCall("ShowWindow", "ptr", claudeWin, "int", 7)   ; SW_SHOWMINNOACTIVE
        try WinSetTransparent("Off", claudeWin)
        Unhid.hwnd := 0
    }
    ; (Claude's list of messages scrolled up to read older ones, see LoadOlder: put back where it was,
    ; as its next step would have. Left scrolled up, Claude's window would be read as scrolled away
    ; from the newest, and the box kept as it was until you scrolled it back down yourself.)
    if (LoadingEarlier && OlderJob)
        try ComCall(4, OlderJob.scroller, "double", -1, "double", Max(0, Min(100, OlderJob.was)))   ; SetScrollPercent
    MuteClaude(true)
    try StopReading()
    GuardGame(false)
    if (Fetcher.hwnd && DllCall("IsWindow", "ptr", Fetcher.hwnd))
        DllCall("PostMessage", "ptr", Fetcher.hwnd, "uint", 0x10, "ptr", 0, "ptr", 0)   ; WM_CLOSE: the fetcher goes too
    if PageOpen()
        ClosePageWindow()
    CloseBrowserWindow(Browser.old)   ; (see LetGoOfPage)
    if !Anim.shown
        return
    Anim.target := 0, Anim.last := MsNow()
    deadline := A_TickCount + DISAPPEAR_MS + 200
    while (Anim.shown && A_TickCount < deadline) {
        Frame()
        Sleep 15
    }
}

; Game mode: while a game (or anything else full screen, like a video) is in front, the box keeps
; still (no floating), draws only when something changes and at most 60 times a second, and the
; Claude tab hides unless you tucked the box away yourself. A window drawn on top of a game makes
; Windows blend the two every frame, which can make the game stutter (and upset its overlays, like
; MSI Afterburner's or ReShade's), so the box does as little of that as it can. (With a game in front,
; GameFront, Game mode or not, the box stays out of its way: the mouse, and which window has the
; keyboard. Game mode is only about how much the box moves and redraws meanwhile.)
Gaming() => Settings.GameMode && GameFront

CheckGameFront() {
    global GameFront, LastGame, GameSeenAt
    if Handed   ; (the box has the mouse, with its own window in front of the game: see ClaudeKey)
        return
    front := false
    try front := CoversScreen(hwnd := WinExist("A"))   ; (see claude-voice-on-off-send.ahk)
    if front
        LastGame := hwnd, GameSeenAt := A_TickCount
    if (front != GameFront) {
        GameFront := front
        SetTimer(WatchGamePointer, front ? 25 : 0)
        if !front
            GamePointer()   ; (let go of watching it)
        Kick()
        UpdateVisibility()
        KeepPageUp()
    }
    GuardGame(GameFront)
}

; While a game is in front (in Game mode), other programs can't take the front from it. Claude's
; app brings its own window forward when its dictation starts or stops, and even a moment out of
; the game drops the keys you're holding and lets go of the mouse. Windows' own foreground lock
; stops that. You switching windows yourself (Alt+Tab, a click, the Windows key) still works, and
; lets go of the lock; it's taken again at the next check while the game is in front, and let go
; of as soon as the game isn't (or captions turn off).
GuardGame(on) {
    static locked := false
    if (on || locked)
        DllCall("LockSetForegroundWindow", "uint", on ? 1 : 2), locked := on   ; LSFW_LOCK, LSFW_UNLOCK
}

; Whether this copy is running with UI Access (see CaptionsMain).
HasUIAccess() {
    if !DllCall("advapi32\OpenProcessToken", "ptr", DllCall("GetCurrentProcess", "ptr"), "uint", 0x8, "ptr*", &token := 0)   ; TOKEN_QUERY
        return false
    ok := DllCall("advapi32\GetTokenInformation", "ptr", token, "int", 26, "uint*", &ui := 0, "uint", 4, "uint*", &size := 0)   ; TokenUIAccess
    DllCall("CloseHandle", "ptr", token)
    return ok && ui
}

; Notes in FOCUS_LOG whenever a game (or anything else full screen) loses the foreground, and what
; took it, so if a game ever drops to the desktop it's clear what did it. The box's own windows
; never take it (they're made so they can't). (on false: stops watching, as captions close: a window
; coming in front as they closed once found what it looks at already gone, see GoAway.)
WatchForeground(on := true) {
    static callback := CallbackCreate(ForegroundChanged, "F", 7), hook := 0
    if (on && !hook)
        hook := DllCall("SetWinEventHook", "uint", 3, "uint", 3, "ptr", 0, "ptr", callback, "uint", 0, "uint", 0, "uint", 0, "ptr")   ; EVENT_SYSTEM_FOREGROUND
    else if (!on && hook)
        DllCall("UnhookWinEvent", "ptr", hook), hook := 0
}

ForegroundChanged(hook, event, hwnd, idObject, idChild, thread, time) {
    static last := 0, lastFull := false, lastName := ""
    SetTimer(CheckGameFront, -1)
    full := false, name := "?"
    try {
        name := WinGetProcessName(hwnd) " '" SubStr(WinGetTitle(hwnd), 1, 60) "'"
        full := CoversScreen(hwnd)   ; (see claude-voice-on-off-send.ahk)
    }
    if (lastFull && hwnd != last)
        try FileAppend(FormatTime(, "yyyy-MM-dd HH:mm:ss") "  " lastName " (full screen) lost the foreground to " name "`n", FOCUS_LOG, "UTF-8")
    last := hwnd, lastFull := full, lastName := name
    ; The page under the box came in front of a game (by its own buttons, the only part of it the
    ; invisible window over it leaves to it, see CatchPage), or its window as it opens (before the box
    ; knows which it is: it's the browser's): see PageTookFront. With the Claude key, that doesn't
    ; give the game back the mouse (it once did, as a page opened, and the box was out of reach).
    if (IsPageWindow(hwnd) && (GameFront || Handed))
        return SetTimer(PageTookFront, -100)
    ; While the box has the mouse and keyboard (see ClaudeKey), going to anything else (not the box's
    ; own windows, nor Claude's for a moment while what you typed goes in) gives them back.
    if Handed {
        try {
            if (WinGetPID(hwnd) != DllCall("GetCurrentProcessId") && WinGetProcessName(hwnd) != "claude.exe") {
                NoteEvent("went to " name ": the Claude key's mouse and keyboard go back")
                SetTimer(GiveBackMouse.Bind(false), -1)
            }
        }
    }
}

; The page under the box came in front of the game: once you've let go of the mouse, the game has
; the front back (or, with the Claude key, the box keeps the mouse), and the box goes back over the
; page, so you're never left out of the game with the taskbar showing, or the page over the box.
PageTookFront() {
    if !IsPageWindow(WinExist("A"))
        return
    if (GetKeyState("LButton", "P") || Browser.dragging)   ; (still holding it, dragging it say: once you let go)
        return SetTimer(PageTookFront, -100)
    ReturnToGame()
    BoxAbovePage()
}

; Whether a window (hwnd) is the page under the box, or, while one's opening (it isn't known which
; yet), a window of the browser it opens in.
IsPageWindow(hwnd) {
    if !(hwnd && Browser.url != "")
        return false
    if Browser.hwnd
        return hwnd = Browser.hwnd
    try return WinGetProcessName(hwnd) = PageExe
    return false
}

; The window of another copy of this script that's already running, if there is one. Seeing hidden
; windows is only switched on for the look, and back as it was after: this runs as captions start,
; and a setting changed then stays the setting for everything after, so otherwise every look for
; Claude's window could find a hidden one of its (say, closed to the tray) instead of the real one.
OtherCaptions() {
    was := A_DetectHiddenWindows
    DetectHiddenWindows true
    found := 0
    try {
        for hwnd in WinGetList(A_ScriptFullPath " ahk_class AutoHotkey")
            if (hwnd != A_ScriptHwnd) {
                found := hwnd
                break
            }
    }
    DetectHiddenWindows was
    return found
}

; ---- Keeping up with the conversation ----------------------------------------------

; Every CHECK_EVERY_MS: read Claude's window, and update the box if anything changed.
UpdateCaptions() {
    global Reads
    static here := {lastHwnd: 0, pageAt: 0, readAt: 0}   ; (and when the window was last read here)
    if (Mod(++Reads, 5) = 0)
        CheckWindowsColors()
    CheckGameFront()
    if (Browser.hwnd && !PageOpen())   ; you closed the page under the box
        ClosePage()
    KeepPageUp()
    if Hidden
        return UpdateVisibility()
    ; While you scroll or drag the box, reading waits: a read takes long enough to make the motion stutter.
    ; So does it while Claude's window is scrolled up for older messages (it'd read those as the newest).
    if (Drag.mode || A_TickCount - ScrollAt < 700 || LoadingEarlier)
        return
    ; The fetcher reads Claude's window in a program of its own (see StartFetcher), so the box never
    ; waits for it: what it reads comes in by itself (see TookRead). If nothing has come from it for
    ; 20 s, it's seen to: asked for a read if it's still there (like just after the computer wakes
    ; from sleep), or started again if it's gone (see StartFetcher), and the box goes on showing what
    ; it last read meanwhile. A read here holds the box up for a tenth of a second or more (once, for
    ; 8 s), so the window is read here only while there's no fetcher to wait for: as captions start,
    ; before the fetcher's first read, and after that only once nothing has come from a fetcher for
    ; 5 s (a new one has had that long to get going), and once every 5 s at most. (Each time the
    ; computer woke, the fetcher, still there, was started again, and the window read here, holding
    ; the box up for a second or more.)
    if FetcherAlive()
        return
    StartFetcher()
    if (Fetcher.hwnd && DllCall("IsWindow", "ptr", Fetcher.hwnd)
        || Fetcher.at && (A_TickCount - Max(Fetcher.at, Fetcher.startedAt) < 5000 || A_TickCount - here.readAt < 5000))
        return UpdateVisibility()   ; (so the box still goes away on time)
    at := MsNow()
    try read := ReadClaude(here)
    catch {
        here.readAt := A_TickCount
        UpdateVisibility()   ; (so the box still goes away on time)
        return   ; the window changed while it was being read; try again next time
    }
    here.readAt := A_TickCount
    readMs := MsNow() - at, Perf.here++, Perf.hereMs += readMs
    if (Perf.here = 1 && Fetcher.at)   ; (not as captions start, before the fetcher's first read)
        NoteEvent(Format("nothing from the fetcher for {:.0f} s: Claude's window read here ({:.0f} ms)", (A_TickCount - Fetcher.at) / 1000, readMs))
    Digest(read)
}

; One read of Claude's window: {hwnd, now (see ReadConversation), page (see PageOf; "" unless it was
; checked, every second and a half), tabs (where its page switches are, with page), bar (see
; ModelBarOf)}. Throws if the window changed while it was being read. st keeps Claude's window and
; when its page was checked, between reads.
ReadClaude(st) {
    hwnd := FindClaudeWindow()
    if (hwnd && hwnd != st.lastHwnd)
        WakeAccessibility(hwnd)
    st.lastHwnd := hwnd
    now := hwnd ? ReadConversation(hwnd) : {you: "", claude: "", live: false, streaming: false, thinking: false, work: "", listening: false, voice: false,
        micLive: false, sessions: [], session: "", convo: "", buttons: []}
    page := "", tabs := ""
    if (hwnd && A_TickCount - st.pageAt > 1500) {
        st.pageAt := A_TickCount
        try page := PageOf(hwnd, &tabs)
    }
    if (hwnd && StartsWith(now.convo, "code|"))
        SessionPage(hwnd, now, &page, &tabs, st)
    return {hwnd: hwnd, now: now, page: page, tabs: tabs, bar: ModelBarOf(now.buttons)}
}

; A Cowork session, on Claude's Chat and Cowork page, has its title named as a session on the Code
; page has ("Weekly report, rename session", see SidebarRows): for a session showing (now.convo, like
; "code|Weekly report"), which page it's on goes by Claude's page switch (see PageOf), checked with the
; read (page and tabs, if they weren't) the first time the title shows, and kept. A Cowork session's
; convo is made "chat|…", and now.cowork true. (Taken for a Code session, the box went to the Code
; page with each read and back with each check of the page, and its Code list got the Chat and Cowork
; page's chats.) A later check that says otherwise counts only the second time running, a second and
; a half on: just after Claude switches pages, its switch can say the new page while the title is
; still the old one's.
SessionPage(hwnd, now, &page, &tabs, st) {
    static pages := Map()   ; which page each session's title is on, as {page, odd}
    title := SubStr(now.convo, 6)
    if !pages.Has(title) {
        if (page = "")
            try page := PageNow.Call(hwnd, &tabs), st.pageAt := A_TickCount
        if (page != "")
            pages[title] := {page: page, odd: 0}
    } else if (page != "") {
        s := pages[title]
        s.odd := page = s.page ? 0 : s.odd + 1
        if (s.odd >= 2)
            s.page := page, s.odd := 0
    }
    if (pages.Has(title) && pages[title].page = "chat")
        now.convo := "chat|" title, now.cowork := true
}

; What Claude's buttons under its message box (among buttons, as read, see ButtonsAround) say about
; the model (see Bar): "model|effort|usage", from "Model: Opus 5.5", "Effort: Ultracode" and "Usage:
; Context 613.7k / 1M (61%), 52% of 5-hour limit, Resets in 2 hr 42 min" on the Code page, or "Model:
; Haiku 4.5 Extended" on the Chat and Cowork page (its effort is in its name there); "" for what isn't
; showing.
ModelBarOf(buttons) {
    model := effort := usage := ""
    for item in buttons {
        n := item.name
        if (model = "" && StartsWith(n, "Model: "))
            model := SubStr(n, 8)
        else if (effort = "" && StartsWith(n, "Effort: "))
            effort := SubStr(n, 9)
        else if (usage = "" && StartsWith(n, "Usage: "))
            usage := SubStr(n, 8)
    }
    return model = "" && effort = "" && usage = "" ? "" : model "|" effort "|" usage
}

; Goes through a read of Claude's window (see ReadClaude): the box shows what's new in it.
Digest(read) {
    global Shown, LastChange, LastHwnd, Listening, Waiting, VoiceModeAt, VoiceMode, VoiceMicLive, PageAt, ClaudeWorking, TabSpots, HeyClaudeAt, ClaudeConvo, QuickMisses
    hwnd := read.hwnd, now := read.now
    LastHwnd := hwnd
    if (now.convo != "")
        ClaudeConvo := now.convo
    ; (Whichever page it's of: by the conversation, or with none, the page this same read says. Not the
    ; page seen a moment before: just after switching, that was the other page still, and its list
    ; got this page's chats.)
    NoteSidebar(now, read.page)
    ; Which page Claude is on, as last read: noted even while the box waits for Claude to switch, so
    ; a switch that didn't take is seen (see SwitchedYet). (Noted only after the wait, it never was:
    ; the box gave up waiting and went back, and the switch was never tried again.)
    if (read.page != "")
        SeenPage.page := read.page, SeenPage.at := A_TickCount
    ; You just switched Claude's page from the box, which went to that page's conversation straight
    ; away (see SelectPage): until Claude's window has caught up, what it still shows is the page
    ; before, which isn't news.
    if (PageAsked.page != "") {
        onPage := now.convo != "" ? StrSplit(now.convo, "|")[1] : ""
        if (onPage = PageAsked.page || onPage = "" && A_TickCount - PageAsked.at > 1500 || A_TickCount - PageAsked.at > 4000)
            PageAsked.page := ""
        else
            return UpdateVisibility()
    }
    micOn := now.listening
    if now.voice {   ; voice mode: Claude reads its replies out loud, so the words can light up as it does
        VoiceModeAt := A_TickCount
        StartFollowing()   ; which also notices when it's your turn to talk
    }
    if (now.voice != VoiceMode || now.micLive != VoiceMicLive)   ; the voice light goes with it
        VoiceMode := now.voice, VoiceMicLive := now.micLive, Kick()
    MuteClaude()
    working := now.HasOwnProp("working") && now.working
    if (working != ClaudeWorking) {
        ClaudeWorking := working
        if (Anim.panel && Page = "code")   ; (the ring in the list can compact once Claude's done)
            Kick()
    }
    ; Each chat and session keeps its own history: when Claude shows another one (or the other
    ; page), the box puts this one away and brings that one back. The conversation's title bar also
    ; says which page it's on.
    if (now.convo != "") {
        if (ConvKey != "" && ConvPage(now.convo) != ConvPage(ConvKey)) {   ; (gone to the other page in Claude's own window)
            SetReopen(ConvPage(now.convo))
            if (Reopen.key != "")   ; (to the one you had open last there, straight away, as from the box)
                SwitchConversation(Reopen.key)
        }
        NoticePage(ConvPage(now.convo))
        if StillReopening(now.convo)   ; (Claude opened another conversation there than the one you had open last)
            return UpdateVisibility()
        if (now.convo != ConvKey)
            SwitchConversation(now.convo)
    } else if (read.page != "" && ConvKey != "" && ConvPage(ConvKey) != read.page && A_TickCount - PageAt > 1500) {
        ; Claude went to the other page, and doesn't say yet which of its conversations it's showing
        ; there (no title to go by): the box goes to that page's anyway, rather than taking what's
        ; there for new messages in the conversation from the other page.
        SetReopen(read.page)
        NoticePage(read.page)
        SwitchConversation(PageConv(read.page))
    }
    ; Which page Claude is on, for the tab on top of the box. It's checked now and then: it's slow to
    ; find. (Not for a moment after you switch it from the box, see SelectPage.)
    if (read.page != "" && A_TickCount - PageAt > 1500)
        NoticePage(read.page)
    if (read.bar != "" && A_TickCount - ModelBars.setAt > 2500 && !ModelMenu) {   ; (not while you pick, or just after)
        ; (Only the Code page has Effort and Usage buttons; without them, the page the conversation's
        ; on says, as a new Code session can have neither yet. A Cowork session, on the Chat and Cowork
        ; page, is that page's whatever buttons it has, see ReadClaude.)
        f := StrSplit(read.bar, "|"), cowork := now.HasOwnProp("cowork") && now.cowork
        b := ModelBars.%((f[2] != "" || f[3] != "") && !cowork || now.convo != "" && ConvPage(now.convo) = "code" ? "code" : "chat")%
        if (f[1] != b.model || f[2] != b.effort || f[3] != b.usage) {
            b.model := f[1], b.effort := f[2], b.usage := f[3]
            if (Compacting.at && (pct := UsagePercent(f[3])) != "" && Compacting.from != "" && pct < Compacting.from)
                CompactDone("the context went from " Compacting.from "% to " pct "%")
            if Anim.panel
                Kick()
        }
    }
    if (read.tabs != "") {   ; (where its page switches are, see ClickTab)
        t := StrSplit(read.tabs, ",")
        TabSpots := {hwnd: hwnd, chat: {x: Integer(t[1]), y: Integer(t[2])}, code: {x: Integer(t[3]), y: Integer(t[4])}, w: Integer(t[5]), h: Integer(t[6]),
            key: hwnd "," read.tabs}
        ; After a quick switch that didn't take, every switch went the slow way for the rest of the
        ; session (see SwitchedYet). Now the quick way's tried again once Claude's switches are seen
        ; somewhere other than where that click went (they'd moved, or it's another of Claude's
        ; windows). Not while they're still where it clicked: where the quick switch doesn't take at
        ; all, every switch would first wait for it to miss again.
        if (QuickMisses && TabSpots.key != TabSpotsClicked)
            QuickMisses := 0
    }
    ; Claude's window is scrolled up, so what was read isn't the newest: the box stays as it is until
    ; it's back at the bottom.
    if (now.HasOwnProp("away") && now.away && !SettingsGui) {
        UpdateVisibility()
        return
    }
    now := TakeRead(now)
    ; What Claude said before your newest message can still change after it: a reply you talked
    ; over goes on until Claude gets to what you said, and your message then lands in the middle of
    ; it. So the exchange before is kept up to date in the history (and its new words, not seen
    ; yet, get the arrow at the top of the box).
    if (now.HasOwnProp("prevYou") && now.prevYou != "" && now.prevClaude != "" && History.Length) {
        last := History[History.Length]
        if (last.you == now.prevYou && last.claude != now.prevClaude) {
            Critical
            last.words := ReplyWords(now.prevClaude)
            last.claude := now.prevClaude
            LayOutExchange(last), Place()
            Critical "Off"
            Kick()
        }
    }
    if (micOn != Listening) {
        Listening := micOn
        SetTimer(WatchYourWords, Listening ? YOUR_WORDS_MS : 0)
        if (Listening && HeyClaudeAt && A_TickCount - HeyClaudeAt < 15000)   ; (how long "Hey Claude" took to get Claude listening)
            NoteEvent(Format("Claude listening, {:.1f} s after 'Hey Claude'", (A_TickCount - HeyClaudeAt) / 1000)), HeyClaudeAt := 0
        ; The mic just turned on. Unless the box is still showing a reply you might be reading, it
        ; shows that Claude is listening. If the mic turns off before you say anything, it goes back.
        ; Tucked away, it comes back out of its tab first: you're talking to Claude.
        if (Listening && Minimized)
            OpenFromPeek()
        if (Listening && (!Anim.target || Current.claude = ""))
            StartWaiting()
        else if !Listening
            StopWaiting()
    }
    UpdateVisibility()
    ; While Claude reads out a reply that has all come in, the window is read less often: reading a
    ; reply that's being read out (a piece for every word) takes long enough to make the glow stutter.
    ; Your words still show up quickly (see WatchYourWords).
    if (Voice.on && A_TickCount - LastChange > 2000)
        ReadEvery(TALKING_CHECK_MS)
    else
        ReadEvery(Anim.target || Listening || Waiting || Shown.streaming || Shown.thinking || Shown.work != "" ? CHECK_EVERY_MS : IDLE_CHECK_MS)
}

; Claude's sidebar, as a read found it (now, see SidebarRows): kept as the list of the page its
; conversation's title says it's on, and shown in the list beside the box if the box is on that page
; (see ShowSidebar). While Claude goes to another page, its sidebar and title can be of different
; pages for a moment: just then, a read only counts if the conversation showing is in its sidebar.
NoteSidebar(now, page := "") {
    ; (Which page's it is: the conversation's, or with none showing yet, like a new chat, the page
    ; Claude's window says it's on. Kept only for a titled conversation, the list read "Reading
    ; Claude's sidebar…" on a new chat until you opened one of its chats in Claude yourself.)
    onPage := now.convo != "" ? ConvPage(now.convo) : page
    if (onPage = "")
        return
    key := now.session "|", has := now.convo = ""
    for row in now.sessions
        key .= row.status " " row.title "|", has := has || row.title == now.session
    if (onPage != SidebarPage.page)
        SidebarPage.page := onPage, SidebarPage.at := A_TickCount
    if (!has && A_TickCount - SidebarPage.at < 2000)
        return
    was := SidebarLists.Has(onPage) ? SidebarLists[onPage] : ""
    if (was && key == was.key)
        return
    ; Another session in Claude's sidebar (not the one showing) finished while the box is tucked
    ; away: the tab counts it too.
    if was
        for before in was.list
            if InStr(before.status, "Running")
                for after in now.sessions
                    if (after.title == before.title && !InStr(after.status, "Running") && after.title != now.session)
                        Nudge("done", onPage, true)
    SidebarLists[onPage] := {list: now.sessions, current: now.session, key: key}
    ShowSidebar()
}

; The list beside the box shows the sessions or chats of the page the box is on, as last read (see
; NoteSidebar): going to the other page shows its list straight away, before Claude's window has
; caught up.
ShowSidebar() {
    global Sessions
    which := ConvKey != "" ? ConvPage(ConvKey) : Page
    list := SidebarLists.Has(which) ? SidebarLists[which] : {list: [], current: "", key: "", unread: true}
    if (list !== Sessions && !(Sessions.HasOwnProp("unread") && list.HasOwnProp("unread")))
        Sessions := list, Kick()
}

; Which page Claude is showing: "chat" (Chat and Cowork) or "code", or "" if its page switch isn't there.
; tabs: where its two switches are, as "chatX,chatY,codeX,codeY,width,height" in its window (see
; TabSpots), or "".
PageOf(hwnd, &tabs := "") {
    chat := code := "", tabs := ""
    for item in GetElements(hwnd, UIA_RADIO)
        if (!chat && StartsWith(item.name, "Chat and Cowork"))
            chat := item
        else if (!code && StartsWith(item.name, "Code"))
            code := item
    if !chat
        return ""
    if (code && (a := SpotIn(hwnd, chat.el)) && (b := SpotIn(hwnd, code.el))) {
        client := Buffer(16, 0), DllCall("GetClientRect", "ptr", hwnd, "ptr", client)
        tabs := Format("{},{},{},{},{},{}", a.x, a.y, b.x, b.y, NumGet(client, 8, "int"), NumGet(client, 12, "int"))
    }
    ; (Code only if its own switch says so: going by Chat and Cowork's alone, anything else, like a
    ; moment when neither says, was taken for Code, and a page's list could get the other page's chats.)
    return IsSelected(chat.el) ? "chat" : code && IsSelected(code.el) ? "code" : ""
}

; Clicks Claude's switch to a page (which) where it was last seen, with click messages (no mouse, and
; Claude doesn't come to the front), if Claude's window is the same size as then. Whether it did.
; (Where it clicked is kept, for if it didn't take: see Digest.)
ClickTab(hwnd, which) {
    global TabSpotsClicked
    s := TabSpots
    if !(s && s.hwnd = hwnd && DllCall("IsWindow", "ptr", hwnd) && !DllCall("IsIconic", "ptr", hwnd))
        return false
    client := Buffer(16, 0), DllCall("GetClientRect", "ptr", hwnd, "ptr", client)
    if (NumGet(client, 8, "int") != s.w || NumGet(client, 12, "int") != s.h)
        return false
    TabSpotsClicked := s.HasOwnProp("key") ? s.key : ""
    PostClickAt(hwnd, s.%which%)   ; (see claude-voice-on-off-send.ahk)
    return true
}

; Claude is showing a page (which): its tab joins the box, gliding over from the other. If the
; page wasn't known yet, the exchange showing is laid out again to suit it.
NoticePage(which) {
    global Page
    if (which = "" || which = Page)
        return
    if (which = "code" && Anim.peekCounts.code)   ; (you went to the Code page: what was counted there while you were away goes, see CodeMessage)
        Anim.peekCounts.code := 0
    first := Page = ""
    Page := which
    if first {
        Critical
        Current.chat := Page = "chat"
        LayOutExchange(Current), Place()
        Critical "Off"
    }
    ShowSidebar()
    Kick()
}

; Switches Claude to one of its pages ("chat" or "code"), as its switch at the top of Claude's
; window does. The tab on the box glides over right away.
SelectPage(which) {
    global PageAt
    NoticePage(which)
    PageAt := A_TickCount   ; gives Claude a moment before checking again
    ; The box shows that page's conversation straight away (the one it last showed there), and
    ; doesn't go back to the other while Claude's window catches up (see UpdateCaptions).
    PageAsked.page := which, PageAsked.at := A_TickCount
    SetReopen(which)   ; (if Claude opens another of its conversations there, the one you had open last)
    if (ConvKey != "" && ConvPage(ConvKey) != which)
        SwitchConversation(PageConv(which))
    try {
        hwnd := FindClaudeWindow()
        ; Straight to where its switch was last seen: instant, and Claude stays where it is. If that
        ; didn't take (the switch had moved), it's looked for after all. Either way, it's checked.
        ; (Where it's missed before, out of a game: the slow way straight away, see SwitchedYet, till
        ; Claude's switches are seen somewhere else, see Digest.)
        quick := !(QuickMisses && !GameFront) && ClickTab(hwnd, which)
        how := quick ? "" : PressPageSwitch.Call(hwnd, which)
        clicked := A_TickCount
        SetTimer(() => SwitchedYet(which, clicked, quick, how), -700)
        ReadSoon()
    }
}

; Claude's switch to a page (which), found in Claude's window first: slower, in a long conversation.
; What it did, for the log.
ClickTabSlowly(hwnd, which) {
    tab := FindByPrefix(hwnd, UIA_RADIO, which = "chat" ? "Chat and Cowork" : "Code")
    if !tab
        return "its switch wasn't found in Claude's window"
    ; In a game, Claude's switch is clicked with click messages: through UI Automation, Claude's
    ; window would jump in front of the game (see PostClick, in claude-voice-on-off-send.ahk).
    if (GameFront && PostClick(tab.el, hwnd))
        return "clicked where it is"
    if !(pattern := GetPattern(tab.el, 10010, "{a8efa66a-0fda-421a-9194-38021f3578ea}"))
        return "it couldn't be pressed"
    ComCall(3, pattern)   ; Select
    return "pressed"
}

; After switching Claude's page from the box (at clicked: quick, at its switch's last spot, see
; ClickTab; or how ClickTabSlowly went): once a read of Claude's window since says which page it's
; on, if that isn't the one asked for, a quick switch that didn't take is done the slow way, with the
; box staying on that page meanwhile, and checked again. Still not: the box goes by Claude's window
; again, and it's noted why. (It used to go back to the other page after 4 s and never try again:
; on another computer the quick switch missed, and the box went back and forth with every click.)
SwitchedYet(which, clicked, quick, how := "") {
    global QuickMisses
    Critical   ; (runs to the end: see ClickClaude)
    ; Which page Claude's on: asked of its window straight away (see PageNow), or if it doesn't say,
    ; as the reads of it since say (every second and a half or so: waiting for them, a switch that
    ; didn't take took seconds to put right).
    hwnd := FindClaudeWindow(), on := ""
    try on := PageNow.Call(hwnd)
    if (on = "") {
        if (SeenPage.at < clicked + 300) {   ; (no read since: checks back shortly, for a while)
            if (A_TickCount - clicked < 6000)
                SetTimer(() => SwitchedYet(which, clicked, quick, how), -400)
            return
        }
        on := SeenPage.page
    }
    if (on = which)
        return
    if quick {
        s := TabSpots, spotNow := ""
        try spotNow := (tab := FindByPrefix(hwnd, UIA_RADIO, which = "chat" ? "Chat and Cowork" : "Code")) && (at := SpotIn(hwnd, tab.el)) ? at.x "," at.y : "not found"
        NoteEvent(Format("switching to {} where its switch was ({},{}) didn't take (it's at {} now); looking for it{}", which, s ? s.%which%.x : "?", s ? s.%which%.y : "?", spotNow,
            QuickMisses ? "" : ". From now on, switched that way straight away (out of a game)"))
        QuickMisses += 1
        PageAsked.page := which, PageAsked.at := A_TickCount   ; (the box stays on that page meanwhile)
        how := ""
        try how := PressPageSwitch.Call(hwnd, which)
        again := A_TickCount
        SetTimer(() => SwitchedYet(which, again, false, how), -1200)
        return
    }
    NoteEvent(Format("couldn't switch Claude to {} ({}; Claude's window '{}' {}): the box goes by Claude's window", which, how, WinExist(hwnd) ? WinGetTitle(hwnd) : "-", hwnd))
    PageAsked.page := ""
}

; The page switch button (claude-switch-page.ahk) was pressed: to the other page. Out of a game,
; Claude comes up too, to show it.
SwitchPageMessage() {
    static msg := DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.SwitchPage", "uint")
    return msg
}

SwitchPagePressed(*) {
    static at := 0
    if (A_TickCount - at > 300)   ; (once, however many of the captions' windows the message reached)
        at := A_TickCount, SetTimer(SwitchPageNow, -1)
    return 0
}

SwitchPageNow() {
    Critical   ; (runs to the end: see ClickClaude)
    SelectPage(Page = "chat" ? "code" : "chat")
    if (!GameFront && (hwnd := FindClaudeWindow())) {
        RevealClaude(hwnd)   ; (if the box had it restored unseen, it's seen: it comes to the front on purpose)
        SetWinDelay(-1)
        if (WinGetMinMax(hwnd) = -1)
            WinRestore(hwnd)
        try WinActivate(hwnd)
    }
}

; Goes to one of Claude's sessions or chats (by its title), as clicking it in Claude's sidebar does:
; with click messages, so Claude stays where it is (or, if it's out of sight there, pressed through UI
; Automation, but not with a game in front, which Claude would come in front of). Whether it could.
; Its row's looked for around Claude's list of messages, as each read of Claude's window finds the
; sidebar's rows (see ElementsAround, SidebarRows), not among every button in the window, each of a
; long session's steps too.
OpenSession(title) {
    try {
        hwnd := ClaudeToClick()   ; (minimized, it's shown again behind your windows first: see ClaudeToClick)
        for button in ElementsAround(hwnd, UIA_BUTTON) {
            name := button.name
            if !(name == title || SubStr(name, -StrLen(title) - 1) == " " title) || StartsWith(name, "More options for ")
                continue
            if StartsWith(button.cls, SIDEBAR_ROW) {   ; (its class comes along with it, see ElementsUnder)
                if !ClickClaude(button.el, hwnd) {
                    if GameFront
                        return false
                    Invoke(button.el)
                } else
                    SetTimer(OpenedYet.Bind(title, button.el), -1600)   ; (checked: see OpenedYet)
                ReadSoon()
                return true
            }
        }
    }
    return false
}

; A moment after a chat or session (title) was opened with a click in Claude's sidebar (see
; OpenSession): if Claude's window isn't showing it, it's pressed instead (el), through UI Automation.
; (On a laptop, with Claude's window minimized or behind others, Claude didn't take the click, and
; you had to open it in Claude yourself.)
OpenedYet(title, el) {
    Critical   ; (runs to the end: see ClickClaude)
    if (ClaudeConvo != "" && StrSplit(ClaudeConvo, "|", , 2)[2] == title)
        return
    NoteEvent("opening '" title "' with a click didn't take; pressing it instead")
    try PressInClaude(el, Invoke)
    ReadSoon()
}

; Going to a page (which), from the box or in Claude's own window: Claude opens the conversation it
; had open there last, which isn't always the one you had open last (as the box saw it). So the box
; is ready to open yours again (see StillReopening).
SetReopen(which) {
    ; (Not just after you picked a chat or session in the list: that's the one you want, and opening
    ; the one before over it made the box and Claude go back and forth between them, and the pages.)
    if (A_TickCount - ListPick.at < 10000)
        return (Reopen.key := "", Reopen.at := A_TickCount, Reopen.asked := false)
    Reopen.key := PageConvs.Has(which) && SubStr(PageConvs[which], -1) != "|" ? PageConvs[which] : ""
    Reopen.at := A_TickCount, Reopen.asked := false
}

; Whether the box is still getting Claude to open the conversation you had open last on its page,
; after you went there (see SetReopen), as Claude shows another there (convo): it opens yours in
; Claude's window, once, and the box keeps showing yours meanwhile. Once Claude shows it (or after
; four seconds, or if it isn't in Claude's sidebar to open), the box goes by Claude again.
StillReopening(convo) {
    r := Reopen
    if (r.key = "" || ConvPage(convo) != ConvPage(r.key))
        return false
    if (convo = r.key || A_TickCount - r.at > 4000) {
        r.key := ""
        return false
    }
    if !r.asked {
        r.asked := true
        NoteEvent("Claude opened " convo " on going to its page; opening " r.key " again, the one you had open last")
        SetTimer(OpenLast, -1)
    }
    return true
}

OpenLast() {
    if (Reopen.key != "" && !ReopenAction.Call(StrSplit(Reopen.key, "|", , 2)[2]))
        Reopen.key := ""   ; (it isn't in Claude's sidebar to open: the box goes by Claude)
}

; Which page a conversation (by its key, like "chat|General chat") is on: "chat" or "code".
ConvPage(key) => StrSplit(key, "|")[1]

; The conversation the box goes to on a page (which), before Claude's window says which of its
; conversations it's showing there (like just after switching pages): the one it last showed there,
; or, if it hasn't shown one there yet, one of its own for that page (like "chat|") until it's told.
PageConv(which) => PageConvs.Has(which) ? PageConvs[which] : which "|"

; Claude is showing another conversation: a different chat or session, or the other page. Each
; keeps its own history, so this one's is put away and that one's brought back (or started fresh),
; and the box slides over to it, from the side its tab is on (or from below, for another chat or
; session on the same page), just as it was when you left it.
SwitchConversation(key) {
    global Current, History, ConvKey, Waiting, SettledAt
    EndPreview()   ; (not a setting's test message: the exchange it stood in for)
    PageConvs[ConvPage(key)] := key   ; (for switching back to it from the box, see SelectPage)
    if (ConvKey = "") {   ; the first one: it's the one showing already
        ConvKey := key
        ShowSidebar()
        SetTimer(LoadEarlier, -1500)
        return
    }
    ; The box went to a page's conversation before Claude's window said which it is (see PageConv),
    ; and now it does: that's the one showing, with nothing to put away or bring back. (If nothing
    ; showed yet, what shows next was already there, as below.)
    if (SubStr(ConvKey, -1) = "|" && ConvPage(ConvKey) = ConvPage(key) && !Conversations.Has(key)) {
        NoteEvent("the conversation on the " ConvPage(key) " page is " key)
        ConvKey := key
        if !HasConversation()
            Current.loaded := true, SettledAt := A_TickCount + 3000
        return
    }
    NoteEvent("showing the conversation " key " (was " ConvKey ")")
    Critical
    Conversations[ConvKey] := {current: Current.sample ? NewExchange() : Current, history: History}
    was := ConvPage(ConvKey), now := ConvPage(key)
    ConvKey := key
    if Conversations.Has(key) {
        saved := Conversations[key], Conversations.Delete(key)
        Current := saved.current, History := saved.history
    } else {
        Current := NewExchange(), History := []
    }
    Current.loaded := true   ; what it shows next was already there, so it isn't "new"
    Waiting := false, View.scrolled := false, View.bottomSpeed := View.hSpeed := 0
    Anim.switchAt := A_TickCount, Anim.switchDir := was = now ? 0 : now = "code" ? 1 : -1
    Place(), SnapView()
    ; For a few seconds, what Claude's window shows counts as already there: it can take a read or two
    ; to show the whole conversation, and that isn't new (no typing out, and no typing sounds).
    SettledAt := A_TickCount + 3000
    Critical "Off"
    ShowSidebar()   ; (the other page's list, if it went there)
    Kick()
    SetTimer(LoadEarlier, -600)   ; what was said there before, for scrolling back
}

; Fills in what was said in the conversation showing before the box saw it (it only sees what
; happens while captions are on), from what Claude's window has loaded, so you can scroll back
; through it: the exchanges before the oldest one the box has go into the history, above it, counted
; as seen. It's done once for each conversation, a moment after the box goes to it (and when
; captions start). Scrolling back past them loads more (see LoadOlder).
LoadEarlier() {
    static done := Map()
    key := ConvKey
    if (key = "" || done.Has(key) || Hidden || !LastHwnd)
        return
    try list := ReadWholeChat(LastHwnd)
    catch
        return
    if (key != ConvKey || !list.Length)   ; (went to another conversation meanwhile)
        return
    done[key] := true
    ; Where the oldest exchange the box has is in the conversation (the latest time it was said).
    first := History.Length ? History[1] : Current, at := 0
    loop list.Length
        if (list[A_Index].you == first.you)
            at := A_Index
    if !at {
        if HasConversation()   ; can't tell where what the box has fits in
            return
        at := list.Length   ; the box has nothing yet: all but the newest, which it'll show
    }
    first.no := list[at].no   ; (for loading older ones, see LoadOlder)
    from := AfterCleared(key, list, at) + 1   ; (not what you cleared from the box, see ClearChat)
    if (at <= from)
        return
    earlier := []
    loop at - from
        earlier.Push(LoadedExchange(list[from + A_Index - 1]))
    AddEarlier(earlier)
}

; Shown before anything has been read from Claude's window (or to have the next read show again).
NothingRead() => {you: "", claude: "", live: false, streaming: false, thinking: false, work: ""}

; Puts what was read from Claude's window (now) in the box, if it's changed. Returns what it went by.
TakeRead(now) {
    global Shown, LastChange, Waiting, HoldingLogs
    ; In a long reply, your message (and the start of the reply) can drop out of what Claude's window
    ; has loaded, so only the end of the reply was read: it carries on the reply the box already has.
    ; While "I'm listening…" shows, that's the exchange from before it (otherwise the end of that
    ; reply would look like a new one, and type itself out all over again).
    if (now.HasOwnProp("partial") && now.partial && !Current.sample) {
        base := Current.dim ? (History.Length ? History[History.Length] : "") : Current
        if (base && base.you != "")
            now.you := base.you, now.claude := CarryOn(base.claude, now.claude)
    }
    if (SettingsGui && now.you = "" && now.claude = "")
        now := SAMPLE
    if (now.you != Shown.you || now.claude != Shown.claude || now.live != Shown.live || now.streaming != Shown.streaming
        || now.thinking != Shown.thinking || now.work != Shown.work) {
        Critical   ; so the animation never draws the conversation halfway through being changed
        HoldingLogs := true   ; (what this notes for the logs is written just after, not while the frames wait: see AddToLog)
        ; Claude's window showing less of the same reply, or its words laid out anew (like a Code
        ; turn tidied up once it's finished), isn't news: the box doesn't come back for it.
        stale := now.you == Shown.you && now.live = Shown.live && now.streaming = Shown.streaming && now.thinking = Shown.thinking
            && now.work == Shown.work && NothingNew(now.claude, Shown.claude)
        Shown := now
        if !stale
            LastChange := A_TickCount
        ; While showing "I'm listening…", the exchange from before "Hey Claude" can still change a
        ; little (its reply finishing). That doesn't count as you saying something. And while a
        ; setting's test message shows, what's new shows once it's done (see EndPreview).
        if Preview.saved
            Preview.missed := true
        else if (stale && now.you == Current.you && Current.words != "" && !Current.sample && !Current.dim && InStr(Current.words, ReplyWords(now.claude), true))
            Perf.stale++   ; (the box shows all of it already, word for word: not laid out again, which took a while for a long reply, several times a second)
        else if !(Waiting && Current.dim && !now.live && History.Length && now.you == History[History.Length].you) {
            Waiting := false
            ShowExchange(now)
        }
        HoldingLogs := false
        Critical "Off"
        Kick()
    }
    return now
}

; Claude's window is read again shortly, rather than at the next regular read: after the box clicked
; something in it (which Claude takes a moment to show), so the box and its list keep right up.
ReadSoon() => SetTimer(ReadNow, -200)
ReadNow() {
    if FetcherAlive()
        DllCall("PostMessage", "ptr", Fetcher.hwnd, "uint", FetchMessage(), "ptr", 0, "ptr", 0)
    else
        UpdateCaptions()
}

; Changes how often Claude's window is read (by the fetcher too).
ReadEvery(ms) {
    static every := CHECK_EVERY_MS
    if (ms != every) {
        SetTimer(UpdateCaptions, every := ms)
        if Fetcher.hwnd
            DllCall("PostMessage", "ptr", Fetcher.hwnd, "uint", FetchMessage(), "ptr", ms, "ptr", 0)
    }
    Fetcher.every := ms
}

; ---- The fetcher: reading Claude's window in a program of its own --------------------------------

; Reading Claude's window takes 40 ms or so (a long reply, more), and while it's being read the box
; can't draw: at 165 frames a second, that's several frames missed. So the fetcher, this same script
; started as a helper (see FetchMain), does the reading and hands each read over (see TookRead): the
; box goes on drawing meanwhile. Started as captions start (only as themselves: not a test that
; borrows their code), and again if it ever stops. It runs without UI Access, so it can be closed
; like any program. Once it's gone quiet (see UpdateCaptions), it's seen to here. Still there (its
; window), it's asked for a read straight away, and only started again if that brings nothing in 20 s
; either: just after the computer wakes from sleep, its last read is hours old, though it's doing
; fine, and it used to be started again every time, with Claude's window read here meanwhile. Gone
; (its window, or before its first read, its program), it's started again straight away, though not
; within 5 s of its last start, so one that can't keep going isn't started over and over; one just
; started is given 15 s to send its first read.
StartFetcher() {
    if (A_LineFile != A_ScriptFullPath || FetcherKeepingUp())
        return
    if (Fetcher.hwnd && DllCall("IsWindow", "ptr", Fetcher.hwnd)) {   ; still there, just quiet
        if (Fetcher.askedAt <= Fetcher.at) {   ; (not asked yet, since it last sent something)
            Fetcher.askedAt := A_TickCount
            DllCall("PostMessage", "ptr", Fetcher.hwnd, "uint", FetchMessage(), "ptr", 0, "ptr", 0)
            return
        }
        if (A_TickCount - Fetcher.askedAt < 20000)
            return
    } else if (Fetcher.startedAt && A_TickCount - Fetcher.startedAt < (!Fetcher.hwnd && Fetcher.pid && ProcessExist(Fetcher.pid) ? 15000 : 5000))
        return
    ; One that's stuck (still there, but nothing from it even when asked, or nothing yet 15 s after it
    ; started) goes first: left, it carried on after, beside the new one, and Claude's window was read
    ; twice over. Only if it's still the fetcher, though (see FetcherProcess).
    if FetcherProcess(Fetcher.pid)
        try ProcessClose(Fetcher.pid)
    Fetcher.hwnd := 0, Fetcher.startedAt := A_TickCount
    try {
        Run('"' RegExReplace(A_AhkPath, "i)_UIA(?=\.exe$)") '" "' A_ScriptFullPath '" fetcher ' A_ScriptHwnd, A_ScriptDir, , &pid)
        Fetcher.pid := pid
    }
}

; Whether the fetcher is reading Claude's window: it has sent a read lately (it sends one at least
; every second or so).
FetcherKeepingUp() => Fetcher.hwnd && A_TickCount - Fetcher.at < 3000 && DllCall("IsWindow", "ptr", Fetcher.hwnd)

; Whether the fetcher is still there to wait for: running, and it's sent something in the last 20 s.
FetcherAlive() => Fetcher.hwnd && A_TickCount - Fetcher.at < 20000 && DllCall("IsWindow", "ptr", Fetcher.hwnd)

; Whether there's a fetcher at all, quiet or not: its window still there, or, before its first read,
; its program running.
FetcherThere() => Fetcher.hwnd ? DllCall("IsWindow", "ptr", Fetcher.hwnd) : Fetcher.pid && ProcessExist(Fetcher.pid)

; Whether the program pid is still the fetcher: an AutoHotkey program with a script window named as
; FetchMain names it (or, just started, still named after this script). Windows hands a program's
; number on to a new one once it's gone, so a while after the fetcher went (like once captions come
; back from being hidden), its old number could be any program, like your game, which mustn't be
; closed for it.
FetcherProcess(pid) {
    if !(pid && ProcessExist(pid))
        return false
    was := A_DetectHiddenWindows
    DetectHiddenWindows true
    found := false
    try {
        for hwnd in WinGetList("ahk_class AutoHotkey ahk_pid " pid)
            if (WinGetTitle(hwnd) = "Claude captions fetcher" || InStr(WinGetTitle(hwnd), A_ScriptFullPath))
                found := true
    }
    DetectHiddenWindows was
    return found
}

; The message the captions send the fetcher: how often to read (wParam, in ms), or to read now (0).
FetchMessage() {
    static msg := DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.Fetcher", "uint")
    return msg
}

; A read from the fetcher (WM_COPYDATA): 1, a read of Claude's window (see PackRead), 2, your words in
; the message box while you're talking, or 3, a read that didn't work out. Only the fetcher these
; captions started counts. It's gone through just after (see TookFullRead, TookWords), so the fetcher
; can carry on straight away.
TookRead(wParam, lParam, msg, hwnd) {
    kind := NumGet(lParam, 0, "uptr")
    if (kind < 1 || kind > 3 || !Fetcher.pid)
        return
    DllCall("GetWindowThreadProcessId", "ptr", wParam, "uint*", &pid := 0)
    if (pid != Fetcher.pid)
        return
    text := kind = 3 ? "" : StrGet(NumGet(lParam, 16, "ptr"), NumGet(lParam, 8, "uint") // 2, "UTF-16")
    if (Fetcher.hwnd != wParam) {   ; (just started: it reads as often as the box wants)
        Fetcher.hwnd := wParam
        DllCall("PostMessage", "ptr", wParam, "uint", FetchMessage(), "ptr", Fetcher.every, "ptr", 0)
    }
    Fetcher.at := A_TickCount
    if (kind = 2)
        Fetcher.said := text, SetTimer(TookWords, -1)
    else
        Fetcher.read := kind = 1 ? text : "failed", SetTimer(TookFullRead, -1)
    return true
}

TookFullRead() {
    text := Fetcher.read, Fetcher.read := ""
    if (text = "")
        return
    if (Hidden || text = "failed")
        return UpdateVisibility()
    ; (Not while you scroll or drag the box, or Claude's window is scrolled up for older messages:
    ; see UpdateCaptions.)
    if (Drag.mode || A_TickCount - ScrollAt < 700 || LoadingEarlier)
        return
    at := MsNow()
    Digest(UnpackRead(text))
    digestMs := MsNow() - at, Perf.reads++, Perf.readMs += digestMs, Perf.readMax := Max(Perf.readMax, digestMs)
}

; How long the box spent on what isn't drawing, for the note on how smoothly it moves (see
; NoteSmoothness): reads of Claude's window gone through (reads, and how long, all told and the
; longest), how many of those were the reply shown again with nothing new (stale, not laid out
; again), and Claude's window read here rather than by the fetcher (here, and how long).
NewPerf() => {reads: 0, readMs: 0, readMax: 0, stale: 0, here: 0, hereMs: 0}

TookWords() {
    said := Fetcher.said
    if (!Hidden && said != "" && !(Shown.live && said == Shown.you))
        ShowYourWords(said)
}

; A read of Claude's window (see ReadClaude) as text, for handing from the fetcher to the captions,
; and back.
PackRead(read) {
    now := read.now, rs := Chr(30), us := Chr(31), gs := Chr(29)
    text := "hwnd=" read.hwnd rs "page=" read.page rs "tabs=" read.tabs rs "bar=" read.bar
    for key in ["you", "claude", "work", "session", "convo", "prevYou", "prevClaude"]
        text .= rs key "=" (now.HasOwnProp(key) ? now.%key% : "")
    for key in ["live", "streaming", "thinking", "working", "listening", "voice", "micLive", "partial", "away", "cowork"]
        text .= rs key "=" (now.HasOwnProp(key) && now.%key% ? 1 : 0)
    rows := ""
    for row in now.sessions
        rows .= (rows = "" ? "" : us) row.title gs row.status
    links := ""
    if now.HasOwnProp("links")
        for link in now.links
            links .= (links = "" ? "" : us) link.text gs link.url
    return text rs "sessions=" rows rs "links=" links
}

UnpackRead(text) {
    now := {}, read := {now: now, hwnd: 0, page: "", tabs: "", bar: ""}
    for field in StrSplit(text, Chr(30)) {
        at := InStr(field, "="), key := SubStr(field, 1, at - 1), value := SubStr(field, at + 1)
        switch key {
            case "hwnd": read.hwnd := Integer(value)
            case "page": read.page := value
            case "tabs": read.tabs := value
            case "bar": read.bar := value
            case "sessions", "links":
                list := []
                if (value != "")
                    for item in StrSplit(value, Chr(31)) {
                        f := StrSplit(item, Chr(29))
                        list.Push(key = "sessions" ? {title: f[1], status: f.Length > 1 ? f[2] : ""} : {text: f[1], url: f.Length > 1 ? f[2] : ""})
                    }
                now.%key% := list
            case "live", "streaming", "thinking", "working", "listening", "voice", "micLive", "partial", "away", "cowork":
                now.%key% := value = "1"
            default:
                now.%key% := value
        }
    }
    return read
}

; The fetcher itself (this script, started with "fetcher" and the captions' script window, owner):
; no box, no tray icon. It reads Claude's window as often as the captions ask (see ReadEvery), and
; while you're talking, the message box several times as often, for your words; it sends each read
; over (see TookRead). It goes once the captions do. Its script window is named differently, so
; turning captions off (see OtherCaptions) can't take it for them.
FetchMain(owner) {
    FetchState.owner := owner
    Persistent
    Suspend(true)   ; (the captions' mouse wheel shortcuts are theirs, not the fetcher's)
    A_IconHidden := true
    DllCall("SetThreadDpiAwarenessContext", "ptr", -4, "ptr")   ; (real screen pixels, as the captions go by)
    DllCall("SetWindowText", "ptr", A_ScriptHwnd, "str", "Claude captions fetcher")
    OnError(FetchFailed)
    OnMessage(FetchMessage(), FetchAsked)
    SetTimer(FetchRead, FetchState.every)
    FetchRead()
}

; Something going wrong in the fetcher is noted in FOCUS_LOG, as for the box (see BoxFailed), and it
; carries on: what was running stops there, and its next read goes as usual. (It used to exit at
; anything at all, like one call into Claude's window that went wrong, and until the captions had
; started it again, they read Claude's window themselves, holding the box up.) Only what leaves it
; unable to go on at all (mode "ExitApp") still ends it, and the captions start it again (see
; StartFetcher).
FetchFailed(e, mode) => BoxFailed(e, mode, "in the fetcher")

; The captions asked it to read every so many ms (wParam), or right now (0).
FetchAsked(wParam, lParam, msg, hwnd) {
    if wParam
        SetTimer(FetchRead, FetchState.every := wParam)
    else   ; (a read now, and on from then at the same pace)
        SetTimer(FetchRead, FetchState.every), SetTimer(FetchNow, -1)
    return 0
}
FetchNow() => FetchRead()

FetchRead() {
    static reading := false
    if !DllCall("IsWindow", "ptr", FetchState.owner)   ; (the captions are gone)
        ExitApp
    if reading   ; (one read at a time: one can start while another waits on Claude's window)
        return
    reading := true
    try {
        read := ReadClaude(FetchState)
        SendToCaptions(1, PackRead(read))
    } catch {
        reading := false
        SendToCaptions(3, "")
        return
    }
    reading := false
    if (read.now.listening != FetchState.listening) {   ; you're talking (or you've stopped)
        FetchState.listening := read.now.listening, FetchState.said := ""
        SetTimer(FetchWords, FetchState.listening ? YOUR_WORDS_MS : 0)
    }
}

; While you're talking: your words in the message box, sent over as they change.
FetchWords() {
    if !FetchState.lastHwnd
        return
    try said := PromptText(FetchState.lastHwnd)
    catch
        return
    if (said != FetchState.said)
        FetchState.said := said, SendToCaptions(2, said)
}

SendToCaptions(kind, text) {
    cds := Buffer(24, 0)   ; COPYDATASTRUCT
    NumPut("uptr", kind, cds, 0), NumPut("uint", (StrLen(text) + 1) * 2, cds, 8), NumPut("ptr", StrPtr(text), cds, 16)
    DllCall("SendMessageTimeoutW", "ptr", FetchState.owner, "uint", 0x4A, "ptr", A_ScriptHwnd, "ptr", cds, "uint", 2, "uint", 2000, "ptr*", &result := 0)   ; SMTO_ABORTIFHUNG
}

; An exchange: what you said and Claude's reply, as the box shows them, plus a note while there's
; no conversation. parts holds each one laid out: its label, and its words with where each goes.
; chat notes that it's from the Chat page, where what you said goes on the right, queued what you
; said next while Claude was still busy with this reply (see ShowExchange),
; loaded that it's from a conversation just switched to, so what it shows next was already there,
; and which of its reply's words you've seen (see CheckSeen): seen, since when others have been in
; view, where the first you haven't seen starts (unseenAt, its paragraph's y in the exchange, or
; ""), and when you finished reading each paragraph that was new (readAt, by its block: its NEW line
; fades away then).
NewExchange() => {note: "", you: "", youStatus: "", dim: false, claude: "", claudeStatus: "", thinking: false, chat: Page = "chat", queued: "", loaded: false,
    work: "", time: FormatTime(, "h:mm tt"), replyTime: "", newAt: 0, newTime: "", words: "", wordsAt: 0, saidAt: 0, sample: false, restores: false,
    parts: [], stops: [], lineStops: [], anyStops: [], spans: [], height: 0, y: 0, fadeUntil: 0,
    since: Map(), unseenAt: "", readAt: Map(), sounded: 0, links: [], linkOpened: false, revealEnd: 0,
    old: false, doneAt: 0, took: "", saidStamp: A_Now}

HasConversation() => Current.you != "" || Current.claude != "" || Current.thinking

; Puts what was read from Claude's window in the box. When you've said something new since Claude's
; last reply (or the chat is now empty), the exchange showing moves up into the history.
ShowExchange(now, spreadMs := CHECK_EVERY_MS) {
    global Current
    isSample := now = SAMPLE
    empty := now.you = "" && now.claude = "" && !now.thinking
    fresh := Current.loaded || A_TickCount < SettledAt, Current.loaded := false
    ; The exchange you cleared the box at (see ClearChat), still in Claude's window, doesn't come
    ; back: the box stays clear until there's something new.
    if (!isSample && now.you != Current.you && ClearedAt(ConvKey, now.you, now.claude))
        return
    if (isSample != Current.sample) {
        Current := NewExchange()   ; to or from the settings' example, which isn't kept
        Current.sample := isSample
    } else if (!isSample && Current.claude != "" && (empty || now.you != "" && now.you != Current.you)) {
        PushCurrent()
        Current := NewExchange()
    } else if (!isSample && Current.claude = "" && now.you != "" && History.Length && now.you == History[History.Length].you) {
        ; The chat still shows the exchange from before what you just said. Usually that's because
        ; your message is on its way there, so the box keeps showing your words. Only if it hasn't
        ; turned up after SENT_WAIT_MS does the box go back to that exchange.
        wait := SENT_WAIT_MS - (A_TickCount - Current.saidAt)
        if (wait > 0) {
            Current.youStatus := ""   ; not listening any more
            SetTimer(ShowLatestRead, -(wait + 50))
            return
        }
        said := Current.dim ? "" : Current.you   ; (not "I'm listening…")
        Current := History.Pop(), Current.old := false
        ; If Claude is still busy with that reply, what you said is most likely waiting its turn:
        ; Claude gets to it at its next stopping point (on the Code page, between its steps). Until
        ; it turns up, it stays at the bottom of the reply, marked QUEUED.
        if (said != "" && (now.work != "" || now.streaming || now.thinking))
            Current.queued := said
    }
    if !empty
        Current.note := ""
    if (now.you != Current.you)
        Current.saidAt := A_TickCount, Current.saidStamp := A_Now
    wasBusy := Current.thinking || Current.claudeStatus != "" || Current.work != ""
    ; (the reply shown again with nothing new in it, only less or laid out anew: see NothingNew)
    stale := now.you == Current.you && Current.claude != "" && now.claude != Current.claude && NothingNew(now.claude, Current.claude)
    if stale
        NoteEvent(Format("Claude's reply shown again, {} letters to {}, with nothing new in it: not counted, and not shown again", StrLen(Current.claude), StrLen(now.claude)))
    ; Nor is a finished reply that changed a word or three where it was, without growing: something in
    ; it that ticks on (a finished reply "changed" every minute on the dot, and each time was counted
    ; as a new message). It shows as it is now, as seen.
    if (!stale && !isSample && now.you == Current.you && Current.words != "" && !now.streaming && !now.thinking && now.work = ""
        && (words := ReplyWords(now.claude)) != Current.words && InStr(words, Current.words) != 1 && (added := NewWords(words, Current.words)).Length < 4) {
        NoteEvent(Format("Claude's finished reply changed a little ({} letters to {}; new: '{}'): not counted as new", StrLen(Current.words), StrLen(words), Join(added, "', '")))
        stale := true
    }
    if RegExMatch(now.work, "^(.*\S)\s*·\s*[^·]*$", &spentMatch)   ; how long it's taken, and how many tokens (for "Finished")
        Current.took := spentMatch[1]
    Current.you := now.you, Current.dim := false, Current.youStatus := now.live ? "LISTENING" : ""
    Current.claude := now.claude, Current.thinking := now.thinking, Current.work := now.work
    Current.claudeStatus := now.thinking ? "THINKING" : now.streaming ? "RESPONDING" : ""
    Current.links := now.HasOwnProp("links") ? now.links : []
    ; Claude has finished a reply: if the box is tucked away, its tab counts it and wiggles; and its
    ; first link opens under the box, if you asked for that.
    if (wasBusy && !Current.thinking && Current.claudeStatus = "" && Current.work = "" && Current.claude != "" && !fresh) {
        Current.doneAt := A_TickCount   ; (Claude's spark settles, see DrawWork)
        Nudge("done")
        if (Settings.AutoLinks && Current.links.Length && !Current.linkOpened && !isSample)
            Current.linkOpened := true, SetTimer(OpenPage.Bind(Current.links[1].url), -1)
    }
    ; What was already there when captions started, or when you went to this conversation, isn't
    ; new (and counts as seen: you'd have read it in Claude's window). Nor is a reply shown again
    ; with nothing new in it (stale).
    already := fresh || A_TickCount - Started < 3000 || stale
    if ((now.claude != "" || now.thinking) && Current.replyTime = "") {   ; a new reply: note when, for its label (and for later)
        Current.replyTime := FormatTime(, "h:mm tt")
        if (!isSample && !already && Current.you != "" && !Current.dim && !now.live && Current.HasOwnProp("saidStamp"))
            NoteTime(Current.you, Current.saidStamp, A_Now)
    }
    ; A new message gets the "new message" badge: Claude's first words, or new words after it's
    ; been quiet (or busy taking steps) for a while.
    words := ReplyWords(now.claude)
    if (words != Current.words) {
        if (words != "" && (Current.words = "" || A_TickCount - Current.wordsAt > NEW_AFTER_MS) && !isSample && !already) {
            ; (Noted, with whether the reply grew or changed: a reply changing after it's done reads as new.)
            NoteEvent(Current.words = "" ? Format("new words from Claude: a new reply, {} letters", StrLen(words))
                : Format("new words from Claude after {} s quiet: {} letters to {}, {}", Round((A_TickCount - Current.wordsAt) / 1000),
                StrLen(Current.words), StrLen(words), InStr(words, Current.words) = 1 ? "it grew" : "it changed"))
            Current.newAt := A_TickCount, Current.newTime := FormatTime(, "h:mm tt"), Nudge("new")
        }
        Current.words := words, Current.wordsAt := A_TickCount
    }
    LayOutExchange(Current, spreadMs, !already && !isSample)
    if already {   ; (it was already there: it just shows, as it was, and counts as seen)
        for part in Current.parts
            for t in part.tokens
                t.born := 0, t.per := 0
        ; Unless you came to it with new messages counted on its tab (like Code replies finished
        ; while you were on the Chat and Cowork page): what you haven't seen of it stays unseen, so the
        ; box shows where the new words start, and the count goes once you've read them.
        shownOn := ShownPage()
        if !(fresh && Anim.peekCounts.%shownOn%)
            MarkAllSeen(Current)
    }
    Place()
    ReadAloud(Current, already)
}

; Whether Claude's reply as its window shows it now holds nothing that the box hadn't already shown
; (was): every word of it is in was, in the same order. Its window showing less of the reply, or the
; same words laid out anew (as a finished Code turn is tidied up), rather than new words. Only its
; words count: not the lines between them saying what Claude did ("Ran 4 commands…"), which Claude's
; window sums up anew as a turn finishes.
NothingNew(now, was) {
    now := ReplyWords(now), was := ReplyWords(was)
    if (now = "" || was = "")
        return now = "" && was != ""
    if InStr(was, now, true)
        return true
    at := 1
    for w in StrSplit(Trim(RegExReplace(now, "\s+", " ")), " ") {
        if !(p := InStr(was, w, true, at))
            return false
        at := p + StrLen(w)
    }
    return true
}

; The words in now (a reply's words, see ReplyWords) that aren't in was, in the same order: each of
; now's words is looked for a little way on from where the last one was found.
NewWords(now, was) {
    old := StrSplit(was, " "), j := 1, out := []
    for w in StrSplit(now, " ") {
        k := j
        while (k <= old.Length && old[k] !== w && k - j < 40)
            k++
        if (k <= old.Length && old[k] == w)
            j := k + 1
        else
            out.Push(w)
    }
    return out
}

Join(list, between) {
    out := ""
    for item in list
        out .= (A_Index > 1 ? between : "") item
    return out
}

; Claude's reply as the box has it (old), carried on with the end of it that Claude's window still
; has loaded (tail): the tail picks up where its first lines match lines of old (the last place they
; do; the last line of old may have grown since), and what comes after is new. If they don't match
; up anywhere, the box keeps what it has.
CarryOn(old, tail) {
    have := StrSplit(old, "`n"), got := StrSplit(tail, "`n")
    loop Min(3, got.Length) {   ; (the first line or two might have changed)
        from := A_Index, i := have.Length + 1
        while (--i >= 1) {
            if !SameLine(have[i], got[from])
                continue
            n := Min(got.Length - from + 1, have.Length - i + 1), ok := true
            loop n - 1 {
                a := have[i + A_Index], b := got[from + A_Index]
                if !(SameLine(a, b) || i + A_Index = have.Length && StartsWith(SameLine(b), SameLine(a))) {
                    ok := false
                    break
                }
            }
            if !ok
                continue
            text := ""
            loop i - 1
                text .= have[A_Index] "`n"
            loop got.Length - from + 1
                text .= got[from + A_Index - 1] (A_Index < got.Length - from + 1 ? "`n" : "")
            return text
        }
    }
    return old
}

; Whether two lines of a reply are the same, a step Claude is taking counting the same as once it's
; taken it. With one line, that line as compared.
SameLine(a, b := unset) {
    a := StrReplace(a, STEP_RUNNING, STEP)
    return IsSet(b) ? a == StrReplace(b, STEP_RUNNING, STEP) : a
}

; Shows what was last read from Claude's window again, for a decision that had to wait a moment.
ShowLatestRead() {
    Critical
    ShowExchange(Shown)
    Critical "Off"
    Kick()
    UpdateVisibility()
}

; A reply's words, leaving out its steps and how it's laid out, to notice new words rather than new
; steps, or the same words drawn again differently (like voice mode's words becoming paragraphs
; once Claude stops talking).
; Each read of Claude's window asks for the words of the same reply several times over (whether
; anything's new, whether a finished reply only changed a little, the words to keep), and for those
; of the reply the box showed before it. Going through a long reply took a while each time, so the
; last two worked out are kept, and a reply's words are worked out once a read rather than up to five
; times. (Kept by the reply exactly as it was, letter for letter, so any change at all works them out
; again.)
ReplyWords(markup) {
    static lastIn := "", lastOut := "", prevIn := "", prevOut := ""
    if (markup == lastIn)
        return lastOut
    if (markup == prevIn) {   ; (the one before: now it's the last one)
        prevIn := lastIn, lastIn := markup, words := prevOut, prevOut := lastOut, lastOut := words
        return words
    }
    text := ""
    for line in StrSplit(markup, "`n") {
        if (StartsWith(line, STEP) || StartsWith(line, STEP_RUNNING))
            continue
        for marker in [BULLET, HEADING, CODE_BLOCK]
            if StartsWith(line, marker)
                line := SubStr(line, StrLen(marker) + 1)
        text .= line " "
    }
    text := RegExReplace(StrReplace(text, TICK), "\s+", " ")
    words := Trim(RegExReplace(text, " ([,.;:!?…)])", "$1"))
    prevIn := lastIn, prevOut := lastOut, lastIn := markup, lastOut := words
    return words
}

; Moves the exchange showing into the history, which keeps HISTORY_KEEP of them.
PushCurrent() {
    if (Current.dim || Current.sample || Current.you = "" && Current.claude = "")
        return false
    Current.youStatus := Current.claudeStatus := "", Current.note := ""
    ; No thinking, status line, queued words or Claude's spark in the history.
    Current.thinking := false, Current.work := "", Current.queued := "", Current.old := true
    LayOutExchange(Current)
    History.Push(Current)
    while (History.Length > HISTORY_KEEP)
        History.RemoveAt(1)
    return true
}

; "Hey Claude" was just heard, or the mic just turned on: the last exchange moves up, and the box
; shows that Claude is listening, softly, until you start talking.
StartWaiting() {
    global Waiting, LastChange, Current
    if (Waiting || Hidden)
        return
    EndPreview(), ToLive()   ; (from a setting's test message too)
    Waiting := true, LastChange := A_TickCount
    Critical
    pushed := PushCurrent()
    Current := NewExchange()
    Current.restores := pushed, Current.dim := true
    Current.you := LISTENING_TEXT, Current.youStatus := "LISTENING"
    LayOutExchange(Current), Place()
    Critical "Off"
    Kick()
    UpdateVisibility()
}

; Nothing was said after all: the box goes back to the exchange from before.
StopWaiting() {
    global Waiting, Current
    if !Waiting
        return
    Waiting := false
    if !Current.dim
        return
    Critical
    Current := Current.restores && History.Length ? History.Pop() : NewExchange()
    Current.old := false
    LayOutExchange(Current), Place()
    Critical "Off"
    Kick()
    UpdateVisibility()
}

; claude-hey-claude.ahk heard "Hey Claude". This shows before the mic has even turned on, and brings
; the box back out of its tab if you tucked it away.
HeardHeyClaude(*) {
    global HeyClaudeAt := A_TickCount
    if Minimized
        OpenFromPeek()
    StartWaiting()
    ReadEvery(CHECK_EVERY_MS)   ; to catch your words soon
    SetTimer(GiveUpWaiting, -6000)   ; in case the mic never turns on
}

GiveUpWaiting() {
    if !Listening
        StopWaiting()
}

; While voice mode or dictation is listening: reads just the message box, several times as often as
; the whole window, so your words show up almost as soon as Claude writes them down. Only while
; there's no fetcher, though: the fetcher reads them, and sends them over as they change (see
; FetchWords). (Read here whenever nothing had come from the fetcher for 3 s, the message box was
; searched ten times a second on the box's own thread, just when Claude was slow to answer.)
WatchYourWords() {
    if (Hidden || !LastHwnd || FetcherThere())
        return
    try said := PromptText(LastHwnd)
    catch
        return
    if (said != "" && !(Shown.live && said == Shown.you))
        ShowYourWords(said)
}

ShowYourWords(said) {
    global Shown, LastChange, Waiting
    EndPreview(), ToLive()   ; you're talking, so back to what's happening now
    Critical   ; so the animation never draws the conversation halfway through being changed
    Shown := {you: said, claude: "", live: true, streaming: false, thinking: false, work: ""}, LastChange := A_TickCount, Waiting := false
    ShowExchange(Shown, YOUR_WORDS_MS)
    Critical "Off"
    Kick()
    UpdateVisibility()
}

; ---- Reading Claude's window ------------------------------------------------------

; The newest exchange in Claude's window: the newest thing you said, and Claude's reply to it so
; far, written down with its layout (see TICK above). The chat is read from the bottom up until
; it reaches your newest message.
; While voice mode or dictation is listening, your words show up in the message box as you talk;
; those count as the newest thing you said, before Claude has replied to them.
ReadConversation(hwnd) {
    ; Reading goes on past your newest message to the one before it, for the reply in between
    ; (prevYou, prevClaude): it can still change after you've said something new (see UpdateCaptions).
    found := {you: "", parts: [], newest: "", prevYou: "", streaming: false, done: false, work: ""}
    chat := ChatList(hwnd)
    ; Claude's list of messages scrolled up (by you, to read back, or for a moment to load older ones,
    ; see LoadOlder): what it has loaded isn't the newest, so this read doesn't count (away).
    away := false
    if (chat && (scroller := GetPattern(chat, 10004, "{88f4d42a-e881-459d-a77c-73bbbb7e02dc}"))) {   ; ScrollPattern
        try {
            ComCall(10, scroller, "int*", &can := 0)   ; CurrentVerticallyScrollable
            if can {
                ComCall(6, scroller, "double*", &spot := 0.0)   ; CurrentVerticalScrollPercent
                away := spot >= 0 && spot < 97
            }
        }
    }
    if chat {
        ReadBack(chat, found)
    } else {
        ; No chat list by that name: go by the messages alone.
        groups := GetElements(hwnd, UIA_GROUP)
        i := groups.Length
        while (i >= 1 && !found.done)
            if IsMessage((g := groups[i--]).name)
                AddMessage({el: g.el, name: g.name, type: UIA_GROUP}, found)
    }
    ; The parts are newest first. Once your newest message is found, the newest reply's parts are
    ; in found.newest and found.parts holds the reply before it.
    parts := OldestFirst(found.newest != "" ? found.newest : found.parts)
    prevClaude := found.prevYou != "" ? PartsToMarkup(OldestFirst(found.parts)) : ""
    ; The mic is on while dictation's or voice mode's buttons show, voice mode (where Claude reads
    ; its replies out loud) is on while its microphone button shows (and listening, not muted,
    ; while that says "Turn off microphone"), and Claude is working on a reply while its Stop button
    ; shows. The buttons also give the sessions or chats in Claude's sidebar (see SidebarRows).
    micOn := working := voiceOn := micLive := false
    buttons := ButtonsAround(hwnd, chat)
    for button in buttons {
        micOn := micOn || IsDictationStop(button.name) || IsVoiceModeControl(button.name)
        voiceOn := voiceOn || IsVoiceModeControl(button.name)
        micLive := micLive || button.name == "Turn off microphone"
        working := working || IsStopReplyButton(button.name)
    }
    side := SidebarRows(buttons)
    if (micOn && (said := PromptText(hwnd)) != "")
        return {you: said, claude: "", live: true, streaming: false, thinking: false, work: "", working: working, listening: true, voice: voiceOn,
            micLive: micLive, sessions: side.rows, session: side.current, convo: side.convo, prevYou: "", prevClaude: "", away: false, buttons: buttons}
    replyText := PartsToMarkup(parts)
    links := LinksIn(parts)
    ; Thinking: working on your newest message, with no words of the reply yet.
    thinking := found.you != "" && replyText = "" && (working || found.streaming)
    ; Reading got to the top of what Claude's window has loaded without finding your message: in a
    ; long reply, Claude's window only keeps the part of it near the bottom (see UpdateCaptions).
    partial := found.newest = "" && replyText != ""
    return {you: found.you, claude: replyText, live: false, streaming: found.streaming, thinking: thinking,
        work: working ? found.work : "", working: working, listening: micOn, voice: voiceOn, micLive: micLive, sessions: side.rows, session: side.current,
        convo: side.convo, prevYou: found.prevYou, prevClaude: prevClaude, links: links, partial: partial, away: away, buttons: buttons}
}

; The exchanges Claude's window has loaded, oldest first, as {you, claude, no} (no: the number of
; your message in the conversation): up to the newest most of them. Claude's window only keeps the
; part of a long conversation near where it's scrolled to (see LoadOlder for the rest).
ReadWholeChat(hwnd, most := 40) => (chat := ChatList(hwnd)) ? ReadChat(chat, most) : []

; Claude's list of messages (it scrolls), or "". It's looked for with FindFirst, which stops as
; soon as it gets to it, without going through the messages inside it (a long chat has thousands of
; pieces: going through them all took about 20 ms each time).
ChatList(hwnd) {
    static byBoth := 0
    if !byBoth {
        v := Buffer(24, 0), NumPut("ushort", 3, v, 0), NumPut("int", UIA_GROUP, v, 8)
        ComCall(23, UIA, "int", 30003, "ptr", v, "ptr*", &byType := 0)   ; CreatePropertyCondition: control type
        name := Buffer(24, 0), bstr := DllCall("OleAut32\SysAllocString", "wstr", "Chat messages", "ptr")
        NumPut("ushort", 8, name, 0), NumPut("ptr", bstr, name, 8)   ; (a VARIANT holding the name)
        ComCall(23, UIA, "int", 30005, "ptr", name, "ptr*", &byName := 0)   ; ...and name
        DllCall("OleAut32\SysFreeString", "ptr", bstr)
        ComCall(25, UIA, "ptr", byType, "ptr", byName, "ptr*", &byBoth)     ; CreateAndCondition, kept for good
        ObjRelease(byType), ObjRelease(byName)
    }
    try {
        ComCall(6, UIA, "ptr", hwnd, "ptr*", &p := 0), root := ComPtr(p)   ; ElementFromHandle
        ComCall(5, root, "int", 4, "ptr", byBoth, "ptr*", &p := 0)       ; FindFirst(descendants)
        return p ? ComPtr(p) : ""
    }
    return ""
}

; The buttons in Claude's window that aren't in the list of messages (chat): its sidebar, the
; conversation's title, and the message box's (Stop, the mic, voice mode), and the Model, Effort and
; Usage buttons under it (see ElementsAround).
ButtonsAround(hwnd, chat) => ElementsAround(hwnd, UIA_BUTTON, chat)

; The elements of one type (controlType) in Claude's window that aren't in its list of messages (chat,
; looked for if it isn't given, see ChatList), as GetElements has them. From the list of messages it
; goes up a level at a time, looking through the other branches at each level, up to the page itself,
; so the messages themselves are never gone through (see ChatList): in a long conversation, those are
; most of the window, and going through them all for one of Claude's buttons held the box up each time
; it looked. Without the list, every one in the window; and the same if it doesn't get up to the page
; (Claude's window laid out some other way), rather than leave out what's further up.
ElementsAround(hwnd, controlType, chat := unset) {
    static walker := 0
    if !IsSet(chat)
        chat := ChatList(hwnd)
    if !chat
        return GetElements(hwnd, controlType)
    if !walker
        ComCall(14, UIA, "ptr*", &walker)   ; RawViewWalker, kept for good
    try {
        items := [], el := chat
        loop 12 {
            ComCall(3, walker, "ptr", el, "ptr*", &p := 0)   ; GetParentElement
            if !p
                break
            parent := ComPtr(p)
            ComCall(4, walker, "ptr", parent, "ptr*", &p := 0)   ; GetFirstChildElement
            while p {
                kid := ComPtr(p)
                ComCall(3, UIA, "ptr", kid, "ptr", el, "int*", &same := 0)   ; CompareElements
                if !same
                    for item in ElementsUnder(kid, controlType, 7)   ; (the branch, itself included)
                        items.Push(item)
                ComCall(6, walker, "ptr", kid, "ptr*", &p := 0)   ; GetNextSiblingElement
            }
            ComCall(21, parent, "int*", &parentType := 0)   ; CurrentControlType
            if (parentType = 50030)   ; the page itself (a document): no need to go any higher
                return items
            el := parent
        }
    }
    return GetElements(hwnd, controlType)
}

ReadChat(chat, most := 40) {
    found := {you: "", parts: [], newest: "", prevYou: "", streaming: false, done: false, work: "", all: [], most: most}
    ReadBack(chat, found)
    out := [], i := found.all.Length
    while (i >= 1) {
        e := found.all[i--], parts := OldestFirst(e.parts)
        out.Push({you: e.you, claude: PartsToMarkup(parts), no: e.no, links: LinksIn(parts)})
    }
    return out
}

; The web pages a reply's parts link to, up to three, each once, as {text, url}, in order: its links,
; and web addresses written out in its words (see AddressesIn), or in a bit of code that's nothing
; else. (Only its links had pills: asked for a link, Claude often writes the address out, and you
; had to ask again for one you could click.) A bigger bit of code, like a command, isn't looked in.
LinksIn(parts) {
    links := [], seen := Map()
    for part in parts {
        if (part.type = "link")
            AddLink(links, seen, part.text, part.url)
        else if (part.type = "item" || part.type = "run" && (!part.code || Trim(part.text) ~= "^\S+$"))
            for url in AddressesIn(part.text)
                AddLink(links, seen, url, url)
    }
    return links
}

; Adds a link (text, url) to links, unless there are three already, or it's one of them (seen: the
; same page, written with "www." or without, "http" or "https", or a "/" at the end, counts once:
; a link's words are often its own address).
AddLink(links, seen, text, url) {
    key := StrLower(RegExReplace(url, "i)^https?://(www\.)?|/+$"))
    if (links.Length < 3 && !seen.Has(key))
        links.Push({text: text, url: url}), seen[key] := true
}

; The web addresses written out in some words, in order, as "https://…": each starting with "http://",
; "https://" or "www.", and without what comes after it in the sentence, like a full stop, or the
; bracket around it ("(see https://…)"), but keeping one that's its own ("…/Foo_(bar)").
AddressesIn(text) {
    out := [], at := 1
    while (at := RegExMatch(text, "i)(?<![\w@./-])(?:https?://|www\.)[^\s<>`"'``“”‘’]+", &m, at)) {
        at += m.Len, url := m[0]
        loop {
            url := RegExReplace(url, "[.,;:!?*…]+$")
            last := SubStr(url, -1), StrReplace(url, "(", , , &opens), StrReplace(url, ")", , , &closes)
            StrReplace(url, "[", , , &opensSq), StrReplace(url, "]", , , &closesSq)
            if !(last = ")" && closes > opens || last = "]" && closesSq > opensSq)
                break
            url := SubStr(url, 1, -1)
        }
        if StartsWith(url, "www.")
            url := "https://" url
        if (url ~= "i)^https?://(([\w-]+\.)+[a-z]{2,}|localhost|\d{1,3}(\.\d{1,3}){3})(:\d+)?([/?#]|$)")
            out.Push(url)
    }
    return out
}

; Keeps one of Claude's messages (msg, with its kids and first line, label) in byNo under its number
; in the conversation: yours as {you}, and Claude's as {parts}, in order. (A reply still being
; written has no number, and isn't kept.)
KeepMessage(msg, kids, label, byNo) {
    if RegExMatch(msg.name, "^Message (\d+)", &m)
        byNo[Integer(m[1])] := StartsWith(label, "You said: ") ? {you: YourWords(kids, label)} : {parts: ClaudesParts(kids)}
}

; What you said in one of your messages (its kids, and its first line, label): the message itself,
; leaving out its buttons and when it was sent (or what the label says, if that's all there is).
YourWords(kids, label) {
    text := ""
    loop kids.Length - 1 {
        kid := kids.Get(A_Index + 1), name := Trim(kid.name)
        if (kid.type = UIA_TEXT && name != "" && !IsWhenLabel(name))
            text .= (text = "" ? "" : " ") name
    }
    return text != "" ? text : SubStr(label, 11)
}

; The parts of one of Claude's messages (its kids, see CollectParts), leaving out its hidden
; "Claude responded: ..." label.
ClaudesParts(kids) {
    piece := []
    loop kids.Length {
        kid := kids.Get(A_Index)
        if !(A_Index = 1 && StartsWith(Trim(kid.name), "Claude responded: "))
            CollectParts(kid, piece)
    }
    return piece
}

; The exchanges before your message number before (newest last), put together from the messages
; gathered by number (byNo): each of yours, with Claude's messages after it as its reply. It goes
; back from before, and stops at a number it hasn't seen (so it never skips any), or after most.
ExchangesBefore(byNo, before, most) {
    out := [], reply := [], k := before - 1
    while (k >= 1 && out.Length < most && byNo.Has(k)) {
        m := byNo[k--]
        if m.HasOwnProp("you") {
            parts := []
            loop reply.Length   ; (reply was gathered newest first)
                for part in reply[reply.Length - A_Index + 1]
                    parts.Push(part)
            out.InsertAt(1, {you: m.you, claude: PartsToMarkup(parts), no: k + 1, links: LinksIn(parts)})
            reply := []
        } else {
            reply.Push(m.parts)
        }
    }
    return out
}

; An exchange read from Claude's window (see ReadChat), laid out for the history: counted as seen,
; with no time (it isn't known).
LoadedExchange(e) {
    ex := NewExchange()
    ex.you := e.you, ex.claude := e.claude, ex.no := e.no, ex.chat := Page = "chat", ex.time := "", ex.words := ReplyWords(e.claude), ex.old := true
    ex.links := e.HasOwnProp("links") ? e.links : []
    GiveTimes(ex)
    LayOutExchange(ex), MarkAllSeen(ex)
    return ex
}

; Puts older exchanges (earlier, oldest first) above the history, keeping the newest HISTORY_KEEP
; of them all. Scrolled back, the box keeps showing the same lines.
AddEarlier(earlier) {
    global History
    Critical
    before := View.spans.Length
    for ex in History
        earlier.Push(ex)
    while (earlier.Length > HISTORY_KEEP)
        earlier.RemoveAt(1)
    History := earlier
    Place()
    if View.scrolled
        View.topLine += View.spans.Length - before
    Critical "Off"
    Kick()
}

; You've scrolled back to the oldest thing the box has, and there's more of the conversation before
; it: Claude's window only keeps the part of a long conversation near where it's scrolled to, so it
; has Claude's list of messages scroll up a little at a time for a moment, gathering the older
; messages by their numbers as they load (going on from where it got to last time), then scrolls it
; back to where it was (the bottom, usually). The older exchanges go above the history, a few at a
; time and never skipping any. Reading Claude's window waits meanwhile. It goes a step at a time, each
; on a timer of its own (see OlderStep, OlderRead, OlderBack), with nothing waiting in between: it used
; to wait for Claude's list right here, step after step, up to three seconds all told, and meanwhile
; the box couldn't keep step with the screen (only FrameTick's frames came, about 32 a second), just
; as you scrolled. (So it's done once LoadingEarlier is false again, not when LoadOlder returns.)
LoadOlder() {
    global LoadingEarlier
    static reached := Map()   ; (how far up each conversation it's got, see OlderRead)
    key := ConvKey, first := History.Length ? History[1] : Current
    if (LoadingEarlier || key = "" || !first.HasOwnProp("no") || first.no <= 1 || !LastHwnd || Cleared.Has(key) && Cleared[key].floor)
        return
    if !((chat := ChatList(LastHwnd)) && (scroller := GetPattern(chat, 10004, "{88f4d42a-e881-459d-a77c-73bbbb7e02dc}")))   ; ScrollPattern
        return
    LoadingEarlier := true
    ; What it's doing, carried from step to step: where Claude's list was (was) and where it's got to
    ; (at), how far up it goes each step (step), how many steps it's taken (round) and how many tries
    ; at going back (back), the messages gathered by number (byNo) and the exchanges they make (older).
    job := {key: key, first: first, chat: chat, scroller: scroller, reached: reached, byNo: Map(), older: [], was: 100.0, at: 0, step: 0, round: 0, back: 0}
    global OlderJob := job   ; (so captions closing meanwhile can put Claude's list back, see GoAway)
    try {
        ComCall(6, scroller, "double*", &was := 100.0)    ; CurrentVerticalScrollPercent
        job.was := was
        ComCall(8, scroller, "double*", &viewSize := 0.0)   ; CurrentVerticalViewSize (how much shows, in percent)
        job.at := Min(was, reached.Has(key) ? reached[key] : was), job.step := Max(0.3, viewSize * 0.9)   ; (every message shows at some step: they're gathered by number)
    } catch
        return OlderBack(job)
    OlderStep(job)
}

; A step of LoadOlder's (job): Claude's list of messages scrolled up a little (the first time, left
; where it is, unless it got further up last time), and what's loaded there read a moment later, once
; it's had time to load (see OlderRead). The first time without scrolling, it's read straight away.
OlderStep(job) {
    if (++job.round > 1 || job.at != job.was) {   ; (first, what's loaded where it is)
        if (job.round > 1)
            job.at := Max(0, job.at - job.step)
        try ComCall(4, job.scroller, "double", -1, "double", job.at)   ; SetScrollPercent (UIA_ScrollPatternNoScroll sideways)
        catch
            return OlderBack(job)
        return SetTimer(OlderRead.Bind(job), -80)
    }
    OlderRead(job)
}

; What's loaded in Claude's list of messages, read for LoadOlder (job): its messages gathered by
; number, and the exchanges before the oldest one the box has put together from them. Once there are
; enough (or it's at the top, or it's taken 25 steps), how far up it got is kept for next time, and
; Claude's list goes back where it was (see OlderBack); otherwise it goes up another step.
OlderRead(job) {
    try {
        ReadBack(job.chat, {you: "", parts: [], newest: "", prevYou: "", streaming: false, done: false, work: "", byNo: job.byNo})
        job.older := ExchangesBefore(job.byNo, job.first.no, 8)
    } catch
        return OlderBack(job)
    if (job.older.Length >= 8 || job.at <= 0 || job.round >= 25) {
        job.reached[job.key] := job.at
        return OlderBack(job)
    }
    OlderStep(job)
}

; Claude's list of messages back where it was before LoadOlder (job). It loads messages as it goes, so
; it can take a few tries to get there: up to 12, each checked a moment later (see OlderBackYet).
OlderBack(job) {
    target := Max(0, Min(100, job.was))
    while (job.back++ < 12) {
        try {
            ComCall(4, job.scroller, "double", -1, "double", target)
            return SetTimer(OlderBackYet.Bind(job), -90)
        }
    }
    OlderLoaded(job)
}

OlderBackYet(job) {
    target := Max(0, Min(100, job.was)), olderThere := false
    try {
        ComCall(6, job.scroller, "double*", &now := 0.0)
        olderThere := target >= 99 ? now >= 99.5 : Abs(now - target) < 0.5
    }
    ; (Only reading where Claude's list is is tried here: putting the older exchanges in place, if it
    ; failed inside the try, was tried again on the next step back, up to 12 times, and could put them
    ; above the history again each time, with nothing noted.)
    if olderThere
        return OlderLoaded(job)
    OlderBack(job)
}

; LoadOlder's done (job): reading Claude's window goes on, and the older exchanges it found go above
; the history, unless the box has gone to another conversation meanwhile.
OlderLoaded(job) {
    global LoadingEarlier, OlderJob
    LoadingEarlier := false, OlderJob := ""
    key := job.key, older := job.older
    if (!older.Length || key != ConvKey)
        return
    earlier := [], from := AfterCleared(key, older, older.Length) + 1   ; (not what you cleared from the box, see ClearChat)
    loop older.Length - from + 1
        earlier.Push(LoadedExchange(older[from + A_Index - 1]))
    if earlier.Length
        AddEarlier(earlier)
}

; "Clear box", in the heading of the list beside the box (☰): clears the conversation showing from the
; box, to start over as if it were new. What Claude's still answering (or you're still saying) stays; everything before it goes,
; and scrolling back doesn't bring it back, not even after captions restart (Claude's window still
; has it all). A second click within CLEAR_UNDO_MS brings it all back.
ClearChat() {
    global Current, History, ClearUndo
    Critical
    if (ClearUndo && ClearUndo.key = ConvKey && A_TickCount - ClearUndo.at < CLEAR_UNDO_MS) {
        u := ClearUndo, ClearUndo := ""
        if (Current == u.current || !HasConversation())
            Current := u.current, History := u.history
        else {   ; (something new came meanwhile: it stays, with it all above it)
            if (u.current.you != "" || u.current.claude != "")
                u.history.Push(u.current)
            for ex in History
                u.history.Push(ex)
            History := u.history
        }
        if u.was
            Cleared[ConvKey] := u.was
        else
            Cleared.Delete(ConvKey)
        SaveCleared()
        NoteEvent("brought " ConvKey " back into the box")
        View.scrolled := false, Place(), SnapView()
        Critical "Off"
        return ShowNote("It's all back.")
    }
    if (ConvKey = "" || SubStr(ConvKey, -1) = "|" || Current.sample) {
        Critical "Off"
        return
    }
    busy := Current.dim || Current.thinking || Current.claudeStatus != "" || Current.work != ""   ; (still going)
    last := busy ? (History.Length ? History[History.Length] : "") : HasConversation() ? Current : ""
    if !last {
        Critical "Off"
        return ShowNote("There's nothing to clear yet.")
    }
    ClearUndo := {key: ConvKey, current: Current, history: History, was: Cleared.Has(ConvKey) ? Cleared[ConvKey] : "", at: A_TickCount}
    Cleared[ConvKey] := {you: TimeKey(last.you), words: SubStr(ReplyWords(last.claude), 1, 2000), floor: true}
    SaveCleared()
    History := []
    if !busy
        Current := NewExchange()
    shownOn := ShownPage(), Anim.peekCounts.%shownOn% := 0
    NoteEvent("cleared " ConvKey " from the box")
    View.scrolled := false, Place(), SnapView()
    Critical "Off"
    ShowNote("Cleared. It's all still in Claude's window. Click Clear box again to bring it back.")
}

; Whether an exchange (what you said, and Claude's reply) is the one you cleared a conversation (key)
; at (see ClearChat): it's known by your words (see TimeKey), or by Claude's if you didn't say any.
ClearedAt(key, you, claude) {
    if !Cleared.Has(key)
        return false
    c := Cleared[key]
    if (c.you != "")
        return TimeKey(you) == c.you
    return you = "" && (words := ReplyWords(claude)) != "" && NewWords(words, c.words).Length < 4
}

; Where the exchange you cleared a conversation (key) at is in a list of its exchanges read from
; Claude's window, up to the upTo-th (see ClearedAt): its place, or 0. Once it's been found,
; scrolling back doesn't look for anything older (see LoadOlder).
AfterCleared(key, list, upTo) {
    loop upTo {
        i := upTo - A_Index + 1
        if ClearedAt(key, list[i].you, list[i].claude) {
            Cleared[key].floor := true
            return i
        }
    }
    return 0
}

; Where you cleared each conversation from the box, kept in CLEARED_FILE (a line for each: its key,
; then your words there, then Claude's).
SaveCleared() {
    out := ""
    for key, c in Cleared
        out .= key "`t" c.you "`t" c.words "`n"
    try FileDelete(CLEARED_FILE)
    if (out != "")
        try FileAppend(out, CLEARED_FILE, "UTF-8")
}

LoadCleared() {
    try text := FileRead(CLEARED_FILE, "UTF-8")
    catch
        return
    loop parse text, "`n", "`r" {
        f := StrSplit(A_LoopField, "`t")
        if (f.Length >= 3 && f[1] != "")
            Cleared[f[1]] := {you: f[2], words: f[3], floor: false}
    }
}

OldestFirst(list) {
    out := [], i := list.Length
    while (i >= 1)
        out.Push(list[i--])
    return out
}

; The sessions (on the Code page) or chats (on the Chat and Cowork page) in Claude's sidebar, in
; order, as {title, status}. Each has a "More options for ..." button, and its own button is named
; with what it's doing first, like "Running Monitor overlay UI" or "Idle General chat". Also the one
; showing (current), whose title has a rename button, like "General chat, rename chat" (or "...,
; rename session" on the Code page), and so which conversation is showing (convo, like
; "chat|General chat"), or "" if there's no title to go by. (A Cowork session's is named as a Code
; session's is: ReadClaude tells them apart.)
SidebarRows(buttons) {
    titles := [], currentTitle := "", convo := ""
    for button in buttons {
        if StartsWith(button.name, "More options for ")
            titles.Push(SubStr(button.name, 18))
        else if RegExMatch(button.name, "^(.+), rename (\w+)$", &m)
            currentTitle := m[1], convo := (m[2] = "session" ? "code" : "chat") "|" m[1]
    }
    rows := [], seen := Map()
    for button in buttons {
        name := button.name, best := ""
        for title in titles   ; the longest title the name ends with
            if (StrLen(title) > StrLen(best) && (name == title || SubStr(name, -StrLen(title) - 1) == " " title))
                best := title
        if (best = "" || seen.Has(best) || StartsWith(name, "More options for "))
            continue
        if !StartsWith(button.cls, SIDEBAR_ROW)   ; (its class comes along with it, see ElementsUnder)
            continue
        seen[best] := true
        rows.Push({title: best, status: Trim(SubStr(name, 1, StrLen(name) - StrLen(best)))})
    }
    return {rows: rows, current: currentTitle, convo: convo}
}

; Reads the chat from the bottom up, adding the parts of Claude's reply to found.parts (newest
; first), until it reaches your newest message. On the Code page a reply comes in pieces: its
; first paragraphs are a message, and the rest sits after it, between buttons for each step
; Claude took (running a command, reading a file). The status line under a reply that's being
; worked on isn't part of the reply; it's kept as found.work, to show what Claude is doing.
ReadBack(el, found, depth := 0) {
    kids := UIChildren(el)
    if (depth && IsStatusLine(kids)) {
        if (found.work = "")
            found.work := StatusText(kids)
        return
    }
    i := kids.Length
    while (i >= 1 && !found.done) {
        kid := kids.Get(i--)
        if (kid.type = UIA_GROUP && IsMessage(Trim(kid.name))) {
            AddMessage(kid, found)
        } else if (kid.type = UIA_GROUP && Trim(kid.name) = "" && depth < 8) {
            ReadBack(kid.el, found, depth + 1)   ; a wrapper, which might hold messages
        } else {
            piece := []
            CollectParts(kid, piece)
            AddNewestFirst(found.parts, piece)
        }
    }
}

; Each message is a group named like "Message 12" (or "Message 12 of 40" on the Chat page) that
; starts with a hidden "You said: ..." or "Claude responded: ..." label. A reply still being written
; is a group named "Currently streaming message", without a label. A message that isn't yours
; counts as Claude's.
IsMessage(name) => name ~= "^Message \d+" || name == "Currently streaming message"

AddMessage(msg, found) {
    kids := UIChildren(msg.el)
    label := kids.Length ? Trim(kids.Get(1).name) : ""
    if found.HasOwnProp("byNo")   ; gathering messages by their numbers (see LoadOlder)
        return KeepMessage(msg, kids, label, found.byNo)
    if StartsWith(label, "You said: ") {
        said := YourWords(kids, label)
        if found.HasOwnProp("all") {   ; reading the whole conversation (see ReadWholeChat): each of your messages starts an exchange
            no := RegExMatch(msg.name, "^Message (\d+)", &m) ? Integer(m[1]) : 0   ; (its number in the conversation)
            found.all.Push({you: said, parts: found.parts, no: no}), found.parts := []
            found.done := found.all.Length >= found.most
            return
        }
        if (found.newest = "")   ; your newest message: on to the reply before it
            found.you := said, found.newest := found.parts, found.parts := []
        else
            found.prevYou := said, found.done := true
        return
    }
    if (Trim(msg.name) == "Currently streaming message")
        found.streaming := true
    AddNewestFirst(found.parts, ClaudesParts(kids))
}

; Adds the parts of Claude's reply in one element to out, in order: runs of text (with where they
; sit on screen, and whether they're code), list items, headings, and breaks where Claude took a
; step. A list item's name holds all its text; its bold words are also pieces inside it, so
; those are left alone. Messages' own buttons (Copy and so on) and the list of files changed at
; the end of a turn aren't part of the reply.
CollectParts(kid, out, depth := 0) {
    name := Trim(kid.name)
    switch kid.type {
        case UIA_BUTTON:
            ; Claude's steps (reading a file, running a command) are buttons of their own kind; the
            ; one it's still taking is named "running ...". Other buttons just split the reply.
            if InStr(kid.cls, "group/tool")
                out.Push({type: "step", text: RegExReplace(name, "^running "), running: StartsWith(name, "running ")})
            else
                out.Push({type: "break"})
        case UIA_TOOLBAR:
            return
        case UIA_LISTITEM:
            if (name != "")
                out.Push({type: "item", text: name})
        case UIA_TEXT, UIA_HYPERLINK:
            if (kid.type = UIA_HYPERLINK && (url := LinkUrl(kid.el)) != "")   ; a link to a web page, for the row of links
                out.Push({type: "link", text: name, url: url})
            kind := kid.kind
            if (kind = "heading") {
                if !(StartsWith(name, "You said: ") || StartsWith(name, "Claude responded: "))
                    out.Push({type: "heading", text: name})
            } else if (name != "") {
                if !(StartsWith(name, "Use the up and down arrow keys") || IsWhenLabel(name) || IsPassingStatus(name))
                    out.Push(TextRun(kid, kid.name, kind = "code"))
            } else if (kid.name != "") {
                out.Push({type: "space"})   ; a space on its own, like between the words of a reply read out in voice mode
            } else {
                text := ""   ; text made of smaller pieces, like code
                for piece in TextPieces(kid.el)
                    text .= piece
                if (Trim(text) != "")
                    out.Push(TextRun(kid, text, kind = "code"))
            }
        default:
            if (depth > 8 || kid.type = UIA_LIST && kid.cls != "")
                return
            ; What Claude's window says again, hidden, for screen readers (like "Compacted session ·
            ; saved 360.4k tokens", once shown and once said): only the one shown counts.
            if (kid.type = 50017 && InStr(kid.cls, "sr-only"))   ; UIA_StatusBarControlTypeId
                return
            kids := UIChildren(kid.el)
            if IsStatusLine(kids)
                return
            loop kids.Length
                CollectParts(kids.Get(A_Index), out, depth + 1)
    }
}

; Where a link goes, if it's a web page (its address, from the link's value), or "".
LinkUrl(el) {
    try {
        if !(pattern := GetPattern(el, 10002, "{a94cd8b1-0844-4cd6-9d2d-640537ab39e9}"))   ; ValuePattern
            return ""
        ComCall(4, pattern, "ptr*", &bstr := 0)   ; CurrentValue
        url := bstr ? StrGet(bstr, "UTF-16") : ""
        DllCall("OleAut32\SysFreeString", "ptr", bstr)
        return url ~= "i)^https?://[^\s`"<>]+$" ? url : ""
    }
    return ""
}

; Words Claude's window shows for a moment where a reply is about to go, like "Sending…",
; "Waiting for Claude…" and "Thinking…". They aren't part of the reply (the status line under it
; says what Claude is doing), so they don't count as new words either.
IsPassingStatus(text) => Trim(text) ~= "^[\w' ]{1,32}(…|\.\.\.)$"

TextRun(kid, text, code) => {type: "run", text: text, code: code, top: kid.top, bottom: kid.bottom}

AddNewestFirst(list, piece) {
    i := piece.Length
    while (i >= 1)
        list.Push(piece[i--])
}

; Writes the reply's parts down as lines: one per paragraph, list item, heading or code block. A
; paragraph with code or bold words in it comes in several runs, on the same line as each other
; in Claude's window or just below; a bigger gap, or a step Claude took, starts a new paragraph.
; While Claude reads a reply out loud in voice mode, every word is a run of its own, and so is
; every space between them.
PartsToMarkup(parts) {
    block := {lines: [], text: "", codeOnly: true}, bottom := 0
    gap := 6 * A_ScreenDPI / 96
    for part in parts {
        if (part.type = "link") {   ; (the links go in their own row; their words are runs too)
            continue
        } else if (part.type = "space") {
            if (block.text != "" && SubStr(block.text, -1) != " ")
                block.text .= " "
        } else if (part.type = "run") {
            if (block.text != "" && part.top > bottom + gap)
                EndBlock(block)
            block.text .= part.code ? TICK Trim(part.text) TICK : part.text
            block.codeOnly := block.codeOnly && part.code
            bottom := part.bottom
        } else {
            EndBlock(block)
            if (part.type = "item")
                block.lines.Push(BULLET part.text)
            else if (part.type = "heading")
                block.lines.Push(HEADING part.text)
            else if (part.type = "step")
                block.lines.Push((part.running ? STEP_RUNNING : STEP) part.text)
        }
    }
    EndBlock(block)
    text := ""
    for i, line in block.lines
        text .= (i > 1 ? "`n" : "") line
    return text
}

; A paragraph that's nothing but code is a code block.
EndBlock(block) {
    text := Trim(RegExReplace(block.text, "\s+", " "))
    if (text != "")
        block.lines.Push(block.codeOnly ? CODE_BLOCK StrReplace(text, TICK) : text)
    block.text := "", block.codeOnly := true
}

; The line under a reply that's being worked on, like "6m 5s · 6.0k tokens · Running tools…".
IsStatusLine(kids) {
    loop Min(3, kids.Length) {
        kid := kids.Get(A_Index)
        if (kid.type = UIA_TEXT && Trim(kid.name) ~= "^((\d+h )?(\d+m )?\d+s|[\d.,]+k? tokens)$")
            return true
    }
    return false
}

; The status line as one piece of text, like "2m 5s · 1.3k tokens · Thinking…".
StatusText(kids) {
    text := ""
    loop kids.Length {
        name := Trim(kids.Get(A_Index).name)
        if (name != "")
            text .= (text = "" ? "" : " ") name
    }
    return text
}

; The text inside an element, in pieces, each with its own spacing.
TextPieces(el) {
    pieces := []
    for item in ElementsUnder(el, UIA_TEXT)
        if (item.name != "")
            pieces.Push(ElementName(item.el))
    return pieces
}

; An element's name as it is, spaces at the ends included.
ElementName(el) {
    ComCall(23, el, "ptr*", &bstr := 0)   ; CurrentName
    name := bstr ? StrGet(bstr, "UTF-16") : ""
    DllCall("OleAut32\SysFreeString", "ptr", bstr)
    return RegExReplace(name, "\s+", " ")
}

; The children of a UI element, looked at one at a time as they're needed, since only the newest
; few of a long chat get looked at. What each one is comes along with the list, in one go: asking
; Claude's window about each child separately is slow, and a reply read out in voice mode has a
; child for every word.
class UIChildren {
    __New(el) {
        static all := 0, cache := 0
        if !all {
            ComCall(21, UIA, "ptr*", &all)     ; CreateTrueCondition, kept for good
            ComCall(20, UIA, "ptr*", &cache)   ; CreateCacheRequest, kept for good
            for id in [30003, 30004, 30005, 30012, 30001]   ; control type, kind, name, class, bounding rectangle
                ComCall(3, cache, "int", id)   ; AddProperty
        }
        ComCall(8, el, "int", 2, "ptr", all, "ptr", cache, "ptr*", &p := 0)   ; FindAllBuildCache(children)
        this.list := ComPtr(p)
        ComCall(3, this.list, "int*", &n := 0)   ; Length
        this.Length := n
    }
    ; The i-th child, counting from 1, as {el, type, name, kind, cls, top, bottom}: its control
    ; type, its name (spaces at the ends included), what kind of text it is in Claude's words
    ; ("heading", "code", "text" and so on), its class, and the top and bottom of it on screen.
    Get(i) {
        static rect := Buffer(16, 0)
        ComCall(4, this.list, "int", i - 1, "ptr*", &p := 0)   ; GetElement
        el := ComPtr(p)
        ComCall(53, el, "int*", &ctype := 0)   ; CachedControlType
        ComCall(75, el, "ptr", rect)           ; CachedBoundingRectangle
        ; (CachedString, in claude-voice-on-off-send.ahk: one of its properties that's text, as read
        ; along with it: method 54 for its kind, 55 for its name, 62 for its class)
        return {el: el, type: ctype, name: RegExReplace(CachedString(el, 55), "\s+", " "), kind: CachedString(el, 54),
            cls: CachedString(el, 62), top: NumGet(rect, 4, "int"), bottom: NumGet(rect, 12, "int")}
    }
}

; ---- Laying out the words ----------------------------------------------------------

; Lays out an exchange: a label and words for each part there is (a note, what you said, Claude's
; reply), with room between them. On the Chat page, what you said goes on the right (see
; LayOutRight). Words that were already there keep fading in from when they first came; new ones
; take turns, spread over spreadMs.
LayOutExchange(ex, spreadMs := 0, paced := false) {
    before := Map()
    for part in ex.parts
        before[part.key] := part.tokens
    parts := [], y := 0
    for spec in [["note", "CAPTIONS", "claude", ex.note, false], ["you", "YOU", "you", ex.you, false],
            ["claude", "CLAUDE", "claude", ex.claude, true]] {
        ; Claude thinking, before its first words: just its name, with the line at the end saying so.
        if (spec[4] = "" && !(spec[1] = "claude" && (ex.thinking || ex.work != "")))
            continue
        if parts.Length
            y += Look.gap
        tokens := Tokenize(spec[4], spec[5])
        right := ex.chat && spec[1] = "you"
        laid := right ? LayOutRight(tokens)
            : ex.chat && Settings.Bubbles && spec[1] = "claude" ? LayOutLeft(tokens) : {h: LayOutTokens(tokens), bubble: ""}
        KeepFading(before.Has(spec[1]) ? before[spec[1]] : [], tokens, spreadMs, ex, paced && spec[1] = "claude")
        parts.Push({key: spec[1], label: spec[2], color: spec[3], y: y, textY: y + Look.labelH + Look.labelGap,
            tokens: tokens, align: right ? "right" : "", bubble: laid.bubble})
        y += Look.labelH + Look.labelGap + laid.h
    }
    ; At the end of Claude's newest reply, one line with Claude's spark and what Claude is doing, or
    ; that it's finished (see DrawWork).
    if (!ex.old && (ex.claude != "" || ex.thinking || ex.work != "")) {
        y += Look.labelGap * 2
        parts.Push({key: "work", y: y, textY: y, tokens: [], line: FitWidth(ex.work, Look.smallFont, Look.inner - Look.workIndent)})
        y += Look.smallH
    }
    ; What you said while Claude was still busy, waiting its turn at the bottom (see ShowExchange).
    if (ex.queued != "") {
        y += Look.gap
        tokens := Tokenize(ex.queued, false)
        laid := ex.chat ? LayOutRight(tokens) : {h: LayOutTokens(tokens), bubble: ""}
        KeepFading(before.Has("queued") ? before["queued"] : [], tokens, spreadMs, ex)
        parts.Push({key: "queued", label: "YOU", color: "you", y: y, textY: y + Look.labelH + Look.labelGap,
            tokens: tokens, align: ex.chat ? "right" : "", bubble: laid.bubble})
        y += Look.labelH + Look.labelGap + laid.h
    }
    ; Where the live view of this exchange can start cleanly: at a label, a paragraph or a list item
    ; (stops), failing that at a line of words (lineStops), and failing that at any line at all
    ; (anyStops). It never starts at one of Claude's steps if it can help it, so steps only show
    ; below the words they come after. spans holds every line's top and bottom, so scrolling back
    ; can move a whole line at a time.
    stops := [], lineStops := [], anyStops := [], spans := []
    for part in parts {
        stops.Push(part.y), lineStops.Push(part.y), anyStops.Push(part.y)
        spans.Push({top: part.y, bottom: part.y + (part.key = "work" ? Look.smallH : Look.labelH)})
        block := "", lineY := ""
        for t in part.tokens {
            ty := part.textY + t.y
            if (t.block != block && !IsStepKind(t.kind))
                stops.Push(ty)
            if (ty != lineY) {
                if !IsStepKind(t.kind)
                    lineStops.Push(ty)
                anyStops.Push(ty), spans.Push({top: ty, bottom: ty + Look.lineH}), lineY := ty
            }
            block := t.block
        }
    }
    ex.parts := parts, ex.height := y, ex.stops := stops, ex.lineStops := lineStops, ex.anyStops := anyStops, ex.spans := spans
    UpdateUnseen(ex)
}

; Claude's reply in an exchange (its part), or "" if there isn't one yet.
ReplyPart(ex) {
    for part in ex.parts
        if (part.key = "claude")
            return part
    return ""
}

; Where the first of an exchange's reply words that you haven't seen is: the top of its paragraph,
; from the top of the exchange (unseenAt), or "" once you've seen them all. Steps don't count.
UpdateUnseen(ex) {
    at := ""
    if (part := ReplyPart(ex)) {
        for i, t in part.tokens {
            if (t.seen || IsStepKind(t.kind))
                continue
            while (i > 1 && part.tokens[i - 1].block = t.block)   ; back to where its paragraph starts
                i--
            at := part.textY + part.tokens[i].y
            break
        }
    }
    ex.unseenAt := at
}

; The paragraphs of Claude's reply (part) marked NEW now: each with words you haven't seen, and each
; you've just finished reading, fading away over 900 ms (see CheckSeen). Each is {y: its top, from
; the top of the reply's words, a: how visible}.
NewParagraphs(ex, part, now) {
    tops := Map(), order := [], unseen := Map(), marks := []
    for t in part.tokens {
        if !tops.Has(t.block)
            tops[t.block] := t.y, order.Push(t.block)
        if (!t.seen && !IsStepKind(t.kind))
            unseen[t.block] := true
    }
    for block in order {
        a := unseen.Has(block) ? 1 : ex.readAt.Has(block) ? 1 - (now - ex.readAt[block]) / 900 : 0
        if (a > 0)
            marks.Push({y: tops[block], a: a})
    }
    return marks
}

; Whether you've seen all of a paragraph (block) of Claude's reply (part). Steps don't count.
BlockRead(part, block) {
    for t in part.tokens
        if (t.block = block && !t.seen && !IsStepKind(t.kind))
            return false
    return true
}

; Counts all of an exchange's reply as seen (it was already there when it showed up).
MarkAllSeen(ex) {
    if !(part := ReplyPart(ex))
        return
    for t in part.tokens
        t.seen := true
    ex.unseenAt := "", ex.sounded := part.tokens.Length   ; (and makes no typing sounds)
}

; Every 200 ms while the box shows: Claude's words that have been in view (most of their line) for
; SEEN_MS count as seen, scrolling past them included. Each word keeps it (seen), so it stays with
; the word as the reply changes shape. Words that showed up while the box was away, or flew by
; faster than that, haven't been seen, and the arrow at the top points up to them (see MoreAbove).
CheckSeen() {
    if !(Anim.shown && Anim.target && Anim.p >= 1)
        return
    now := A_TickCount, top := View.bottom - View.h, bottom := View.bottom, lineH := Look.lineH, any := false
    loop History.Length + 1 {
        ex := A_Index <= History.Length ? History[A_Index] : Current
        part := ReplyPart(ex), showing := Map(), changed := false
        if (part && ex.y + part.textY < bottom && ex.y + ex.height > top) {
            i := FirstVisible(part.tokens, top - ex.y - part.textY - lineH)
            while (i <= part.tokens.Length) {
                t := part.tokens[i++], ty := ex.y + part.textY + t.y
                if (ty + lineH * 0.4 > bottom)   ; (most of its line is below the box)
                    break
                if (!t.seen && ty + lineH * 0.6 >= top && now >= t.born + Look.motion.fade)
                    showing[t] := true
            }
        }
        read := Map()   ; (the paragraphs with words just seen)
        for t in showing {
            if !ex.since.Has(t)
                ex.since[t] := now
            else if (now - ex.since[t] >= SEEN_MS) {
                t.seen := true, changed := true
                if !IsStepKind(t.kind)   ; (steps are never NEW)
                    read[t.block] := true
            }
        }
        gone := []
        for t in ex.since
            if (!showing.Has(t) || t.seen)
                gone.Push(t)
        for t in gone
            ex.since.Delete(t)
        if changed {
            for block in read   ; a paragraph read all through, in whatever order: its NEW line fades away
                if BlockRead(part, block)
                    ex.readAt[block] := Anim.lineGoneAt := now
            UpdateUnseen(ex), any := true
        }
    }
    ; Once you've seen everything the box has for the page it's showing, that page's count of new
    ; messages (on its tab, and Claude's logo) goes.
    shownOn := ShownPage()
    if (Anim.peekCounts.%shownOn% && AllSeen()) {
        NoteEvent(Format("read everything on {}: its count of {} goes", shownOn, Anim.peekCounts.%shownOn%))
        Anim.peekCounts.%shownOn% := 0, any := true
    }
    if any
        Kick()
}

; The page of the conversation the box is showing: "code" or "chat".
ShownPage() => (ConvKey != "" ? StrSplit(ConvKey, "|")[1] : Page) = "chat" ? "chat" : "code"

; Whether you've seen all of Claude's words the box has, in every exchange it has.
AllSeen() {
    loop History.Length + 1
        if ((A_Index <= History.Length ? History[A_Index] : Current).unseenAt != "")
            return false
    return true
}

; The earliest of the stops (top to bottom) from which the rest of something height tall fits in
; room, or "" if even the last doesn't.
FirstFit(stops, height, room) {
    found := "", i := stops.Length
    while (i >= 1 && stops[i] > height)   ; (below what's there yet)
        i--
    while (i >= 1 && height - stops[i] <= room)
        found := stops[i--]
    return found
}

; Text cut short with "…" if it's wider than width.
FitWidth(text, f, width) {
    if (TextWidth(text, f) <= width)
        return text
    while (StrLen(text) > 1 && TextWidth(text "…", f) > width)
        text := SubStr(text, 1, -1)
    return RTrim(text) "…"
}

; Words that match the ones before keep how they appeared, going by their letters and numbers
; alone (key), so a reply drawn again differently (like voice mode's words becoming paragraphs, with
; its commas joining the words before them) doesn't appear all over again. A word or three that
; went are passed over, punctuation on its own goes with the word before it, and after a bigger
; change (like Claude's steps being put together as "Read 3 files") it picks up again where the
; words match up again (see PickUp), with what's new in between just showing. The rest are new:
; what you say takes turns fading in within spreadMs, and Claude's new words (paced) come in at a
; steady pace however quickly they arrived (see PaceWords).
KeepFading(old, tokens, spreadMs, ex, paced := false) {
    same := 0, j := 0, now := A_TickCount
    while (same < tokens.Length && j < old.Length) {
        t := tokens[same + 1], found := 0
        if (t.key = "" && old[j + 1].key != "") {   ; punctuation, now on its own
            same++, t.born := same > 1 ? tokens[same - 1].born : now, t.per := 0, t.seen := same > 1 && tokens[same - 1].seen
            continue
        }
        loop Min(4, old.Length - j)   ; this word, a little further on in the old ones (some went)
            if (old[j + A_Index].key == t.key) {
                found := j + A_Index
                break
            }
        if found {
            same++, j := found, t.born := old[found].born, t.per := old[found].per, t.seen := old[found].seen
            continue
        }
        if !(spot := PickUp(old, j, tokens, same))
            break
        while (same < spot.i - 1)   ; what's new in between
            t := tokens[++same], t.born := now, t.per := 0
        j := spot.j - 1
    }
    fresh := tokens.Length - same
    if !fresh
        return
    if (paced && ReadingAlong()) {   ; read out loud: they show up as they're read (see ReadFollow)
        loop fresh
            tokens[same + A_Index].born := HELD, tokens[same + A_Index].per := 0
        ex.revealEnd := Max(ex.revealEnd, now + 3600000)
        return
    }
    if (paced && Settings.Animate) {
        list := []
        loop fresh
            list.Push(tokens[same + A_Index])
        return PaceWords(list, ex, same ? tokens[same] : "")
    }
    step := Min(Look.motion.step, spreadMs / fresh)
    next := same ? Max(now, tokens[same].born + step) : now
    loop fresh
        tokens[same + A_Index].born := next + (A_Index - 1) * step, tokens[same + A_Index].per := 0
    ex.fadeUntil := Max(ex.fadeUntil, tokens[tokens.Length].born + Look.motion.fade)
}

WordKey(text) => RegExReplace(text, "[^\p{L}\p{N}]")

; Where the words pick up again after a change (see KeepFading): the first place a little further
; on, in both the new words (after the first same) and the old ones (after the first j), where
; three words in a row match up. Returns where that is in each ({i, j}), or "" if nowhere near.
PickUp(old, j, tokens, same) {
    loop Min(60, tokens.Length - same - 2) {
        i := same + A_Index, k := tokens[i].key
        if (k = "")
            continue
        loop Min(250, old.Length - j - 2) {
            at := j + A_Index
            if (old[at].key == k && old[at + 1].key == tokens[i + 1].key && old[at + 2].key == tokens[i + 2].key)
                return {i: i, j: at}
        }
    }
    return ""
}

; Claude's new words (list) come in one after another at a steady pace, after the ones still coming
; in (the one just before them is prev): fading in a word at a time, or typed out a letter at a
; time (per: how long each letter takes), as RevealPace says. Like someone talking, they take a
; breath (see Rest): before each new paragraph or list item, after a bullet, and after the end of
; a sentence or a comma, so the typing sounds pause there too. If they fall too far behind,
; everything speeds up alike to catch up.
PaceWords(list, ex, prev := "") {
    pace := RevealPace(), chars := 0, rests := 0, now := A_TickCount, before := prev
    for t in list
        chars += StrLen(t.text) + 1, rests += Rest(t, before, pace), before := t
    at := Max(now, ex.revealEnd)
    quicker := Min(1, Max(300, pace.most - (at - now)) / Max(1, chars * pace.ms + rests))
    ms := pace.ms * quicker, before := prev
    for t in list {
        at += Rest(t, before, pace) * quicker
        t.born := at, t.per := pace.letters && (t.style = "plain" || t.style = "bold" || t.style = "pre") ? ms : 0
        at += (StrLen(t.text) + 1) * ms, before := t
    }
    ex.revealEnd := at
    ex.fadeUntil := Max(ex.fadeUntil, at + Look.motion.fade)
}

; How long Claude's words pause before the word t, after the one before it (in ms): a beat before a
; new paragraph or list item, a short one after its bullet, and after the end of a sentence (or a
; colon) or a comma. Faster text pauses for less.
Rest(t, before, pace) {
    if !before
        return 0
    if (t.block != before.block)
        return 3 * pace.rest
    if (before.style = "bullet" || before.style = "stepdot" || before.style = "rundot")
        return pace.rest
    if (before.text ~= "[.!?…:]$")
        return 2 * pace.rest
    if (before.text ~= "[,;]$")
        return pace.rest
    return 0
}

; How Claude's words come in: typed out a letter at a time (letters) or fading in a word at a time,
; how long each character takes (ms, from the Word speed setting), and how far behind they can fall
; before they speed up (most), and how long a short pause is (rest; see Rest). "Match the sound" goes
; by the typing sounds (see MatchedReveal). In voice mode, words fade in, for the glow.
; What "Match the sound" does with the typing sounds picked: types letters out with the Animal
; Crossing and Undertale sounds (they go with each letter), and fades words in otherwise.
MatchedReveal() => Settings.TypingSound = "Animal Crossing" || Settings.TypingSound = "Undertale" ? "Letter by letter" : "Fade in"

RevealPace() {
    mode := Settings.TextReveal, sound := Settings.TypingSound
    if (mode = "Match the sound")
        mode := MatchedReveal()
    letters := mode = "Letter by letter" && !VoiceMode
    t := (Settings.WordSpeed - 1) / 9
    perSecond := letters ? (sound = "Animal Crossing" ? 10 : 13) * 7 ** t : 30 * 9 ** t   ; characters
    ms := 1000 / perSecond
    return {letters: letters, ms: ms, rest: Min(letters ? 160 : 70, 8 * ms), most: letters ? 8000 : 3000}
}

; Splits text into words for laying out. Each word gets a style (plain, bold, code, a code
; block's "pre", or a list item's bullet), whether a space comes before it, and which paragraph
; (block) it's in. Claude's replies are written down with their layout (markup, see TICK above);
; what you said is taken as it is.
Tokenize(text, markup) {
    tokens := []
    for block, line in StrSplit(text, "`n") {
        kind := "p"
        if markup {
            if StartsWith(line, BULLET)
                kind := "li", line := SubStr(line, StrLen(BULLET) + 1)
            else if StartsWith(line, HEADING)
                kind := "h", line := SubStr(line, StrLen(HEADING) + 1)
            else if StartsWith(line, CODE_BLOCK)
                kind := "pre", line := SubStr(line, StrLen(CODE_BLOCK) + 1)
            else if StartsWith(line, STEP)
                kind := "step", line := SubStr(line, StrLen(STEP) + 1)
            else if StartsWith(line, STEP_RUNNING)
                kind := "running", line := SubStr(line, StrLen(STEP_RUNNING) + 1)
        }
        if (kind = "li")
            tokens.Push({text: "•", style: "bullet", space: false, block: block, kind: kind, born: 0, per: 0, key: "", seen: false})
        else if IsStepKind(kind)   ; a small dot, which breathes while the step is still going
            tokens.Push({text: "", style: kind = "step" ? "stepdot" : "rundot", space: false, block: block, kind: kind, born: 0, per: 0, key: "", seen: false})
        spaced := false, first := true
        for i, segment in ((markup && kind != "pre") ? StrSplit(line, TICK) : [line]) {
            style := kind = "pre" ? "pre" : IsStepKind(kind) ? "step" : Mod(i, 2) = 0 ? "code" : kind = "h" ? "bold" : "plain"
            for j, word in StrSplit(segment, " ") {
                if (j > 1)
                    spaced := true
                if (word = "")
                    continue
                tokens.Push({text: word, style: style, space: spaced && !first, block: block, kind: kind, born: 0, per: 0, key: WordKey(word), seen: false})
                spaced := false, first := false
            }
        }
    }
    return tokens
}

IsStepKind(kind) => kind = "step" || kind = "running"

; Works out where each word goes (x, and y from the top of the text), wrapping lines to fit the
; box (or width). Words stuck together (like code and the comma after it) stay on one line. List items hang
; after their bullet (and steps after their dot), and paragraphs get a little room between them,
; except steps in a row, which stay close together. Returns how tall it is.
LayOutTokens(tokens, width := 0) {
    width := width || Look.inner
    y := 0, x := 0, block := 0, kind := "", indent := 0, lineH := Look.lineH, n := tokens.Length, i := 1
    while (i <= n) {
        t := tokens[i]
        if (t.block != block) {
            if block
                y += lineH + (IsStepKind(t.kind) && IsStepKind(kind) ? 0 : Look.paraGap)
            block := t.block, kind := t.kind
            marker := t.style = "bullet" || t.style = "stepdot" || t.style = "rundot"
            indent := marker ? Look.indent : 0, x := indent
            if marker {
                t.x := Look.bulletX, t.y := y, t.w := 0
                i++
                continue
            }
        }
        j := i, w := t.w := TokenWidth(t)
        while (j < n && !tokens[j + 1].space && tokens[j + 1].block = block)
            j++, w += tokens[j].w := TokenWidth(tokens[j])
        gapW := (x > indent && t.space) ? Look.space : 0
        if (x > indent && x + gapW + w > width)
            y += lineH, x := indent, gapW := 0
        x += gapW
        loop j - i + 1 {
            tk := tokens[i + A_Index - 1]
            tk.x := x, tk.y := y
            x += tk.w
        }
        i := j + 1
    }
    return n ? y + lineH : 0
}

; Lays out what you said on the right, as on the Chat page: each line ends at the right edge. With
; Bubbles on, it sits in a bubble there instead, its lines starting together inside it. Returns how
; tall it is (h) and the bubble, if there is one (its x and width, from the left of the text, and
; its height).
LayOutRight(tokens) {
    padX := Settings.Bubbles ? Look.bubblePadX : 0, padY := Settings.Bubbles ? Look.bubblePadY : 0
    h := LayOutTokens(tokens, Round(Look.inner * (Settings.Bubbles ? 0.8 : 0.85)) - 2 * padX)
    lineW := Map(), widest := 0   ; how wide each line is (a line's words share its y), and the widest
    for t in tokens
        lineW[t.y] := Max(lineW.Has(t.y) ? lineW[t.y] : 0, t.x + t.w), widest := Max(widest, t.x + t.w)
    boxW := widest + 2 * padX
    for t in tokens
        t.x += Settings.Bubbles ? Look.inner - boxW + padX : Look.inner - lineW[t.y], t.y += padY
    bubble := Settings.Bubbles && tokens.Length ? {x: Look.inner - boxW, w: boxW, h: h + 2 * padY} : ""
    return {h: h + 2 * padY, bubble: bubble}
}

; Lays out Claude's reply on the Chat page with Bubbles on: in a bubble on the left, across from
; yours, like a text message. Returns the same as LayOutRight.
LayOutLeft(tokens) {
    padX := Look.bubblePadX, padY := Look.bubblePadY
    h := LayOutTokens(tokens, Round(Look.inner * 0.85) - 2 * padX), widest := 0
    for t in tokens
        widest := Max(widest, t.x + t.w)
    for t in tokens
        t.x += padX, t.y += padY
    return {h: h + 2 * padY, bubble: tokens.Length ? {x: 0, w: widest + 2 * padX, h: h + 2 * padY} : ""}
}

TokenWidth(t) => TextWidth(t.text, FontOf(t.style)) + (t.style = "code" ? 2 * Look.codePad : 0)
FontOf(style) => (style = "code" || style = "pre") ? Look.codeFont : style = "bold" ? Look.boldFont
    : style = "step" ? Look.smallFont : Look.font

; Works out where each exchange sits, top to bottom, and where every line in the conversation is
; (View.spans). Scrolled back, the box keeps its place by line (View.topLine), so what you're
; looking at stays put as things change below it.
; The history's lines are only worked out again when the history has changed. While Claude writes,
; each read changes just the exchange showing, and going through every line of up to HISTORY_KEEP
; exchanges again each time held the box's frames up. So they're kept (kept.spans), with what they
; were worked out from: each exchange's own lines (its spans, a new list each time it's laid out)
; and where it sat. If any of that's different (an exchange added, loaded, laid out again, or moved),
; they're all worked out again, as before. The exchange showing's lines are, every time.
Place() {
    static kept := {from: [], at: [], spans: []}
    list := History, was := kept, same := was.from.Length = list.Length, y := 0
    for ex in list {
        ex.y := y
        if (same && (was.from[A_Index] !== ex.spans || was.at[A_Index] != y))
            same := false
        y += ex.height + Look.exGap
    }
    if !same {
        from := [], at := [], spans := []
        for ex in list {
            lines := ex.spans, top := ex.y
            from.Push(lines), at.Push(top)
            for s in lines
                spans.Push({top: top + s.top, bottom: top + s.bottom})
        }
        kept := was := {from: from, at: at, spans: spans}
    }
    Current.y := y
    spans := was.spans.Clone()   ; (a list of its own: the kept one stays as it is)
    for s in Current.spans
        spans.Push({top: y + s.top, bottom: y + s.bottom})
    View.total := Current.height ? y + Current.height : Max(0, y - Look.exGap)
    View.spans := spans
}

; Where the box is headed. Live, it shows the exchange happening now; if that's taller than the
; box, it shows its newest whole sections (labels, paragraphs, list items) that fit, sized to
; them, so no cut-off lines hang at the top. Only a paragraph taller than the whole box starts
; partway, at a line. While Claude reads the reply out loud, it keeps the words Claude is saying
; in view (see ReadingView). Scrolled back, it shows whole lines from View.topLine down, as many
; as fit. While you resize it, it's at its full height, so you can see the size you're making.
ViewTarget() {
    most := Settings.Lines * Look.lineH
    if Drag.resizing
        return {h: most, bottom: View.total}
    if View.scrolled {
        spans := View.spans, n := spans.Length
        if !n
            return {h: 0, bottom: 0}
        i := Max(1, Min(View.topLine, n)), j := i
        if (Drag.mode = "scroll")
            return {h: Drag.fixedH, bottom: spans[i].top + Drag.fixedH}
        while (j < n && spans[j + 1].bottom - spans[i].top <= most)
            j++
        return {h: spans[j].bottom - spans[i].top, bottom: spans[j].bottom}
    }
    pending := PendingHeight(), h := Current.height - pending
    if (h > most) {
        start := FirstFit(Current.stops, h, most)
        if (start = "")
            start := FirstFit(Current.lineStops, h, most)
        if (start = "")
            start := FirstFit(Current.anyStops, h, most)
        if (Voice.on && (spot := SpokenSpot()) && spot.y < (start = "" ? h - most : start))
            return ReadingView(spot, most)
        h := start = "" ? most : h - start
    }
    return {h: h, bottom: View.total - pending}
}

; How much of the bottom of the exchange showing isn't there yet: the lines of Claude's reply still
; to come in (see PaceWords). The box grows as they come, rather than opening up empty lines first.
PendingHeight() {
    now := A_TickCount
    if (View.scrolled || Current.revealEnd <= now || !(part := ClaudePart()))
        return 0
    tokens := part.tokens, i := tokens.Length
    while (i >= 1 && tokens[i].born > now)
        i--
    if (i = tokens.Length)
        return 0
    cut := i ? part.textY + tokens[i].y + Look.lineH : part.textY   ; under the last line with anything on it yet
    return Max(0, Current.height - cut)
}

; What the box shows while Claude reads the reply out loud and the words it's saying (at spot) are
; above the reply's newest sections, since the reply showed up faster than Claude says it: the
; paragraph Claude is saying (or, if that's too tall, from the line it's on) and what comes after,
; in as many whole lines as fit. It moves on a section at a time as Claude talks.
ReadingView(spot, most) {
    top := spot.y, bottom := spot.y + Look.lineH
    for stop in Current.stops
        if (stop <= spot.y && bottom - stop <= most)
            top := stop   ; the last one before the words is where their paragraph starts
    for span in Current.spans
        if (span.bottom > bottom && span.bottom - top <= most)
            bottom := span.bottom
    return {h: bottom - top, bottom: Current.y + bottom}
}

SnapView() {
    t := ViewTarget()
    View.h := t.h, View.bottom := t.bottom
}

; How far a word has faded in, from 0 to 1: quickly at first, then settling.
WordShown(born, now) {
    fade := Look.motion.fade
    if (!Settings.Animate || now >= born + fade)
        return 1
    if (now <= born)
        return 0
    return 1 - (1 - (now - born) / fade) ** 3
}

; How things move at the chosen word speed, in ms: how long a new word takes to fade in, the most
; time between one new word and the next, and how quickly the box grows and scrolls (lower is
; faster). Speed 1 is the slowest and 10 the fastest, each step a little quicker than the last.
Motion() {
    t := (Settings.WordSpeed - 1) / 9
    return {fade: 600 * (80 / 600) ** t, step: 60 * (8 / 60) ** t, ease: 120 * (40 / 120) ** t}
}

; ---- Showing and hiding -----------------------------------------------------------

; The box shows when there's something to show and it's recent, or someone is talking or Claude is
; working, or you're pointing at it (or its list, even with no conversation to show, like on a new
; chat), scrolled back or typing in it, or a page is open under it, or the settings are open, or
; there's a note; but not while you've tucked it away (the settings go too). Voice mode keeps it up
; the whole time it's on, rather than it going away and coming back between replies
; (claude-hey-claude.ahk ends voice mode once it's been quiet a few seconds).
UpdateVisibility() {
    global Opened
    ; Hide after counts from once Claude's words have all come in on the box, not from when they
    ; arrived: a long message still coming in word by word keeps it up, and it goes that long after
    ; its last word. (Words held for Claude's voice, far ahead, don't count: see PaceWords.)
    reveal := Current.revealEnd <= A_TickCount + 60000 ? Current.revealEnd : 0
    recent := !Settings.HideAfter || A_TickCount - Max(LastChange, reveal) < Settings.HideAfter * 1000
    ; (and a Code session still working on its reply, on the Code page: between its messages, while it
    ; uses its tools, the box stays up, and Hide after only starts once it has finished, see
    ; WatchCodeSessions)
    busy := Shown.live || Shown.streaming || Shown.thinking || Shown.work != "" || Listening || Reader.speaking || VoiceMode
        || Page = "code" && Anim.codeWorking
    show := !Hidden && !Minimized && (Handed || SettingsGui || Current.note != "" || Waiting || View.scrolled || Anim.panelTarget || Composing
        || Browser.hwnd && !Browser.tucked && !Browser.detached || Anim.hoverTarget || (HasConversation() || Opened) && (recent || busy)) ? 1 : 0
    if !show
        Opened := false
    if (show != Anim.target) {
        Anim.tucking := PeekWanted() || Anim.peek > 0   ; it shrinks into the tab at the side (or grows out of it)
        if (show && !Anim.p) {   ; coming back from hidden
            SnapView()
            ReplayWords()
            OnTop()
        }
        Anim.target := show
        Kick()
    }
}

; Puts the box and its tab back on top of other always-on-top windows (a game going full screen can
; put its own window above them), without taking the keyboard.
OnTop() {
    for gui in [BoxGui, PeekGui]
        if gui
            DllCall("SetWindowPos", "ptr", gui.Hwnd, "ptr", -1, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x13)   ; HWND_TOPMOST; SWP_NOSIZE | SWP_NOMOVE | SWP_NOACTIVATE
}

; As the box shows up, Claude's words showing in it that you haven't seen yet flow in one after
; another, top to bottom, all within about the time the box takes to show up. What you've read is
; just there: flowing it all in again read as the box going through the whole reply again.
ReplayWords() {
    t := ViewTarget(), viewTop := t.bottom - t.h, showing := []
    for part in Current.parts
        if (part.key = "claude")
            for tk in part.tokens
                if (!tk.seen && Current.y + part.textY + tk.y >= viewTop - 1)
                    showing.Push(tk)
    if showing.Length
        NoteEvent(Format("the box came back: {} words you haven't seen flow in", showing.Length))
    step := showing.Length ? Min(Look.motion.step, APPEAR_MS * 0.7 / showing.Length) : 0
    next := A_TickCount + APPEAR_MS * 0.2
    for tk in showing
        if (tk.born < HELD)   ; (not words waiting to be read out loud)
            tk.born := next, tk.per := 0, next += step
    Current.fadeUntil := next + Look.motion.fade
}

; While the box is showing: notices when you point at it (which shows its handles and keeps it
; up) and at one of its handles, which then takes clicks. Anywhere else on the box, clicks go
; straight through to what's underneath.
WatchMouse(at := "") {   ; (at: a spot to take the pointer to be at, {x, y}, for trying it out)
    global LastChange
    if Drag.mode
        return   ; mid-drag, the box has the mouse to itself
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    if at
        mx := at.x, my := at.y
    part := Anim.shown ? HitTest(mx - Anim.x, my - Anim.y) : ""
    ; In a game, the pointer on the box only counts while the game shows Windows' own pointer (as in
    ; many games' menus). While it hides it (you're playing, or it draws a pointer of its own), the
    ; hidden pointer drifts about as you turn the camera, over the box too, and parks there: that's
    ; never pointing at it, so the box doesn't light up, take clicks or the wheel, or show a pointer.
    ; (Once the box has the mouse, the pointer showing is its own, so it keeps it till you leave.)
    ; (With the Claude key, the box has it. And a pointer that was on the page under the box a moment
    ; ago, where it shows, is yours, going from the page to the box: the box takes it.) But a game that
    ; holds its hidden pointer still while you play, and lets it follow the mouse only in its menus
    ; (The Last of Us Part I): there, it following the mouse onto the box is you, in a menu, and the
    ; box takes it, as the list beside it does; and it held still while the mouse moves is you playing,
    ; and the box lets go of it, even where the game holds it on the box (see GamePointer).
    inMenu := InGameMenu()
    ignored := GameFront && !Handed && (!Anim.hoverTarget && !PointerShown() && !inMenu || GamePlaying()) && A_TickCount - Anim.pageAt > 1500
    if ignored
        part := ""
    mouseY := part != "" ? my - Anim.y - Look.tabH : ""   ; from the top of the box
    if (mouseY != Anim.mouseY && (mouseY = "" || Anim.mouseY = "" || Abs(mouseY - Anim.mouseY) > 2))
        Anim.mouseY := mouseY, Kick()
    ; In a game, pointing at the box only counts once the pointer has been on it for a moment (quicker
    ; than anyone clicks once they get there), with no mouse button held: a game's hidden pointer drifting over the box while you play (and shoot)
    ; mustn't take the mouse from the game. (In a game's menu, where its pointer is known to be yours,
    ; straight away: waiting, your first click on the box went to the game.)
    static restingSince := 0
    if (GameFront && part != "")
        restingSince := GetKeyState("LButton", "P") || GetKeyState("RButton", "P") || GetKeyState("MButton", "P") ? 0 : restingSince || A_TickCount
    else
        restingSince := 0
    if (GameFront && !Handed && !inMenu && !(restingSince && A_TickCount - restingSince >= 60) && A_TickCount - Anim.pageAt > 1500)
        part := ""
    row := ignored ? 0 : PanelRowAt(mx, my)   ; the list beside the box counts as part of it
    ; In a game, once the box has the pointer, crossing the little gap between it and the list beside it
    ; (or the page under it) doesn't let go of it: letting go there, the game's own pointer flickered
    ; in between them, the box's handles went and came back, and a click on the box straight after went
    ; to the game. (Unless the game's holding the pointer still: you're playing.)
    near := GameFront && !Handed && Anim.hoverTarget && !GamePlaying() && NearOurs(mx, my) != ""
    over := part != "" || !ignored && OverPanel(mx, my) || near ? 1 : 0, hot := part = "box" ? "" : part
    if (row != Anim.panelHot)
        Anim.panelHot := row, Kick()
    ; Clicks go through the box except on its handles. But in a game, which hides the pointer, the
    ; whole box takes the mouse while you point at it, so the pointer shows over all of it (and it keeps
    ; it across the gap beside it, so coming back onto it, the pointer's the box's at once).
    ; (And with a touchpad, too: its two-finger scrolling goes to the window under the pointer, not
    ; through the hook the mouse wheel's shortcuts go by, so the box has to be that window to get it,
    ; see BoxWheel. Letting it through, a laptop's touchpad scrolled what was behind the box instead.)
    through := hot = "" && !(GameFront ? part != "" || over : part != "" && HasTouchpad())
    if (hot != Anim.hot || through != Anim.through) {
        Anim.hot := hot, Anim.through := through
        ClickThrough(through)
        Kick()
    }
    if (over != Anim.hoverTarget) {
        Anim.hoverTarget := over
        static notedMenu := 0
        if (over && inMenu && !PointerShown() && A_TickCount - notedMenu > 60000)
            notedMenu := A_TickCount, NoteEvent("the box took " GamePtr.game "'s own pointer, in its menu")
        if !over {
            LastChange := A_TickCount   ; the box stays a little while after you stop pointing at it
            if View.scrolled
                SetTimer(ToLiveIfAway, -1500)   ; and goes back to what's happening now
        }
        UpdateVisibility()
        Kick()
    }
}

; What's at x, y on the box's window (from its top left, where the tabs are): "cog", "move" (the
; grip at the top), a corner for resizing ("resize-tl", "resize-tr", "resize-bl", "resize-br"),
; "scroll" (the scroll bar along the right), a tab that can be clicked ("tab-menu", "tab-chat" or
; "tab-code"), "mini" (the – that tucks it away), one of the links at the bottom ("link-1" and so
; on), the typing box ("input") or its send button ("send"), "box" (anywhere else on it, the tab
; joined to it included), or "" (not on the box).
HitTest(x, y) {
    w := Look.W, c := Look.cornerSize
    y -= Look.tabH, h := Anim.h - Look.tabH   ; from the top of the box, under the tab
    if (x < 0 || x >= w || y < -Look.tabH || y >= h)
        return ""
    if ((x - Look.cogX) ** 2 + (y - Look.cogY) ** 2 <= (Look.cogR + 2) ** 2)
        return "cog"
    if (Anim.hover > 0.5 && (x - Look.miniX) ** 2 + (y - Look.cogY) ** 2 <= (Look.cogR + 2) ** 2)
        return "mini"
    if (y < 0) {   ; up by the tabs
        for which, slot in Look.slots
            if (x >= slot.left && x < slot.right)
                return which = Page ? "box" : "tab-" which
        return ""
    }
    for i, spot in Anim.linkSpots
        if (x >= spot.left && x < spot.right && y >= spot.top && y < spot.bottom)
            return "link-" i
    if (Settings.TypeBox && (r := Anim.inputRect) && x >= r.left && x < r.right && y >= r.top && y < r.bottom)
        return x >= r.sendX - 4 * Look.s ? "send" : "input"
    if ((x < c || x >= w - c) && (y < c || y >= h - c))
        return "resize-" (y < c ? "t" : "b") (x < c ? "l" : "r")
    if (Abs(x - w / 2) <= Look.gripW / 2 + 6 * Look.s && y < Look.pad + 2 * Look.s)
        return "move"
    if (Anim.bar && x >= w - Look.barZone)
        return "scroll"
    return "box"
}

ClickThrough(on, hwnd := BoxGui.Hwnd) {
    style := DllCall("GetWindowLongPtr", "ptr", hwnd, "int", -20, "ptr")   ; GWL_EXSTYLE
    DllCall("SetWindowLongPtr", "ptr", hwnd, "int", -20, "ptr", on ? style | 0x20 : style & ~0x20)
}

; Whether a spot on screen (x, y) is on, or within a little (margin) of, the box, the list beside it, or
; the page under it: which ("box", "list" or "page"), or "".
NearOurs(x, y, margin := 24) {
    m := Round(margin * Look.s)
    if (Anim.shown && x >= Anim.x - m && x < Anim.x + Look.W + m && y >= Anim.y - m && y < Anim.y + Anim.h + m)
        return "box"
    if (Anim.panel > 0 && x >= Anim.panelX - m && x < Anim.panelX + Look.panelW + m && y >= Anim.panelY - m && y < Anim.panelY + Anim.panelH + m)
        return "list"
    if ((seen := PageSeen()) && !Browser.tucked && x >= seen.x - m && x < seen.x + seen.w + m && y >= seen.y - m && y < seen.y + seen.h + m)
        return "page"
    return ""
}

; A click on one of the box's handles: the cog opens the settings; the grip, a corner or the
; scroll bar starts dragging it.
BoxMouseDown(wParam, lParam, msg, hwnd) {
    global Drag
    ; The mouse's handlers always run to the end: if one were left halfway, under FrameLoop (see
    ; ApplySettings), every press, move or release after it would be dropped.
    Critical
    if (Veil && hwnd = Veil.Hwnd) {   ; a click on the game, while the box has the mouse: back to the game (see ClaudeKey)
        if !Handed {   ; (never left in the way)
            DllCall("ShowWindow", "ptr", Veil.Hwnd, "int", 0)
            return 0
        }
        ; ...unless it's on or right by the box, the list beside it or the page under it, and went
        ; through to the game (going from the page up to the box, say, before the box had taken the
        ; mouse): that's not leaving them, and the box takes the mouse there now.
        CoordMode("Mouse", "Screen")
        MouseGetPos(&mx, &my)
        if (near := NearOurs(mx, my)) {
            NoteEvent("a click by the " near " went through to the game: the box keeps the mouse")
            SetTimer(WatchMouse, -1)
            return 0
        }
        NoteEvent(Format("a click on the game (at {}, {}): it has the mouse and keyboard back", mx, my))
        SetTimer(GiveBackMouse, -1)
        return 0
    }
    if (Catcher && hwnd = Catcher.Hwnd)   ; (on the page, in a game: see CatchPage)
        return PassToPage(msg, wParam, lParam)
    if (SettingsGui && hwnd = SettingsGui.Hwnd)
        return SettingsDown()
    if (PanelGui && hwnd = PanelGui.Hwnd)
        return PanelClick()
    if (PeekGui && hwnd = PeekGui.Hwnd) {   ; the Claude tab: a click opens the box, and a drag moves the tab (see BoxMouseMove)
        CoordMode("Mouse", "Screen")
        MouseGetPos(&mx, &my)
        Drag := {mode: "peek-press", resizing: false, x: mx, y: my, edge: "", at: 0}
        DllCall("SetCapture", "ptr", PeekGui.Hwnd)
        return 0
    }
    if !(BoxGui && hwnd = BoxGui.Hwnd)
        return
    ; What's under the mouse right now (it may have moved since the last look).
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    hot := HitTest(mx - Anim.x, my - Anim.y)
    if (hot = "cog") {
        SetTimer(OpenSettings, -1)
        return 0
    }
    if (hot = "mini") {
        Minimize()
        return 0
    }
    if (hot = "input" || hot = "send") {   ; starts typing, or sends what you've typed
        SetTimer(hot = "send" && (Composing || Typed != "") ? SendTyped : StartTyping, -1)
        return 0
    }
    if (InStr(hot, "link-") = 1) {   ; opens the page under the box (or closes it)
        SetTimer(OpenPage.Bind(Anim.linkSpots[Integer(SubStr(hot, 6))].url), -1)
        return 0
    }
    if (InStr(hot, "tab-") = 1) {   ; ☰ opens or closes the list beside the box; a page's tab switches Claude to it
        which := SubStr(hot, 5)
        if (which = "menu")
            TogglePanel()
        else if (which = "page")   ; the page tucked away: back under the box
            SetTimer(UntuckPage, -1)
        else
            SetTimer(SelectPage.Bind(which), -1)
        return 0
    }
    if (hot = "" || hot = "box")
        return 0
    Anim.hot := hot
    if SettingsGui   ; (a trace, while the settings are open, for a lock-up the user once hit)
        NoteEvent(Format("pressed the box's {} at {},{} (box at {},{}, corner {})", hot, mx, my, Anim.x, Anim.y, Settings.Corner))
    Drag := {mode: hot, resizing: InStr(hot, "resize") = 1, x: mx, y: my,
        offsetX: Settings.OffsetX, offsetY: Settings.OffsetY,
        left: Anim.x, top: Anim.y, right: Anim.x + Look.W, bottom: Anim.y + Anim.h}
    if Drag.resizing {
        ; Resizing is about the box at its full height, whatever it's showing right now.
        Drag.bottom := InStr(Settings.Corner, "bottom") ? Anim.y + Anim.h : Anim.y + Look.tabH + 2 * Look.pad + Settings.Lines * Look.lineH
        Drag.top := Drag.bottom - 2 * Look.pad - Settings.Lines * Look.lineH
        SnapView()
    }
    if (hot = "scroll") {
        ; While you drag the scroll bar the box holds one size (settling onto whole lines once you
        ; let go), so the bar stays put under the mouse instead of moving as the box resizes.
        Drag.fixedH := Min(Settings.Lines * Look.lineH, View.total)
        Drag.barTop := Anim.bar ? Anim.bar.top : Look.pad, Drag.barH := Max(24 * Look.s, Drag.fixedH * Drag.fixedH / Max(1, View.total))
        ; Grabbing the bar keeps it where you grabbed it; clicking beside it jumps it there.
        scrollBar := Anim.bar, pointY := my - Anim.y - Look.tabH   ; from the top of the box
        Drag.grab := scrollBar && pointY >= scrollBar.y && pointY < scrollBar.y + scrollBar.h ? pointY - scrollBar.y : Drag.barH / 2
        ScrollToBar(pointY)
    }
    DllCall("SetCapture", "ptr", BoxGui.Hwnd)
    return 0
}

BoxMouseMove(wParam, lParam, msg, hwnd) {
    Critical   ; (see BoxMouseDown)
    if (Catcher && hwnd = Catcher.Hwnd)   ; (on the page, in a game: see CatchPage)
        return PassToPage(msg, wParam, lParam)
    if (SettingsGui && hwnd = SettingsGui.Hwnd)
        return SettingsMove()
    if (InStr(Drag.mode, "peek") = 1) {   ; dragging the Claude tab: it goes to the edge of the screen nearest the mouse
        CoordMode("Mouse", "Screen")
        MouseGetPos(&mx, &my)
        if (Drag.mode = "peek-press" && Abs(mx - Drag.x) + Abs(my - Drag.y) < 6)
            return 0
        Drag.mode := "peek", Drag.mon := MonitorAt(mx, my)   ; (on whichever monitor the mouse is on)
        MonitorGetWorkArea(Drag.mon, &left, &top, &right, &bottom)
        far := Map("left", mx - left, "right", right - mx, "top", my - top, "bottom", bottom - my), edge := "right"
        for side, d in far
            if (d < far[edge])
                edge := side
        Drag.edge := edge, Drag.at := edge = "left" || edge = "right" ? my - top - Look.peekSize / 2 : mx - left - Look.peekSize / 2
        Anim.peekHot := true
        Kick()
        return 0
    }
    if !(Drag.mode && BoxGui && hwnd = BoxGui.Hwnd)
        return
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    dx := mx - Drag.x, dy := my - Drag.y
    if (Drag.mode = "move") {
        Settings.OffsetX := Drag.offsetX + dx, Settings.OffsetY := Drag.offsetY + dy
        try Draw()
    } else if (Drag.mode = "scroll") {
        ScrollToBar(my - Anim.y - Look.tabH)
    } else {
        ResizeTo(dx, dy)
    }
    return 0
}

BoxMouseUp(wParam, lParam, msg, hwnd) {
    global Drag
    Critical   ; (see BoxMouseDown)
    if (Catcher && hwnd = Catcher.Hwnd)   ; (on the page, in a game: see CatchPage; losing the mouse mid-drag ends the drag there too)
        return PassToPage(msg, wParam, lParam)
    if (SettingsGui && hwnd = SettingsGui.Hwnd)
        return SettingsUp(msg)
    if (InStr(Drag.mode, "peek") = 1) {
        was := Drag
        Drag := {mode: "", resizing: false}
        if (msg != 0x215)
            DllCall("ReleaseCapture")
        if (was.mode = "peek-press")   ; a click
            return msg = 0x215 ? 0 : OpenFromPeek()
        Settings.PeekEdge := was.edge, Settings.PeekAt := Round(Max(0, was.at)), Settings.Monitor := was.mon   ; dropped on an edge: the box will open from there
        AnchorBox()
        SaveSettings()
        Kick()
        return 0
    }
    if !(Drag.mode && BoxGui && hwnd = BoxGui.Hwnd)
        return
    wasResizing := Drag.resizing, wasMoving := Drag.mode = "move"
    Drag := {mode: "", resizing: false}
    if (msg != 0x215)
        DllCall("ReleaseCapture")
    if wasMoving
        HomeBox()
    SaveSettings()
    if SettingsGui {
        SettingsKick()   ; the settings window shows the new size too
        NoteEvent(Format("let go of the box ({}) at {},{}, corner {}; mouse held by {}", msg = 0x215 ? "it lost the mouse" : "released",
            Anim.x, Anim.y, Settings.Corner, DllCall("GetCapture", "ptr")))
    }
    if wasResizing {
        ApplySettings()   ; (every word, at the width you let go at)
        Kick()   ; back to sizing itself to what it's showing
    }
    return 0
}

; Resizing from a corner: the opposite corner stays put, and the width and the number of lines
; follow the mouse (the lines in whole lines).
ResizeTo(dx, dy) {
    d := Drag, s := Look.s, left := SubStr(d.mode, -1) = "l", top := SubStr(d.mode, -2, 1) = "t"
    w := Max(300, Min(900, Round((d.right - d.left + (left ? -dx : dx)) / s / 10) * 10))   ; in steps of 10
    lines := Max(4, Min(30, Round((d.bottom - d.top + (top ? -dy : dy) - 2 * Look.pad) / Look.lineH)))
    if (w = Settings.Width && lines = Settings.Lines)
        return
    newW := Round(w * s), newH := 2 * Look.pad + lines * Look.lineH
    boxLeft := left ? d.right - newW : d.left, boxTop := top ? d.bottom - newH : d.top
    ; Where that puts the box, as how far it is from its usual place in its corner.
    MonitorGetWorkArea(BoxMonitor(), &areaLeft, &areaTop, &areaRight, &areaBottom)
    m := Round(MARGIN * s)
    Settings.OffsetX := InStr(Settings.Corner, "left") ? boxLeft - (areaLeft + m) : boxLeft + newW - (areaRight - m)
    Settings.OffsetY := InStr(Settings.Corner, "bottom") ? boxTop + newH - (areaBottom - m) : boxTop - Look.tabH - (areaTop + m)   ; the window starts at the tab
    Settings.Width := w, Settings.Lines := lines
    ApplySettings(true)   ; (quick: all of it once you let go, see BoxMouseUp)
    SnapView()
    try Draw()
}

; Scrolls so the scroll bar's thumb sits at y (from the top of the box), a whole line at a time.
ScrollToBar(y) {
    global ScrollAt
    d := Drag
    if !View.spans.Length
        return
    where := Max(0, Min(1, (y - d.grab - d.barTop) / Max(1, d.fixedH - d.barH)))
    View.scrolled := true, ScrollAt := A_TickCount
    View.topLine := Min(LastTopLine(), TopLineAt(where * Max(0, View.total - d.fixedH)))
    Kick()
    UpdateVisibility()
}

; The pointer's shape over the box's handles: a hand for the cog and the scroll bar, arrows for
; moving and resizing.
BoxCursor(wParam, lParam, msg, hwnd) {
    static shapes := Map("cog", 32649, "scroll", 32649, "move", 32646, "resize-tl", 32642, "resize-br", 32642,
        "resize-tr", 32643, "resize-bl", 32643, "tab-menu", 32649, "tab-chat", 32649, "tab-code", 32649, "tab-page", 32649, "mini", 32649,
        "input", 32513, "send", 32649)
    if (PanelGui && wParam = PanelGui.Hwnd && Anim.panelHot && Anim.panelHot != "compact-wait" || PeekGui && wParam = PeekGui.Hwnd || BoxGui && wParam = BoxGui.Hwnd && InStr(Anim.hot, "link-") = 1) {   ; a hand over the list's rows, the Claude tab and links
        DllCall("SetCursor", "ptr", DllCall("LoadCursor", "ptr", 0, "ptr", 32649, "ptr"))
        return true
    }
    if (SettingsGui && wParam = SettingsGui.Hwnd) {   ; the settings window: a hand over what can be clicked, arrows on its top
        hot := SetUI.hot
        shape := hot = "head" ? 32646 : hot ~= "^(ctl|tab|step|color|pop)-|^(close|done|reset|version)$" ? 32649 : 32512
        DllCall("SetCursor", "ptr", DllCall("LoadCursor", "ptr", 0, "ptr", shape, "ptr"))
        return true
    }
    if (BoxGui && wParam = BoxGui.Hwnd && shapes.Has(Anim.hot)) {
        DllCall("SetCursor", "ptr", DllCall("LoadCursor", "ptr", 0, "ptr", shapes[Anim.hot], "ptr"))
        return true
    }
    if (BoxGui && wParam = BoxGui.Hwnd || Catcher && wParam = Catcher.Hwnd) {   ; anywhere else on it (in a game, see WatchMouse), or on the page in a game: the usual arrow
        DllCall("SetCursor", "ptr", DllCall("LoadCursor", "ptr", 0, "ptr", 32512, "ptr"))
        return true
    }
}

; Where the box goes: its corner of its monitor (see BoxMonitor), leaving out the taskbar, moved by
; however far you've dragged it from there (OffsetX, OffsetY).
BoxPosition(h) {
    MonitorGetWorkArea(BoxMonitor(), &left, &top, &right, &bottom)
    m := Round(MARGIN * Look.s)
    return {x: (InStr(Settings.Corner, "left") ? left + m : right - Look.W - m) + Settings.OffsetX,
        y: (InStr(Settings.Corner, "bottom") ? bottom - h - m : top + m) + Settings.OffsetY}
}

; The monitor the box is on (as MonitorGet counts them): the one you last moved it to, or the main one.
BoxMonitor() => Settings.Monitor >= 1 && Settings.Monitor <= MonitorGetCount() ? Settings.Monitor : MonitorGetPrimary()

; The monitor at x, y on the screen (or the main one, if it's off them all).
MonitorAt(x, y) {
    loop MonitorGetCount() {
        MonitorGet(A_Index, &l, &t, &r, &b)
        if (x >= l && x < r && y >= t && y < b)
            return A_Index
    }
    return MonitorGetPrimary()
}

; How many dots to the inch a monitor has, going by its scaling (96 at 100%, 144 at 150%).
MonitorDpi(n) {
    MonitorGet(n, &l, &t)
    hmon := DllCall("MonitorFromPoint", "int64", (l + 1) & 0xFFFFFFFF | ((t + 1) & 0xFFFFFFFF) << 32, "uint", 2, "ptr")   ; (a POINT, by value)
    if (hmon && !DllCall("shcore\GetDpiForMonitor", "ptr", hmon, "int", 0, "uint*", &dpi := 0, "uint*", &dpiY := 0))
        return dpi
    return A_ScreenDPI
}

; How often the box is drawn while it moves (ms): as often as its monitor refreshes with High FPS on,
; and 60 times a second otherwise.
FramePeriod() => !Settings.HighFps || Gaming() ? 16 : Max(4, Floor(1000 / MonitorHz()))

; How many times a second the monitor the box is on refreshes (checked now and then).
MonitorHz() {
    static hz := 60, checkedAt := -60000, screen := 0
    n := BoxMonitor()
    if (n != screen || A_TickCount - checkedAt > 10000) {
        screen := n, checkedAt := A_TickCount, mode := Buffer(220, 0)   ; DEVMODEW
        NumPut("ushort", 220, mode, 68)
        if DllCall("EnumDisplaySettingsW", "str", MonitorGetName(n), "int", -1, "ptr", mode)   ; ENUM_CURRENT_SETTINGS
            hz := Max(30, NumGet(mode, 184, "uint"))   ; dmDisplayFrequency
    }
    return hz
}

PutBack() {
    Settings.OffsetX := Settings.OffsetY := 0, Settings.PeekEdge := "", Settings.PeekAt := -1, Settings.Monitor := 0
    ApplySettings()
    SaveSettings()
    Kick()
}

; ---- Scrolling back -----------------------------------------------------------------

; Over the settings window, the mouse wheel scrolls its lists and moves its sliders, and Esc closes it.
#HotIf OverSettings()
WheelUp::SettingsWheel(-1)
WheelDown::SettingsWheel(1)
Esc::CloseSettings()

; While the box has the mouse and keyboard in a game (see ClaudeKey), Esc gives them back.
#HotIf Handed && !Composing
Esc::(NoteEvent("Esc: the game has the mouse and keyboard back"), GiveBackMouse())

; The mouse wheel over the page under the box, in a game: the page scrolls (see ScrollPage).
#HotIf OverPage()
WheelUp::ScrollPage(0x20A, 120)
WheelDown::ScrollPage(0x20A, -120)
WheelLeft::ScrollPage(0x20E, -120)
WheelRight::ScrollPage(0x20E, 120)

; The mouse wheel scrolls the box only while the pointer is over it; anywhere else it works as
; usual. Wheel down only belongs to the box while it's scrolled back. In a game, only once the box
; has taken the mouse (see WatchMouse): the game's hidden pointer parked on it doesn't count. (Out of
; a game, while the box has the mouse, as with a touchpad, the wheel comes to the box itself, see
; BoxWheel: a touchpad's scrolling is a stream of little wheel turns, and as shortcuts, each one
; scrolled a line, 70 in a second, until AutoHotkey asked whether to go on.)
#HotIf WheelOverBox() && HasEarlier()
WheelUp::Scroll(1)
#HotIf WheelOverBox() && !HasEarlier() && Cleared.Has(ConvKey)   ; (cleared, and nothing since to scroll back to)
WheelUp::ClearedTop()
#HotIf WheelOverBox() && View.scrolled
WheelDown::Scroll(-1)
#HotIf

; The wheel over the box, for its shortcuts: while the box lets the mouse through (or in a game).
WheelOverBox() => (Anim.through || GameFront || Handed) && OverBox()

OverBox() {
    if (!Anim.shown || GameFront && !Anim.hoverTarget)
        return false
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    return HitTest(mx - Anim.x, my - Anim.y) != ""
}

; Whether Windows is showing the mouse pointer (a game hides it while you play).
PointerShown() {
    static info := Buffer(24, 0)
    NumPut("uint", 24, info)
    return DllCall("GetCursorInfo", "ptr", info) && NumGet(info, 4, "uint") & 1
}

; ---- A game's own pointer -----------------------------------------------------------

; Many games hide Windows' pointer over their screen, in their menus as well as while you play, and
; draw one of their own. While you play, some let the hidden pointer drift about with the mouse (The
; Witcher 3: it parks on the box a lot), so the box ignores a hidden pointer (see WatchMouse). Others
; hold it still while you play, and let it follow the mouse only in their menus (The Last of Us Part
; I, measured): for those, a hidden pointer following the mouse onto the box is you, in a menu, and
; the box takes it, as the list beside it does. Which games hold it is learned by watching, while one's
; in front with its pointer hidden: the mouse's own movement (raw input, which reaches the box whatever's
; in front) against the pointer's. The mouse moving a second's worth, all told, with the pointer held
; still: the game holds it, and that's kept (in GAMES_FILE). Nothing to set up for any game: the first
; time you play one, it's learned by itself. Half an hour of it following the mouse, and never held:
; it doesn't, and it's watched no more (till captions start again). (After three minutes, a game whose
; menus you'd been in that long before playing was given up on, and its menus never worked.) A game known to
; hold it is watched the whole time it's in front (watched only near the box, coming onto the box from
; further off, the box didn't know yet it was you, and your first click there went to the game): its
; pointer following the mouse is you in a menu (see InGameMenu), and it held still is you playing (see
; GamePlaying). Every 25 ms while a game's in front (see CheckGameFront); with no spot given, the game's
; gone from the front, and the mouse isn't watched.
GamePointer(mx := "", my := "") {
    p := GamePtr
    game := GameFront && !Handed && mx != "" ? GameExe() : ""
    if (game != p.game)
        p.game := game, p.mode := "", p.run := 0, p.heldTicks := 0, p.watched := 0
    ptrHidden := game != "" && !PointerShown()
    holds := game != "" && HoldingGames.Has(game)
    want := game != "" && (holds || ptrHidden && !p.gaveUp.Has(game))
    if (want != p.sink)
        RawSink(want)
    raw := p.raw, p.raw := 0
    PointerStep(want, raw, mx, my, ptrHidden, holds)
}

; What the mouse's own movement (raw, since the last look) and the pointer's (to mx, my) say, while the
; mouse is watched (watching): the pointer following the mouse, or held still by the game; and if
; it's held a second's worth, all told, in a game not known to hold it (holds), with the pointer
; hidden, the game holds it.
PointerStep(watching, raw, mx, my, hidden, holds) {
    p := GamePtr, game := p.game
    moved := p.x = "" || mx = "" ? 0 : Abs(mx - p.x) + Abs(my - p.y)
    p.x := mx, p.y := my
    if !(watching && raw >= 6 && !AtMonitorEdge(mx, my)) {   ; (the mouse still, or the pointer held by the edge of its screen, not the game)
        p.run := 0
        return
    }
    if (moved > 1) {   ; following the mouse
        p.run := 0, p.mode := "following", p.modeAt := A_TickCount
        if (!holds && ++p.watched >= POINTER_WATCH_TICKS) {
            p.gaveUp[game] := true
            NoteEvent(game " lets its hidden pointer follow the mouse while you play: the box goes on ignoring it (the Claude key takes the mouse there)")
        }
        return
    }
    ; Held still while the mouse moves: for a tenth of a second at least, so it's not just the mouse's
    ; last movement coming in late.
    if (++p.run < 4)
        return
    p.mode := "held", p.modeAt := A_TickCount
    static confirmed := Map()
    if (holds && !confirmed.Has(game))   ; (noted once a session: the game's holding it, as it's known to)
        confirmed[game] := true, NoteEvent(game " held its hidden pointer still as the mouse moved (you playing): the box leaves it to the game")
    if (hidden && !holds && ++p.heldTicks >= 40) {
        HoldingGames[game] := true
        SaveHoldingGames()
        NoteEvent(game " holds its hidden pointer still while you play: in its menus, its pointer on the box is yours")
    }
}

WatchGamePointer() {
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    GamePointer(mx, my)
}

; In a game that holds its hidden pointer while you play, it's following the mouse: you're in a menu.
InGameMenu() => GamePtr.game != "" && HoldingGames.Has(GamePtr.game) && GamePtr.mode = "following" && A_TickCount - GamePtr.modeAt < 1500

; The game's holding its pointer still as the mouse moves: you're playing.
GamePlaying() => GamePtr.game != "" && GamePtr.mode = "held" && A_TickCount - GamePtr.modeAt < 250

; Watching the mouse's own movement (raw input, even with a game in front), or not.
RawSink(on) {
    dev := Buffer(8 + A_PtrSize, 0)
    NumPut("ushort", 1, "ushort", 2, "uint", on ? 0x100 : 0x1, dev)   ; the mouse (generic desktop, mouse); RIDEV_INPUTSINK or RIDEV_REMOVE
    NumPut("ptr", on ? A_ScriptHwnd : 0, dev, 8)
    ok := DllCall("RegisterRawInputDevices", "ptr", dev, "uint", 1, "uint", 8 + A_PtrSize)
    if (!ok && on)
        NoteEvent("couldn't watch the mouse's own movement (error " A_LastError ")")
    GamePtr.sink := on, GamePtr.raw := 0   ; (not tried again till it's wanted again)
}

; The mouse moving (WM_INPUT), while it's watched (see RawSink): how far, counted up for GamePointer.
RawMouse(wParam, lParam, msg, hwnd) {
    static data := Buffer(48, 0), head := 8 + 2 * A_PtrSize
    size := 48
    if (hwnd = A_ScriptHwnd && DllCall("GetRawInputData", "ptr", lParam, "uint", 0x10000003, "ptr", data, "uint*", &size, "uint", head) > 0
        && NumGet(data, 0, "uint") = 0 && !(NumGet(data, head, "ushort") & 1))   ; RID_INPUT; RIM_TYPEMOUSE, moved relative (not a tablet's spots)
        GamePtr.raw += Abs(NumGet(data, head + 12, "int")) + Abs(NumGet(data, head + 16, "int"))   ; lLastX, lLastY
}

; Whether a spot on screen is at the edge of its screen (where the pointer stops, whatever the game does).
AtMonitorEdge(x, y) {
    info := Buffer(40, 0), NumPut("uint", 40, info)
    DllCall("GetMonitorInfo", "ptr", DllCall("MonitorFromPoint", "int64", (y & 0xFFFFFFFF) << 32 | (x & 0xFFFFFFFF), "uint", 2, "ptr"), "ptr", info)
    return x <= NumGet(info, 4, "int") || y <= NumGet(info, 8, "int") || x >= NumGet(info, 12, "int") - 1 || y >= NumGet(info, 16, "int") - 1
}

; The program of the game in front (see CheckGameFront), by its window.
GameExe() {
    static hwnd := 0, exe := ""
    if (LastGame != hwnd)
        hwnd := LastGame, exe := ""
    if (exe = "" && hwnd)
        try exe := WinGetProcessName(hwnd)
    return exe
}

; The games that hold their hidden pointer while you play, kept in GAMES_FILE (a line for each).
SaveHoldingGames() {
    out := ""
    for game in HoldingGames
        out .= game "`n"
    try FileDelete(GAMES_FILE)
    if (out != "")
        try FileAppend(out, GAMES_FILE, "UTF-8")
}

LoadHoldingGames() {
    try text := FileRead(GAMES_FILE, "UTF-8")
    catch
        return
    loop parse text, "`n", "`r"
        if (A_LoopField != "")
            HoldingGames[A_LoopField] := true
}

; Something to scroll back to: an earlier exchange, or more of the one showing than fits.
HasEarlier() => History.Length || Current.height > Settings.Lines * Look.lineH

; Up scrolls back through earlier words and exchanges, two whole lines for each notch of the
; wheel (a wheel spinning fast counts as a few notches at once, up to three), so it always stops
; with whole lines showing. Down comes forward again, and one more notch down once you're at the
; newest goes back to the live captions. That last notch has to come after the wheel has stopped,
; so a spin down doesn't carry you past.
Scroll(dir, notches := "") {   ; (notches: how far, if not the mouse wheel's own, see BoxWheel)
    global ScrollAt
    static last := 0
    ScrollAt := A_TickCount
    spinning := A_TickCount - last < 400, last := A_TickCount
    if !View.spans.Length
        return
    newest := LastTopLine()
    if !View.scrolled {
        if (dir < 0)
            return
        View.topLine := TopLineAt(View.bottom - View.h)   ; from wherever the live captions are
    }
    if (dir < 0 && View.topLine >= newest) {
        if !spinning
            ToLive()
        return
    }
    if (notches = "")
        notches := A_EventInfo ? Min(A_EventInfo, 3) : 0.5   ; 0: a touchpad's less-than-a-notch
    View.topLine := Max(1, Min(newest, View.topLine - dir * Max(1, Round(2 * notches))))
    View.scrolled := true
    if (dir > 0 && View.topLine <= 3)   ; at the oldest thing the box has: more from Claude's window
        SetTimer(LoadOlder, -60)
    if (dir > 0 && View.topLine <= 1 && Cleared.Has(ConvKey) && Cleared[ConvKey].floor)
        ClearedTop()
    Kick()
    UpdateVisibility()
}

; Scrolling the box with a touchpad (see HasTouchpad): its two-finger scrolling comes to the box itself,
; as wheel messages a little at a time, while it has the mouse (see WatchMouse). Counted up, a line
; for every half notch's worth, the way the wheel scrolls; up only when there's something to go back
; to, down only while scrolled back, as with the wheel (see the wheel's shortcuts above).
BoxWheel(wParam, lParam, msg, hwnd) {
    static sum := 0, lastAt := 0
    if !(BoxGui && hwnd = BoxGui.Hwnd)
        return
    if (A_TickCount - lastAt > 400)   ; (a new swipe)
        sum := 0
    lastAt := A_TickCount
    sum += (wParam >> 16 & 0xFFFF) - (wParam >> 16 & 0x8000 ? 0x10000 : 0)
    while (Abs(sum) >= 60) {
        dir := sum > 0 ? 1 : -1, sum -= dir * 60
        if (dir > 0 && !HasEarlier())
            return (Cleared.Has(ConvKey) && ClearedTop(), sum := 0, 0)
        if (dir < 0 && !View.scrolled)
            return (sum := 0, 0)
        Scroll(dir, 0.5)
    }
    return 0
}

; Whether this PC has a touchpad (a laptop's precision touchpad), found among its input devices (a
; HID one used as a touchpad: digitizer page 0x0D, usage 0x05). Looked for once.
HasTouchpad() {
    static has := ""
    if (has != "")
        return has
    has := false, size := 8 + A_PtrSize, count := 0   ; (RAWINPUTDEVICELIST: the device, its kind)
    if (DllCall("GetRawInputDeviceList", "ptr", 0, "uint*", &count, "uint", size) != 0 || !count)
        return has
    list := Buffer(count * size, 0)
    count := DllCall("GetRawInputDeviceList", "ptr", list, "uint*", &count, "uint", size, "int")
    loop Max(count, 0) {
        at := (A_Index - 1) * size
        if (NumGet(list, at + A_PtrSize, "uint") != 2)   ; RIM_TYPEHID
            continue
        info := Buffer(32, 0), NumPut("uint", 32, info), got := 32
        if (DllCall("GetRawInputDeviceInfoW", "ptr", NumGet(list, at, "ptr"), "uint", 0x2000000B, "ptr", info, "uint*", &got, "int") > 0   ; RIDI_DEVICEINFO
            && NumGet(info, 20, "ushort") = 0x0D && NumGet(info, 22, "ushort") = 0x05)   ; usUsagePage, usUsage
            return has := true
    }
    return has
}

; Scrolling back as far as a conversation you cleared from the box (see ClearChat): the box says
; so, rather than the wheel seeming not to work (a moment apart at most).
ClearedTop() {
    static at := 0
    if (A_TickCount - at < 15000)
        return
    at := A_TickCount
    ShowNote("This chat was cleared from the box, so that's as far back as it goes. It's all still in Claude's window.")
}

; The first line at or below y in the conversation, found by halving.
TopLineAt(y) {
    spans := View.spans, lo := 1, hi := spans.Length
    while (lo < hi) {
        mid := (lo + hi) // 2
        if (spans[mid].top < y - 0.5)
            lo := mid + 1
        else
            hi := mid
    }
    return lo
}

; The line the box starts at when it's scrolled all the way to the newest.
LastTopLine() {
    spans := View.spans, n := spans.Length, most := Settings.Lines * Look.lineH, i := n
    while (i > 1 && spans[n].bottom - spans[i - 1].top <= most)
        i--
    return i
}

ToLive() {
    if !View.scrolled
        return
    View.scrolled := false, Anim.liveAt := A_TickCount
    Kick()
    UpdateVisibility()
}

ToLiveIfAway() {
    if !Anim.hoverTarget
        ToLive()
}

; Claude's reply in the exchange showing, or "" if there isn't one yet.
ClaudePart() => ReplyPart(Current)

; Whether some of Claude's words that you haven't seen yet (see CheckSeen) are above what the box
; is headed to show (t), so the arrow at the top points up to them.
MoreAbove(t) {
    if Drag.resizing
        return false
    top := t.bottom - t.h
    loop History.Length + 1 {
        ex := A_Index <= History.Length ? History[A_Index] : Current
        if (ex.unseenAt != "" && ex.y + ex.unseenAt < top - 1)
            return true
    }
    return false
}

; ---- Following Claude's voice -------------------------------------------------------

; In voice mode, Claude reads its replies out loud, and each word lights up as Claude says it. The
; captions can't hear which word Claude is saying, only how loud Claude's app is (Windows keeps a
; level meter for each app's sound), so they go by Claude's pace: while Claude talks, the glow
; moves along the words at that pace, and at each pause, which comes at the end of a sentence (or
; sometimes a phrase), it lines back up with the words. Every VOICE_CHECK_MS while voice mode is
; on, this checks how loud Claude is and moves the glow along.
FollowClaudesVoice() {
    now := A_TickCount, dt := Min(400, now - Voice.at), Voice.at := now
    if (Voice.ex != Current) {   ; a new exchange, followed from its first word
        Voice.ex := Current, Voice.on := false, Voice.word := Voice.pos := Voice.posSpeed := 0.0
        Voice.loudMs := Voice.talkMs := Voice.passed := 0, Voice.snapTo := "", Voice.paused := true
        Voice.finished := false, Voice.shown := 0.0, Voice.trail := []
    }
    if (Hidden || !Voice.fake && now - VoiceModeAt > 5000) {
        Voice.fake := "", Voice.demo := false
        return StopFollowing()
    }
    level := Voice.fake ? Voice.fake.Call() : ClaudeLoudness()
    if (level > 0.02)
        Voice.loudAt := now   ; for knowing whose turn it is (see VoiceState)
    Voice.claudeLevel := Max(level, Voice.claudeLevel * Exp(-dt / 120))   ; for the blue light to pulse with
    ; How loud your mic is, for the listening light to swell as you talk.
    if (!Voice.micTried && !Voice.fake)
        try Voice.micMeter := OpenMicMeter()
    Voice.micTried := true, mic := 0.0
    if Voice.micMeter
        try ComCall(3, Voice.micMeter, "float*", &mic)   ; GetPeakValue
    Voice.mic := Max(mic, Voice.mic * Exp(-dt / 150))
    if !Settings.FollowVoice {   ; only listening, not following
        if Voice.on
            StopFollowing()
        return
    }
    ; How loud Claude is, lingering a moment so the little gaps between words don't count as
    ; pauses, and how loud it has been lately, which sets what counts as quiet.
    Voice.env := Max(level, Voice.env * Exp(-dt / 35))
    Voice.level := Max(level, Voice.level * Exp(-dt / 4000))
    loud := Voice.env > Max(0.004, Voice.level * 0.15)
    list := SpokenWords(), n := list.Length
    if !Voice.on {
        ; Claude starts talking: a moment of steady sound (not just a beep), with words left to say.
        Voice.loudMs := loud ? Voice.loudMs + dt : 0
        if (Voice.loudMs >= 200 && Voice.word < n - 1) {
            Voice.on := true, Voice.paused := Voice.finished := false, Voice.quietMs := Voice.heldMs := 0
            Voice.phraseStart := Voice.word, Voice.phraseMs := Voice.talkMs := Voice.loudMs
            Voice.trail := [[now - Voice.loudMs, Voice.word]]   ; Claude started a moment ago, from here
            Voice.word := Min(n - 0.001, Voice.word + Voice.rate * Voice.loudMs / 1000)
            Remember(now)
            Kick()
        }
        return
    }
    if loud {
        if Voice.paused {   ; talking again after a pause: on to the next sentence
            Voice.paused := false
            if (Voice.snapTo != "" && Voice.snapTo > Voice.word)
                Voice.word := Voice.snapTo
            Voice.snapTo := "", Voice.phraseStart := Voice.word, Voice.phraseMs := 0
        }
        Voice.quietMs := 0, Voice.phraseMs += dt, Voice.talkMs += dt
        word := Voice.word + Voice.rate * dt / 1000
        ; It doesn't go past the end of a sentence until Claude pauses there, or has kept talking
        ; a moment without pausing.
        k := NextSentenceEnd(list, Floor(Voice.word) + 1)
        if (k > Voice.passed && word >= k) {
            Voice.heldMs += dt
            if (Voice.heldMs < 350)
                word := k - 0.001
            else
                Voice.passed := k, Voice.heldMs := 0
        } else {
            Voice.heldMs := 0
        }
        Voice.word := Max(0, Min(word, n - 0.001))   ; nor past the words that are there so far
    } else {
        Voice.quietMs += dt
        if (!Voice.paused && Voice.quietMs >= 90)
            PausedTalking(list)
        if (!Voice.finished && Voice.quietMs >= 1500)
            FinishedTalking(n)
        if (Voice.quietMs >= 3000)
            return StopFollowing()
    }
    Remember(now)
}

; Notes where Claude is now, for the glow to follow a moment later (see DelayedWord).
Remember(now) {
    Voice.trail.Push([now, Voice.word])
    while (Voice.trail.Length > 2 && Voice.trail[1][1] < now - 2500)
        Voice.trail.RemoveAt(1)
}

; Where Claude was GlowDelay ms ago, which is where Claude is in what you hear: its voice takes a
; moment to reach your ears after Claude's app plays it.
DelayedWord() {
    at := A_TickCount - Settings.GlowDelay, trail := Voice.trail
    if !trail.Length
        return Voice.word
    if (at <= trail[1][1])
        return trail[1][2]
    i := trail.Length
    while (i > 1 && trail[i][1] > at)
        i--
    if (i = trail.Length)
        return trail[i][2]
    return trail[i][2] + (trail[i + 1][2] - trail[i][2]) * (at - trail[i][1]) / Max(1, trail[i + 1][1] - trail[i][1])
}

; The first of the spoken words from from on (counting from 1) that ends a sentence, or 0.
NextSentenceEnd(list, from) {
    loop Max(0, list.Length - from + 1)
        if (list[from + A_Index - 1].ends = 2)
            return from + A_Index - 1
    return 0
}

; Claude paused, most likely at the end of the sentence or phrase the glow is near (it's never far
; off). The glow goes to that sentence's last word if it wasn't there yet, and on to the next word
; when Claude talks again, and how long the sentence took tells Claude's pace. A pause that isn't
; near the end of one is only a breath.
PausedTalking(list) {
    Voice.paused := true
    w := Voice.word, cur := Floor(w) + 1, best := 0, bestOff := 99
    first := Max(1, cur - 2), last := Min(list.Length, cur + 10)
    loop Max(0, last - first + 1) {
        k := first + A_Index - 1
        if !list[k].ends
            continue
        off := Abs(k - 0.5 - w) - (list[k].ends = 2 ? 0.75 : 0)   ; how far from the glow, sentence ends counting as nearer
        if (off < bestOff)
            best := k, bestOff := off
    }
    if !best
        return
    said := best - Voice.phraseStart, ms := Voice.phraseMs - 100   ; less the moment the sound lingers
    if (!Voice.demo && said >= 3 && ms > 400)
        Voice.rate := Voice.rate * 0.5 + Max(1.5, Min(7, said / (ms / 1000))) * 0.5
    if (best > cur)   ; behind: it catches up to the end of the sentence
        Voice.word := best - 0.001
    Voice.snapTo := best, Voice.passed := Max(Voice.passed, best), Voice.heldMs := 0
}

; Claude has been quiet long enough to have finished: its pace is worked out again from the whole
; reply (all n of its words, over the time it was talking), and the glow sweeps on to the end if
; it hadn't got there.
FinishedTalking(n) {
    Voice.finished := true
    if (!Voice.demo && n >= 5 && Voice.talkMs > 1500)
        Voice.rate := Voice.rate * 0.5 + Max(1.5, Min(7, n / (Voice.talkMs / 1000))) * 0.5
    Voice.word := Max(Voice.word, n - 0.001)
}

StartFollowing() {
    if Voice.ticking
        return
    Voice.ticking := true, Voice.at := A_TickCount
    SetTimer(FollowClaudesVoice, VOICE_CHECK_MS)
}

; Claude has stopped talking, or voice mode is off, or following is turned off: the glow fades.
; Claude's pace is kept for next time. Unless voice mode is still on, the listening stops too.
StopFollowing() {
    if (Voice.on && !Voice.demo)
        try IniWrite(Round(Voice.rate, 2), SETTINGS_FILE, "voice", "rate")
    if Voice.on
        Voice.on := false, Kick()
    Voice.loudMs := 0
    if (!Voice.fake && (Hidden || A_TickCount - VoiceModeAt > 5000))
        SetTimer(FollowClaudesVoice, 0), Voice.ticking := false, Voice.micMeter := "", Voice.micTried := false
}

; The words of the reply showing that Claude says out loud, in order (leaving out bullets, steps
; and code blocks): which of the reply's laid-out words each is (i), and whether a sentence (2) or
; a phrase (1) ends with it, where Claude may pause. Worked out again when the reply is laid out again.
SpokenWords() {
    if (Voice.parts == Current.parts)
        return Voice.list
    list := [], Voice.part := ""
    for part in Current.parts {
        if (part.key != "claude")
            continue
        Voice.part := part, tokens := part.tokens, n := tokens.Length
        for i, t in tokens {
            if !(t.style = "plain" || t.style = "bold" || t.style = "code")
                continue
            ends := i = n || tokens[i + 1].block != t.block ? 2
                : t.text ~= "[.!?:;…][`"'”’)\]]*$" ? 2 : t.text ~= "[,–—][`"'”’)\]]*$" ? 1 : 0
            if (t.text ~= "[\p{L}\p{N}]")
                list.Push({i: i, ends: ends})
            else if list.Length   ; punctuation on its own, like the comma after some code
                list[list.Length].ends := Max(list[list.Length].ends, ends)
        }
    }
    Voice.parts := Current.parts, Voice.list := list
    return list
}

; Where the word Claude is saying sits: its x and width, its line's y (from the top of the
; exchange), and which of the reply's laid-out words it is (i). "" when there's no glow.
SpokenSpot() {
    if (!(Voice.on || Voice.shown > 0) || Voice.ex != Current)
        return ""
    list := SpokenWords()
    if !list.Length
        return ""
    k := Max(1, Min(list.Length, Floor(Voice.word) + 1)), i := list[k].i, t := Voice.part.tokens[i]
    return {x: Look.pad + t.x, y: Voice.part.textY + t.y, w: t.w, i: i}
}

; How loud Claude's app is right now, from 0 to 1: the loudest of its sound streams. They come and
; go, but finding them asks Windows about every speaker and every stream on it, a few milliseconds
; on the box's own thread: so they're kept, and looked for again only once one can't be read or
; Claude has made no sound for 2 seconds, not every 2 seconds while it talks (see ClaudeSoundNow).
ClaudeLoudness() => ClaudeSoundNow(2000)

; Shows what following Claude's voice looks like, when it's turned on in the settings: a pretend
; voice (with no sound) reads the start of the reply showing at Claude's pace, pausing at the end
; of each sentence and phrase, and the glow follows it just as it would Claude's.
DemoVoice() {
    list := SpokenWords()
    if !list.Length
        return
    talks := [], at := 400, from := at   ; after a moment of quiet
    for i, w in list {
        at += 1000 / Voice.rate
        if (w.ends || i = list.Length) {
            talks.Push([from, at])
            at += w.ends = 2 ? 500 : 300, from := at
            if (i >= 30 && w.ends = 2)   ; the first few sentences are enough
                break
        }
    }
    begin := A_TickCount, ends := at + 3500
    Voice.ex := "", Voice.demo := true, Voice.fake := PretendVoice
    StartFollowing()

    PretendVoice() {
        elapsed := A_TickCount - begin
        if (elapsed > ends) {
            Voice.fake := "", Voice.demo := false
            return 0
        }
        for talk in talks
            if (elapsed >= talk[1] && elapsed < talk[2])
                return 0.3 + 0.15 * Abs(Sin(elapsed / 45))
        return 0
    }
}

; ---- Tucked away ----------------------------------------------------------------------

; Whether the box goes into a tab with Claude's logo at the edge of the screen when it hides: when
; you tucked it away yourself, or when Tuck is on, so you can always bring it back; and while the page
; is tucked into its tab on the box (even in a game), so it can't be left out of reach.
PeekWanted() => !Hidden && (Minimized || PageTucked() || Settings.Tuck && !Gaming())

; How long tucking away (or, opening, coming back out) takes in the style picked, in ms.
TuckMs(opening) {
    switch Settings.TuckStyle {
        case "Bouncy": return opening ? 480 : 380
        case "Smooth": return opening ? 460 : 400
        case "Quick":  return opening ? 220 : 180
    }
    return opening ? 640 : 520   ; Swoosh
}

; Tucks the box into its tab at the side of the screen (the – beside the cog), where it stays until
; you click the tab: everything goes, the list beside it, the settings and the page open under it
; (out of sight, not down to the taskbar) too, and the typing sounds stop. It all comes back where it was.
Minimize() {
    global Minimized
    if Composing
        StopTyping(false)
    Minimized := true, Anim.tuckedAt := A_TickCount
    Anim.panelTarget := 0, Anim.hoverTarget := 0
    if ModelMenu
        SetTimer(CloseModelMenu, -1)
    DllCall("winmm\PlaySoundW", "ptr", 0, "ptr", 0, "uint", 0)   ; (stops a sound playing)
    if (SettingsGui && !SetUI.closing)
        DllCall("ShowWindow", "ptr", SettingsGui.Hwnd, "int", 0), SetUI.hidden := true
    ToLive()
    UpdateVisibility()
    if PageOpen()
        DllCall("ShowWindow", "ptr", Browser.hwnd, "int", 0), Browser.min := true   ; SW_HIDE
    CatchPage()
}

; Brings the box back out of its tab (it grows out of it), and clears the count; and the page that
; was open under it, if there was one. With nothing to show yet, it says how to start.
OpenFromPeek(*) {
    global Minimized, LastChange, Opened
    Minimized := false, Opened := true, Anim.peekHot := false   ; (its counts go once you've read what they count, see CheckSeen)
    if (SettingsGui && SetUI.hidden)   ; the settings, back where they were
        DllCall("ShowWindow", "ptr", SettingsGui.Hwnd, "int", 8), SetUI.hidden := false, SettingsKick()
    LastChange := A_TickCount   ; so it stays up a while
    if (!HasConversation() && Current.note = "") {
        Critical
        Current.note := Settings.TypeBox ? "Say “Hey Claude”, or type to Claude below." : "Say “Hey Claude” to start talking."
        LayOutExchange(Current), Place()
        Critical "Off"
        SetTimer(ClearNote, -5000)
    }
    ShowWhatsNew()
    UpdateVisibility()
    if (PageOpen() && !Browser.tucked)
        BringPageBack()
    return 0
}

; Coming back out of Claude's logo: if Claude said things meanwhile that you haven't seen, and they
; start above what the box would show, it opens scrolled back to where they start (the NEW line marks
; the spot), so you can read on from there.
ShowWhatsNew() {
    global ScrollAt
    Place()
    loop History.Length + 1 {
        ex := A_Index <= History.Length ? History[A_Index] : Current
        if (ex.unseenAt = "" || ex.wordsAt < Anim.tuckedAt)   ; (only what came while it was away)
            continue
        t := ViewTarget(), at := ex.y + ex.unseenAt
        if (at < t.bottom - t.h - 1) {
            View.topLine := TopLineAt(at), View.scrolled := true, ScrollAt := A_TickCount
            SnapView()
            Kick()
        }
        return
    }
}

; Something happened while the box is tucked away. A new message from Claude ("new": its first
; words, or new words after a pause, like in the middle of a long job): Claude's logo counts it and
; wiggles. Claude finished a reply ("done"): the logo does a full spin, and if it's another session
; finishing in Claude's sidebar (count), counts it too. Counts go by page (onPage, or the page Claude
; is on): blue for Code, red for Chat and Cowork. (TuckCount shows the counts, TuckWiggle moves it.)
Nudge(what, onPage := "", count := false) {
    if (Anim.target && !Minimized || !PeekWanted())
        return
    if (VoiceMode && !count)   ; (in voice mode you hear Claude's replies, so they aren't unread)
        return
    onPage := onPage != "" ? onPage : Page = "chat" ? "chat" : "code"
    if (what = "new" || count) {
        Anim.peekCounts.%onPage% += 1, Anim.badgeAt := A_TickCount, Anim.badgePage := onPage
        NoteEvent(Format("while tucked away: {} ({}), counted on {}: {}", what = "new" ? "new words" : "finished",
            count ? "another session" : "this conversation", onPage, Anim.peekCounts.%onPage%))
    }
    if (what = "new")
        Anim.wiggleAt := Settings.TuckWiggle ? A_TickCount : 0
    else
        Anim.spinAt := Settings.TuckWiggle ? A_TickCount : 0
    Kick()
}

; Whether Claude is working on a reply (thinking, writing, or taking steps).
ClaudeBusy() => Current.thinking || Current.claudeStatus != "" || Current.work != ""

; Where the Claude tab goes: which edge of the screen it's on (edge), and where along it (along: its
; top, on the left or right edge, or its left, on the top or bottom one), as you put it there by
; dragging it (or while you're dragging it). Until you do, it's on the box's side, level with the
; box. Also its middle once it's all the way out (cx, cy), for the box to shrink into, and the
; edges of the screen.
PeekSpot() {
    MonitorGetWorkArea(Drag.mode = "peek" ? Drag.mon : BoxMonitor(), &left, &top, &right, &bottom)
    size := Look.peekSize
    if (Drag.mode = "peek") {
        edge := Drag.edge, at := Drag.at
    } else {
        edge := Settings.PeekEdge != "" ? Settings.PeekEdge : InStr(Settings.Corner, "left") ? "left" : "right"
        at := Settings.PeekAt
        if (at < 0) {
            box := BoxPosition(Anim.h || Look.tabH + 2 * Look.pad)   ; (where it sits, not where it's floated to)
            at := edge = "left" || edge = "right" ? box.y + Look.tabH - top : box.x + Look.W / 2 - size / 2 - left
        }
    }
    upright := edge = "left" || edge = "right"
    along := upright ? Max(top, Min(top + at, bottom - size)) : Max(left, Min(left + at, right - size))
    out := Look.peekLogo * 0.3   ; the middle of Claude's logo, from the edge
    switch edge {
        case "left":  cx := left + out, cy := along + size / 2
        case "right": cx := right - out, cy := along + size / 2
        case "top":   cx := along + size / 2, cy := top + out
        default:      cx := along + size / 2, cy := bottom - out
    }
    return {edge: edge, along: along, left: left, top: top, right: right, bottom: bottom, cx: cx, cy: cy}
}

; Puts the box by its Claude tab, after you drag the tab to another edge of the screen: it opens from
; there, in the corner nearest the tab, laid out for that side (see ApplySettings). By the left or
; right edge, the box starts level with the tab (or ends level with it, low on the screen, growing
; up from there); by the top or bottom, it's centered on the tab.
AnchorBox() {
    ApplySettings()   ; (sized for the monitor the tab is on)
    MonitorGetWorkArea(BoxMonitor(), &left, &top, &right, &bottom)
    m := Round(MARGIN * Look.s), size := Look.peekSize, edge := Settings.PeekEdge, at := Settings.PeekAt
    if (edge = "left" || edge = "right") {
        y := top + at, low := y + size / 2 > top + (bottom - top) * 0.6
        Settings.Corner := (low ? "Bottom " : "Top ") edge
        Settings.OffsetX := 0
        Settings.OffsetY := Round(low ? y + size - (bottom - m) : y - Look.tabH - (top + m))
    } else {
        cx := left + at + size / 2, onLeft := cx < (left + right) / 2
        Settings.Corner := (edge = "top" ? "Top " : "Bottom ") (onLeft ? "left" : "right")
        x := Max(left + m, Min(cx - Look.W / 2, right - m - Look.W))
        Settings.OffsetX := Round(onLeft ? x - (left + m) : x + Look.W - (right - m))
        Settings.OffsetY := 0
    }
    ApplySettings()
}

; After you move the box, it belongs to the corner of the screen it's nearest (so it grows and is
; laid out from there), and its Claude tab goes to the edge of the screen nearest it, level with it.
HomeBox() {
    mon := MonitorAt(Anim.x + Look.W / 2, Anim.y + Anim.h / 2)   ; (it may have gone to another monitor)
    MonitorGetWorkArea(mon, &left, &top, &right, &bottom)
    m := Round(MARGIN * Look.s)
    onLeft := Anim.x + Look.W / 2 < (left + right) / 2, low := Anim.y + Anim.h / 2 > (top + bottom) / 2
    corner := (low ? "Bottom " : "Top ") (onLeft ? "left" : "right")
    if (corner != Settings.Corner || mon != BoxMonitor()) {
        Settings.Corner := corner, Settings.Monitor := mon
        Settings.OffsetX := Round(onLeft ? Anim.x - (left + m) : Anim.x + Look.W - (right - m))
        Settings.OffsetY := Round(low ? Anim.y + Anim.h - (bottom - m) : Anim.y - (top + m))
        ApplySettings()
    }
    far := Map("left", Anim.x - left, "right", right - Anim.x - Look.W, "top", Anim.y - top, "bottom", bottom - Anim.y - Anim.h)
    edge := "right"
    for side, d in far
        if (d < far[edge])
            edge := side
    Settings.PeekEdge := edge
    Settings.PeekAt := Round(edge = "left" || edge = "right" ? Anim.y + Look.tabH - top : Anim.x + Look.W / 2 - Look.peekSize / 2 - left)
}

; The tab the box tucks into: Claude's logo with a slight dark outline, peeking out from the edge of
; the screen. It slides all the way out, and grows a little, while you point at it, and clicking it
; brings the box back. While the box is tucked away, it rocks gently back and forth while Claude
; works, does a full spin (popping up a little) when Claude finishes a reply, and wiggles when
; there's something new; the replies that finished meanwhile are counted on it, in blue for the Code
; page and red for Chat and Cowork. It's a window of its own, since it takes clicks.
DrawPeek() {
    global Canvas
    static showing := false, spot := Buffer(16, 0)
    if (Anim.peek <= 0) {
        if showing
            DllCall("ShowWindow", "ptr", PeekGui.Hwnd, "int", 0), showing := false, SetTimer(WatchPeek, 0)
        return
    }
    s := Look.s, size := Look.peekSize, where := PeekSpot(), edge := where.edge, now := FrameNow
    ; How it moves: a full spin that pops it up a little when Claude finishes, rocking back and forth
    ; while Claude works, or a quick wiggle when there's something new.
    turn := 0, pop := 1, spun := now - Anim.spinAt
    if (Anim.spinAt && spun < 800) {
        k := spun / 800, turn := 360 * (k < 0.5 ? 4 * k ** 3 : 1 - (2 - 2 * k) ** 3 / 2), pop := 1 + 0.28 * Sin(3.1416 * k)
    } else if (ClaudeBusy() || Anim.codeWorking && Page = "chat") {   ; (or a Code session, while you're on the Chat page)
        turn := 12 * Sin(now / 1000 * 6.2832 / 1.8)
    } else if (Anim.wiggleAt && now - Anim.wiggleAt < 900) {
        age := now - Anim.wiggleAt, turn := 14 * Sin(age / 1000 * 6.2832 * 4.5) * (1 - age / 900)
    }
    logoW := Look.peekLogo * (1 + 0.12 * Anim.peekHover) * pop
    ; How far it's out: most of the logo, all of it while you point at it. Its window is only the part
    ; that's out, with room around the logo for it to turn (so it never shows on a screen next to this one).
    full := Look.peekLogo * (0.9 + 0.1 * Anim.peekHover) + 6 * s * Anim.peekHover
    out := full * (1 - (1 - Anim.peek) ** 3), deep := Min(size, Max(1, Ceil(out + size * 0.25)))
    upright := edge = "left" || edge = "right", w := upright ? deep : size, h := upright ? size : deep
    inset := out - Look.peekLogo / 2   ; the middle of the logo, from the edge of the screen
    switch edge {
        case "left":  x := where.left, y := where.along, cx := inset, cy := size / 2
        case "right": x := where.right - deep, y := where.along, cx := deep - inset, cy := size / 2
        case "top":   x := where.along, y := where.top, cx := size / 2, cy := inset
        default:      x := where.along, y := where.bottom - deep, cx := size / 2, cy := deep - inset
    }
    x := Round(x), y := Round(y)
    Anim.peekX := x, Anim.peekY := y, Anim.peekW := w, Anim.peekH := h
    saved := Canvas, Canvas := PeekCanvas, g := Canvas.g
    DllCall("gdiplus\GdipGraphicsClear", "ptr", g, "uint", 0)
    DllCall("gdiplus\GdipResetWorldTransform", "ptr", g)
    DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", cx, "float", cy, "int", 0)
    DllCall("gdiplus\GdipRotateWorldTransform", "ptr", g, "float", turn, "int", 0)
    edge2 := 1.6 * s, radius := logoW * 0.23   ; a slight dark outline, hugging the logo
    FillRoundRect(-logoW / 2 - edge2, -logoW / 2 - edge2, logoW + 2 * edge2, logoW + 2 * edge2, radius + edge2, ARGB(0.6, 0x000000))
    if (logo := ClaudeLogo())
        DllCall("gdiplus\GdipDrawImageRect", "ptr", g, "ptr", logo, "float", -logoW / 2, "float", -logoW / 2, "float", logoW, "float", logoW)
    else
        DrawSpark(logoW / 2)
    DllCall("gdiplus\GdipResetWorldTransform", "ptr", g)
    ; How many replies finished while it was tucked away: blue for the Code page, red for Chat and
    ; Cowork, by the logo's corner toward the middle of the screen.
    if Settings.TuckCount {
        toward := edge = "right" ? [-1, -1] : edge = "top" ? [1, 1] : [1, -1], r := 8.5 * s, n := 0
        for which, color in Map("code", Look.colors.you, "chat", 0xE5484D) {
            count := Anim.peekCounts.%which%
            ; (a Code session working while you're on the Chat page, before it has said anything: a
            ; blue dot, which the count goes on once it does)
            dot := which = "code" && !count && Anim.codeWorking && Page = "chat"
            if !(count || dot)
                continue
            bx := cx + toward[1] * (logoW * 0.5 - n * 2.3 * r), by := cy + toward[2] * logoW * 0.5, n++
            if dot {
                FillCircle(bx, by, r * 0.6 + 1.5 * s, ARGB(0.6, 0x000000))
                FillCircle(bx, by, r * 0.6, ARGB(1, color))
                continue
            }
            FillCircle(bx, by, r + 1.5 * s, ARGB(0.6, 0x000000))
            FillCircle(bx, by, r, ARGB(1, color))
            NumPut("float", bx - r, "float", by - r, "float", 2 * r, "float", 2 * r, spot)
            DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", 0xFFFFFFFF)
            DllCall("gdiplus\GdipDrawString", "ptr", g, "wstr", count > 9 ? "9+" : count "", "int", -1, "ptr", Look.labelFont.font,
                "ptr", spot, "ptr", CenterFormat, "ptr", Brush)
        }
    }
    Canvas := saved
    ShowLayered(PeekGui.Hwnd, PeekCanvas, x, y, 255 * Min(1, Anim.peek * 1.5), w, h)
    if !showing
        DllCall("ShowWindow", "ptr", PeekGui.Hwnd, "int", 8), showing := true, SetTimer(WatchPeek, 50)
}

; While the Claude tab shows: notices when you point at it. In a game, only while the game shows
; Windows' own pointer (see WatchMouse); otherwise the tab lets clicks through to the game, so the
; game's hidden pointer at the edge of the screen can't open the box in the middle of a fight. (But in
; the menus of a game that holds its hidden pointer while you play, its pointer is yours: see
; GamePointer.)
WatchPeek() {
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    over := Drag.mode = "peek" || mx >= Anim.peekX && mx < Anim.peekX + Anim.peekW && my >= Anim.peekY && my < Anim.peekY + Anim.peekH
    if (over && Drag.mode = "" && GameFront && (!Anim.peekHot && !PointerShown() && !InGameMenu() || GamePlaying()))
        over := false
    through := GameFront && !over
    if (through != Anim.peekThrough)
        Anim.peekThrough := through, ClickThrough(through, PeekGui.Hwnd)
    if (over != Anim.peekHot)
        Anim.peekHot := over, Kick()
}

; Claude's own app icon, read from Claude's app (while it's running) as a picture with its
; see-through corners kept, or "" if it can't be read. Tried again now and then until it can. It's
; read from the program behind Claude's window, not just any claude.exe: Claude Code's command-line
; tool is named claude.exe too, and one started before the app was the one found first.
ClaudeLogo() {
    static logo := "", triedAt := -60000, bits := ""
    if (logo || A_TickCount - triedAt < 30000)
        return logo
    triedAt := A_TickCount
    try {
        if !(appWin := FindClaudeWindow()) {
            ; (In the tray, with no window of Claude's showing: its hidden windows are the app's too,
            ; as Claude Code's command-line claude.exe has none of its own. With none at all, it's
            ; tried again in a while.)
            hiddenToo := DetectHiddenWindows(true)
            appWin := WinExist("ahk_exe claude.exe")
            DetectHiddenWindows(hiddenToo)
            if !appWin
                return logo
        }
        if !DllCall("PrivateExtractIconsW", "str", ProcessGetPath(WinGetPID(appWin)), "int", 0, "int", 128, "int", 128, "ptr*", &icon := 0, "ptr", 0, "uint", 1, "uint", 0) || !icon
            return logo
        info := Buffer(32, 0)   ; ICONINFO
        DllCall("GetIconInfo", "ptr", icon, "ptr", info)
        color := NumGet(info, 24, "ptr"), mask := NumGet(info, 16, "ptr")
        bm := Buffer(32, 0)
        DllCall("GetObject", "ptr", color, "int", 32, "ptr", bm)
        w := NumGet(bm, 4, "int"), h := NumGet(bm, 8, "int")
        header := Buffer(40, 0)   ; BITMAPINFOHEADER, rows top to bottom, 32 bits a pixel
        NumPut("uint", 40, "int", w, "int", -h, "ushort", 1, "ushort", 32, header)
        bits := Buffer(w * h * 4, 0), hdc := DllCall("GetDC", "ptr", 0, "ptr")
        DllCall("GetDIBits", "ptr", hdc, "ptr", color, "uint", 0, "uint", h, "ptr", bits, "ptr", header, "uint", 0)
        DllCall("ReleaseDC", "ptr", 0, "ptr", hdc)
        DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", w, "int", h, "int", w * 4, "int", 0x26200A, "ptr", bits, "ptr*", &picture := 0)
        logo := picture
        DllCall("DeleteObject", "ptr", color), DllCall("DeleteObject", "ptr", mask), DllCall("DestroyIcon", "ptr", icon)
    }
    return logo
}

; A stand-in for Claude's logo (a white spark on an orange tile), r from its middle to its edge,
; drawn around (0, 0).
DrawSpark(r) {
    FillRoundRect(-r, -r, 2 * r, 2 * r, r * 0.45, ARGB(1, 0xD97757))
    points := Buffer(16)
    loop 11 {
        turn := (A_Index - 1) * 6.2832 / 11 + 0.3, long := r * (0.52 + 0.14 * Mod(A_Index * 7, 3) / 2)
        NumPut("float", 0, "float", 0, "float", Cos(turn) * long, "float", Sin(turn) * long, points)
        DrawLines(points, 2, r * 0.16, 0xFFFFFFFF)
    }
}

; ---- Links under the box ------------------------------------------------------------

; The links in the replies in view (see ShownLinks), as pills along the bottom of the box, each
; saying where it goes ("youtube.com"). Click one to open the page in a browser window attached under
; the box; while it's open, its pill turns blue with a ✕, and clicking it again closes the page. As
; the links go (scrolled out of view), the pills fade away with the row.
DrawLinks(top, rowH) {
    static last := []
    Anim.linkSpots := []
    if (links := ShownLinks()).Length
        last := links
    else
        links := last
    if (rowH < 2 || !links.Length)
        return
    s := Look.s, c := Look.colors, h := Look.labelH + 2 * s, x := Look.pad, y := top + (rowH - h) / 2 - 2 * s
    a := Anim.links, iconW := Look.icons.Has("link") ? Look.icons["link"].w + 5 * s : 0
    sites := Map(), names := []   ; (links to the same site say which page too)
    for link in links
        names.Push(site := LinkSite(link.url)), sites[site] := sites.Has(site) ? sites[site] + 1 : 1
    for i, link in links {
        state := PillState(link.url), color := state ? c.you : c.claude, site := names[i]
        if (sites[site] > 1 &&RegExMatch(link.url, "i)^https?://[^/]+/([^/?#]+)", &m))
            site .= "/" (StrLen(m[1]) > 16 ? SubStr(m[1], 1, 15) "…" : m[1])
        text := (state = "open" ? "✕  " : "") site (state = "opening" ? "…" : "")
        w := 14 * s + iconW + TextWidth(text, Look.labelFont)
        if (x + w > Look.pad + Look.inner)
            break
        FillRoundRect(x, y, w, h, h / 2, ARGB(a * (Anim.hot = "link-" i ? 0.32 : 0.16), color))
        if iconW
            DrawWord(Look.icons["link"].glyph, Look.iconFont, x + 7 * s, y + (h - Look.labelH) / 2 + Look.icons["link"].dy, a, color, 0)
        DrawWord(text, Look.labelFont, x + 7 * s + iconW, y + (h - Look.labelH) / 2 + Look.labelDy, a, color, 0)
        Anim.linkSpots.Push({left: x, right: x + w, top: y, bottom: y + h, url: link.url})
        x += w + 6 * s
    }
}

; A link's pill: "open" (its page is under the box, and the pill's ✕ closes it), "opening" (it's on its
; way, or next once the one opening is there: see OpenPage), or "".
PillState(url) {
    wanted := Browser.next != "" ? Browser.next : Browser.url
    return wanted != url ? "" : Browser.url = url && Browser.hwnd ? "open" : "opening"
}

; Where a link goes, as "youtube.com".
LinkSite(url) => RegExReplace(url, "i)^https?://(www\.)?([^/:?#]+).*$", "$2")

; The links the pills along the bottom of the box offer (up to three): live, those in the reply
; showing; scrolled back, those in each reply in view, so they come and go as you scroll.
ShownLinks() {
    if Current.sample
        return []
    if !View.scrolled
        return Current.links
    top := View.bottom - View.h, out := [], seen := Map()
    loop History.Length + 1 {
        ex := A_Index <= History.Length ? History[A_Index] : Current
        if (ex.y + ex.height > top && ex.y < View.bottom && ex.HasOwnProp("links"))
            for link in ex.links
                if (!seen.Has(link.url) && out.Length < 3)
                    out.Push(link), seen[link.url] := true
    }
    return out
}

; Opens a web page from Claude's reply in a browser window attached to the box (see BrowserSpot, and
; PageBrowser for which browser: Edge, as a bare window). While it's open, the box stays up. Opening
; the page that's open again closes it. With no browser it knows, the page just opens in your default
; one as usual. Only web pages (http and https) open. Another page open (or old: one let go of, out of
; sight, see LetGoOfPage): it's closed once this one's there.
OpenPage(url, old := 0) {
    global Browser, PageExe
    if !(url ~= "i)^https?://[^\s`"<>]+$")
        return CloseBrowserWindow(old)
    ; A page still opening (its window not there yet, a second or two): its link again leaves it be,
    ; and another link opens once it's there, in its place (see FindPage). (Straight away, two pages
    ; opened over each other, one of them left behind; and clicking a link again as it opened, its pill
    ; already showing a ✕, closed it before it was even there.)
    if (Browser.url != "" && !Browser.hwnd) {
        Browser.next := url = Browser.url ? "" : url
        Kick()
        return
    }
    if Browser.hwnd {
        same := Browser.url = url
        if (same && Browser.tucked && PageOpen())   ; tucked into its tab: it comes back instead
            return UntuckPage()
        if same
            return ClosePage()
        old := LetGoOfPage()   ; (out of sight now, and closed once this one's there)
    }
    if !(b := PageBrowser()) {
        CloseBrowserWindow(old)
        Browser := NoPage(), PlacePageTab(), CatchPage()
        Run(url)
        return
    }
    Browser := NoPage(url), PageExe := b.exe, Browser.old := old
    PlacePageTab(), CatchPage()
    spot := BrowserSpot(), edges := PageInsets(), before := Map()
    for hwnd in WinGetList("ahk_exe " b.exe)
        before[hwnd] := true
    size := ' --window-size=' (spot.w + edges.l + edges.r) ',' (spot.h + edges.t + edges.b) ' --window-position=' (spot.x - edges.l) ',' (spot.y - edges.t)
    cmd := '"' b.path '" ' (b.app ? '--app="' url '" --new-window' size : b.newWindow ' "' url '"')
    if !(GameFront && LaunchQuietly(cmd))
        Run(cmd)
    Kick()
    SetTimer(FindPage.Bind(url, b, before, A_TickCount + 8000), -150)
}

; The page's window, the new one the browser opens (see OpenPage), once it's there: looked for every
; 150 ms, for 8 s at most, so the box goes on moving meanwhile (waiting for it in one go held the box
; still for seconds). Then it goes under the box.
FindPage(url, b, before, deadline) {
    global Browser
    if (Browser.url != url || Browser.hwnd)   ; (another link since, or closed)
        return
    for hwnd in WinGetList("ahk_exe " b.exe)
        if (!before.Has(hwnd) && DllCall("IsWindowVisible", "ptr", hwnd) && WinGetTitle(hwnd) != "" && WinGetClass(hwnd) ~= "^(Chrome_WidgetWin_1|MozillaWindowClass)$") {
            if DllCall("IsZoomed", "ptr", hwnd)   ; (it opened full size, as the browser's last window was: the box's size instead)
                DllCall("ShowWindow", "ptr", hwnd, "int", 4)   ; SW_SHOWNOACTIVATE
            NoteEvent("opened " LinkSite(url) " in " b.exe " under the box")
            CloseBrowserWindow(Browser.old), Browser.old := 0   ; (the page it takes the place of)
            if (Browser.next != "") {   ; (another link was clicked as it opened: that one, in its place)
                next := Browser.next
                NoteEvent("another link was clicked as it opened: " LinkSite(next) " in its place")
                DllCall("ShowWindowAsync", "ptr", hwnd, "int", 0)   ; (out of sight, and closed once that one's there)
                Browser := NoPage()
                return OpenPage(next, hwnd)
            }
            Browser.hwnd := hwnd, Browser.inset := PageInsets(hwnd), Browser.set := ""
            WatchPage()
            KeepPageUp()
            ReturnToGame(), SetTimer(ReturnToGame, -600)   ; (if it took the front from the game anyway)
            MoveBrowser()
            UpdateVisibility()
            SetTimer(CheckStack, -500)   ; (with the Claude key: it's over the veil)
            return
        }
    if (A_TickCount < deadline)
        return SetTimer(FindPage.Bind(url, b, before, deadline), -150)
    new := ""   ; (what did turn up, if anything, to see why)
    for hwnd in WinGetList("ahk_exe " b.exe)
        if !before.Has(hwnd)
            try new .= Format(" [{} '{}'{}]", WinGetClass(hwnd), SubStr(WinGetTitle(hwnd), 1, 40), DllCall("IsWindowVisible", "ptr", hwnd) ? "" : ", hidden")
    NoteEvent("opened " LinkSite(url) " in " b.exe ", but no new window of it turned up to put under the box (new windows of it:" (new = "" ? " none" : new) ")")   ; (like the page going into a tab of one already open)
    next := Browser.next, old := Browser.old
    Browser := NoPage()
    Kick()
    if (next != "")   ; (another link clicked meanwhile)
        return OpenPage(next, old)
    CloseBrowserWindow(old)
}

; The browser pages open in (see OpenPage), as {path, exe, app, newWindow}: Edge, as it comes with
; Windows, since it can open a page as a bare window of its own (app: no tabs or address bar) exactly
; as wide as the box. (Opera GX, tried as the default browser, won't go narrower than 660 pixels, nor
; open a bare window.) Without Edge, your default browser: a bare window from one that can (Chrome,
; Brave, Vivaldi), otherwise a new window of its own (newWindow: how to ask it, for Opera or Firefox).
; "" if there's none of those.
PageBrowser() {
    for edge in [A_ProgramFiles " (x86)\Microsoft\Edge\Application\msedge.exe", A_ProgramFiles "\Microsoft\Edge\Application\msedge.exe"]
        if FileExist(edge)
            return {path: edge, exe: "msedge.exe", app: true, newWindow: ""}
    path := ""
    try {
        prog := RegRead("HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice", "ProgId")
        if RegExMatch(RegRead("HKCR\" prog "\shell\open\command"), '^\s*(?:"([^"]+)"|(\S+))', &m)
            path := m[1] != "" ? m[1] : m[2]
    }
    SplitPath(path, &exe)
    switch StrLower(exe) {
        case "msedge.exe", "chrome.exe", "brave.exe", "vivaldi.exe", "chromium.exe":
            if FileExist(path)
                return {path: path, exe: exe, app: true, newWindow: ""}
        case "opera.exe", "launcher.exe":
            if FileExist(path)
                return {path: path, exe: "opera.exe", app: false, newWindow: "--new-window"}
        case "firefox.exe", "librewolf.exe", "waterfox.exe", "floorp.exe":
            if FileExist(path)
                return {path: path, exe: exe, app: false, newWindow: "-new-window"}
    }
    return ""
}

; Closes the page under the box (if it's still open), and lets go of it. Only the page goes: the box
; stays up a while as usual (it counts as something happening), rather than going away with it.
ClosePage() {
    global Browser, LastChange, Opened
    if PageOpen()
        ClosePageWindow()
    CloseBrowserWindow(Browser.old)   ; (one let go of for another, still out of sight: see LetGoOfPage)
    UnhookPage()
    Browser := NoPage()
    LastChange := A_TickCount, Opened := true
    PlacePageTab()
    CatchPage()
    Kick()
    UpdateVisibility()
    SetTimer(ReturnToGame, -300)   ; (closing it with its ✕ brought it in front first)
}

; The page under the box is open (whether it shows or not).
PageOpen() => Browser.hwnd && DllCall("IsWindow", "ptr", Browser.hwnd)

; Closes the page's window (it may be out of sight), as its own ✕ does: Opera takes no notice of
; being asked to close any other way.
ClosePageWindow() => CloseBrowserWindow(Browser.hwnd)
CloseBrowserWindow(hwnd) => hwnd && DllCall("PostMessage", "ptr", hwnd, "uint", 0x112, "ptr", 0xF060, "ptr", 0)   ; WM_SYSCOMMAND, SC_CLOSE

; The page under the box, let go of as another opens in its place: out of sight straight away, and
; closed once the other's there (see FindPage). (Closed first, it was Edge's last window, so Edge shut
; down just as the other page was asked for, and the other never opened.) Its window, or 0.
LetGoOfPage() {
    old := PageOpen() ? Browser.hwnd : 0
    UnhookPage()
    if old
        DllCall("ShowWindowAsync", "ptr", old, "int", 0)   ; SW_HIDE
    return old
}

; Browser with no page open under the box (or, given its address, one that's just opening).
NoPage(url := "") => {hwnd: 0, url: url, side: "", set: "", w: 0, h: 0, min: false, hook: 0, top: false, inset: "", tucked: false, detached: false, hook2: 0, dragging: false, boxDrag: false, next: "", old: 0}

; Shows the page again where it goes, without taking the front from anything.
BringPageBack() {
    if !PageOpen()
        return
    DllCall("ShowWindow", "ptr", Browser.hwnd, "int", DllCall("IsIconic", "ptr", Browser.hwnd) ? 4 : 8)   ; SW_SHOWNOACTIVATE (restoring it), or SW_SHOWNA
    Browser.min := false, Browser.set := ""
    KeepPageUp()
    MoveBrowser()
}

; You minimized the page: instead of going down to the taskbar, it tucks into a tab of its own on
; the box, beside the page tabs (see PlacePageTab). Click that (or its link again) to bring it back.
; The box stays up a while as usual with it there (it counts as something happening: it used to go
; straight away, page tab and all), and once it goes, its Claude tab stays at the side of the screen
; while the page is tucked, even in a game (see PeekWanted), so the page is never out of reach.
TuckPage() {
    global LastChange, Opened
    if !PageOpen()
        return
    DllCall("ShowWindow", "ptr", Browser.hwnd, "int", 0)   ; SW_HIDE: out of sight, and off the taskbar
    Browser.tucked := true, Browser.min := true
    LastChange := A_TickCount, Opened := true
    NoteEvent("the page tucked into its tab on the box")
    PlacePageTab(), Kick(), UpdateVisibility()
    CatchPage()
    ReturnToGame()   ; (its – brought it in front; with the Claude key, the box keeps the mouse)
}

UntuckPage() {
    Browser.tucked := false
    NoteEvent("the page came back out of its tab")
    PlacePageTab()
    BringPageBack()
    Kick(), UpdateVisibility()
}

; The page under the box is tucked into its tab (see TuckPage).
PageTucked() => Browser.tucked && PageOpen()

; The tabs' places: ☰, then Chat and Cowork, then Code, from the box's left (or, with the box on
; the left of the screen, from its right). While the page is tucked into a tab of its own and there
; isn't room for it otherwise, Chat and Cowork and Code show just their icons (compact).
TabSlots() {
    s := Look.s, x := Look.radius + 8 * s
    Look.slots := Map()
    for which in ["menu", "chat", "code"] {
        w := TabWidth(which)
        Look.slots[which] := Look.mirror ? {left: Look.W - x - w, right: Look.W - x} : {left: x, right: x + w}
        x += w + 4 * s
    }
}

; While the page is tucked away, its tab: a globe and its site's name (cut short if it has to be),
; after the page tabs (before them, while the tabs are the other way round), before the cog and the
; –. The page tabs go down to just their icons if that's what makes room for it.
PlacePageTab() {
    wanted := Browser.tucked && PageOpen()
    Look.compact := false, TabSlots()
    if !wanted
        return
    s := Look.s
    if (TabRoomAfterCode() < TabWidth("page"))
        Look.compact := true, TabSlots()
    room := TabRoomAfterCode(), w := Min(TabWidth("page"), room), code := Look.slots["code"]
    if (w >= 40 * s)
        Look.slots["page"] := Look.mirror ? {left: code.left - 4 * s - w, right: code.left - 4 * s} : {left: code.right + 4 * s, right: code.right + 4 * s + w}
}

TabRoomAfterCode() {
    s := Look.s, code := Look.slots["code"], controls := Look.pad + 4 * Look.cogR + 14 * s
    return Look.mirror ? code.left - 4 * s - controls : Look.W - controls - code.right - 4 * s
}

; You took hold of the page by its title bar or an edge, let go of it after moving it (see
; PageMoved), or minimized it.
PageEvent(hook, event, hwnd, idObject, idChild, thread, time) {
    if (hwnd != Browser.hwnd || idObject != 0)
        return
    if (event = 0x0016)        ; EVENT_SYSTEM_MINIMIZESTART
        SetTimer(TuckPage, -1)
    else if (event = 0x000A)   ; EVENT_SYSTEM_MOVESIZESTART
        Browser.dragging := true
    else if (event = 0x000B)   ; EVENT_SYSTEM_MOVESIZEEND
        Browser.dragging := false, SetTimer(PageDropped, -1)
}

; You let go of the page after moving it off the box: back near its place by the box, it snaps back
; on; anywhere else, it stays where you put it.
PageDropped() {
    if !(Browser.detached && Browser.set)
        return
    Browser.detached := false   ; (to see where it'd go on the box)
    spot := BrowserSpot(), set := Browser.set
    ShowSnapSpot("")
    if (Abs(set.x - spot.x) + Abs(set.y - spot.y) <= SnapZone()) {
        Browser.set := ""
        MoveBrowser(), Kick(), UpdateVisibility()
    } else {
        Browser.detached := true
    }
}

; Starts a program (cmd) through Windows' management service (WMI) rather than from here. Started
; from here just after you clicked the box, it would be allowed to take the front, and a page opening
; in a game would drop you out of it (showing the taskbar and the Windows cursor). Returns false if
; it couldn't.
LaunchQuietly(cmd) {
    try return ComObjGet("winmgmts:").Get("Win32_Process").Create(cmd, , , &pid := 0) = 0
    return false
}

; How much of the page's window is invisible border (Windows gives windows an invisible edge, about
; 7 pixels on the sides and bottom, to grab for resizing), from its window (or, before it's open, the
; usual amount): so the page's visible edges line up with the box's.
PageInsets(hwnd := 0) {
    usual := {l: Round(7 * Look.s), t: 0, r: Round(7 * Look.s), b: Round(7 * Look.s)}
    win := Buffer(16), seen := Buffer(16)
    if (!hwnd || !DllCall("GetWindowRect", "ptr", hwnd, "ptr", win)
        || DllCall("dwmapi\DwmGetWindowAttribute", "ptr", hwnd, "uint", 9, "ptr", seen, "uint", 16) != 0)   ; DWMWA_EXTENDED_FRAME_BOUNDS
        return usual
    return {l: NumGet(seen, 0, "int") - NumGet(win, 0, "int"), t: NumGet(seen, 4, "int") - NumGet(win, 4, "int"),
        r: NumGet(win, 8, "int") - NumGet(seen, 8, "int"), b: NumGet(win, 12, "int") - NumGet(seen, 12, "int")}
}

; In a game (which often keeps its own window always on top), the page under the box is kept on
; top too, so the game doesn't hide it; otherwise it's an ordinary window again.
KeepPageUp() {
    if !PageOpen()
        return CatchPage()
    top := GameFront
    if (top || Browser.top)
        DllCall("SetWindowPos", "ptr", Browser.hwnd, "ptr", top ? -1 : -2, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x13), Browser.top := top   ; HWND_TOPMOST or HWND_NOTOPMOST; SWP_NOSIZE | SWP_NOMOVE | SWP_NOACTIVATE
    ; Then, over it, the invisible window that takes your clicks on it (put under it, the page took
    ; them itself and came in front of the game), and over both, the box and the list beside it (the
    ; page on top of the box, you couldn't get to the box).
    CatchPage()
    if top
        BoxAbovePage()
}

; The Claude key's veil coming in front puts it over everything, the box too: it goes back over it
; (the invisible window taking your clicks on the page, then the box and the list), or all you'd see
; is the blur. The page can't go over it, but shows through a hole in it (see VeilHole), kept over the
; game under it.
OverVeil() {
    KeepPageUp()
    OnTop()
    BoxAbovePage()
}

; With the Claude key, a moment after the box takes the mouse (or a page opens): does the page under
; the box show through the veil, over the game, with the invisible window taking your clicks on it
; over the veil? If not (the page once didn't show at all with the Claude key), it's put right, and
; it's noted, with how it was, so the log says what happened. A few times, a moment apart.
CheckStack(tries := 3) {
    if !(Handed && Veil && PageOpen() && !Browser.tucked)
        return
    pageShown := DllCall("IsWindowVisible", "ptr", Browser.hwnd) && !DllCall("IsIconic", "ptr", Browser.hwnd)
    through := PageThroughVeil(), overGame := !(Took.game && DllCall("IsWindow", "ptr", Took.game)) || IsAbove(Browser.hwnd, Took.game)
    caught := Catcher && IsAbove(Catcher.Hwnd, Veil.Hwnd), boxUp := BoxGui && IsAbove(BoxGui.Hwnd, Veil.Hwnd)
    if !(pageShown && through && overGame && caught && boxUp) {
        NoteEvent(Format("the Claude key with the page open: page showing {}, through the veil {}, over the game {}, the invisible window over the veil {}, the box over it {}: put right",
            pageShown ? "yes" : "no", through ? "yes" : "no", overGame ? "yes" : "no", caught ? "yes" : "no", boxUp ? "yes" : "no"))
        if !pageShown
            BringPageBack()
        OverVeil()
        VeilHole(PageSeen(), true)
    }
    if (tries > 1)
        SetTimer(CheckStack.Bind(tries - 1), -700)
}

; With the Claude key, the page can't go over the veil, always on top or not: the box's windows, the
; veil too, are in the layer Windows keeps for UI Access (see CaptionsMain), over every other program's
; windows, and no other program's window can go over them (Edge's page included). So the veil has a hole
; where the page is, and the page, kept over the game (see KeepPageUp), shows through it; the invisible
; window taking your clicks on it is the box's own, over the veil. The hole goes where the page goes,
; and while the veil fades out, and is taken away once there's no page. seen: the page's visible
; edges ({x, y, w, h}), or "" for no hole. again: made again, even if it's where it was.
VeilHole(seen := "", again := false) {
    static cut := ""
    if !Veil
        return
    want := (VeilCanvas && seen) ? Format("{},{} {}x{} in {}x{}", seen.x - VeilCanvas.x, seen.y - VeilCanvas.y, seen.w, seen.h, VeilCanvas.w, VeilCanvas.h) : ""
    if (want = cut && !again)
        return
    cut := want
    if (want = "")
        return DllCall("SetWindowRgn", "ptr", Veil.Hwnd, "ptr", 0, "int", 1)
    x := seen.x - VeilCanvas.x, y := seen.y - VeilCanvas.y
    rgn := DllCall("CreateRectRgn", "int", 0, "int", 0, "int", VeilCanvas.w, "int", VeilCanvas.h, "ptr")
    hole := DllCall("CreateRectRgn", "int", x, "int", y, "int", x + seen.w, "int", y + seen.h, "ptr")
    DllCall("CombineRgn", "ptr", rgn, "ptr", rgn, "ptr", hole, "int", 4)   ; RGN_DIFF
    DllCall("DeleteObject", "ptr", hole)
    DllCall("SetWindowRgn", "ptr", Veil.Hwnd, "ptr", rgn, "int", 1)   ; (the window keeps the region)
}

; Whether the page shows through the veil: the veil doesn't cover the middle of it (see VeilHole).
PageThroughVeil() {
    if !(Veil && VeilCanvas && (seen := PageSeen()))
        return false
    rgn := DllCall("CreateRectRgn", "int", 0, "int", 0, "int", 0, "int", 0, "ptr")
    holed := DllCall("GetWindowRgn", "ptr", Veil.Hwnd, "ptr", rgn)   ; (0: no region, all of it covered)
        && !DllCall("PtInRegion", "ptr", rgn, "int", seen.x + seen.w // 2 - VeilCanvas.x, "int", seen.y + seen.h // 2 - VeilCanvas.y)
    DllCall("DeleteObject", "ptr", rgn)
    return holed
}

; Whether a window (a) is above another (b), nearer the front.
IsAbove(a, b) {
    h := a
    while (h := DllCall("GetWindow", "ptr", h, "uint", 2, "ptr"))   ; GW_HWNDNEXT (the next one down)
        if (h = b)
            return true
    return false
}

; The box, and the list beside it, back over the page (both are always on top), with the Claude key's
; glow just under the box.
BoxAbovePage() {
    for win in [PanelGui, BoxGui, PeekGui]
        if win
            DllCall("SetWindowPos", "ptr", win.Hwnd, "ptr", -1, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x13)   ; HWND_TOPMOST; SWP_NOSIZE | SWP_NOMOVE | SWP_NOACTIVATE
    if (GlowGui && BoxGui)
        DllCall("SetWindowPos", "ptr", GlowGui.Hwnd, "ptr", BoxGui.Hwnd, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x13)
}

; Where the page goes (its visible edges): right under the box, or above it if there isn't room under
; it, or beside it if there's room for neither, so it's never behind the box. It's as wide as the box
; and centered on it, and half the screen tall, unless you've resized it. It keeps to the side it opened on while the box grows and
; shrinks, as long as there's room there.
BrowserSpot() {
    MonitorGetWorkArea(BoxMonitor(), &left, &top, &right, &bottom)
    s := Look.s, gap := Round(8 * s), least := Round(220 * s)
    w := Browser.w || Max(Look.W, PageWidths.Has(PageExe) ? PageWidths[PageExe] : 0), want := Browser.h || Round((bottom - top) * 0.5)
    onLeft := InStr(Settings.Corner, "left")
    below := bottom - (Anim.baseY + Anim.h + gap), above := Anim.baseY - gap - top
    side := Browser.side
    if (side = "" || side = "below" && below < least || side = "above" && above < least || side = "beside" && Max(below, above) >= want) {
        side := below >= Min(want, 2 * least) || below >= above ? "below" : "above"
        if (Max(below, above) < least)
            side := "beside"
        Browser.side := side
    }
    ; (One wider than the box, as a browser that won't go as narrow as it: lined up with the box's side
    ; toward the edge of the screen it's at, rather than sticking out either side of it.)
    x := w <= Look.W ? Anim.baseX + (Look.W - w) // 2 : onLeft ? Anim.baseX : Anim.baseX + Look.W - w
    switch side {
        case "below": h := Max(least, Min(want, below)), y := Anim.baseY + Anim.h + gap
        case "above": h := Max(least, Min(want, above)), y := Anim.baseY - gap - h
        default: h := Min(want, bottom - top), y := Anim.baseY, x := onLeft ? Anim.baseX + Look.W + gap : Anim.baseX - gap - w
    }
    x := Max(left, Min(x, right - w)), y := Max(top, Min(y, bottom - h))
    return {x: Round(x), y: Round(y), w: Round(w), h: Round(h)}
}

; Keeps the page attached to the box as the box moves and grows, every frame: it's moved without
; waiting for Edge to catch up (and only resized when its size changes), so it glides along with the
; box. Now and then it checks the page is still open (or lets go of it once it's closed).
MoveBrowser() {
    static checkedAt := 0
    if (A_TickCount - checkedAt > 500) {
        checkedAt := A_TickCount
        if !PageOpen()
            return ClosePage()
        page := Browser.hwnd   ; minimized, made full screen, or out of sight (tucked into its tab, or with the box)
        Browser.min := DllCall("IsIconic", "ptr", page) || DllCall("IsZoomed", "ptr", page) || !DllCall("IsWindowVisible", "ptr", page)
        ; It went where it was put? (It's moved without waiting, and a move that came late, the box
        ; having moved on meanwhile, left it hanging well below the box, and the invisible window that
        ; hands it your scrolling in a game somewhere else.) If not, it's put there again; one that
        ; can't be made that small keeps the size it has. And that invisible window goes where it is.
        if (!Browser.min && !Browser.detached && !Browser.dragging && (set := Browser.set) && (seen := PageSeen())) {
            if (Abs(seen.x - set.x) > 2 || Abs(seen.y - set.y) > 2 || Abs(seen.w - set.w) > 2 || Abs(seen.h - set.h) > 2) {
                if (seen.w > set.w + 2)   ; (its browser won't go that narrow, like Opera: it opens this wide from now on)
                    Browser.w := seen.w, PageWidths[PageExe] := seen.w
                if (seen.h > set.h + 2)
                    Browser.h := seen.h
                Browser.set := ""
            }
            CatchPage(seen)
        }
    }
    if (Browser.min || Browser.detached)   ; (moved off the box: it stays where you put it)
        return
    spot := BrowserSpot(), set := Browser.set
    if (set && spot.x = set.x && spot.y = set.y && spot.w = set.w && spot.h = set.h)
        return
    sized := set && spot.w = set.w && spot.h = set.h
    Browser.set := spot, edges := Browser.inset || PageInsets()   ; (its window is bigger by its invisible border)
    ; SWP_NOZORDER | SWP_NOACTIVATE | SWP_ASYNCWINDOWPOS, and SWP_NOSIZE if it's only moving
    DllCall("SetWindowPos", "ptr", Browser.hwnd, "ptr", 0, "int", spot.x - edges.l, "int", spot.y - edges.t,
        "int", spot.w + edges.l + edges.r, "int", spot.h + edges.t + edges.b, "uint", 0x4014 | (sized ? 1 : 0))
    CatchPage(spot)
}

; Notices you moving or resizing the page yourself, by its title bar or its edges (see PageMoved).
WatchPage() {
    static callback := CallbackCreate(PageMoved, "F", 7), onEvent := CallbackCreate(PageEvent, "F", 7)
    Browser.hook := DllCall("SetWinEventHook", "uint", 0x800B, "uint", 0x800B, "ptr", 0, "ptr", callback,
        "uint", WinGetPID(Browser.hwnd), "uint", 0, "uint", 0, "ptr")   ; EVENT_OBJECT_LOCATIONCHANGE, from Edge
    Browser.hook2 := DllCall("SetWinEventHook", "uint", 0x000A, "uint", 0x0016, "ptr", 0, "ptr", onEvent,
        "uint", WinGetPID(Browser.hwnd), "uint", 0, "uint", 0, "ptr")   ; EVENT_SYSTEM_MOVESIZESTART to MINIMIZESTART, from the browser
}

; Stops noticing the page (see WatchPage): nothing more from Windows about it moving, resizing or
; being minimized, as it closes, or another takes its place, or captions close.
UnhookPage() {
    for h in [Browser.hook, Browser.hook2]
        if h
            DllCall("UnhookWinEvent", "ptr", h)
    Browser.hook := Browser.hook2 := 0
}

; You moved the page (or resized it): it comes off the box and stays where you put it, out of the
; way (let go of it near its place by the box and it snaps back on, see PageDropped), and it keeps
; the size you gave it. Only while you have hold of it (see PageEvent): the box's own moves can come
; late, and one was once taken for you moving it.
PageMoved(hook, event, hwnd, idObject, idChild, thread, time) {
    if (hwnd != Browser.hwnd || idObject != 0 || !Browser.set || Drag.mode || Browser.min || !Browser.dragging)
        return
    try {
        WinGetPos(&x, &y, &w, &h, hwnd)
        if (WinGetMinMax(hwnd) != 0)
            return
    } catch {
        return
    }
    edges := Browser.inset || PageInsets()   ; (its visible edges, inside its invisible border)
    x += edges.l, y += edges.t, w -= edges.l + edges.r, h -= edges.t + edges.b
    set := Browser.set
    if (Abs(x - set.x) <= 2 && Abs(y - set.y) <= 2 && Abs(w - set.w) <= 2 && Abs(h - set.h) <= 2)
        return   ; where the box put it
    if (Abs(w - set.w) > 2 || Abs(h - set.h) > 2)
        Browser.w := w, Browser.h := h
    Browser.set := {x: x, y: y, w: w, h: h}
    if !Browser.boxDrag   ; (dragged by the box, the invisible window over it keeps still till it's let go: where the mouse is on it stays true)
        CatchPage(Browser.set)
    if !Browser.detached
        Browser.detached := true, SetTimer(UpdateVisibility, -1)
    ; Near its place on the box, an outline shows where it'll snap back on when you let go.
    spot := BrowserSpot()
    ShowSnapSpot(Abs(x - spot.x) + Abs(y - spot.y) <= SnapZone() ? spot : "")
    SetTimer(WatchPageDrag, 30)
}

; In a game, clicking the page would bring its window in front of the game (out of the game, with the
; taskbar showing: Windows lets a click do that). So an invisible window lies over all of the page
; and hands your clicks, scrolling and pointing on to it as messages, which don't bring it in front:
; the game stays in front and the page still works (links, buttons, tabs, scrolling, picking out
; text), though you can't type into it there. Dragging it by its top (its tab strip or title bar)
; moves it too, by the box (see PassToPage). Only its own buttons at the top right (–, □, ✕) are
; left to it, as they are. seen: the page's visible edges, if they're known ({x, y, w, h}).
CatchPage(seen := "") {
    global Catcher
    static shaped := ""
    show := GameFront && PageOpen() && !Minimized && !Hidden && DllCall("IsWindowVisible", "ptr", Browser.hwnd)
        && !DllCall("IsIconic", "ptr", Browser.hwnd)
    if (show && !seen)
        show := (seen := PageSeen()) != ""
    if !show {
        if (Catcher && DllCall("IsWindowVisible", "ptr", Catcher.Hwnd))
            DllCall("ShowWindow", "ptr", Catcher.Hwnd, "int", 0)
        VeilHole()
        return
    }
    VeilHole(seen)   ; (with the Claude key, the page shows through its veil)
    if !Catcher {
        Catcher := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000 +E0x08000000")   ; never takes the front
        Catcher.BackColor := "000000"
        DllCall("SetLayeredWindowAttributes", "ptr", Catcher.Hwnd, "uint", 0, "uchar", 1, "uint", 2)   ; all but invisible, and still takes clicks
    }
    DllCall("SetWindowPos", "ptr", Catcher.Hwnd, "ptr", -1, "int", seen.x, "int", seen.y, "int", seen.w, "int", seen.h,
        "uint", 0x0050)   ; HWND_TOPMOST; SWP_NOACTIVATE | SWP_SHOWWINDOW
    if (shaped != seen.w "x" seen.h) {   ; (all of it but a gap for the page's own buttons, at its top right)
        shaped := seen.w "x" seen.h, gapW := Round(140 * Look.s)
        rgn := DllCall("CreateRectRgn", "int", 0, "int", 0, "int", seen.w, "int", seen.h, "ptr")
        cut := DllCall("CreateRectRgn", "int", seen.w - gapW, "int", 0, "int", seen.w, "int", PageStripH(), "ptr")
        DllCall("CombineRgn", "ptr", rgn, "ptr", rgn, "ptr", cut, "int", 4)   ; RGN_DIFF
        DllCall("DeleteObject", "ptr", cut)
        DllCall("SetWindowRgn", "ptr", Catcher.Hwnd, "ptr", rgn, "int", 1)   ; (the window keeps the region)
    }
}

; How tall the top of the page is that it's dragged by (its tab strip or title bar).
PageStripH() => Round(34 * Look.s)

; Where the page's window is on screen, by its visible edges ({x, y, w, h}), or "".
PageSeen() {
    rect := Buffer(16)
    if !(PageOpen() && DllCall("dwmapi\DwmGetWindowAttribute", "ptr", Browser.hwnd, "uint", 9, "ptr", rect, "uint", 16) = 0)   ; DWMWA_EXTENDED_FRAME_BOUNDS
        return ""
    return {x: NumGet(rect, 0, "int"), y: NumGet(rect, 4, "int"), w: NumGet(rect, 8, "int") - NumGet(rect, 0, "int"), h: NumGet(rect, 12, "int") - NumGet(rect, 4, "int")}
}

; A click (or the mouse moving, or a double click) on the invisible window over the page, handed on
; to the page at the same spot, as a message. Pressed at the top of the page (see PageStripH) and
; moved, the page moves with the mouse instead, moved by the box: Windows' own way of dragging a window
; by its title bar brings it in front, out of the game. Pressed there and let go without moving, it's
; a click like any other (on a tab, say).
PassToPage(msg, wParam, lParam) {
    static press := ""
    ; Something else took the mouse in the middle of it (WM_CAPTURECHANGED: something came in front
    ; of the game, say, and the invisible window was put away, see CatchPage), or the mouse is moving
    ; with the button no longer down (let go where the invisible window never heard of it): the press
    ; is over, as if you'd let go there. Otherwise the page kept on following the pointer, with no
    ; button held, until your next click.
    if (press && (msg = 0x215 && lParam != Catcher.Hwnd || msg = 0x200 && !(wParam & 1))) {   ; (lParam: what took it; wParam & 1: MK_LBUTTON)
        p := press, press := ""
        if (msg = 0x200 && Catcher && DllCall("GetCapture", "ptr") = Catcher.Hwnd)
            DllCall("ReleaseCapture")
        if p.moved {   ; (dropped, as when you let go: see below)
            Browser.dragging := Browser.boxDrag := false
            CatchPage()
            SetTimer(PageDropped, -1)
        }
    }
    if (msg = 0x215)   ; (nothing for the page itself in that)
        return 0
    if !PageOpen()
        return 0
    Anim.pageAt := A_TickCount   ; (the pointer's on the page: yours, see WatchMouse)
    pt := Buffer(8), NumPut("int", lParam << 48 >> 48, "int", lParam << 32 >> 48, pt)   ; (where on the invisible window)
    DllCall("ClientToScreen", "ptr", Catcher.Hwnd, "ptr", pt)
    sx := NumGet(pt, 0, "int"), sy := NumGet(pt, 4, "int")   ; (on screen)
    if ((msg = 0x201 || msg = 0x203) && (seen := PageSeen()) && sy - seen.y < PageStripH()) {
        press := {x: sx, y: sy, px: seen.x, py: seen.y, pw: seen.w, ph: seen.h, moved: false, wParam: wParam}
        DllCall("SetCapture", "ptr", Catcher.Hwnd)
        return 0
    }
    if press {
        if (msg = 0x200) {   ; (moving, still pressed; the invisible window keeps still meanwhile, see PageMoved)
            if (!press.moved && Abs(sx - press.x) + Abs(sy - press.y) < 5)
                return 0
            press.moved := true, Browser.dragging := Browser.boxDrag := true
            edges := Browser.inset || PageInsets()
            DllCall("SetWindowPos", "ptr", Browser.hwnd, "ptr", 0, "int", press.px + sx - press.x - edges.l, "int", press.py + sy - press.y - edges.t,
                "int", 0, "int", 0, "uint", 0x15)   ; SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE
            VeilHole({x: press.px + sx - press.x, y: press.py + sy - press.y, w: press.pw, h: press.ph})   ; (with the Claude key, the hole in its veil goes along)
            return 0
        }
        if (msg = 0x202) {   ; let go
            p := press, press := ""
            DllCall("ReleaseCapture")
            if p.moved {   ; (dropped: back on the box near its place, or it stays where you put it)
                Browser.dragging := Browser.boxDrag := false
                CatchPage()
                SetTimer(PageDropped, -1)
            } else {       ; (a click on it, pressed and let go)
                spot := PageSpot(p.x, p.y)
                DllCall("PostMessage", "ptr", Browser.hwnd, "uint", 0x201, "ptr", p.wParam, "ptr", spot)
                DllCall("PostMessage", "ptr", Browser.hwnd, "uint", 0x202, "ptr", wParam, "ptr", spot)
            }
            return 0
        }
    }
    spot := PageSpot(sx, sy)
    if (msg = 0x201 || msg = 0x203)
        DllCall("SetCapture", "ptr", Catcher.Hwnd)   ; (so a drag, like picking out text, keeps going)
    DllCall("PostMessage", "ptr", Browser.hwnd, "uint", msg, "ptr", wParam, "ptr", spot)
    if (msg = 0x202)
        DllCall("ReleaseCapture")
    return 0
}

; A spot on screen (x, y) as a spot on the page's window, the way a mouse message gives it.
PageSpot(x, y) {
    pt := Buffer(8), NumPut("int", x, "int", y, pt)
    DllCall("ScreenToClient", "ptr", Browser.hwnd, "ptr", pt)
    return (NumGet(pt, 4, "int") & 0xFFFF) << 16 | (NumGet(pt, 0, "int") & 0xFFFF)
}

; The mouse wheel over the invisible window over the page (usually caught before it gets there, see
; OverPage): the page scrolls.
CatcherWheel(wParam, lParam, msg, hwnd) {
    if !(Catcher && hwnd = Catcher.Hwnd && PageOpen())
        return
    ScrollPage(msg, wParam >> 16 & 0x8000 ? (wParam >> 16) - 0x10000 : wParam >> 16)
    return 0
}

; The mouse wheel over the page under the box, in a game (turned, delta, a notch being 120; msg:
; WM_MOUSEWHEEL, or WM_MOUSEHWHEEL sideways): handed to the page, where the pointer is. For that
; moment the invisible window over it lets the mouse through: Edge (like any Chromium browser) looks
; at what's under the pointer, and with another program's window there, it handed the wheel back to
; that window instead of scrolling, which handed it back to the page, and so on, over and over.
ScrollPage(msg, delta, mx := "", my := "") {
    static busy := false
    if (busy || !PageOpen() || !Catcher)
        return
    busy := true, Anim.pageAt := A_TickCount
    CoordMode("Mouse", "Screen")
    if (mx = "")   ; (where the pointer is, unless given)
        MouseGetPos(&mx, &my)
    keys := (GetKeyState("Shift") ? 0x4 : 0) | (GetKeyState("Ctrl") ? 0x8 : 0)   ; MK_SHIFT, MK_CONTROL
    ClickThrough(true, Catcher.Hwnd)
    DllCall("SendMessageTimeout", "ptr", Browser.hwnd, "uint", msg, "ptr", (delta & 0xFFFF) << 16 | keys, "ptr", (my & 0xFFFF) << 16 | (mx & 0xFFFF),
        "uint", 2, "uint", 150, "ptr*", 0)   ; SMTO_ABORTIFHUNG, 150 ms at most
    ClickThrough(false, Catcher.Hwnd)
    busy := false
}

; Whether the pointer is on the page under the box, where the invisible window over it (in a game)
; takes the mouse (see CatchPage).
OverPage() {
    if !(Catcher && PageOpen() && DllCall("IsWindowVisible", "ptr", Catcher.Hwnd))
        return false
    CoordMode("Mouse", "Screen")
    MouseGetPos(, , &win)
    return win = Catcher.Hwnd
}

CatcherDoubleClick(wParam, lParam, msg, hwnd) {
    if (Catcher && hwnd = Catcher.Hwnd)
        return PassToPage(msg, wParam, lParam)
}

; Puts the game you were playing back in front after something with the page brought the page (or
; nothing) in front instead: you dragging it by its title bar, minimizing or closing it, or it
; opening. So you're not left out of the game with the taskbar showing. With the Claude key, the box
; has the mouse and keyboard, and keeps them: its own window over the game goes back in front instead.
ReturnToGame() {
    if (Handed && Veil) {
        if !WinActive("ahk_id " Veil.Hwnd) {
            try WinActivate("ahk_id " Veil.Hwnd)
            OverVeil()
        }
        return
    }
    if !(Settings.GameMode && LastGame && A_TickCount - GameSeenAt < 120000 && WinExist(LastGame) && !WinActive(LastGame))
        return
    front := WinExist("A")
    if (!front || WinActive("ahk_exe " PageExe) || WinGetClass(front) ~= "^(Progman|WorkerW|Shell_TrayWnd)$")
        try WinActivate(LastGame)
}

; ---- The Claude key -----------------------------------------------------------------

; The Claude key (Settings.ClaudeKey, or the Stream Deck button claude-cursor.ahk) brings the box up
; with the pointer on it, to use with the mouse. In a game it's the way to: a game like The Witcher 3
; hides Windows' pointer in its menus as well as while you play, so the box can't tell them apart
; (see WatchMouse), and a game in front feels the mouse and keyboard whatever's under the pointer (it
; reads them directly: nothing outside the game can hide them from it). So there, the box takes them:
; an all-but-invisible window of its own covers the game's screen and takes the front (the game gets
; nothing, and Windows' taskbar stays down, as for anything full screen), the game dims a little
; behind it, and the box lands with a little jiggle and a ring in Claude's color. The key again, Esc,
; or a click on the game gives them back, with the pointer where the game left it.
ClaudeKey(*) {
    if Handed
        return (NoteEvent("the Claude key again: the game has the mouse and keyboard back"), GiveBackMouse())
    TakeMouse()
}

ClaudeKeyMessage() {
    static msg := DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.ClaudeKey", "uint")
    return msg
}

; The Stream Deck button (claude-cursor.ahk) pressed the Claude key. (Once, however many of the
; captions' windows the message reached.)
ClaudeKeyPressed(*) {
    static at := 0
    if (A_TickCount - at > 400)
        at := A_TickCount, SetTimer(ClaudeKey, -1)
    return 0
}

; Puts the Claude key on the key picked in the settings (or none).
SetClaudeKey() {
    static on := ""
    want := CLAUDE_KEY_NAMES.Has(Settings.ClaudeKey) ? "*" CLAUDE_KEY_NAMES[Settings.ClaudeKey] : ""
    if (want = on)
        return
    if (on != "")
        try Hotkey(on, "Off")
    if (want != "")
        try Hotkey(want, ClaudeKey, "On")
    on := want
}

TakeMouse() {
    global Handed, Took
    ; All in one go: nothing else starts meanwhile (like FrameLoop, which, started while this waited,
    ; would keep it waiting as long as the box moves), and no pause after bringing a window in front.
    Critical
    SetWinDelay(-1)
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    game := GameFront ? WinExist("A") : 0
    OpenFromPeek()   ; out it comes (from Claude's logo, if it's tucked away)
    Anim.jiggleAt := Settings.Animate ? A_TickCount : 0
    if game {
        Took := {x: mx, y: my, game: game}, Handed := true
        try {
            ShowVeil(game)
            NoteEvent("the Claude key: the box has the mouse and keyboard" (WinActive("ahk_id " Veil.Hwnd) ? "" : ", but it couldn't take the front from the game"))
            SetTimer(CheckStack, -500)
        } catch as e {   ; (never left halfway: the game keeps the mouse, and it's noted why)
            Handed := false
            try DllCall("ShowWindow", "ptr", Veil.Hwnd, "int", 0)
            NoteEvent("the Claude key couldn't take the mouse: " e.Message " (line " e.Line ")")
        }
        UpdateVisibility()
    }
    SetTimer(PointAtBox, -80)   ; (once it's been drawn where it goes)
    Kick()
}

; The pointer, in the middle of the box.
PointAtBox() {
    if (Anim.target && Anim.h)
        DllCall("SetCursorPos", "int", Anim.baseX + Look.W // 2, "int", Anim.baseY + Look.tabH + (Anim.h - Look.tabH) // 2)
}

; Gives the game back the mouse and keyboard (and the front, unless it already has it, or you went to
; something else: back), with the pointer where the game had it.
GiveBackMouse(back := true) {
    global Handed, LastChange
    if !Handed
        return
    Critical   ; (all in one go, see TakeMouse)
    SetWinDelay(-1)
    Handed := false, LastChange := A_TickCount
    if Composing
        StopTyping(false)   ; (what you typed waits in the typing box for next time)
    FadeVeil()
    if back {
        DllCall("SetCursorPos", "int", Took.x, "int", Took.y)
        if (Took.game && WinExist(Took.game))
            try WinActivate(Took.game)
    }
    CheckGameFront()   ; (the game in front again: see GuardGame)
    UpdateVisibility()
    Kick()
}

; The window over the game's screen while the box has the mouse and keyboard (see ClaudeKey): it takes
; the front, and shows the game softly blurred and a little darker, fading in quickly.
ShowVeil(game) {
    global Veil, VeilCanvas
    if !Veil
        Veil := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000")   ; (layered: its picture, faded in and out)
    info := Buffer(40, 0), NumPut("uint", 40, info)
    DllCall("GetMonitorInfo", "ptr", DllCall("MonitorFromWindow", "ptr", game, "uint", 2, "ptr"), "ptr", info)
    l := NumGet(info, 4, "int"), t := NumGet(info, 8, "int"), w := NumGet(info, 12, "int") - l, h := NumGet(info, 16, "int") - t
    if VeilCanvas
        FreeCanvas(VeilCanvas)
    VeilCanvas := VeilPicture(l, t, w, h), VeilCanvas.x := l, VeilCanvas.y := t
    ShowLayered(Veil.Hwnd, VeilCanvas, l, t, 0)   ; (see-through to start, see FadeVeil)
    DllCall("SetWindowPos", "ptr", Veil.Hwnd, "ptr", -1, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x53)   ; HWND_TOPMOST; SWP_NOSIZE | SWP_NOMOVE | SWP_NOACTIVATE | SWP_SHOWWINDOW
    DllCall("LockSetForegroundWindow", "uint", 2)   ; (let go of what keeps the game in front, see GuardGame)
    try WinActivate(Veil.Hwnd)
    ; What goes over the game with the box stays in sight: the page under the box (through a hole in
    ; the veil, see VeilHole), and the box, over the veil.
    KeepPageUp()
    CatchPage()
    OnTop()
    for win in [PanelGui, SettingsGui]   ; (not "gui": that would hide Gui() in here)
        if win
            DllCall("SetWindowPos", "ptr", win.Hwnd, "ptr", -1, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x13)
    FadeVeil()
}

; The veil fading in (while the box has the mouse) or out (and then away), quickly: over 150 ms. Once
; it's all the way in, it's solid (its picture has no see-through in it): Windows then doesn't blend
; the game under it with it at every refresh, a whole screen of it, which made the box stutter over a
; game. It's see-through again to fade out.
FadeVeil() {
    global VeilCanvas
    static from := 0, to := 0, at := 0, level := 0
    if ((Handed ? 1 : 0) != to) {   ; (a new fade, from wherever the last got to)
        from := level, to := Handed ? 1 : 0, at := A_TickCount, SetTimer(FadeVeil, 15)
        if (Veil && VeilCanvas && !to)   ; (see-through again, its picture and all)
            ShowLayered(Veil.Hwnd, VeilCanvas, VeilCanvas.x, VeilCanvas.y, 255 * level)
    }
    p := Min(1, (A_TickCount - at) / 150), level := from + (to - from) * (1 - (1 - p) ** 2)
    if Veil   ; (only how see-through it is changes: no picture needed)
        DllCall("UpdateLayeredWindow", "ptr", Veil.Hwnd, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "uint", 0,
            "uint*", Round(255 * level) << 16 | 1 << 24, "uint", 2)
    if (p >= 1) {
        SetTimer(FadeVeil, 0)
        if (to && Veil && VeilCanvas && VeilCanvas.solid) {   ; all the way in: solid (ULW_OPAQUE)
            pt := Buffer(8), size := Buffer(8), origin := Buffer(8, 0)
            NumPut("int", VeilCanvas.x, "int", VeilCanvas.y, pt), NumPut("int", VeilCanvas.w, "int", VeilCanvas.h, size)
            DllCall("UpdateLayeredWindow", "ptr", Veil.Hwnd, "ptr", 0, "ptr", pt, "ptr", size, "ptr", VeilCanvas.hdc, "ptr", origin, "uint", 0,
                "uint*", 255 << 16 | 1 << 24, "uint", 4)
        }
        if (!to && Veil) {
            DllCall("ShowWindow", "ptr", Veil.Hwnd, "int", 0)
            if VeilCanvas
                FreeCanvas(VeilCanvas), VeilCanvas := ""
        }
    }
}

; What the veil shows: the game's screen (l, t, w, h) as it is, without the box's own windows,
; softly blurred and a little darker. It's taken once, since the game waits meanwhile. For a blur
; that's smooth at full size (not blocky, as just blowing up a small picture was), the screen is
; shrunk to a quarter (each pixel the average of what it covers), given a real Gaussian blur there
; (GDI+'s, which only blurs across, so it's done across, turned, and across again), and blown back
; up. If it can't be taken, just a see-through darkening.
VeilPicture(l, t, w, h) {
    at := MsNow()
    cv := MakeCanvas(w, h)
    sw := Max(1, w // 4), sh := Max(1, h // 4)
    ours := []   ; (the box's windows are left out of the picture, though they stay on screen)
    for win in [BoxGui, PeekGui, PanelGui, SettingsGui, GlowGui]
        if (win && DllCall("SetWindowDisplayAffinity", "ptr", win.Hwnd, "uint", 0x11))   ; WDA_EXCLUDEFROMCAPTURE
            ours.Push(win.Hwnd)
    DllCall("dwmapi\DwmFlush")
    screen := DllCall("GetDC", "ptr", 0, "ptr")
    small := DllCall("CreateCompatibleDC", "ptr", screen, "ptr")
    hbm := DllCall("CreateCompatibleBitmap", "ptr", screen, "int", sw, "int", sh, "ptr")
    old := DllCall("SelectObject", "ptr", small, "ptr", hbm, "ptr")
    DllCall("SetStretchBltMode", "ptr", small, "int", 4)   ; HALFTONE
    DllCall("SetBrushOrgEx", "ptr", small, "int", 0, "int", 0, "ptr", 0)
    copied := DllCall("StretchBlt", "ptr", small, "int", 0, "int", 0, "int", sw, "int", sh, "ptr", screen, "int", l, "int", t, "int", w, "int", h, "uint", 0x00CC0020)   ; SRCCOPY
    DllCall("SelectObject", "ptr", small, "ptr", old)
    DllCall("DeleteDC", "ptr", small)
    DllCall("ReleaseDC", "ptr", 0, "ptr", screen)
    for hwnd in ours
        DllCall("SetWindowDisplayAffinity", "ptr", hwnd, "uint", 0)
    if copied {
        DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", 0, "ptr*", &shot := 0)
        DllCall("gdiplus\GdipCloneBitmapAreaI", "int", 0, "int", 0, "int", sw, "int", sh, "int", 0x26200A, "ptr", shot, "ptr*", &pic := 0)   ; (32-bit, which the blur needs)
        DllCall("gdiplus\GdipDisposeImage", "ptr", shot)
        if !DllCall("gdiplus\GdipCreateEffect", "ptr", Guid("{633C80A4-1843-482b-9EF2-BE2834C5FDD4}"), "ptr*", &blur := 0) {   ; GDI+'s blur
            params := Buffer(8, 0), NumPut("float", 12.0, "int", 0, params)   ; its radius (at a quarter size), and not growing the picture
            DllCall("gdiplus\GdipSetEffectParameters", "ptr", blur, "ptr", params, "uint", 8)
            DllCall("gdiplus\GdipBitmapApplyEffect", "ptr", pic, "ptr", blur, "ptr", 0, "int", 0, "ptr", 0, "ptr", 0)
            DllCall("gdiplus\GdipImageRotateFlip", "ptr", pic, "int", 1)   ; a quarter turn
            DllCall("gdiplus\GdipBitmapApplyEffect", "ptr", pic, "ptr", blur, "ptr", 0, "int", 0, "ptr", 0, "ptr", 0)
            DllCall("gdiplus\GdipImageRotateFlip", "ptr", pic, "int", 3)   ; and back
            DllCall("gdiplus\GdipDeleteEffect", "ptr", blur)
        }
        DllCall("gdiplus\GdipCreateImageAttributes", "ptr*", &attr := 0)
        DllCall("gdiplus\GdipSetImageAttributesWrapMode", "ptr", attr, "int", 3, "uint", 0, "int", 0)   ; TileFlipXY: soft right to the edges
        DllCall("gdiplus\GdipSetInterpolationMode", "ptr", cv.g, "int", 6)   ; HighQualityBilinear
        DllCall("gdiplus\GdipSetPixelOffsetMode", "ptr", cv.g, "int", 4)     ; Half: lined up with the screen
        DllCall("gdiplus\GdipDrawImageRectRectI", "ptr", cv.g, "ptr", pic, "int", 0, "int", 0, "int", w, "int", h,
            "int", 0, "int", 0, "int", sw, "int", sh, "int", 2, "ptr", attr, "ptr", 0, "ptr", 0)   ; UnitPixel
        DllCall("gdiplus\GdipDisposeImageAttributes", "ptr", attr)
        DllCall("gdiplus\GdipDisposeImage", "ptr", pic)
    }
    DllCall("DeleteObject", "ptr", hbm)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(copied ? 0.22 : 0.3, 0x000000))
    DllCall("gdiplus\GdipFillRectangleI", "ptr", cv.g, "ptr", Brush, "int", 0, "int", 0, "int", w, "int", h)
    NoteEvent(Format("the Claude key: the game blurred in {:.0f} ms ({}x{})", MsNow() - at, w, h))
    cv.solid := copied != 0   ; (a picture of the game all over: nothing see-through, see FadeVeil)
    return cv
}

; Puts a picture (a canvas, see MakeCanvas) on screen as a layered window at x, y: each pixel as
; see-through as it was drawn, and all of it alpha (0 to 255). Only its top left w by h, if given.
ShowLayered(hwnd, cv, x, y, alpha, w := 0, h := 0) {
    pt := Buffer(8), size := Buffer(8), origin := Buffer(8, 0)
    NumPut("int", x, "int", y, pt), NumPut("int", w || cv.w, "int", h || cv.h, size)
    DllCall("UpdateLayeredWindow", "ptr", hwnd, "ptr", 0, "ptr", pt, "ptr", size, "ptr", cv.hdc,
        "ptr", origin, "uint", 0, "uint*", Round(alpha) << 16 | 1 << 24, "uint", 2)
}

; A neon strip in Claude's color around the box, glowing, a visible (0 to 1), while the Claude key has
; handed it the mouse and keyboard (x, y: the box's window, with the tabs above it; w, h: the box).
; It's in a window of its own just under the box's, drawn again only when the box changes shape.
PlaceGlow(x, y, w, h, a) {
    global GlowGui, GlowCanvas
    static drawn := "", glowShown := ""
    if (a <= 0.01) {
        if (GlowGui && DllCall("IsWindowVisible", "ptr", GlowGui.Hwnd))
            DllCall("ShowWindow", "ptr", GlowGui.Hwnd, "int", 0)
        glowShown := ""
        return
    }
    if !GlowGui
        GlowGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000 +E0x20 +E0x08000000")   ; layered, lets clicks through, never takes the front
    tab := TabShape(), key := w "x" h "|" Look.colors.claude "|" (tab ? Round(tab.left) "-" Round(tab.right) : "")
    if (drawn != key) {
        drawn := key
        if GlowCanvas
            FreeCanvas(GlowCanvas)
        GlowCanvas := GlowPicture(w, h, tab)
    }
    ; Only when it's changed: sending its picture every frame, over a game, made the box stutter.
    m := GlowMargin(), glowSpot := Round(x - m) "," Round(y - m) "," Round(255 * a) "|" key
    if (glowSpot == glowShown)
        return
    glowShown := glowSpot
    ShowLayered(GlowGui.Hwnd, GlowCanvas, Round(x - m), Round(y - m), 255 * a)
    DllCall("SetWindowPos", "ptr", GlowGui.Hwnd, "ptr", BoxGui.Hwnd, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x53)   ; just under the box
}

; How far the glow reaches out from the box.
GlowMargin() => Round(32 * Look.s)

; The neon (see PlaceGlow) for a box w by h with its tab (see TabShape, or ""), as a canvas GlowMargin
; bigger all round, with the tab row above the box: the box's outline, tab and all, stroked wider and
; fainter over and over for the glow coming off it (tight, fading out within the margin), then a thin
; bright strip on it, a little lighter than Claude's color, like a lit tube. (The box covers the inside.)
GlowPicture(w, h, tab) {
    s := Look.s, m := GlowMargin(), c := Look.colors.claude
    cv := MakeCanvas(w + 2 * m, h + Look.tabH + 2 * m)
    DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", cv.g, "float", m, "float", m + Look.tabH, "int", 0)
    path := tab ? TabbedPath(0.5, 0.5, w - 1, h - 1, Look.radius, tab) : RoundedPath(0.5, 0.5, w - 1, h - 1, Look.radius)
    loop 14 {   ; (the widest first)
        i := 15 - A_Index
        Stroke(cv.g, path, (3 + i * 4.2) * s, ARGB(0.12 * (1 - (i - 1) / 14) ** 1.6, c))
    }
    Stroke(cv.g, path, 3.2 * s, ARGB(0.9, c))                         ; the strip
    Stroke(cv.g, path, 1.4 * s, ARGB(0.85, Blend(c, 0xFFFFFF, 0.45)))   ; its bright middle
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
    return cv
}

; Draws along a path with a pen width pixels wide, in color (ARGB), with round corners.
Stroke(g, path, width, color) {
    DllCall("gdiplus\GdipCreatePen1", "uint", color, "float", width, "int", 2, "ptr*", &pen := 0)
    DllCall("gdiplus\GdipSetPenLineJoin", "ptr", pen, "int", 2)
    DllCall("gdiplus\GdipDrawPath", "ptr", g, "ptr", pen, "ptr", path)
    DllCall("gdiplus\GdipDeletePen", "ptr", pen)
}

; How near its place on the box (across and down, added up) the page has to be let go of to snap back on.
SnapZone() => 110 * Look.s

; While you're dragging the page: once you let go of the mouse button, it snaps back on or stays.
WatchPageDrag() {
    if GetKeyState("LButton", "P")
        return
    SetTimer(WatchPageDrag, 0)
    ShowSnapSpot("")
    PageDropped()
    ReturnToGame()   ; (dragging it by its title bar brought it in front)
}

; The outline showing where the page will snap back on (spot, its visible edges), in Claude's color,
; or "" to hide it.
ShowSnapSpot(spot) {
    global SnapGui, SnapCanvas, Canvas
    static snapShown := ""
    if !spot {
        if (SnapGui && snapShown != "")
            DllCall("ShowWindow", "ptr", SnapGui.Hwnd, "int", 0), snapShown := ""
        return
    }
    key := spot.x "," spot.y "," spot.w "," spot.h
    if (key = snapShown)
        return
    if !SnapGui
        SnapGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000 +E0x20 +E0x08000000")   ; see-through, and clicks go through it
    if (!SnapCanvas || SnapCanvas.w != spot.w || SnapCanvas.h != spot.h) {
        if SnapCanvas
            FreeCanvas(SnapCanvas)
        SnapCanvas := MakeCanvas(spot.w, spot.h)
    }
    s := Look.s, c := Look.colors, r := 10 * s
    was := A_IsCritical
    Critical   ; (so the box doesn't draw on it meanwhile: see Draw)
    saved := Canvas, Canvas := SnapCanvas   ; (the drawing helpers draw on Canvas)
    DllCall("gdiplus\GdipGraphicsClear", "ptr", Canvas.g, "uint", 0)
    FillRoundRect(1, 1, spot.w - 2, spot.h - 2, r, ARGB(0.14, c.claude))
    path := RoundedPath(1.5 * s, 1.5 * s, spot.w - 3 * s, spot.h - 3 * s, r)
    Stroke(Canvas.g, path, 2 * s, ARGB(0.75, c.claude))
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
    Canvas := saved
    Critical(was)
    ShowLayered(SnapGui.Hwnd, SnapCanvas, spot.x, spot.y, 255)
    if (snapShown = "")
        DllCall("ShowWindow", "ptr", SnapGui.Hwnd, "int", 8)   ; SW_SHOWNA
    snapShown := key
}

; ---- When older messages were sent ------------------------------------------------

; Every 2 seconds: whether a Code session has finished a reply. Claude's window only shows the page
; it's on, but Code sessions are kept as transcripts (in .claude\projects; Cowork's are kept apart)
; as they go, and a finished reply ends with Claude's message saying so (end_turn). While you're on
; the Chat and Cowork page, each one counts on the Code tab (and Claude's logo) until you go there and
; read it (see CheckSeen). Only what's added since captions started counts (all of a session started
; since); side conversations, like a subagent's, don't. Each transcript is read on from where it got
; to, a whole line at a time.
WatchCodeSessions() {
    static at := Map(), ids := Map(), pastFirst := false   ; (pastFirst: once it has looked them all over the first time)
    static busy := Map(), texts := Map()   ; (when each session last did something, "" or 0 once it's done; the messages with words counted)
    global LastChange
    loop files CODE_SESSIONS "\*.jsonl", "R" {
        path := A_LoopFileFullPath, size := A_LoopFileSize
        if !at.Has(path)
            at[path] := pastFirst ? 0 : size
        if (size < at[path])   ; (written over: from its end again)
            at[path] := size
        if (size = at[path])
            continue
        try {
            f := FileOpen(path, "r"), f.Pos := at[path]
            got := f.RawRead(buf := Buffer(Min(size - at[path], 4 << 20)))
            f.Close()
        } catch
            continue
        last := got   ; (up to the last whole line: the rest is still being written, and waits)
        while (last > 0 && NumGet(buf, last - 1, "uchar") != 10)
            last--
        if !last {
            if (got >= 4 << 20)   ; (a line longer than all that is skipped)
                at[path] += got
            continue
        }
        at[path] += last
        loop parse StrGet(buf, last, "UTF-8"), "`n", "`r" {
            ; Each line is one part of a message. Whose it is comes first, in its "message" (what's
            ; said inside is in quotes, with its own quotes escaped, so it can't look like this).
            line := A_LoopField, head := SubStr(line, 1, 400)
            if (line = "" || InStr(head, '"isSidechain":true'))   ; (side conversations, like a subagent's)
                continue
            ; Claude Code writes older lines out again at times (compacting a session, it wrote out
            ; the messages from the hour before again): those aren't new.
            if (LineAge(line) > 180)
                continue
            if InStr(head, '"message":{"role":"user"') {   ; you sent something, or a tool Claude used answered: it's working
                ; ...except what a command of Claude Code's own writes down as yours: what it said
                ; once done (like "Compacted", after /compact) means it's finished, and notes along
                ; with it (like the summary a compacted session carries on from) change nothing.
                if (Compacting.at && (InStr(line, '"isCompactSummary":true') || InStr(head, "<local-command-stdout>Compacted")))
                    CompactDone("Claude Code says it's compacted")
                ; Claude's window shows it as a message of its own ("Compacted session · saved 360.4k
                ; tokens"): on the Chat and Cowork page, it's counted on the Code tab like one.
                if (InStr(head, "<local-command-stdout>Compacted") && Page = "chat")
                    CodeMessage(), CodeReplyDone()
                if RegExMatch(head, '"message":\{"role":"user","content":"<local-command-(stdout|stderr)>')
                    busy[path] := 0
                else if !(InStr(head, '"content":"<local-command-caveat>') || InStr(line, '"isMeta":true') || InStr(line, '"isCompactSummary":true'))
                    busy[path] := InStr(line, "[Request interrupted by user") ? 0 : A_TickCount
                continue
            }
            if !RegExMatch(head, '"message":\{[^{}]*"role":"assistant"')
                continue
            busy[path] := A_TickCount
            id := RegExMatch(head, '"id":"(msg_\w+)"', &m) ? m[1] : ""
            ; A message with words in it (not just thinking, or using a tool): counted (a message
            ; can take more than one line).
            if (id != "" && InStr(line, '"content":[{"type":"text","text":"') && !InStr(line, '"content":[{"type":"text","text":""') && !texts.Has(id)) {
                texts[id] := true
                if (Page = "chat")
                    CodeMessage()
            }
            if InStr(line, '"stop_reason":"end_turn"') {   ; done, until you say something again
                busy[path] := 0
                if (id != "" && !ids.Has(id)) {
                    ids[id] := true
                    if (Page = "chat")
                        CodeReplyDone()
                }
            }
        }
    }
    ; Working: a session that's said or done something (and hasn't finished) in the last 10 minutes.
    working := false
    for path, when in busy
        if (when && A_TickCount - when < 600000)
            working := true
    if (working != Anim.codeWorking) {
        Anim.codeWorking := working
        if (working && Page = "chat")
            NoteEvent("a Code session is working while you're on the Chat and Cowork page: a blue dot on the Code tab and Claude's logo")
        if (!working && Page = "code")   ; (finished: Hide after counts from now, see UpdateVisibility)
            LastChange := Max(LastChange, A_TickCount)
        Kick(), UpdateVisibility()
    }
    if (ids.Count > 2000)
        ids := Map(), texts := Map()
    pastFirst := true
}

; How long ago a line of a Code session's transcript happened (by its own time), in seconds; 0 if
; it doesn't say.
LineAge(line) {
    if !RegExMatch(line, '"timestamp":"(\d{4})-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)', &m)
        return 0
    try return DateDiff(A_NowUTC, m[1] m[2] m[3] m[4] m[5] m[6], "Seconds")
    return 0
}

; Claude posted a message in a Code session while you're on the Chat and Cowork page: counted on the
; Code tab and on Claude's logo (in blue, with a little pop), until you go to the Code page (see
; NoticePage).
CodeMessage() {
    Anim.peekCounts.code += 1, Anim.badgeAt := A_TickCount, Anim.badgePage := "code"
    NoteEvent("a message in a Code session while you're on the Chat and Cowork page: counted on the Code tab, " Anim.peekCounts.code)
    Kick()
}

; A Code session finished its reply while you're on the Chat and Cowork page: Claude's logo spins, if
; the box is tucked away (its last message is already counted, see CodeMessage).
CodeReplyDone() {
    if (PeekWanted() && (!Anim.target || Minimized))
        Anim.spinAt := Settings.TuckWiggle ? A_TickCount : 0
    NoteEvent("a Code reply finished while you're on the Chat and Cowork page (" Anim.peekCounts.code " counted)")
    Kick()
}

; Claude's window doesn't say when older messages were sent. But Code sessions (and Cowork ones) are
; kept on your computer as transcripts (in .claude\projects), with the time of every message. They're
; read a little at a time in the background (see ReadTranscripts), and each of your messages' time is
; kept by its words (see TimeKey), with when Claude started replying ({said, replied}). Chats aren't
; kept anywhere readable, so the box notes the times of every message it sees itself, in TIMES_FILE
; (see NoteTime): scrolling back in a chat later (even after captions restart) shows them too. They're
; all kept in Times (made at the top, as captions start up).

; Reads the times the box noted before (the later line for a message wins), and keeps the file from
; growing without end: past 5000 lines, it's written again with just the newest of each.
LoadNotedTimes() {
    try text := FileRead(TIMES_FILE, "UTF-8")
    catch
        return
    lines := 0
    loop parse text, "`n", "`r" {
        f := StrSplit(A_LoopField, "`t")
        if (f.Length >= 3 && f[1] != "")
            Times[f[1]] := {said: f[2], replied: f[3]}, lines++
    }
    if (lines > 5000) {
        out := ""
        for key, when in Times
            out .= key "`t" when.said "`t" when.replied "`n"
        try FileDelete(TIMES_FILE)
        try FileAppend(out, TIMES_FILE, "UTF-8")
    }
}

; Notes when you said something (said, like "20260927163600") and when Claude replied, for scrolling
; back to it later.
NoteTime(you, said, replied := "") {
    if ((key := TimeKey(you)) = "")
        return
    Times[key] := {said: said, replied: replied}
    AddToLog(TIMES_FILE, key "`t" said "`t" replied "`n")
}

; What a message is known by: its letters and numbers (the first 120 of them).
TimeKey(text) => SubStr(RegExReplace(text, "[^\p{L}\p{N}]+"), 1, 120)

; An exchange read from Claude's window gets its times, if they're known: as "4:32 PM", or with the
; day, "Sep 26, 11:25 AM", if it wasn't today.
GiveTimes(ex) {
    if (ex.time != "" || !Times.Has(key := TimeKey(ex.you)))
        return false
    when := Times[key]
    ex.time := ClockTime(when.said), ex.replyTime := when.replied != "" ? ClockTime(when.replied) : ""
    return true
}

ClockTime(stamp) => FormatTime(stamp, SubStr(stamp, 1, 8) = SubStr(A_Now, 1, 8) ? "h:mm tt" : "MMM d, h:mm tt")

; Reads the transcripts from the last 30 days, newest first, 3 ms at a time so the box stays smooth
; (timed by MsNow: timed by A_TickCount, which only moves in steps of 15 or 16 ms, 20 ms came out as
; 16 to 31, several frames missed each time), going on from where it got to in each (they grow as a
; session goes on). The first time, it reads just the end of each (TRANSCRIPT_TAIL): the box only
; needs the times of recent messages, and a long Code session's transcript runs to 150 MB, nearly all
; of it what Claude's tools gave back (its last 4 MB still held the last ten things you said in it).
; Once it has read them all, the older messages in the box get their times (see FillTimes), and it
; checks again for new ones a minute later.
ReadTranscripts() {
    static files := [], at := Map(), next := 1, open := "", pending := "", lineAt := -1   ; (lineAt: where the line it last read started)
    if (next = 1 && !open && !files.Length) {
        loop files CODE_SESSIONS "\*.jsonl", "R"
            if (DateDiff(A_Now, A_LoopFileTimeModified, "Days") <= 30)
                files.Push({path: A_LoopFileFullPath, time: A_LoopFileTimeModified})
        loop files.Length - 1 {   ; newest first
            i := A_Index
            loop files.Length - i
                if (files[A_Index].time < files[A_Index + 1].time)
                    t := files[A_Index], files[A_Index] := files[A_Index + 1], files[A_Index + 1] := t
        }
    }
    sliceAt := MsNow()
    while (MsNow() - sliceAt < 3) {
        if !open {
            if (next > files.Length) {   ; all read
                files := [], next := 1
                FillTimes()
                SetTimer(ReadTranscripts, 60000)
                return
            }
            file := files[next]
            try open := FileOpen(file.path, "r", "UTF-8")
            catch {
                next++
                continue
            }
            if at.Has(file.path)
                open.Pos := at[file.path]
            else if (open.Length > TRANSCRIPT_TAIL) {   ; (the first time: just its end, from the start of a line)
                open.Pos := open.Length - TRANSCRIPT_TAIL
                try open.ReadLine()
            }
            pending := "", lineAt := -1
        }
        if open.AtEOF {
            ; A last line Claude Code is still writing (no newline at its end yet) is read again, whole,
            ; next time, as WatchCodeSessions does: carried on from the middle of it, that message never
            ; got its time.
            endAt := open.Pos
            if (lineAt >= 0 && endAt > lineAt) {
                try {
                    open.Pos := endAt - 1
                    if (open.ReadUChar() != 10)   ; (not a newline)
                        endAt := lineAt
                }
            }
            at[files[next].path] := endAt, open.Close(), open := "", next++
            continue
        }
        lineAt := open.Pos
        try TranscriptLine(open.ReadLine(), &pending)   ; (one odd line doesn't stop the rest)
    }
    SetTimer(ReadTranscripts, 30)
}

; One line of a transcript: one of your messages (its words and time), or the first of Claude's
; after it (when it started replying). Tool results, and side conversations, aren't messages.
TranscriptLine(line, &pending) {
    ; What you say while Claude is working is kept on a line of its own, as it's queued up.
    if (InStr(line, '{"type":"queue-operation","operation":"enqueue"') = 1) {
        if (RegExMatch(line, "(\d{4})-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)", &m) && RegExMatch(line, '"content":"((?:[^"\\]++|\\.)*+)"', &c))
            KeepTime(c[1], LocalTime(m), &pending)
        return
    }
    head := SubStr(line, 1, 300)   ; (yours say what they are before the message; Claude's say it in the message)
    if InStr(head, '"isSidechain":true')
        return
    kind := RegExMatch(head, '^\{[^{]*?"type":"user","message"') ? "user" : InStr(head, '"role":"assistant"') ? "assistant" : ""
    if (kind = "")
        return
    if !(at := InStr(line, '"timestamp":"', , -1)) || !RegExMatch(line, "(\d{4})-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)", &m, at)
        return
    when := LocalTime(m)
    if (kind = "assistant") {
        if pending
            pending.replied := when, pending := ""
        return
    }
    if InStr(line, '"tool_result"')
        return
    if !(RegExMatch(line, '"role":"user","content":"((?:[^"\\]++|\\.)*+)"', &c) || RegExMatch(line, '"type":"text","text":"((?:[^"\\]++|\\.)*+)"', &c))
        return
    KeepTime(c[1], when, &pending)
}

; A transcript's time (its year, month, day, hour, minute and second, in UTC) as a time here, by
; Windows' clock rules for that day: a message from before the clocks went forward or back an hour
; still shows the time it was here then. (Taking just this moment's difference from UTC, for all
; 30 days of them, put those an hour out, and every new one too once captions ran on past a change.)
LocalTime(m) {
    static utcTime := Buffer(16), hereTime := Buffer(16)   ; SYSTEMTIMEs
    NumPut("ushort", Integer(m[1]), "ushort", Integer(m[2]), "ushort", 0, "ushort", Integer(m[3]),
        "ushort", Integer(m[4]), "ushort", Integer(m[5]), "ushort", Integer(m[6]), "ushort", 0, utcTime)
    if DllCall("SystemTimeToTzSpecificLocalTime", "ptr", 0, "ptr", utcTime, "ptr", hereTime)   ; (0: the time zone this computer's in)
        return Format("{:04}{:02}{:02}{:02}{:02}{:02}", NumGet(hereTime, 0, "ushort"), NumGet(hereTime, 2, "ushort"),
            NumGet(hereTime, 6, "ushort"), NumGet(hereTime, 8, "ushort"), NumGet(hereTime, 10, "ushort"), NumGet(hereTime, 12, "ushort"))
    return DateAdd(m[1] m[2] m[3] m[4] m[5] m[6], Round(DateDiff(A_Now, A_NowUTC, "Seconds") / 900) * 15, "Minutes")   ; (if Windows couldn't say: this moment's difference)
}

; Keeps when you said something (text, as it's written in the transcript), by its words.
KeepTime(text, when, &pending) {
    while RegExMatch(text, "\\u([0-9a-fA-F]{4})", &u)
        text := StrReplace(text, u[0], Chr(Integer("0x" u[1])))
    text := StrReplace(StrReplace(StrReplace(text, "\n", " "), '\"', '"'), "\\", "\")
    if ((key := TimeKey(text)) = "")
        return
    Times[key] := pending := {said: when, replied: ""}   ; (said again later: the latest time)
}

; The older messages in the box, and in the other conversations put away, get their times now that
; they're known.
FillTimes() {
    any := false
    for ex in History
        any := (ex.HasOwnProp("no") && GiveTimes(ex)) || any
    for key, saved in Conversations
        for ex in saved.history
            any := (ex.HasOwnProp("no") && GiveTimes(ex)) || any
    if any
        Kick()
}

; ---- Typing to Claude --------------------------------------------------------------

; How tall the typing box at the bottom of the box is, with the room above it (0 with TypeBox off).
; It grows a line at a time as what you type wraps, up to four.
TypingBoxH() => Settings.TypeBox ? Max(Look.sendD, Anim.inputLines * Look.editLineH) + 2 * Look.inputPad + Look.gap : 0

; The typing box's color: a little lighter than the box (a little darker, on a light one).
InputFill() => Look.colors.light ? Darker(Look.colors.bg, 0.05) : Blend(Look.colors.bg, 0xFFFFFF, 0.07)

; The typing box along the bottom of the box, like Claude's own message box: a rounded field saying
; what to do ("Reply to Claude…" on the Chat page, "Message Claude…" on the Code page), or showing
; what you've typed but not sent, with a send button on its right that turns Claude's orange once
; there's something to send. Its outline takes the page's color while you type. Click it to type
; (see StartTyping); what you type goes in a real text box laid over it.
DrawInput(top, h) {
    s := Look.s, c := Look.colors, x := Look.pad, w := Look.inner, r := Min(h / 2, 14 * s)
    solid := Max(0.9, Settings.Background / 100), hot := Anim.hot = "input" || Anim.hot = "send"
    FillRoundRect(x, top, w, h, r, ARGB(solid, InputFill()))
    path := RoundedPath(x + 0.5, top + 0.5, w - 1, h - 1, r)
    Stroke(Canvas.g, path, s, ARGB(Composing ? 0.45 : Faint(hot ? 0.24 : 0.13), Composing ? PageColor() : c.text))
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
    ; The send button: a rounded square with an arrow pointing up, at the bottom right.
    d := Look.sendD, bx := x + w - Look.inputPad - d + 2 * s, by := top + h - Look.inputPad - d + (h - 2 * Look.inputPad > d ? 0 : (h - 2 * Look.inputPad - d) / 2)
    ready := Composing ? Trim(EditBox.Value, " `t`r`n") != "" : Typed != ""
    FillRoundRect(bx, by, d, d, d * 0.32, ready ? ARGB(Anim.hot = "send" ? 1 : 0.92, c.claude) : ARGB(0.14, c.text))
    cx := bx + d / 2, cy := by + d / 2, arm := d * 0.24, points := Buffer(24)
    arrow := ready ? 0xFFFFFFFF : ARGB(Faint(0.45), c.text)
    NumPut("float", cx, "float", cy + arm * 1.15, "float", cx, "float", cy - arm, points)
    DrawLines(points, 2, 1.8 * s, arrow)
    NumPut("float", cx - arm * 0.9, "float", cy - arm * 0.1, "float", cx, "float", cy - arm, "float", cx + arm * 0.9, "float", cy - arm * 0.1, points)
    DrawLines(points, 3, 1.8 * s, arrow)
    Anim.inputRect := {left: x, top: top, right: x + w, bottom: top + h, sendX: bx}
    if Composing   ; (the real text box is on top)
        return
    text := Typed != "" ? StrReplace(StrReplace(Typed, "`r"), "`n", " ") : Page = "code" ? "Message Claude…" : "Reply to Claude…"
    DrawWord(FitWidth(text, Look.font, bx - x - Look.inputPad - 10 * s), Look.font, x + Look.inputPad + 3 * s,
        top + (h - Look.lineH) / 2 + Look.textDy, Typed != "" ? 0.8 : 0.42, c.text, 0)
}

; Starts typing to Claude in the typing box: a real text box, in the box's font and colors, is laid
; over it (see PlaceEditor) and takes the keyboard. Enter sends what you typed to Claude (see
; SendTyped), Shift+Enter starts a new line, and Esc stops, keeping what you typed for later (as it
; does if you click somewhere else).
StartTyping() {
    global Composing, EditGui, EditBox, TypedFrom
    if (Composing || !Settings.TypeBox)
        return
    c := Look.colors, fill := Format("{:06X}", InputFill()), inkColor := Format("{:06X}", c.text)
    if !EditGui {
        EditGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +Owner" BoxGui.Hwnd)
        EditGui.MarginX := EditGui.MarginY := 0
        EditBox := EditGui.Add("Edit", "x0 y0 w100 h20 -E0x200 -VScroll +Multi +Wrap")
        EditBox.OnEvent("Change", TypingChanged)
        EditGui.OnEvent("Escape", StopTyping)
    }
    EditGui.BackColor := fill
    EditBox.SetFont("s" Settings.FontSize " c" inkColor, Settings.Font)
    EditBox.Opt("+Background" fill)
    EditBox.Value := Typed
    TypedFrom := WinExist("A")
    Composing := true
    TypingChanged()
    UpdateVisibility()
    try Draw()
    PlaceEditor(true)
    WinActivate(EditGui.Hwnd)
    EditBox.Focus()
    n := StrLen(EditBox.Value)
    SendMessage(0xB1, n, n, EditBox)   ; EM_SETSEL: the cursor at the end
    SetTimer(WatchTyping, 150)
}

; Lays the real text box over the typing box, where the words go (or hides it while the box is
; moving in or out).
PlaceEditor(showing) {
    static last := ""
    if !(EditGui && (r := Anim.inputRect))
        return
    if !showing {
        if (last != "hidden")
            DllCall("ShowWindow", "ptr", EditGui.Hwnd, "int", 0), last := "hidden"
        return
    }
    lines := Anim.inputLines, eh := lines * Look.editLineH
    x := Anim.x + r.left + Look.inputPad, y := Anim.y + Look.tabH + r.top + Round((r.bottom - r.top - eh) / 2)
    w := r.sendX - 8 * Look.s - (r.left + Look.inputPad)
    spot := Round(x) "," Round(y) "," Round(w) "," eh
    if (spot = last)
        return
    DllCall("SetWindowPos", "ptr", EditGui.Hwnd, "ptr", 0, "int", Round(x), "int", Round(y), "int", Round(w), "int", eh, "uint", 0x0054)   ; SWP_NOZORDER | SWP_NOACTIVATE | SWP_SHOWWINDOW
    EditBox.Move(0, 0, Round(w), eh)
    last := spot
}

; What you type wraps onto more lines: the typing box grows to fit (up to four).
TypingChanged(*) {
    global Typed
    if !EditBox
        return
    Typed := EditBox.Value
    lines := Max(1, Min(4, SendMessage(0xBA, 0, 0, EditBox)))   ; EM_GETLINECOUNT
    if (lines != Anim.inputLines)
        Anim.inputLines := lines
    Kick()
}

; While you type: if you click somewhere else, typing stops (keeping what you typed).
WatchTyping() {
    if !Composing
        return SetTimer(WatchTyping, 0)
    if !WinActive("ahk_id " EditGui.Hwnd)
        StopTyping(false)
}

; Stops typing, keeping what you typed (shown in the typing box) for later. With Esc, the window you
; were in before comes back to the front.
StopTyping(backToWindow := true, *) {
    global Composing, Typed, LastChange
    if !Composing
        return
    Typed := Trim(EditBox.Value, " `t`r`n"), Composing := false, LastChange := A_TickCount
    EditGui.Hide()
    if ((IsObject(backToWindow) || backToWindow) && TypedFrom && WinExist(TypedFrom))   ; (Esc passes the window)
        try WinActivate(TypedFrom)
    Anim.inputLines := 1
    Kick()
    UpdateVisibility()
}

#HotIf Composing && EditGui && WinActive("ahk_id " EditGui.Hwnd)
Enter::SendTyped()
NumpadEnter::SendTyped()
+Enter::EditPaste("`r`n", EditBox)
#HotIf

; Sends what you typed (or what you typed before, if you're not typing now) to Claude.
SendTyped(*) {
    global Typed, Composing, LastChange
    text := Trim(Composing ? EditBox.Value : Typed, " `t`r`n")
    if (text = "")
        return
    Typed := "", Composing := false, LastChange := A_TickCount
    if EditGui
        EditBox.Value := "", EditGui.Hide()
    Anim.inputLines := 1
    Kick()
    SetTimer(SendToClaude.Bind(text, TypedFrom), -1)
}

; Sends text to Claude as if you'd typed it into Claude's own message box: Claude comes to the front
; for a moment, the text goes at the end of its message box (after anything already there) and is
; sent, and the window you were in comes back to the front. Your clipboard is put back afterwards.
; Whether it was sent.
SendToClaude(text, backTo) {
    if !(hwnd := FindClaudeWindow()) {
        ShowNote("Claude isn't open, so that wasn't sent.")
        return false
    }
    RevealClaude(hwnd)   ; (if the box had it restored unseen, it's seen: it comes to the front on purpose)
    saved := ClipboardAll(), sent := false
    try {
        PressInMessageBox(hwnd, "^{End}")
        before := PromptText(hwnd)
        A_Clipboard := (before != "" ? " " : "") text
        if !ClipWait(1)
            throw Error("What you typed couldn't be put on the clipboard, so it wasn't sent.")
        Send "^v"
        ; Till it shows up there, Claude's message box is found once, and after that only asked what it
        ; holds (finding it each time went through all of Claude's window, a long conversation too,
        ; every 60 ms). If it can't be asked (Claude laid it out anew), it's found again. Either way,
        ; it's found afresh for the last look, before Enter.
        want := RegExReplace(Trim(text), "\s+", " "), deadline := A_TickCount + 2500, box := PromptBox(hwnd)
        while (A_TickCount < deadline) {
            try {
                if InStr(PromptBoxValue(box), want)
                    break
            } catch
                box := PromptBox(hwnd)
            Sleep 60
        }
        if !InStr(PromptText(hwnd), want)
            throw Error("What you typed didn't show up in Claude's message box, so it wasn't sent.")
        Send "{Enter}"
        ; A slash command (like /compact) opens Claude's list of commands as it's typed, and Enter
        ; first just picks it from there: it turns into a chip in the message box ("compact", without
        ; its slash), waiting. Enter again sends it. Enter's only pressed again while it's still in
        ; the message box, so nothing's ever sent twice.
        if (SubStr(want, 1, 1) = "/") {
            word := RegExReplace(want, "^/([^\s/]+).*$", "$1")
            loop 3 {
                deadline := A_TickCount + (A_Index = 1 ? 600 : 1200)
                while ((still := BoxHolds(hwnd, word)) && A_TickCount < deadline)
                    Sleep 60
                if (!still || A_Index = 3)
                    break
                Send "{Enter}"
            }
            if still
                throw Error(want " is in Claude's message box, but it didn't send.")
        } else
            Sleep 200
        sent := true
    } catch as e {
        ShowNote(e.Message)
    }
    A_Clipboard := saved
    if (backTo && backTo != hwnd && WinExist(backTo))
        try WinActivate(backTo)
    return sent
}

; What Claude's message box (box, as PromptBox found it) holds, with its spacing tidied, as PromptText
; has it: asked of the box itself, without finding it in Claude's window again. Throws if it can't be
; asked (it isn't there, or Claude has laid it out anew), so it can be found again.
PromptBoxValue(box) {
    if !(pattern := GetPattern(box.el, 10002, "{a94cd8b1-0844-4cd6-9d2d-640537ab39e9}"))   ; ValuePattern
        throw Error("Claude's message box can't say what it holds.")
    ComCall(4, pattern, "ptr*", &bstr := 0)   ; CurrentValue
    text := bstr ? StrGet(bstr, "UTF-16") : ""
    DllCall("OleAut32\SysFreeString", "ptr", bstr)
    return Trim(RegExReplace(text, "\s+", " "))
}

; Whether Claude's message box (in its window hwnd) still has a word in it: as text, or as a chip (a
; slash command picked from Claude's list of them shows as one, like "compact").
BoxHolds(hwnd, word) {
    if InStr(PromptText(hwnd), word)
        return true
    try return (box := PromptBox(hwnd)) && NameUnder(box.el, word)
    return false
}

; Whether anything inside a UI element (el), a few levels down, has a word in its name.
NameUnder(el, word, depth := 0) {
    kids := UIChildren(el)
    loop kids.Length {
        kid := kids.Get(A_Index)
        if (InStr(kid.name, word) || depth < 4 && NameUnder(kid.el, word, depth + 1))
            return true
    }
    return false
}

; A note in the box for a few seconds.
ShowNote(text) {
    Critical
    Current.note := text
    LayOutExchange(Current), Place()
    Critical "Off"
    Kick()
    UpdateVisibility()
    SetTimer(ClearNote, -4500)
}

; ---- Reading out loud, and Claude's voice ---------------------------------------------

; On the Code page, with ReadCode on: reads Claude's reply out loud in a Windows voice as it comes
; in, a paragraph (or list item) at a time once each is finished, and the last once the reply is,
; leaving out Claude's steps and code. Its words show up as they're read (see ReadFollow), and the
; typing sounds stay quiet meanwhile. What was already there (fresh) isn't read, and a new reply
; stops the one before.
ReadAloud(ex, fresh) {
    if (!Settings.ReadCode || Page != "code" || ex.sample) {
        if Reader.ex
            StopReading()
        return
    }
    lines := SpeakableLines(ex.claude)
    if (Reader.ex != ex) {
        StopReading()
        Reader.ex := ex, Reader.said := fresh ? lines.Length : 0, Reader.lines := Map()
    }
    done := !(ex.thinking || ex.claudeStatus != "" || ex.work != "")
    ready := done ? lines.Length : lines.Length - 1
    while (Reader.said < ready) {
        i := ++Reader.said, text := lines[i], stream := 0
        if (text != "")
            try stream := Speaker().Speak(text, 1)   ; SVSFlagsAsync: after what it's already saying
        Reader.lines[i] := {stream: stream, len: StrLen(text)}
    }
    SetTimer(ReadFollow, 40)
    SetTimer(CheckReading, 250)
}

; Whether Claude's words show up as they're read out loud, instead of at their own pace.
ReadingAlong() => Settings.ReadCode && Page = "code" && !VoiceMode

; While reading out loud: Claude's words (waiting, see KeepFading) show up as the voice reads them,
; a word at a time, going by where the voice is in the line it's reading. Lines it doesn't read out
; (code, and Claude's steps) show up once it gets to them.
ReadFollow() {
    ex := Reader.ex, now := A_TickCount
    if !(ex && (part := ReplyPart(ex)))
        return SetTimer(ReadFollow, 0)
    try {
        status := Speaker().Status
        stream := status.CurrentStreamNumber, talking := status.RunningState = 2
        upTo := status.InputWordPosition + status.InputWordLength
    } catch {
        return
    }
    line := 0   ; the line being read
    if talking
        for i, info in Reader.lines
            if (info.stream = stream)
                line := i
    if (talking && !line)   ; (saying something else)
        return
    done := talking ? line - 1 : Reader.said   ; every line up to here has been read
    heldCount := 0, came := false, block := 0, spot := 0   ; (heldCount: words still waiting for the voice)
    for t in part.tokens {
        if (t.block != block)
            block := t.block, spot := 0
        start := spot
        if !(t.style = "bullet" || t.style = "stepdot" || t.style = "rundot")
            spot += StrLen(t.text) + 1
        if (t.born < HELD)
            continue
        if (t.block <= done || t.block = line && start < upTo)
            t.born := now, t.per := 0, came := true
        else
            heldCount++
    }
    if came
        ex.fadeUntil := Max(ex.fadeUntil, now + Look.motion.fade), Kick()
    if !heldCount {
        ex.revealEnd := Min(ex.revealEnd, now)
        if !talking
            SetTimer(ReadFollow, 0)
    }
}

; Words waiting to be read out loud show up right away (reading has stopped).
ReleaseHeld(ex) {
    now := A_TickCount, any := false
    for part in ex.parts
        for t in part.tokens
            if (t.born >= HELD)
                t.born := now, t.per := 0, any := true
    if (ex.revealEnd > now + 60000)
        ex.revealEnd := now
    if any
        ex.fadeUntil := Max(ex.fadeUntil, now + Look.motion.fade), Kick()
}

; A reply's lines as they'd be read out: its steps and code left out (as ""), and how they're laid
; out taken away.
SpeakableLines(markup) {
    out := []
    for line in StrSplit(markup, "`n") {
        if (StartsWith(line, STEP) || StartsWith(line, STEP_RUNNING) || StartsWith(line, CODE_BLOCK)) {
            out.Push("")
            continue
        }
        for marker in [BULLET, HEADING]
            if StartsWith(line, marker)
                line := SubStr(line, StrLen(marker) + 1)
        out.Push(Trim(StrReplace(line, TICK)))
    }
    return out
}

; Windows' voice for reading out loud, set up with the voice and speed picked.
Speaker() {
    static sapi := ""
    if !sapi {
        sapi := ComObject("SAPI.SpVoice")
        UseReaderVoice(sapi)
    }
    return sapi
}

UseReaderVoice(sapi := Speaker()) {
    try {
        voices := sapi.GetVoices()
        loop voices.Count
            if (voices.Item(A_Index - 1).GetDescription() = Settings.ReadVoice)
                sapi.Voice := voices.Item(A_Index - 1)
        sapi.Rate := Round((Settings.ReadSpeed - 5) * 1.6)
    }
}

; The Windows voices there are to read with (looked up once).
ReaderVoices() {
    static names := []
    if names.Length
        return names
    try {
        voices := Speaker().GetVoices()
        loop voices.Count
            names.Push(voices.Item(A_Index - 1).GetDescription())
    }
    return names
}

StopReading() {
    if Reader.ex
        ReleaseHeld(Reader.ex)
    Reader.ex := "", Reader.said := 0, Reader.lines := Map()
    SetTimer(ReadFollow, 0)
    try Speaker().Speak("", 3)   ; SVSFlagsAsync | SVSFPurgeBeforeSpeak: stops
    CheckReading()
}

; While reading: notices when it starts and stops talking (Claude's label says SPEAKING meanwhile,
; and the box stays up).
CheckReading() {
    speaking := false
    try speaking := Speaker().Status.RunningState = 2   ; SRSEIsSpeaking
    if (speaking != Reader.speaking) {
        Reader.speaking := speaking
        Kick()
        UpdateVisibility()
    }
    if !speaking
        SetTimer(CheckReading, 0)
}

; With Claude's voice turned off (ClaudeVoice), Claude's app is muted in Windows' volume mixer while
; voice mode is on, so you can read along without hearing it. The captions still follow its voice:
; Windows measures an app's sound before muting it. It's unmuted once voice mode ends, the setting
; is turned back on, or captions close (off). Voice mode can start new sounds, so it's checked again
; every couple of seconds.
MuteClaude(off := false) {
    static mutedByUs := false, checkedAt := 0
    want := !off && !Settings.ClaudeVoice && VoiceMode
    if (!want && !mutedByUs || want && mutedByUs && A_TickCount - checkedAt < 2000)
        return
    checkedAt := A_TickCount
    for volume in ClaudeAudio("{87CE5498-68D6-44E5-9215-6DA47EF883D8}")   ; ISimpleAudioVolume
        try ComCall(5, volume, "int", want, "ptr", 0)   ; SetMute
    mutedByUs := want
}

; ---- Typing sounds ----------------------------------------------------------------

; Claude's words appearing make little sounds, if you picked some (TypingSound): with each letter as
; it's typed out (pausing where the words do, see Rest), or each word as it fades in (see RevealPace),
; like the talking in Animal Crossing
; or Undertale, or soft clicks. Each letter has its own sound, so the same words always sound the
; same. How far the sounds have got goes in Current.sounded: which word, and how much of it. Not in
; voice mode, where Claude talks out loud, nor while the box is away (it just keeps up quietly).
TypingSounds(now) {
    static nextAt := 0
    if !(part := ClaudePart())
        return
    tokens := part.tokens, n := tokens.Length
    if (!Anim.shown || !Anim.target || VoiceMode || Settings.TypingSound = "Off" || ReadingAlong()) {   ; (quiet while Claude's voice reads, or tucking away)
        Current.sounded := n
        return
    }
    if (now < nextAt)
        return
    ; The newest word that has started to appear, and how much of it has.
    i := Max(1, Floor(Current.sounded) + 1), last := 0
    while (i <= n && tokens[i].born <= now)
        last := i++
    if !last
        return
    t := tokens[last], len := Max(1, StrLen(t.text))
    upTo := t.per ? Min(len, Floor((now - t.born) / t.per) + 1) : len
    at := last - 1 + upTo / len
    if (at <= Current.sounded)
        return
    Current.sounded := at
    ; Bullets and such make no sound, and neither do words that came in a while ago.
    if (!(t.text ~= "[\p{L}\p{N}]") || now - (t.born + (upTo - 1) * t.per) > 400)
        return
    ch := SubStr(t.text, t.per ? upTo : 1, 1)
    sounds := Blips(Settings.TypingSound, Settings.SoundVolume)
    blip := sounds[Mod(Ord(ch) + (t.per ? 0 : last), sounds.Length) + 1]
    DllCall("winmm\PlaySoundW", "ptr", blip, "ptr", 0, "uint", 0x0007)   ; SND_MEMORY | SND_ASYNC | SND_NODEFAULT
    kind := Settings.TypingSound   ; (no quicker than the letters come: every other one for Animal Crossing)
    nextAt := now + (kind = "Animal Crossing" ? Max(60, 2 * t.per) : kind = "Undertale" ? Max(34, t.per) : 40)
}

; The little sounds for one kind (see TypingSounds), at a volume from 0 to 100: a few each, so they
; don't all sound the same. They're made the first time they're needed, as short recordings kept
; in memory, each as loud as the others (see Balanced), and never loud: all the way up is a
; comfortable level, not full blast.
Blips(kind, volume := 100) {
    static made := Map()
    key := kind "|" volume
    if made.Has(key)
        return made[key]
    if (made.Count > 8) {
        ; Windows plays a sound straight from its recording here, while it's playing: so whatever's
        ; still playing stops first, before the recordings go (or it could play on from freed memory,
        ; a burst of noise, while you slide the volume with words coming in).
        DllCall("winmm\PlaySoundW", "ptr", 0, "ptr", 0, "uint", 0)
        made.Clear()
    }
    rate := 22050, list := [], gain := (volume / 100) ** 1.6   ; (loudness goes by the square, roughly)
    switch kind {
        case "Soft clicks":   ; a soft key press: a little tap of noise, with a low knock under it
            loop 6 {
                wave := [], last := 0.0, n := Round(rate * 0.03), knock := 150 + Random(0, 60)
                loop n {
                    t := A_Index / rate
                    last := last * 0.35 + (Random() * 2 - 1) * 0.65   ; (noise, a little softened)
                    wave.Push(last * Exp(-t / 0.004) + 0.8 * Sin(6.2832 * knock * t) * Min(1, t / 0.001) * Exp(-t / 0.009))
                }
                list.Push(Recording(Balanced(wave, 0.07), rate, gain))
            }
        case "Undertale":   ; a short square-wave beep, like its text boxes
            for pitch in [520, 490, 550] {
                wave := [], n := Round(rate * 0.034)
                loop n {
                    t := A_Index / rate
                    wave.Push((Mod(t * pitch, 1) < 0.5 ? 1 : -1) * Min(1, (n - A_Index) / (rate * 0.006)))
                }
                list.Push(Recording(Balanced(wave, 0.045), rate, gain))   ; (a square wave sounds harsh: a little quieter)
            }
        default:   ; Animal Crossing: a quick sung syllable on a vowel, each at its own pitch, sliding down
            vowels := [[730, 1090], [530, 1840], [300, 2250], [570, 840], [440, 1020]]   ; a, e, i, o, u
            for pitch in [240, 280, 320, 360, 300, 420, 260, 380] {
                vowel := vowels[Mod(A_Index, vowels.Length) + 1], wave := [], n := Round(rate * 0.06)
                loop n {
                    t := A_Index / rate, f0 := pitch * (1.18 - 0.18 * A_Index / n), v := 0.0
                    loop 7 {   ; the voice's harmonics, loudest near the vowel's two formants
                        f := f0 * A_Index
                        v += Sin(6.2832 * f * t) * (Exp(-((f - vowel[1]) / 260) ** 2) + 0.6 * Exp(-((f - vowel[2]) / 380) ** 2) + 0.12) / A_Index ** 0.5
                    }
                    v *= Min(1, t / 0.006) * Exp(-t / 0.035)
                    wave.Push(v)
                }
                list.Push(Recording(Balanced(wave, 0.055), rate, gain))
            }
    }
    return made[key] := list
}

; A sound (see Recording) made loud (the root of its mean square, over the part of it you hear), so
; the kinds of sounds are all about as loud as each other at any volume. Its peaks can't go past full.
Balanced(wave, loud) {
    sum := 0.0, heard := 0, peak := 0.0
    for v in wave
        if (Abs(v) > 0.001)
            sum += v * v, heard++, peak := Max(peak, Abs(v))
    if !heard
        return wave
    k := Min(loud / Sqrt(sum / heard), 0.95 / peak)
    loop wave.Length
        wave[A_Index] *= k
    return wave
}

; A sound (wave, from -1 to 1, rate samples a second, made gain times as loud) as a WAV recording in
; memory, for PlaySound.
Recording(wave, rate, gain := 1) {
    n := wave.Length, wav := Buffer(44 + 2 * n)
    NumPut("uint", 0x46464952, "uint", 36 + 2 * n, "uint", 0x45564157, "uint", 0x20746D66, "uint", 16,   ; "RIFF", size, "WAVE", "fmt "
        "ushort", 1, "ushort", 1, "uint", rate, "uint", rate * 2, "ushort", 2, "ushort", 16,             ; PCM, mono, 16-bit
        "uint", 0x61746164, "uint", 2 * n, wav)                                                          ; "data", size
    loop n
        NumPut("short", Round(Max(-1, Min(1, wave[A_Index] * gain)) * 32000), wav, 42 + 2 * A_Index)
    return wav
}

; ---- Test messages in the settings ------------------------------------------------

; A setting that changes how Claude's words come in, or how the box comes and goes, was just changed
; (Preview.key, a moment after the last change, as you slide): the box shows a short test message
; about it, done the new way (see ShowPreview), rather than going through the reply showing again.
PreviewSetting() {
    key := Preview.key
    ShowPreview(PreviewText(key), key != "FollowVoice")   ; (the word glow's is all there, for the glow to go along)
    switch key {
        case "Appear": ShowAppearing()
        case "TuckStyle": ShowTucking()
        case "FollowVoice": DemoVoice()
    }
}

; The test message for a setting just changed (key): what it's set to now, in a sentence or two, long
; enough to see (and hear) it.
PreviewText(key) {
    for row in SettingRows()   ; (as the settings show it)
        if (row.key = key)
            value := RowShow(row, RowValue(row))
    switch key {
        case "WordSpeed":
            return "Hey, this is your new word speed: " value ". This is how quickly Claude's replies will come in from now on."
        case "TextReveal":
            return "Hey, this is how words appear now: " value ". Claude's replies will show up just like this."
        case "TypingSound":
            return value = "Off" ? "Typing sounds are off now. Claude's words will come in quietly, just like this."
                : "Hey, these are your new typing sounds: " value ". You'll hear them as Claude's words appear."
        case "SoundVolume":
            return "Hey, this is your new volume: " value ". This is how loud the typing sounds will be."
        case "FollowVoice":
            return "Hey, this is the word glow. In voice mode, each word lights up as Claude says it, one after another, just like this."
    }
    return "Hey, this is how the box shows up and goes away now: " Settings.%key% "."   ; (Appear, TuckStyle)
}

; Shows a test message (text) as Claude's reply, in place of the exchange showing, its words coming in
; at the pace and in the way picked (paced), with the typing sounds. A few seconds after it's all in
; (or once the settings close, or anything happens), the exchange is back as it was (see EndPreview).
ShowPreview(text, paced := true) {
    global Current
    Critical
    if !Preview.saved
        Preview.saved := Current, Preview.missed := false
    Current := NewExchange()
    Current.sample := true, Current.old := true   ; (not kept, and no line saying Claude finished)
    Current.claude := text, Current.words := ReplyWords(text), Current.replyTime := FormatTime(, "h:mm tt")
    LayOutExchange(Current)
    if (paced && Settings.Animate && (part := ClaudePart()))
        PaceWords(part.tokens, Current)
    Place(), SnapView()
    Critical "Off"
    Kick()
    UpdateVisibility()
    SetTimer(PreviewDone, -(Max(0, Current.revealEnd - A_TickCount) + 3000))
}

PreviewDone() {
    if Voice.demo   ; (the word glow's still going along it)
        return SetTimer(PreviewDone, -500)
    EndPreview()
}

; Back from a test message to the exchange it stood in for, as it was, with anything Claude's window
; said meanwhile (see TakeRead).
EndPreview() {
    global Current
    SetTimer(PreviewDone, 0)
    if !Preview.saved
        return
    Critical
    if Voice.demo
        Voice.fake := "", Voice.demo := false
    Current := Preview.saved, Preview.saved := ""
    Place(), SnapView()
    Critical "Off"
    Kick()
    if Preview.missed
        ShowLatestRead()
    UpdateVisibility()
}

; ---- Animation ------------------------------------------------------------------

; The time in ms, like A_TickCount but to a small fraction of a ms. A_TickCount only moves in steps
; of 15 or 16 ms, so motion timed by it moves in those steps too, however often it's drawn. This
; starts right on one of A_TickCount's steps and runs just ahead of it (by less than a step), so
; the two can be compared; it never runs backwards.
MsNow() {
    static freq := 0, base := 0, start := 0, last := 0
    if !freq
        DllCall("QueryPerformanceFrequency", "int64*", &freq)
    DllCall("QueryPerformanceCounter", "int64*", &count := 0)
    t := start ? base + (count - start) * 1000 / freq : 0
    tick := A_TickCount
    if (!start || t < tick - 1 || t > tick + 40) {   ; (the first time, or drifted apart: lines up again)
        while (A_TickCount = tick) {   ; (on its next step: 16 ms at most, and rarely)
        }
        DllCall("QueryPerformanceCounter", "int64*", &start)
        base := A_TickCount, t := base
    }
    return last := Max(last, t)
}

; Starts the animation if it isn't running, and has the box drawn again (something changed). The
; animation stops by itself once everything has settled. With High FPS, FrameLoop draws a frame
; after each refresh of the screen; otherwise, and whenever something else holds FrameLoop up for a
; moment, FrameTick's timer draws them (about 64 times a second at most: Windows' timers go no faster).
Kick() {
    Anim.dirty := true
    if !Anim.running {
        Anim.running := true, Anim.last := MsNow()
        SetTimer(FrameTick, 16)
    }
    KeepPace()
}

; Starts FrameLoop if frames should keep step with the screen and it isn't running.
KeepPace() {
    if (!Anim.looping && Paced())
        Anim.looping := true, SetTimer(FrameLoop, -1)
}

; Whether frames keep step with the screen's refreshes (see FrameLoop). In a game too, though only
; every so many of them (see GameStep): on the timer instead, frames came about 32 times a second at
; best (Windows' timers tick every 15.6 ms, so one set for 16 ms goes off every 31), unevenly.
Paced() => Settings.HighFps && Settings.Animate

; In a game (Game mode), a frame on every how many of the screen's refreshes: about 60 a second at
; most, evenly spaced (every third on a 165 Hz screen, 55 a second; every other on a 120 or 144 Hz
; one). Otherwise every one.
GameStep() => Gaming() ? Max(1, Round(MonitorHz() / 60)) : 1

; Draws frames one after another, each just after the screen the box is on refreshes (see
; WaitForRefresh), so the box and the settings window move as often as that screen refreshes
; (60, 144, 165, 240 times a second...), evenly. When a frame had nothing new to draw (like while
; the box just drifts, see Frame), it doesn't wait for every refresh but checks back shortly. In
; between, everything else waiting its turn runs.
FrameLoop() {
    stats := NewStats(), drew := true
    while ((Anim.running || SettingsGui && SetUI.running) && Paced()) {
        waited := MsNow()
        if drew {
            WaitForRefresh()
            loop GameStep() - 1 {   ; (in a game: on every so many refreshes)
                Sleep -1
                WaitForRefresh()
            }
        } else
            Sleep 8
        at := MsNow(), gap := at - Anim.loopAt, Anim.loopAt := at
        if drew
            stats.waiting += at - waited
        before := Anim.lastDraw
        if Anim.running
            Frame()
        settingsMoving := SettingsGui && SetUI.running
        if settingsMoving
            SettingsFrame()
        wasDrawing := drew, drew := settingsMoving || Anim.lastDraw != before
        if drew {
            drawMs := MsNow() - at, stats.drawn++, stats.busy += drawMs, stats.longest := Max(stats.longest, drawMs)
            if wasDrawing   ; (frame after frame: moving)
                stats.moving++, stats.movingMs += gap, stats.missed += Max(0, Round(gap / (GameStep() * 1000 / MonitorHz())) - 1), stats.worst := Max(stats.worst, gap)
        }
        if (GameStep() > 1)
            stats.how := "the screen, every " GameStep() " refreshes in a game"
        if (MsNow() - stats.began > 30000)   ; (a long run, like voice mode: noted every so often)
            NoteSmoothness(stats), stats := NewStats()
        Critical "Off"   ; (the frames are uninterruptible; waiting for the screen isn't)
        Sleep -1         ; lets everything waiting its turn run
    }
    Anim.looping := false
    NoteSmoothness(stats)
}

; (how: what paced the frames, "the screen" or "a timer" in a game; waiting: how long, all told, it
; waited for the screen to refresh; worst: the longest gap between two frames while moving)
NewStats(how := "the screen") => {began: MsNow(), drawn: 0, busy: 0, longest: 0, moving: 0, movingMs: 0, missed: 0, waiting: 0, worst: 0, how: how}

; Notes in FOCUS_LOG something the box did about new messages (counting one, the box coming back to
; show it), at most 40 a minute, so if it ever gets one wrong, the log says what happened.
NoteEvent(text) {
    static since := 0, count := 0
    if (A_TickCount - since > 60000)
        since := A_TickCount, count := 0
    if (++count <= 40)
        AddToLog(FOCUS_LOG, FormatTime(, "yyyy-MM-dd HH:mm:ss") "  " text "`n")
}

; Adds a line to one of the logs (file). While a read of Claude's window is being taken in (see
; TakeRead), the box's frames wait for it, and writing to a file can take a few ms: so a line noted
; meanwhile is held back, with the time it was noted, and written just after, by a timer. Any lines
; still held back are written first, so the logs keep their order.
AddToLog(file, line) {
    if HoldingLogs {
        HeldLogs.Push([file, line])
        SetTimer(WriteHeldLogs, -1)
        return
    }
    if HeldLogs.Length
        WriteHeldLogs()
    try FileAppend(line, file, "UTF-8")
}

; Writes the lines held back for the logs (see AddToLog). It only ever runs once the read has been
; taken in, so it stops holding them back too: if taking it in went wrong partway (and never got to
; stop holding them back itself), nothing stays held back.
WriteHeldLogs() {
    global HeldLogs, HoldingLogs := false
    lines := HeldLogs, HeldLogs := []
    for entry in lines
        try FileAppend(entry[2], entry[1], "UTF-8")
}

; Waits for the next refresh of the screen the box is on (its vertical blank), so frames keep step
; with that screen at its own rate, even with screens at different rates side by side. If Windows
; won't say, DwmFlush (the desktop's own pace) stands in.
WaitForRefresh() {
    static wait := Buffer(12, 0), adapter := 0, screen := 0
    n := BoxMonitor()
    if (n != screen) {   ; (opened again for another screen, or after a failed wait)
        if adapter {
            close := Buffer(4, 0), NumPut("uint", adapter, close)
            DllCall("gdi32\D3DKMTCloseAdapter", "ptr", close)
        }
        adapter := 0, screen := n
        try {
            hdc := DllCall("CreateDCW", "ptr", 0, "str", MonitorGetName(n), "ptr", 0, "ptr", 0, "ptr")
            open := Buffer(24, 0), NumPut("ptr", hdc, open, 0)   ; D3DKMT_OPENADAPTERFROMHDC
            status := DllCall("gdi32\D3DKMTOpenAdapterFromHdc", "ptr", open, "int")
            DllCall("DeleteDC", "ptr", hdc)
            if (status = 0)
                adapter := NumGet(open, 8, "uint"), NumPut("uint", adapter, "uint", 0, "uint", NumGet(open, 20, "uint"), wait)
        }
    }
    if (!adapter || DllCall("gdi32\D3DKMTWaitForVerticalBlankEvent", "ptr", wait, "int")) {
        screen := adapter ? 0 : screen   ; (a failed wait: opened again next time, like after the screen changed)
        DllCall("dwmapi\DwmFlush")
        ; (One quick return can follow a late one; several in a row mean it isn't waiting, like with
        ; the screen off: then no faster than this.)
        Anim.quick := MsNow() - Anim.loopAt < 3 ? Anim.quick + 1 : 0
        if (Anim.quick >= 3)
            Sleep 6
    }
}

; Notes in FOCUS_LOG how smoothly a run of frames from FrameLoop went (one of a second or more, at
; most once a minute): how many frames a second while things moved, on a screen refreshing how
; often, and how many of its refreshes were missed (something else held FrameLoop up), how many
; frames were drawn altogether, and how long drawing one took.
NoteSmoothness(stats) {
    global Perf
    static notedAt := -60000
    ms := MsNow() - stats.began
    if (ms < 1000 || !stats.drawn || A_TickCount - notedAt < 60000)
        return
    notedAt := A_TickCount
    moving := stats.moving ? Format("{:.0f} frames a second while moving ({} refreshes missed, the longest gap {:.0f} ms)", stats.moving * 1000 / stats.movingMs, stats.missed, stats.worst) : "nothing moving"
    ; Where the time went: waiting for the screen, drawing, and everything else (reading Claude's
    ; window, and so on), with what's known of that.
    other := Max(0, ms - stats.waiting - stats.busy), p := Perf, Perf := NewPerf()
    where := Format("; paced by {}: waiting for it {:.0f}%, drawing {:.0f}%, other things {:.0f}% ({} reads of Claude's window, {:.0f} ms all told, the longest {:.0f} ms, {} with nothing new{})",
        stats.how, 100 * stats.waiting / ms, 100 * stats.busy / ms, 100 * other / ms, p.reads, p.readMs, p.readMax, p.stale, p.here ? Format("; {} read here, not by the fetcher, {:.0f} ms", p.here, p.hereMs) : "")
    try FileAppend(FormatTime(, "yyyy-MM-dd HH:mm:ss") Format("  Smooth motion: {} on a {} Hz screen; {} frames in {:.1f} s ({:.0f} a second); drawing one took {:.1f} ms on average, {:.1f} ms at most{}`n",
        moving, MonitorHz(), stats.drawn, ms / 1000, stats.drawn * 1000 / ms, stats.busy / stats.drawn, stats.longest, where), FOCUS_LOG, "UTF-8")
}

; The timer's frame of the box: left to FrameLoop while it's keeping up. In a game (where the timer
; paces the frames, see Paced) how smoothly they go is noted too.
FrameTick() {
    static stats := "", lastAt := 0
    if (Anim.looping && MsNow() - Anim.loopAt < 25)
        return
    if !stats
        stats := NewStats("a timer")
    at := MsNow(), gap := at - lastAt, lastAt := at, before := Anim.lastDraw
    Frame()
    if (!Anim.looping && Anim.lastDraw != before) {
        drawMs := MsNow() - at, stats.drawn++, stats.busy += drawMs, stats.longest := Max(stats.longest, drawMs)
        if (gap < 250)   ; (frame after frame: moving)
            stats.moving++, stats.movingMs += gap, stats.missed += Max(0, Round(gap / 16.7) - 1), stats.worst := Max(stats.worst, gap)
    }
    if (MsNow() - stats.began > 30000)
        NoteSmoothness(stats), stats := NewStats("a timer")
    KeepPace()   ; (like back from a game)
}

; One step of the animation: moves everything a little closer to where it's headed, and draws the box.
Frame() {
    Critical   ; so a new read of Claude's window waits until this frame is drawn
    now := MsNow(), dt := Min(100, now - Anim.last), Anim.last := now
    smooth := Settings.Animate, easeMs := Look.motion.ease
    wasP := Anim.p, ms := Anim.tucking ? TuckMs(Anim.target) : Anim.target ? APPEAR_MS : DISAPPEAR_MS
    Anim.p := Approach(Anim.p, Anim.target, smooth ? dt / ms : 1)
    if (smooth && Anim.tucking && Anim.target && wasP < 1 && Anim.p >= 1 && (Settings.TuckStyle = "Swoosh" || Settings.TuckStyle = "Bouncy"))
        Anim.jiggleAt := now   ; out of the Claude tab: it lands with a little jiggle
    Anim.hover := Approach(Anim.hover, Anim.hoverTarget, smooth ? dt / 150 : 1)
    t := ViewTarget()
    ; The view glides on a spring: scrolling back takes as long as the Scroll smoothness setting
    ; says, dragging the scroll bar follows the mouse closely, and live it keeps up at word speed.
    glideMs := !smooth ? 0 : Drag.mode = "scroll" ? 40 : View.scrolled ? SmoothMs() : easeMs * 2
    speed := View.bottomSpeed, View.bottom := Spring(View.bottom, t.bottom, &speed, dt, glideMs), View.bottomSpeed := speed
    speed := View.hSpeed, View.h := Spring(View.h, t.h, &speed, dt, glideMs), View.hSpeed := speed
    ; The arrow saying there are words above you haven't seen comes and goes softly.
    above := MoreAbove(t) ? 1 : 0
    if (above && !Anim.aboveAt)
        Anim.aboveAt := now
    Anim.above := Approach(Anim.above, above, smooth ? dt / 250 : 1)
    if (!above && !Anim.above)
        Anim.aboveAt := 0
    ; The tab for the page Claude is on joins the box, and glides over when the page changes.
    slot := Page = "" ? "" : Look.slots[Page]
    if slot {
        if (!smooth || !Anim.tabRight)
            Anim.tabLeft := slot.left, Anim.tabRight := slot.right, Anim.tabSpeedL := Anim.tabSpeedR := 0
        speed := Anim.tabSpeedL, Anim.tabLeft := Spring(Anim.tabLeft, slot.left, &speed, dt, 180), Anim.tabSpeedL := speed
        speed := Anim.tabSpeedR, Anim.tabRight := Spring(Anim.tabRight, slot.right, &speed, dt, 180), Anim.tabSpeedR := speed
    }
    ; The list beside the box opens and closes softly, and so does voice mode's blue light.
    Anim.panel := Approach(Anim.panel, Anim.panelTarget, smooth ? dt / 180 : 1)
    state := VoiceState(), listenTo := state != "" ? 1 : 0, toneTo := state = "speaking" ? 1 : 0, thinkTo := state = "thinking" ? 1 : 0
    Anim.listen := Approach(Anim.listen, listenTo, smooth ? dt / 400 : 1)
    Anim.tone := Approach(Anim.tone, toneTo, smooth ? dt / 350 : 1)
    Anim.think := Approach(Anim.think, thinkTo, smooth ? dt / 350 : 1)
    ; While you scroll back, a strip at the top holds the name of whose words you're reading (see
    ; DrawStickyLabel), and the messages' times show until TIMES_MS after you stop.
    stickyTo := View.scrolled ? 1 : 0, timesTo := View.scrolled && (now - ScrollAt < TIMES_MS || Drag.mode = "scroll") ? 1 : 0
    Anim.sticky := Approach(Anim.sticky, stickyTo, smooth ? dt / 200 : 1)
    Anim.times := Approach(Anim.times, timesTo, smooth ? dt / (timesTo ? 200 : 600) : 1)
    ; With the Claude key, while the box has the mouse and keyboard, a soft glow in Claude's color
    ; behind it says so (see PlaceGlow).
    handedTo := Handed ? 1 : 0
    Anim.handed := Approach(Anim.handed, handedTo, smooth ? dt / 200 : 1)
    ; Tucked away, the Claude tab slides out from the side of the screen once the box has shrunk
    ; into it, and back in as the box comes out; pointing at it slides it out a little more. The row
    ; of links at the bottom of the box opens when the reply has links.
    peekTo := Anim.target = 0 && Anim.p < 0.35 && PeekWanted() ? 1 : 0, hoverTo := Anim.peekHot ? 1 : 0
    Anim.peek := Approach(Anim.peek, peekTo, smooth ? dt / 260 : 1)
    Anim.peekHover := Approach(Anim.peekHover, hoverTo, smooth ? dt / 150 : 1)
    linksTo := ShownLinks().Length ? 1 : 0
    Anim.links := Approach(Anim.links, linksTo, smooth ? dt / 200 : 1)
    moving := Anim.p != Anim.target || Anim.hover != Anim.hoverTarget || View.h != t.h || View.bottom != t.bottom
        || (smooth && now < Current.fadeUntil) || (Current.newAt && now - Current.newAt < NEW_BADGE_MS)
        || (Anim.liveAt && now - Anim.liveAt < LIVE_BADGE_MS)
        || Anim.above != above || (Anim.above && now - Anim.aboveAt < 3300) || slot && (Anim.tabLeft != slot.left || Anim.tabRight != slot.right)
        || Anim.panel != Anim.panelTarget || Anim.listen != listenTo || Anim.tone != toneTo || Anim.think != thinkTo || smooth && now - Anim.switchAt < 360
        || Anim.sticky != stickyTo || Anim.times != timesTo || now - Anim.lineGoneAt < 900 || Anim.handed != handedTo
        || Anim.peek != peekTo || Anim.peekHover != hoverTo || now - Anim.wiggleAt < 900 || now - Anim.badgeAt < 400 || Anim.links != linksTo
        || now - Anim.jiggleAt < 700 || now - Current.doneAt < 600 || now - Anim.spinAt < 900 || Anim.peek > 0 && (ClaudeBusy() || Anim.codeWorking && Page = "chat")
    ; With Float on, the box drifts gently (see Draw), leaning a little toward the mouse when it's
    ; near, but not while you're pointing at it or dragging it.
    floating := Settings.Float && smooth && Anim.target && !Drag.mode && !Gaming()
    if floating {
        CoordMode("Mouse", "Screen")
        MouseGetPos(&mx, &my)
        dx := mx - (Anim.x + Look.W / 2), dy := my - (Anim.y + Anim.h / 2), dist := Sqrt(dx * dx + dy * dy)
        near := Anim.hoverTarget || !dist || GameFront && !PointerShown() ? 0 : Max(0, 1 - dist / 700) * 6 * Look.s / dist   ; (not toward a game's hidden pointer)
        speed := Anim.leanSX, Anim.leanX := Spring(Anim.leanX, dx * near, &speed, dt, 500), Anim.leanSX := speed
        speed := Anim.leanSY, Anim.leanY := Spring(Anim.leanY, dy * near, &speed, dt, 500), Anim.leanSY := speed
    }
    ; The drift eases away while you type in the box, so the text box laid over it (a window of its
    ; own, which can only move by whole pixels) sits still with it; and back once you're done.
    floatTo := floating && !Composing ? 1 : 0
    if (Anim.floatK != floatTo)
        Anim.floatK := Approach(Anim.floatK, floatTo, dt / 350), moving := true
    ; The drift is slow (a couple of pixels a second), so it's drawn again once it has moved a fifth
    ; of a pixel rather than at every refresh: just as smooth, for a small part of the work. Leaning
    ; toward the mouse moves it faster, and so it's drawn more often then, by itself.
    drifted := false
    if floating
        drift := FloatOffset(now), drifted := Abs(drift.x - Anim.driftX) + Abs(drift.y - Anim.driftY) >= 0.2
    TypingSounds(now)
    ; The glow following Claude's voice, drawn at every refresh while it moves.
    following := FollowFrame(now, dt, smooth)
    ; "Listening", "Thinking" and "Responding" pulse gently, which only needs drawing now and then:
    ; up to 60 times a second for the quicker ones (like Claude's spark), 10 for the rest. Slow
    ; looping effects like these look no different drawn more often. Over a game, Claude's spark and
    ; the step it's on are drawn just 15 times a second: each time draws the whole box again and
    ; hands it to Windows to lay over the game, and through a long Code task (the spark going the
    ; whole time) that was 60 times a second, next to the game, for a small spark. (Not voice mode's
    ; light, which swells with the voices as they go.)
    pulsing := Anim.target && (Current.note != "" || Current.youStatus != "" || Current.claudeStatus != "" || Current.work != "" || Current.queued != ""
        || Anim.listen > 0 || Anim.panel > 0)
    ; With nothing left to do, the last frame is drawn and the animation stops, unless Claude is
    ; talking, when the glow can move on at any moment, or the times are waiting to fade.
    idle := !(moving || following || pulsing || floating || Voice.on || View.scrolled && Anim.times > 0)
    period := FramePeriod(), quick := Current.thinking || Current.work != "" || Current.claudeStatus != "" || Anim.listen > 0
    pulseMs := !quick ? 100 : Gaming() && Anim.listen <= 0 ? 66 : Max(period - 1, 15)
    if (moving || idle || Anim.dirty || drifted || following && now - Anim.lastDraw >= period - 1
        || pulsing && now - Anim.lastDraw >= pulseMs) {
        Anim.dirty := false
        try Draw()
    }
    if idle {
        SetTimer(FrameTick, 0)
        Anim.running := false
    }
}

; One step of the glow following Claude's voice: it brightens while Claude talks (a little less
; during a pause) and fades once Claude is done, and slides smoothly along the letters after where
; Claude was a moment ago (see DelayedWord; pos glides after it, in hundredths of a word so it can
; settle finely). Returns whether it's on the move.
FollowFrame(now, dt, smooth) {
    if !(Voice.on || Voice.shown > 0)
        return false
    bright := Voice.on ? 1 : 0, glow := Voice.paused ? 0.7 : 1
    Voice.shown := Approach(Voice.shown, bright, smooth ? dt / 300 : 1)
    Voice.glow := Approach(Voice.glow, glow, smooth ? dt / 200 : 1)
    target := DelayedWord()
    speed := Voice.posSpeed, Voice.pos := Spring(Voice.pos * 100, target * 100, &speed, dt, smooth ? 50 : 0) / 100
    Voice.posSpeed := speed
    return Voice.shown != bright || Voice.glow != glow || Voice.pos != target || Voice.pos != Voice.word
}

; What voice mode is doing: "speaking" (Claude is talking), "thinking" (about, or writing, its
; reply), "listening" (for you: its mic is on and it's your turn), or "" (voice mode is off, or its
; mic is muted).
VoiceState() {
    if !VoiceMode
        return ""
    if (A_TickCount - Voice.loudAt < 600)
        return "speaking"
    if (Current.thinking || Current.claudeStatus != "")
        return "thinking"
    return VoiceMicLive ? "listening" : ""
}

Approach(value, target, step) => value < target ? Min(target, value + step) : Max(target, value - step)

; Moves value toward target like a well-damped spring over about ms: it speeds up and slows down
; gently, and if the target moves on mid-way (another notch of the wheel), it carries its speed
; along instead of starting over, so scrolling glides. speed is kept from one frame to the next.
Spring(value, target, &speed, dt, ms) {
    if (ms <= 0) {
        speed := 0
        return target
    }
    omega := 2000 / ms, t := dt / 1000
    off := value - target, fall := Exp(-omega * t), push := (speed + omega * off) * t
    speed := (speed - omega * push) * fall
    off := (off + push) * fall
    if (Abs(off) < 0.3 && Abs(speed) < 8) {
        speed := 0
        return target
    }
    return target + off
}

; How long scrolling back takes to glide to a stop, from the Scroll smoothness setting (ms).
SmoothMs() => 60 * (500 / 60) ** ((Settings.ScrollSmooth - 1) / 9)

; ---- Drawing the box --------------------------------------------------------------

; Starts GDI+, the part of Windows that draws smooth text and shapes, and makes the box's window.
StartDrawing() {
    global Brush, TextFormat, CenterFormat, Measurer, BoxGui, PanelGui, PeekGui
    DllCall("LoadLibrary", "str", "gdiplus", "ptr")
    input := Buffer(24, 0)
    NumPut("uint", 1, input)   ; GDI+ version 1
    DllCall("gdiplus\GdiplusStartup", "ptr*", &token := 0, "ptr", input, "ptr", 0)
    DllCall("gdiplus\GdipCreateSolidFill", "uint", 0xFFFFFFFF, "ptr*", &Brush)
    ; Words are drawn one at a time, so they're measured without the extra room Windows normally
    ; leaves around text. 0x7804 adds to that: spaces count when measuring, and nothing wraps.
    DllCall("gdiplus\GdipStringFormatGetGenericTypographic", "ptr*", &typographic := 0)
    DllCall("gdiplus\GdipCloneStringFormat", "ptr", typographic, "ptr*", &TextFormat)
    DllCall("gdiplus\GdipSetStringFormatFlags", "ptr", TextFormat, "int", 0x7804)
    DllCall("gdiplus\GdipCloneStringFormat", "ptr", TextFormat, "ptr*", &CenterFormat)
    DllCall("gdiplus\GdipSetStringFormatAlign", "ptr", CenterFormat, "int", 1)
    DllCall("gdiplus\GdipSetStringFormatLineAlign", "ptr", CenterFormat, "int", 1)
    Measurer := MakeCanvas(1, 1)
    ; E0x80000 lets the box have soft, see-through edges, E0x20 lets clicks through to whatever is
    ; underneath (except on the cog), and E0x08000000 keeps the box from taking the keyboard.
    BoxGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000 +E0x20 +E0x08000000")
    ; The list beside the box of Claude's sessions or chats (see DrawPanel), which takes clicks.
    PanelGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000 +E0x08000000")
    ; The tab with Claude's logo the box tucks into (see DrawPeek), which takes clicks too.
    PeekGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000 +E0x08000000")
    ApplySettings()
}

; Works out sizes, fonts and colors from Settings, and lays the words out again to match (while you
; drag the box's width, quick: only what shows, see below).
ApplySettings(quick := false) {
    global Look, Canvas, PanelCanvas, PeekCanvas
    was := A_IsCritical   ; (put back at the end: see there)
    Critical
    dpi := MonitorDpi(BoxMonitor()), s := dpi / 96   ; (sized for the monitor the box is on)
    key := Settings.Font "|" Settings.FontSize "|" dpi   ; the fonts only change with these
    if (!Look || Look.key != key) {
        if Look
            FreeFonts(Look)
        px := Settings.FontSize * dpi / 72
        Look := {key: key, s: s, widths: Map()}
        ; What was said is in your font; the labels and indicators around it are always in
        ; LABEL_FONT, sized to go with it, so they look the same whatever font you pick.
        Look.font := MakeFont(Settings.Font, px, 0)
        Look.boldFont := MakeFont(Settings.Font, px, 1)
        Look.codeFont := MakeFont(FontExists("Cascadia Mono") ? "Cascadia Mono" : "Consolas", px * 0.9, 0)
        Look.labelFont := MakeFont(LABEL_FONT, Max(px * 0.72, 9 * s), 1)   ; bold
        Look.smallFont := MakeFont(LABEL_FONT, Max(px * 0.8, 9.5 * s), 0)
        icons := FontExists("Segoe Fluent Icons") ? "Segoe Fluent Icons" : FontExists("Segoe MDL2 Assets") ? "Segoe MDL2 Assets" : ""
        Look.cogFont := MakeFont(icons != "" ? icons : "Segoe UI Symbol", 13 * s, 0)
        Look.cogGlyph := icons != "" ? Chr(0xE713) : "⚙"
        Look.iconFont := icons != "" ? MakeFont(icons, Max(px * 0.72, 9 * s) * 1.1, 0) : ""   ; for the badge's message icon
        Look.messageGlyph := Chr(0xE8BD)
        ; Fonts leave very different room above and below their letters, so lines are spaced, and
        ; everything is lined up, by where the letters themselves sit (their ink). Each *Dy is
        ; how far below the top of its line something is drawn, to sit in the middle of it.
        text := Ink(Look.font), bold := Ink(Look.boldFont), code := Ink(Look.codeFont)
        label := Ink(Look.labelFont, "HO0"), small := Ink(Look.smallFont)   ; labels are in capitals
        Look.lineH := Round(text.h * 1.65)
        Look.textDy := (Look.lineH - text.h) / 2 - text.top, Look.boldDy := (Look.lineH - bold.h) / 2 - bold.top
        Look.labelH := Round(label.h * 2), Look.labelDy := (Look.labelH - label.h) / 2 - label.top
        Look.smallH := Round(small.h * 1.55), Look.smallDy := (Look.smallH - small.h) / 2 - small.top
        Look.stepDy := (Look.lineH - small.h) / 2 - small.top, Look.dotR := Look.smallH * 0.16
        Look.space := TextWidth(" ", Look.font)
        Look.labelSpace := TextWidth(" ", Look.labelFont) * 2
        Look.pad := Round(14 * s)
        Look.radius := 12 * s, Look.gap := Round(10 * s), Look.exGap := Round(22 * s), Look.labelGap := Round(3 * s)
        Look.rise := 5 * s, Look.paraGap := Round(Look.lineH * 0.35)
        Look.bulletX := Round(3 * s), Look.indent := Round(TextWidth("•", Look.font) + 10 * s)
        ; Code sits on a soft rounded patch around its letters, in the middle of the line.
        Look.codePad := Round(4 * s), Look.codeDy := (Look.lineH - code.h) / 2 - code.top
        Look.codeH := Round(Max(code.h, text.h) + 6 * s), Look.codeTop := (Look.lineH - Look.codeH) / 2
        Look.workIndent := Round(Look.smallH * 0.96 + 9 * s)   ; (after Claude's spark)
        ; Icons, lined up in a label's row: the badge's message, and (in icons) the tab's speech
        ; bubble for Chat and Cowork and brackets for Code, and the rest (the tucked page's, ☰, links).
        Look.icons := Map()
        if Look.iconFont {
            icon := Ink(Look.iconFont, Look.messageGlyph)
            Look.iconDy := (Look.labelH - icon.h) / 2 - icon.top
            for name, glyph in Map("chat", Chr(0xE8BD), "code", Chr(0xE943), "menu", Chr(0xE700), "link", Chr(0xE71B), "page", Chr(0xE774)) {
                icon := Ink(Look.iconFont, glyph)
                Look.icons[name] := {glyph: glyph, dy: (Look.labelH - icon.h) / 2 - icon.top, w: TextWidth(glyph, Look.iconFont)}
            }
        }
        Look.cornerSize := Round(14 * s), Look.gripW := Round(18 * s), Look.barZone := Round(14 * s)
        ; The tabs on top of the box (see below), and the bubble around what you said on the Chat
        ; page (with Bubbles on).
        Look.tabH := Round(Look.labelH + 6 * s)
        Look.bubblePadX := Round(11 * s), Look.bubblePadY := Round(2 * s)
        ; The list beside the box: its width, the height of its heading and of each row, and its padding.
        Look.panelW := Round(260 * s), Look.panelHead := Round(Look.labelH + 12 * s)
        Look.rowH := Round(Look.smallH + 12 * s), Look.panelPad := Round(8 * s)
        ; The Claude tab the box tucks into, and the row of links at the bottom of the box.
        Look.peekSize := Round(76 * s), Look.peekLogo := Round(44 * s), Look.linkRowH := Round(Look.labelH + 12 * s)
        ; The typing box at the bottom: room around what you type, how tall a line of it is (in the
        ; real text box, see StartTyping), and the send button.
        Look.inputPad := Round(9 * s), Look.editLineH := Round(px * 1.36)
        Look.sendD := Round(Look.lineH * 0.82)
    }
    ; The width can change on its own (dragging a corner), without the fonts changing.
    Look.W := Round(Settings.Width * s), Look.inner := Look.W - 2 * Look.pad
    ; The tabs on top of the box: from its left, ☰, then Chat and Cowork, then Code; or, with the box
    ; on the left of the screen, the other way round from its right, so ☰ is toward the middle.
    Look.mirror := InStr(Settings.Corner, "left") > 0, Look.compact := false
    TabSlots()
    ; The cog and the – that tucks the box away: level with the tabs, at the other end from them.
    Look.cogR := 11 * s, Look.cogY := -Look.tabH / 2 + s
    Look.cogX := Look.mirror ? Look.pad + Look.cogR : Look.W - Look.pad - Look.cogR
    Look.miniX := Look.mirror ? Look.cogX + 2 * Look.cogR + 6 * s : Look.cogX - 2 * Look.cogR - 6 * s
    PlacePageTab()   ; (the page's, while it's tucked away)
    Look.colors := Colors()
    Look.motion := Motion()
    ; The tab, and the box at its tallest (with the strip for a name, the row of links and the typing box).
    tallest := Look.tabH + 2 * Look.pad + Look.labelH + Look.linkRowH + Settings.Lines * Look.lineH + Round(4 * s)
        + 4 * Look.editLineH + 2 * Look.inputPad + Look.gap + Look.sendD
    if (!Canvas || Canvas.w != Look.W || Canvas.h != tallest) {
        if Canvas
            FreeCanvas(Canvas)
        Canvas := MakeCanvas(Look.W, tallest)
    }
    if (!PeekCanvas || PeekCanvas.w != Look.peekSize) {
        if PeekCanvas
            FreeCanvas(PeekCanvas)
        PeekCanvas := MakeCanvas(Look.peekSize, Look.peekSize)
    }
    panelTallest := Look.panelHead + (PANEL_ROWS + 1) * Look.rowH + Look.panelPad
        + Round(14 * s) + 2 * Look.rowH + Round(Look.smallH + 6 * s)   ; (and the model bar at its bottom, see ModelBarH)
    if (!PanelCanvas || PanelCanvas.w != Look.panelW || PanelCanvas.h != panelTallest) {
        if PanelCanvas
            FreeCanvas(PanelCanvas)
        PanelCanvas := MakeCanvas(Look.panelW, panelTallest)
    }
    ; The words are laid out again only if that would change: the fonts, the box's width, or bubbles.
    ; (Every exchange in every conversation, with thousands of words, so not for a color or a sound.)
    ; While you drag the width (a corner of the box, or its slider), only the newest exchanges, enough
    ; to fill the box, which is all it shows meanwhile; the rest once you let go (see BoxMouseUp,
    ; SettingsUp), so the box keeps up with the mouse however long the conversation.
    static laidFor := ""
    if (laidFor != (layout := Look.key "|" Look.W "|" Settings.Bubbles)) {
        if quick {
            LayOutExchange(Current)
            h := Current.height, i := History.Length
            while (i >= 1 && h < (Settings.Lines + 2) * Look.lineH)
                LayOutExchange(History[i]), h += History[i--].height + Look.exGap
        } else {
            laidFor := layout
            for ex in History
                LayOutExchange(ex)
            LayOutExchange(Current)
            for key, saved in Conversations {   ; (the others too, for when you go back to them)
                for ex in saved.history
                    LayOutExchange(ex)
                LayOutExchange(saved.current)
            }
        }
    }
    Place()
    SnapView()
    ; Back to how the thread that called it was. Turning Critical off here once left a mouse click's
    ; thread interruptible halfway (Critical in a function carries on in its caller): FrameLoop then
    ; started on top of it and ran on while the box moved, so the click never finished, and every
    ; click after it (one thread per message) was dropped, which locked up the box and the settings.
    Critical was ? was : "Off"
    SetClaudeKey()
    Kick()
}

; The colors for the box: its background, the words, your name, Claude's and code's, for the theme
; picked (with "Match Windows", dark or light as Windows is for apps; with "Custom", yours).
Colors() {
    theme := Settings.Theme = "Match Windows" ? (WindowsUsesLight() ? "Light" : "Dark") : Settings.Theme
    switch theme {
        case "Light":    return Palette(0xFAF9F5, 0x1F1E1D, 0x2F6FD8, 0xC15F3C, 0x9A3F22)
        case "Midnight": return Palette(0x0F1629, 0xE3E8F4, 0x7AA7FF, 0xF2A07B, 0xFFD3A8)
        case "Ocean":    return Palette(0x0C2A33, 0xE4F3F3, 0x6FD3F2, 0xFFB27A, 0xFCE3A0)
        case "Forest":   return Palette(0x16241B, 0xE9F1E6, 0x8FC4FF, 0xF0A77A, 0xD7EFA3)
        case "Sunset":   return Palette(0x2B1624, 0xFCEFF4, 0x9DB8FF, 0xFF9F7A, 0xFFD4A6)
        case "Paper":    return Palette(0xF3EDE2, 0x2B2521, 0x2D64C8, 0xB65532, 0x8E3B1F)
        case "Rosé":     return Palette(0xFBEFF1, 0x3A2328, 0x3F6BD6, 0xC8506A, 0x9A3350)
        case "Mono":     return Palette(0x161616, 0xEDEDED, 0xBDBDBD, 0xFFFFFF, 0xD0D0D0)
        case "Custom":
            c := StrSplit(Settings.CustomColors, ",")
            return Palette(Integer("0x" c[1]), Integer("0x" c[2]), Integer("0x" c[3]), Integer("0x" c[4]), Integer("0x" c[5]), true)
    }
    return Palette(0x1F1E1D, 0xF5F4EE, 0x8AB4F8, 0xE08A6D, 0xF2C4A8)   ; Dark
}

; A set of colors from its background, words, your name, Claude's name and code. Whether it's a
; light one goes by how bright the background is; the faint edge and the shadow behind words on a
; see-through box go the other way. With your own colors (custom), any that would be hard to read on
; the background are brightened (or darkened) just enough to read, and soft says how much stronger
; faint words (like "Message Claude…", LISTENING and the times) are drawn when the words and the
; background are close in color (see Faint). The themes here are left as they are.
Palette(bg, text, you, claude, code, custom := false) {
    light := (bg >> 16 & 0xFF) * 0.299 + (bg >> 8 & 0xFF) * 0.587 + (bg & 0xFF) * 0.114 > 140
    soft := 1.0
    if custom {
        text := Readable(text, bg, 7), you := Readable(you, bg, 4.5), claude := Readable(claude, bg, 4.5), code := Readable(code, bg, 4.5)
        while (soft * 0.45 < 1 && Contrast(Blend(bg, text, soft * 0.45), bg) < 3.5)   ; (faint words are drawn at about 0.45)
            soft += 0.1
    }
    return {light: light, bg: bg, text: text, you: you, claude: claude, code: code, soft: Min(soft, 1 / 0.45),
        edge: light ? 0x000000 : 0xFFFFFF, shadow: light ? 0xFFFFFF : 0x000000}
}

; How bright a color looks (its relative luminance): 0 for black to 1 for white.
Lum(rgb) {
    l := 0
    for i, weight in [0.2126, 0.7152, 0.0722] {
        v := (rgb >> (24 - 8 * i) & 0xFF) / 255
        l += weight * (v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4)
    }
    return l
}

; How much two colors stand out from each other: from 1 (the same) to 21 (black and white).
Contrast(a, b) {
    la := Lum(a), lb := Lum(b)
    return (Max(la, lb) + 0.05) / (Min(la, lb) + 0.05)
}

; A color, moved toward white or black just enough to stand out want to 1 on bg. It goes the way it
; already leans (lighter or darker than bg), unless that way it could hardly be read at all. On a
; background halfway between, where even white (or black) can't stand out that much, it goes most of
; the way, keeping a little of its color.
Readable(color, bg, want) {
    if (Contrast(color, bg) >= want)
        return color
    toward := Lum(color) >= Lum(bg) ? 0xFFFFFF : 0x000000
    if (Contrast(toward, bg) < 3)
        toward := toward = 0xFFFFFF ? 0x000000 : 0xFFFFFF
    want := Min(want, Contrast(toward, bg) * 0.9)
    if (Contrast(color, bg) >= want)
        return color
    loop 20
        if (Contrast(mixed := Blend(color, toward, A_Index / 20), bg) >= want)
            return mixed
    return toward
}

; How strongly to draw something faint (at a, from 0 to 1): stronger when your colors are close to
; the background, so it can still be read.
Faint(a) => Min(1, a * Look.colors.soft)

WindowsUsesLight() {
    try return RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme") = 1
    return false
}

; With "Match Windows", follows Windows when it switches between light and dark.
CheckWindowsColors() {
    if (Settings.Theme = "Match Windows" && Look && WindowsUsesLight() != Look.colors.light) {
        Look.colors := Colors()
        Kick()
    }
}

; Where Float's drift (and its lean toward the mouse) puts the box at time now, in pixels from
; where it sits, fractions and all (see DrawBox). It never stops: pausing between glides read as the
; box moving a little, stopping, and moving again.
FloatOffset(now) {
    if !(Anim.floatK > 0 && Settings.Animate && !Drag.mode)
        return {x: 0, y: 0}
    t := now / 1000, k := Anim.floatK
    return {x: (Sin(t * 0.8) * 2.5 * Look.s + Anim.leanX) * k, y: (Sin(t * 1.1 + 1) * 2 * Look.s + Anim.leanY) * k}
}

; Draws the box on Canvas and puts it on screen, all in one go. Nothing else draws meanwhile: the
; drawing helpers draw on whichever Canvas is current, and the tab, the list and the settings window
; each borrow it while they draw, so something drawing in between would land on the wrong one (like
; a frame of the box showing up in the settings window).
Draw() {
    global Canvas, FrameNow
    was := A_IsCritical, saved := Canvas
    Critical
    FrameNow := MsNow()   ; (the time everything in this frame is drawn at)
    try DrawBox()
    catch as e
        DrawFailed(e)
    finally Canvas := saved, Critical(was)   ; (even if drawing went wrong partway)
}

; Drawing went wrong partway (the frame is skipped, and the box carries on): noted in FOCUS_LOG, each
; different problem once, so one that happens every frame doesn't go unseen, as one in the list beside
; the box once did (it stayed where it was while the box moved).
DrawFailed(e) {
    static noted := Map()
    if noted.Has(key := e.Line "|" e.Message)
        return
    noted[key] := true
    NoteEvent(Format("drawing went wrong: {} (line {}{})", e.Message, e.Line, e.Extra != "" ? ", " SubStr(e.Extra, 1, 60) : ""))
}

DrawBox() {
    if (!Anim.shown && !Anim.target && Anim.p <= 0) {   ; the box is away: just its tab (and the page under it)
        DrawPeek()
        PlaceGlow(0, 0, 0, 0, 0)
        if Browser.hwnd
            MoveBrowser()
        return
    }
    g := Canvas.g, c := Look.colors
    ; The box, sized to what it shows (and, while you scroll back, the strip at its top that holds a
    ; name), and its window, which has room on top for the tab.
    stripH := Round(Anim.sticky * Look.labelH), linksH := Round(Anim.links * Look.linkRowH), inputH := TypingBoxH()
    full := 2 * Look.pad + View.h + stripH + linksH + inputH
    hb := Min(Canvas.h - Look.tabH, Round(full)), h := hb + Look.tabH
    viewH := hb - 2 * Look.pad - stripH - linksH - inputH
    ; The part of the conversation it shows, from viewTop down. In the top corners, the box grows
    ; downward a whole pixel at a time (and the name strip slides in at its top the same way) while the
    ; view glides by fractions, so the words go by the view's exact height and the strip's: going by
    ; the rounded ones, they jiggled half a pixel up and down, frame after frame, while the box grew.
    viewTop := View.bottom - viewH
    if !(InStr(Settings.Corner, "bottom") || hb < Round(full))
        viewTop := View.bottom - View.h - (Anim.sticky * Look.labelH - stripH)
    enter := Entrance()
    pos := BoxPosition(h)
    pos.x += Round(InStr(Settings.Corner, "left") ? -enter.shift : enter.shift)
    ; With Float on, it drifts gently, and leans toward the mouse: the window moves by whole pixels,
    ; and what's in it by the rest, so the drift is smooth. Only the box drifts: what's attached to it
    ; (the page under it, the list beside it) goes by where it'd be without it (baseX, baseY), and
    ; stays still, since windows like those can only move by whole pixels.
    Anim.baseX := pos.x, Anim.baseY := pos.y
    drift := FloatOffset(FrameNow), fx := drift.x, fy := drift.y, Anim.driftX := fx, Anim.driftY := fy
    if (fx || fy)
        pos.x += Floor(fx), pos.y += Floor(fy), fx -= Floor(fx), fy -= Floor(fy)
    Anim.x := pos.x, Anim.y := pos.y, Anim.h := h, Anim.lastDraw := FrameNow
    DllCall("gdiplus\GdipGraphicsClear", "ptr", g, "uint", 0)
    ; While popping in or out, everything is drawn a little smaller, growing from the box's corner.
    DllCall("gdiplus\GdipResetWorldTransform", "ptr", g)
    if (fx || fy)
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", fx, "float", fy, "int", 1)
    if (enter.scale != 1) {
        ox := InStr(Settings.Corner, "left") ? 0 : Look.W, oy := InStr(Settings.Corner, "bottom") ? h : 0
        if enter.HasOwnProp("toPeek") {   ; toward the Claude tab at the side of the screen
            spot := PeekSpot()   ; (the nearest point to it in the box's window)
            ox := Max(0, Min(Look.W, spot.cx - pos.x)), oy := Max(Look.tabH, Min(h, spot.cy - pos.y))
        }
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", -ox, "float", -oy, "int", 1)
        DllCall("gdiplus\GdipScaleWorldTransform", "ptr", g, "float", enter.scale, "float", enter.scale, "int", 1)
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", ox, "float", oy, "int", 1)
    }
    ; Out of the Claude tab, it lands with a little jiggle, squashing a touch one way and then the
    ; other from the tab's side (never bigger than the box, which would be cut off).
    age := FrameNow - Anim.jiggleAt
    if (Anim.jiggleAt && age < 700 && Settings.Animate) {
        k := (Settings.TuckStyle = "Bouncy" ? 0.05 : 0.03) * (1 - age / 700) ** 2, wave := Sin(age / 700 * 6.2832 * 2.5)
        spot := PeekSpot(), ox := Max(0, Min(Look.W, spot.cx - pos.x)), oy := Max(Look.tabH, Min(h, spot.cy - pos.y))
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", -ox, "float", -oy, "int", 1)
        DllCall("gdiplus\GdipScaleWorldTransform", "ptr", g, "float", 1 - k * Max(0, wave), "float", 1 - k * Max(0, -wave), "int", 1)
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", ox, "float", oy, "int", 1)
    }
    ; Everything from here on is drawn from the top of the box, under the tab.
    DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", 0, "float", Look.tabH, "int", 0)
    solid := Settings.Background / 100
    if solid {
        DrawTabBacks(solid)   ; the tabs not joined to the box, behind it
        RoundedBox(hb, ARGB(solid, c.bg), ARGB(solid * 0.12, c.edge), TabShape())
    }
    ; With little or no background, a soft shadow behind the words keeps them readable on anything.
    shadow := solid < 0.35 ? (1 - solid / 0.35) * 0.8 : 0
    DrawTabs(shadow)
    if (Anim.listen > 0.01)
        DrawVoiceLight(hb)
    ; After switching to another conversation, it slides in from the side (or from below).
    age := FrameNow - Anim.switchAt, dx := dy := 0
    if (Settings.Animate && age < 360) {
        off := (1 - (1 - age / 360) ** 3) * 24 * Look.s - 24 * Look.s
        dx := Anim.switchDir * -off, dy := Anim.switchDir ? 0 : -off
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", dx, "float", dy, "int", 0)
    }
    DrawConversation(Look.pad + stripH, viewH, viewTop, shadow)
    if (dx || dy)
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", -dx, "float", -dy, "int", 0)
    DrawStickyLabel(Look.pad, stripH, viewTop, shadow)
    DrawLinks(hb - Look.pad - linksH - inputH + Round(4 * Look.s), linksH)
    if inputH
        DrawInput(hb - Look.pad - inputH + Look.gap, inputH - Look.gap)
    if (Anim.above > 0.01)
        DrawMoreAbove(shadow)
    if (Current.newAt && FrameNow - Current.newAt < NEW_BADGE_MS)
        DrawNewBadge(Current)
    if (Anim.liveAt && FrameNow - Anim.liveAt < LIVE_BADGE_MS)
        DrawLiveBadge(hb)
    DrawHandles(hb)
    alpha := Round(255 * enter.alpha)
    ShowLayered(BoxGui.Hwnd, Canvas, pos.x, pos.y, alpha, Look.W, h)
    PlaceGlow(pos.x, pos.y, Look.W, hb, Anim.handed * enter.alpha)   ; (with the Claude key, see ClaudeKey)
    if (alpha && !Anim.shown) {
        DllCall("ShowWindow", "ptr", BoxGui.Hwnd, "int", 8)   ; SW_SHOWNA: show it without taking the keyboard
        Anim.shown := true
        SetTimer(WatchMouse, 25)
        SetTimer(CheckSeen, 200)
    } else if (!alpha && Anim.shown) {
        DllCall("ShowWindow", "ptr", BoxGui.Hwnd, "int", 0)
        Anim.shown := false
        SetTimer(WatchMouse, 0)
        SetTimer(CheckSeen, 0)
        Anim.hover := Anim.hoverTarget := 0
        Anim.panel := Anim.panelTarget := 0   ; the list beside it closes too
        if ModelMenu   ; (and the list of models, and Claude's menu with it: see ToggleHidden)
            SetTimer(CloseModelMenu, -1)
        SetTimer(TrimMemory, -5000)
        global Opened := false
        if (Anim.hot != "")
            Anim.hot := "", Anim.through := true, ClickThrough(true)
    }
    DrawPanel(enter.alpha)
    DrawPeek()
    if Composing
        PlaceEditor(alpha >= 255 && enter.scale = 1)
    if Browser.hwnd
        MoveBrowser()
}

; How the box looks partway through showing up (Anim.p heading to 1) or going away (heading to 0):
; how see-through it is, how big (Pop grows out of its corner), and how far it still has to slide
; in from the edge of the screen (Slide). Going away runs the same curve backwards, so it starts
; gently and finishes quickly. Going into the Claude tab at the edge of the screen (or coming out of
; it), it shrinks right down into the tab (toPeek), in the Tuck animation's style.
Entrance() {
    p := Anim.p
    settle := 1 - (1 - p) ** 3   ; quick at first, then settling
    if (Anim.tucking && Settings.Animate) {
        switch Settings.TuckStyle {
            case "Bouncy": grow := Anim.target ? 1 - (1 - p) ** 3 : p ** 2
            case "Smooth": grow := p * p * (3 - 2 * p)
            case "Quick":  grow := 1 - (1 - p) ** 2
            default:       grow := p ** 2.3   ; Swoosh: comes out slowly, then rushes out; goes in fast, then settles into the tab
        }
        return {alpha: Min(1, 3 * p), scale: 0.06 + 0.94 * grow, shift: 0, toPeek: true}
    }
    switch Settings.Appear {
        case "Pop":
            return {alpha: settle, scale: 0.86 + 0.14 * (1 - (1 - p) ** 4), shift: 0}
        case "Slide":
            return {alpha: settle, scale: 1, shift: (1 - settle) * 40 * Look.s}
    }
    return {alpha: p * p * (3 - 2 * p), scale: 1, shift: 0}   ; Fade: soft at both ends
}

; Draws the part of the conversation the box is showing (from viewTop), viewH tall from top: the exchange
; happening now and, above it, the earlier ones. The box settles on whole lines, so only a line
; sliding in or out past an edge fades, and a thin bar shows where you are when there's more than
; fits. While Claude reads its reply out loud, the letters it's saying glow.
DrawConversation(top, viewH, viewTop, shadow) {
    lineH := Look.lineH, now := FrameNow
    edges := {top: top, bottom: top + viewH}
    SetClip(top, viewH)
    loop History.Length + 1 {
        ex := A_Index <= History.Length ? History[A_Index] : Current
        if (ex.y + ex.height < viewTop - lineH)
            continue
        if (ex.y > viewTop + viewH)
            break
        live := ex = Current
        for j, part in ex.parts {
            y := top + ex.y + part.y - viewTop
            if (part.key = "work") {
                if (y < top + viewH && y + Look.smallH > top)
                    DrawWork(ex, part.line, y, EdgeFade(edges, y, Look.smallH), shadow)
                continue
            }
            ; The message you're pointing at shows its time.
            bottom := top + ex.y + (j < ex.parts.Length ? ex.parts[j + 1].y : ex.height) - viewTop
            focus := Anim.hover > 0.5 && Anim.mouseY != "" && Anim.mouseY >= y && Anim.mouseY < bottom
            if (y < top + viewH && y + Look.labelH > top && !(Anim.sticky >= 0.99 && y < top + Look.labelH / 2))   ; (up in the strip instead)
                DrawLabel(ex, part, y, EdgeFade(edges, y, Look.labelH), shadow, focus)
            textTop := top + ex.y + part.textY - viewTop
            dim :=!live ? 1 : part.key = "queued" ? 0.7 : part.key = "you" && ex.dim ? 0.55 : 1
            if part.bubble {   ; in a bubble (on the Chat page, with Bubbles on): yours in your color, Claude's in its own
                bh := live && part.key = "claude" ? BubbleShown(part, now) : part.bubble.h
                if (bh > 0)
                    FillRoundRect(Look.pad + part.bubble.x, textTop, part.bubble.w, bh, Min(bh / 2, 16 * Look.s),
                        ARGB(dim * (Look.colors.light ? 0.13 : 0.2), Look.colors.%part.color%))
            }
            ; While Claude reads its reply out loud, the words it's on glow (see DrawLetterGlow).
            glows := live && part.key = "claude" && Voice.shown > 0.01 ? GlowingWords() : ""
            preLine := ""
            i := FirstVisible(part.tokens, top - textTop - lineH)
            while (i <= part.tokens.Length) {
                t := part.tokens[i]
                ty := textTop + t.y
                if (ty > top + viewH)
                    break
                appear := live ? WordShown(t.born, now) : 1
                a := EdgeFade(edges, ty, lineH) * dim
                if (live && t.per && now < t.born + StrLen(t.text) * t.per + 90) {   ; being typed out
                    if (now >= t.born)
                        DrawTyping(t, Look.pad + t.x, ty, a, shadow, now)
                    i++
                    continue
                }
                if (t.style = "pre" && t.y != preLine) {   ; a code block's lines sit on a soft band (inside the bubble, if it's in one)
                    if part.bubble
                        FillRect(Look.pad + part.bubble.x + Look.bubblePadX / 2, ty, part.bubble.w - Look.bubblePadX, lineH, ARGB(a * 0.08, Look.colors.text))
                    else
                        FillRect(Look.pad - 6 * Look.s, ty, Look.inner + 12 * Look.s, lineH, ARGB(a * 0.08, Look.colors.text))
                    preLine := t.y
                }
                x := Look.pad + t.x, y := ty + (1 - appear) * Look.rise, glowA := a * appear * Voice.shown * Voice.glow
                lit := glows && glows.Has(i) ? DrawLetterGlow(t, x, y, glowA, glows[i]) : ""
                DrawToken(t, x, y, a * appear, shadow)
                if lit
                    TintWord(t, x, y, glowA, lit)
                i++
            }
        }
        ; Scrolled back, each paragraph of Claude's with words you haven't seen yet (like ones that
        ; flew by too fast) is marked by a thin line with NEW on it, which fades away once you've read
        ; that paragraph, whichever way you scroll to it.
        if (View.scrolled && (reply := ReplyPart(ex)))
            for mark in NewParagraphs(ex, reply, now) {
                ly := top + ex.y + reply.textY + mark.y - viewTop
                if (ly > top - lineH && ly < top + viewH)
                    DrawNewLine(ly, mark.a * EdgeFade(edges, ly - Look.labelH / 2, Look.labelH))
            }
    }
    DllCall("gdiplus\GdipResetClip", "ptr", Canvas.g)
    ; The scroll bar: how much of the conversation shows, and where. It's noted in Anim.bar (in
    ; the box's own coordinates) so it can be grabbed, and gets wider while you point at it.
    Anim.bar := ""
    if (View.total > viewH + 1 && (View.scrolled || Anim.hover > 0)) {
        barH := Max(24 * Look.s, viewH * viewH / View.total)
        where := Max(0, Min(1, viewTop / (View.total - viewH)))
        Anim.bar := {top: top, room: viewH, y: top + (viewH - barH) * where, h: barH}
        wide := Anim.hot = "scroll" || Drag.mode = "scroll"
        barW := (wide ? 6 : 3) * Look.s
        FillPill(Look.W - 5 * Look.s - barW, Anim.bar.y, barW, barH,
            ARGB((wide ? 0.55 : 0.3) * (View.scrolled ? 1 : Anim.hover), Look.colors.text))
    }
}

; How tall Claude's bubble shows while its words are still coming in: down to the newest line with
; any words on it yet, that line opening up smoothly as its first word arrives (or all of it, once
; they're all in).
BubbleShown(part, now) {
    firsts := Map(), bottom := 0
    for t in part.tokens
        if (t.born <= now)
            firsts[t.y] := firsts.Has(t.y) ? Min(firsts[t.y], t.born) : t.born
    for y, born in firsts {
        p := Min(1, (now - born) / 160)
        bottom := Max(bottom, y + Look.lineH * (1 - (1 - p) ** 3))
    }
    return bottom ? Min(part.bubble.h, bottom + Look.bubblePadY) : 0
}

; Where the words you haven't seen start (the top of their paragraph, at y): a thin line in
; Claude's color with a small NEW on its right.
DrawNewLine(y, a) {
    s := Look.s, c := Look.colors, text := "NEW", h := Look.labelH - 2 * s
    w := 14 * s + TextWidth(text, Look.labelFont), x := Look.pad + Look.inner - w, ly := y + s
    FillRect(Look.pad, ly, x - Look.pad - 6 * s, Max(1, s), ARGB(a * 0.55, c.claude))
    FillRoundRect(x, ly - h / 2, w, h, h / 2, ARGB(a * Max(0.85, Settings.Background / 100), c.bg))
    FillRoundRect(x, ly - h / 2, w, h, h / 2, ARGB(a * 0.25, c.claude))
    DrawWord(text, Look.labelFont, x + 7 * s, ly - h / 2 + (h - Look.labelH) / 2 + Look.labelDy, a, c.claude, 0)
}

; While you scroll back, the name on the message the top of the box is in (whose words you're
; reading) stays in a strip at the top, on its side, so you always know; when the next message's
; name comes up, it pushes this one up and out. A name right at the top of the words moves up into
; the strip (see DrawConversation, which leaves it out there). Its time shows too.
DrawStickyLabel(top, stripH, viewTop, shadow) {
    if (stripH < 1)
        return
    best := "", bestEx := "", nextY := ""
    loop History.Length + 1 {
        ex := A_Index <= History.Length ? History[A_Index] : Current
        for part in ex.parts {
            if !part.HasOwnProp("label")   ; (what Claude is doing has no name)
                continue
            if (ex.y + part.y < viewTop + Look.labelH / 2) {
                best := part, bestEx := ex
            } else {
                nextY := ex.y + part.y
                break 2
            }
        }
    }
    if !best
        return
    push := nextY = "" ? 0 : Min(0, nextY - viewTop - Look.labelH)
    DllCall("gdiplus\GdipSetClipRect", "ptr", Canvas.g, "float", 0, "float", top, "float", Look.W, "float", stripH, "int", 0)
    DrawLabel(bestEx, best, top + stripH - Look.labelH + push, 1, shadow, true)
    DllCall("gdiplus\GdipResetClip", "ptr", Canvas.g)
    FillRect(Look.pad, top + stripH - Look.s, Look.inner, Look.s, ARGB(0.1 * stripH / Look.labelH, Look.colors.text))
}

; How much of something at y (h tall) shows inside the box: a line partly past an edge (while
; sliding in or out) fades by how much of it is past.
EdgeFade(edges, y, h) {
    f := 1
    if (y < edges.top)
        f := Max(0, 1 - (edges.top - y) / h)
    if (y + h > edges.bottom)
        f := Min(f, Max(0, 1 - (y + h - edges.bottom) / h))
    return f * f
}

; The first word at or below minY (from the top of its text), found by halving, since a long reply
; can have thousands of words and only the ones in view are drawn.
FirstVisible(tokens, minY) {
    lo := 1, hi := tokens.Length + 1
    while (lo < hi) {
        mid := (lo + hi) // 2
        if (tokens[mid].y < minY)
            lo := mid + 1
        else
            hi := mid
    }
    return lo
}

; A part's label, like "YOU · 10:32 AM", "YOU · LISTENING" or "CLAUDE · SPEAKING". What's
; happening now pulses gently. The time is dimmer, and shows only while you scroll back (and for a
; few seconds after), or on the message you're pointing at (focus). While Claude reads its reply out
; loud, its label says SPEAKING. (Voice mode itself shows as the light rising from the bottom of the
; box, see DrawVoiceLight: a tag and a pill saying so too made the top of the box busy.) Claude's newest reply has Claude's spark before its name, like in Claude's own window:
; moving while Claude is still going, and still once it's all done (what it's doing shows at the end
; of the reply, see DrawWork). On the Chat page, what you said is on the right, and so is its label,
; mirrored so the name stays at the edge: "10:32 AM · YOU".
DrawLabel(ex, part, y, a, shadow, focus := false) {
    color := Look.colors.%part.color%
    live := ex = Current, status := "", pulse := false
    switch part.key {
        case "note": status := "ON", pulse := true
        case "you": pulse := live && ex.youStatus != "", status := pulse ? ex.youStatus : ex.time
        case "queued": status := "QUEUED", pulse := true
        case "claude":
            if (live && (Voice.on && Voice.ex = ex || Reader.speaking && Reader.ex = ex))
                status := "SPEAKING", pulse := true
            else
                status := ex.replyTime
    }
    shows := pulse ? 1 : Max(Anim.times, focus ? 1 : 0)   ; a time shows only now and then
    s := Look.s, labelW := TextWidth(part.label, Look.labelFont)
    statusA := a * shows * (pulse ? 0.7 + 0.3 * Cos(FrameNow / 1800 * 6.2832) : 0.6)
    if (part.align = "right") {
        x := Look.pad + Look.inner - labelW
        DrawWord(part.label, Look.labelFont, x, y + Look.labelDy, a, color, shadow)
        if (status != "" && shows > 0.01) {
            text := status "  ·"
            DrawWord(text, Look.labelFont, x - Look.labelSpace - TextWidth(text, Look.labelFont), y + Look.labelDy, statusA, color, shadow)
        }
    } else {
        x := Look.pad
        if (live && part.key = "claude") {   ; Claude's spark, by its name (and at the end of the reply, see DrawWork)
            r := Look.labelH * 0.36, moving := ex.thinking || ex.claudeStatus != "" || ex.work != "" || Voice.on && Voice.ex = ex
            age := FrameNow - ex.doneAt, grow := !moving && ex.doneAt && age < 500 ? 1 - (1 - age / 500) ** 3 : 1
            ClaudeSpark(x + r, y + Look.labelH / 2, r * (0.55 + 0.45 * grow), a * (0.4 + 0.6 * grow), moving, (1 - grow) * 1.5)
            x += 2 * r + 6 * s
        }
        DrawWord(part.label, Look.labelFont, x, y + Look.labelDy, a, color, shadow)
        if (status != "" && shows > 0.01)
            DrawWord("·  " status, Look.labelFont, x + labelW + Look.labelSpace, y + Look.labelDy, statusA, color, shadow)
    }
}

; The "new message" badge: a pill with a message icon and the time, floating above the box's top
; right corner, level with the tabs and sized to them, so it shows wherever in the reply the new
; words are and never covers any. If the time doesn't fit beside the tabs, it just says NEW, and
; if that doesn't either, it's just the icon. It pops in, stays a moment, then fades away.
DrawNewBadge(ex) {
    s := Look.s, h := Look.tabH - 4 * s
    iconW := Look.iconFont ? TextWidth(Look.messageGlyph, Look.iconFont) + 5 * s : 0
    for text in ["NEW  ·  " ex.newTime, "NEW", ""] {
        w := 16 * s + iconW + (text = "" ? -5 * s : TextWidth(text, Look.labelFont))
        if ((text != "" || iconW) && (x := TabRoom(w)) != "")
            return DrawPill(x, 2 * s - Look.tabH, w, FrameNow - ex.newAt, NEW_BADGE_MS, 1100, iconW, text, true, h)
    }
}

; Where something w wide goes level with the tabs, beside them (on the right, or on the left while
; the tabs are the other way round), or "" if it doesn't fit.
TabRoom(w) {
    gap := 8 * Look.s, controls := 4 * Look.cogR + 14 * Look.s   ; (the cog and – are at the end)
    last := Look.slots.Has("page") ? Look.slots["page"] : Look.slots["code"]   ; (the tucked-away page's tab, if it's there)
    if Look.mirror
        return last.left - gap - Look.pad - controls >= w ? Look.pad + controls : ""
    return Look.W - Look.pad - controls - last.right - gap >= w ? Look.W - Look.pad - controls - w : ""
}

; "LIVE" at the bottom of the box when you've scrolled back to the live captions, with a red dot.
; It stays a moment, then fades away.
DrawLiveBadge(h) {
    s := Look.s, dotW := 2 * Look.dotR + 6 * s, text := "LIVE"
    w := 8 * s + dotW + TextWidth(text, Look.labelFont) + 8 * s, pillH := Look.labelH + 4 * s
    x := Look.W - Look.pad - w, y := h - pillH - 6 * s
    vis := DrawPill(x, y, w, FrameNow - Anim.liveAt, LIVE_BADGE_MS, 1000, dotW, text)
    FillCircle(x + 8 * s + Look.dotR, y + pillH / 2, Look.dotR, ARGB(vis, 0xE5484D))
}

; A pill h tall (or a little taller than a label) that pops in (growing a touch from its right
; end), stays, and fades away over fadeMs before lastsMs is up: its label in Claude's color, after
; room (lead) for a message icon (if icon) or a dot. It sits on the box's own color, so what's
; under it doesn't show through. Returns how visible it is, from 0 to 1.
DrawPill(x, y, w, age, lastsMs, fadeMs, lead, text, icon := false, h := 0) {
    s := Look.s, h := h || Look.labelH + 4 * s, rowTop := y + (h - Look.labelH) / 2
    vis := age < 200 ? age / 200 : age > lastsMs - fadeMs ? (lastsMs - age) / fadeMs : 1
    vis := Max(0, Min(1, vis)), vis := vis * vis * (3 - 2 * vis)   ; soft at both ends
    grow := 0.9 + 0.1 * Min(1, age / 200), gx := x + w * (1 - grow), gy := y + h * (1 - grow) / 2
    FillRoundRect(gx, gy, w * grow, h * grow, h / 2, ARGB(vis * Max(0.85, Settings.Background / 100), Look.colors.bg))
    FillRoundRect(gx, gy, w * grow, h * grow, h / 2, ARGB(vis * 0.22, Look.colors.claude))
    if (icon && Look.iconFont)
        DrawWord(Look.messageGlyph, Look.iconFont, x + 8 * s, rowTop + Look.iconDy, vis, Look.colors.claude, 0)
    DrawWord(text, Look.labelFont, x + 8 * s + lead, rowTop + Look.labelDy, vis, Look.colors.claude, 0)
    return vis
}

; The line at the end of Claude's newest reply: Claude's spark, like in Claude's own window, and
; what Claude is doing, small and quiet: its status on the Code page ("2m 5s · 1.3k tokens ·
; Thinking…", in line), or "Thinking…", "Responding…" or (in voice mode) "Speaking…". While Claude
; is still going, the spark moves; once it's all done, it settles (with a little pop) and stays
; still, with "Finished" (and how long it took, and the tokens, on the Code page), so you know.
DrawWork(ex, line, y, a, shadow) {
    s := Look.s, r := Look.smallH * 0.48, talking := ex = Current && Voice.on && Voice.ex = ex
    moving := ex = Current && (ex.thinking || ex.claudeStatus != "" || ex.work != "") || talking
    age := FrameNow - ex.doneAt, grow := !moving && ex.doneAt && age < 500 ? 1 - (1 - age / 500) ** 3 : 1   ; (settling with a little pop)
    ClaudeSpark(Look.pad + r + s, y + Look.smallH / 2, r * (0.55 + 0.45 * grow), a * (0.4 + 0.6 * grow), moving, (1 - grow) * 1.5)
    text := line != "" ? line : ex.thinking ? "Thinking…" : ex.claudeStatus != "" ? "Responding…" : talking ? "Speaking…"
        : "Finished" (ex.took != "" ? "  ·  " ex.took : "")
    DrawWord(FitWidth(text, Look.smallFont, Look.inner - Look.workIndent), Look.smallFont, Look.pad + Look.workIndent, y + Look.smallDy,
        a * (moving ? 0.6 : 0.6 * grow), Look.colors.text, shadow)
}

; Claude's spark, the shape of its logo: rays of different lengths around a middle, in Claude's
; color, r from the middle to the tip of the longest, drawn around cx, cy. Moving (while Claude
; works), its rays swell and shrink in a wave that goes round and it turns slowly, like in Claude's
; own window; still, it sits quietly (turned by twist, in radians, as it settles).
ClaudeSpark(cx, cy, r, a, moving, twist := 0) {
    static lengths := [1, 0.86, 0.95, 0.82, 0.98, 0.88, 0.93, 0.84, 1, 0.9, 0.95, 0.85], points := Buffer(16)
    if (a < 0.01)
        return
    t := A_TickCount / 1000, n := lengths.Length, turn := (moving ? t * 1.1 : 0) + twist
    breathe := moving ? 0.88 + 0.12 * Sin(t * 3.2) : 1   ; (the whole spark, gently)
    color := ARGB(a, Look.colors.claude), width := Max(1.3 * Look.s, r * 0.17), inner := r * 0.12
    loop n {
        angle := (A_Index - 1) * 6.2832 / n + turn
        long := r * breathe * lengths[A_Index] * (moving ? 0.9 + 0.1 * Sin(t * 5 - A_Index * 1.05) : 1)
        NumPut("float", cx + Cos(angle) * inner, "float", cy + Sin(angle) * inner, "float", cx + Cos(angle) * long, "float", cy + Sin(angle) * long, points)
        DrawLines(points, 2, width, color)
    }
}

; A word being typed out a letter at a time (see PaceWords): the letters so far, and the newest one
; popping in.
DrawTyping(t, x, y, a, shadow, now) {
    f := FontOf(t.style), letters := LetterSpots(t, f), n := letters.Length
    if !n
        return
    k := Min(n, Floor((now - t.born) / t.per) + 1)
    pop := Min(1, (now - t.born - (k - 1) * t.per) / Max(16, Min(90, 2 * t.per)))
    dy := t.style = "bold" ? Look.boldDy : t.style = "pre" ? Look.codeDy : Look.textDy
    color := t.style = "pre" ? Look.colors.code : Look.colors.text
    if (k > 1)
        DrawWord(SubStr(t.text, 1, k - 1), f, x, y + dy, a, color, shadow)
    DrawWord(letters[k].ch, f, x + letters[k].x, y + dy + (1 - pop) * Look.rise * 0.5, a * pop, color, shadow)
}

DrawToken(t, x, y, a, shadow) {
    c := Look.colors
    switch t.style {
        case "bullet":
            DrawWord("•", Look.font, x, y + Look.textDy, a * 0.8, c.text, shadow)
        case "code":
            FillRoundRect(x, y + Look.codeTop, t.w, Look.codeH, 3 * Look.s, ARGB(a * 0.14, c.text))
            DrawWord(t.text, Look.codeFont, x + Look.codePad, y + Look.codeDy, a, c.code, shadow)
        case "pre":
            DrawWord(t.text, Look.codeFont, x, y + Look.codeDy, a, c.code, shadow)
        case "stepdot":
            FillCircle(x + Look.dotR, y + Look.lineH / 2, Look.dotR, ARGB(a * 0.45, c.claude))
        case "rundot":
            breathe := (Sin(FrameNow / 1000 * 6.2832 / 1.6) + 1) / 2
            FillCircle(x + Look.dotR, y + Look.lineH / 2, Look.dotR * (0.8 + 0.3 * breathe), ARGB(a * (0.45 + 0.5 * breathe), c.claude))
        case "step":
            DrawWord(t.text, Look.smallFont, x, y + Look.stepDy, a * 0.6, c.text, shadow)
        default:
            DrawWord(t.text, FontOf(t.style), x, y + (t.style = "bold" ? Look.boldDy : Look.textDy), a, c.text, shadow)
    }
}

; The words around where Claude is in the reply, which may be glowing: which of the reply's
; laid-out words each is, and which spoken word it is (counting from 0). Three behind, one ahead.
GlowingWords() {
    glows := Map()
    if (Voice.ex != Current)
        return glows
    list := SpokenWords(), at := Floor(Voice.pos) + 1
    loop 5 {
        k := at - 4 + A_Index
        if (k >= 1 && k <= list.Length)
            glows[list[k].i] := k - 1
    }
    return glows
}

; The glow on a word Claude is saying, or has just said (the k-th, counting from 0): a soft light
; in Claude's color around each of its letters, lit as Claude gets to it and fading away behind,
; so it sweeps along the words letter by letter. Where Claude is comes from Voice.pos. Returns how
; lit each letter is, from 0 to 1 (see TintWord), or "" if the word is too faint to glow.
DrawLetterGlow(t, x, y, a, k) {
    static pens := [], penSize := 0, layout := Buffer(16, 0)
    if (a < 0.02)
        return ""
    if (penSize != Look.s) {   ; three soft rings around each letter, from the outside in
        for pen in pens
            DllCall("gdiplus\GdipDeletePen", "ptr", pen)
        pens := [], penSize := Look.s
        for width in [6, 3.6, 1.8] {
            DllCall("gdiplus\GdipCreatePen1", "uint", 0, "float", width * Look.s, "int", 2, "ptr*", &pen := 0)
            DllCall("gdiplus\GdipSetPenLineJoin", "ptr", pen, "int", 2)   ; 2: round
            pens.Push(pen)
        }
    }
    strengths := Look.colors.light ? [0.09, 0.16, 0.3] : [0.13, 0.22, 0.4]
    f := FontOf(t.style), dy := t.style = "code" ? Look.codeDy : t.style = "bold" ? Look.boldDy : Look.textDy
    x += t.style = "code" ? Look.codePad : 0
    letters := LetterSpots(t, f), n := letters.Length, pos := Voice.pos, lits := []
    for j, letter in letters {
        spot := k + (j - 0.5) / n   ; where this letter is, in words
        lit := spot <= pos ? Exp(-(pos - spot) / 0.6) : Max(0, 1 - (spot - pos) * n)
        lits.Push(lit)
        if (lit * a < 0.03)
            continue
        DllCall("gdiplus\GdipCreatePath", "int", 0, "ptr*", &path := 0)
        NumPut("float", x + letter.x, "float", y + dy, layout)
        DllCall("gdiplus\GdipAddPathString", "ptr", path, "wstr", letter.ch, "int", -1, "ptr", f.family, "int", f.style,
            "float", f.px, "ptr", layout, "ptr", TextFormat)
        for m, pen in pens {
            DllCall("gdiplus\GdipSetPenColor", "ptr", pen, "uint", ARGB(a * lit * strengths[m], Look.colors.claude))
            DllCall("gdiplus\GdipDrawPath", "ptr", Canvas.g, "ptr", pen, "ptr", path)
        }
        DllCall("gdiplus\GdipDeletePath", "ptr", path)
    }
    return lits
}

; The letters of a word Claude is on, lit up in Claude's color over the word as the glow passes
; (lit says how much, for each letter), blending smoothly from one letter to the next.
TintWord(t, x, y, a, lit) {
    static ends := Buffer(16), spot := Buffer(16, 0)
    f := FontOf(t.style), dy := t.style = "code" ? Look.codeDy : t.style = "bold" ? Look.boldDy : Look.textDy
    x += t.style = "code" ? Look.codePad : 0
    letters := LetterSpots(t, f), n := letters.Length, w := TextWidth(t.text, f)
    if (w < 1 || !n)
        return
    ; A color for the middle of each letter (and each end of the word), for a brush that blends
    ; from one to the next across the word.
    tints := Buffer(4 * (n + 2)), places := Buffer(4 * (n + 2))
    NumPut("uint", ARGB(a * lit[1] * 0.65, Look.colors.claude), tints, 0), NumPut("float", 0, places, 0)
    for j, letter in letters {
        right := j < n ? letters[j + 1].x : w
        NumPut("uint", ARGB(a * lit[j] * 0.65, Look.colors.claude), tints, 4 * j)
        NumPut("float", Max(0.001, Min(0.999, (letter.x + right) / 2 / w)), places, 4 * j)
    }
    NumPut("uint", ARGB(a * lit[n] * 0.65, Look.colors.claude), tints, 4 * (n + 1)), NumPut("float", 1, places, 4 * (n + 1))
    NumPut("float", x, "float", 0, "float", x + w, "float", 0, ends)
    DllCall("gdiplus\GdipCreateLineBrush", "ptr", ends, "ptr", ends.Ptr + 8, "uint", 0, "uint", 0, "int", 0, "ptr*", &brush := 0)
    DllCall("gdiplus\GdipSetLinePresetBlend", "ptr", brush, "ptr", tints, "ptr", places, "int", n + 2)
    NumPut("float", x, "float", y + dy, spot)
    DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", t.text, "int", -1, "ptr", f.font, "ptr", spot, "ptr", TextFormat, "ptr", brush)
    DllCall("gdiplus\GdipDeleteBrush", "ptr", brush)
}

; Where each letter of a word starts, from the word's left, worked out once and kept with the word.
LetterSpots(t, f) {
    if t.HasOwnProp("letters")
        return t.letters
    spots := []
    loop parse t.text
        spots.Push({ch: A_LoopField, x: A_Index = 1 ? 0 : TextWidth(SubStr(t.text, 1, A_Index - 1), f)})
    return t.letters := spots
}

; The arrow at the top middle of the box saying there's more of Claude's reply above: a small
; chevron in Claude's color. It nudges upward a few times as it shows up, then rests. While you
; point at the box, the grip for moving it takes its place.
DrawMoreAbove(shadow) {
    a := Anim.above * (1 - Anim.hover)
    if (a < 0.01)
        return
    s := Look.s, age := FrameNow - Anim.aboveAt
    nudge := age < 3200 ? Abs(Sin(age / 800 * 3.1416)) * (1 - age / 3200) : 0
    cx := Look.W / 2, cy := Look.pad / 2 + 0.5 * s - nudge * 2.5 * s, halfW := 5.5 * s, halfH := 2.6 * s
    points := Buffer(24)
    NumPut("float", cx - halfW, "float", cy + halfH, "float", cx, "float", cy - halfH, "float", cx + halfW, "float", cy + halfH, points)
    if shadow   ; a soft outline, so it shows on anything behind the box
        DrawLines(points, 3, 4 * s, ARGB(a * shadow * 0.5, Look.colors.shadow))
    DrawLines(points, 3, 1.8 * s, ARGB(a * 0.9, Look.colors.claude))
}

; Lines joining count points (pairs of floats), with rounded ends and corners.
DrawLines(points, count, width, color) {
    DllCall("gdiplus\GdipCreatePen1", "uint", color, "float", width, "int", 2, "ptr*", &pen := 0)
    DllCall("gdiplus\GdipSetPenStartCap", "ptr", pen, "int", 2)   ; 2: round
    DllCall("gdiplus\GdipSetPenEndCap", "ptr", pen, "int", 2)
    DllCall("gdiplus\GdipSetPenLineJoin", "ptr", pen, "int", 2)
    DllCall("gdiplus\GdipDrawLines", "ptr", Canvas.g, "ptr", pen, "ptr", points, "int", count)
    DllCall("gdiplus\GdipDeletePen", "ptr", pen)
}

; The box's background (or, given w, another box that wide, with corners r round): a rectangle with
; rounded corners and a faint edge, with the tab on top of it (if there's a tab), all one shape.
RoundedBox(h, fill, edge, tab := "", w := 0, r := 0) {
    w := w || Look.W, r := r || Look.radius
    path := tab ? TabbedPath(0.5, 0.5, w - 1, h - 1, r, tab) : RoundedPath(0.5, 0.5, w - 1, h - 1, r)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", fill)
    DllCall("gdiplus\GdipFillPath", "ptr", Canvas.g, "ptr", Brush, "ptr", path)
    Stroke(Canvas.g, path, Look.s, edge)
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
}

; The box with the tab rising out of its top edge, as one GDI+ path (for whoever asked for it to
; delete): the box's corners and the tab's top corners are rounded, and the tab flares out where
; it meets the box. The arcs go: the box's top left corner, the flare into the tab, the tab's two
; top corners, the flare back out, and the box's other three corners.
TabbedPath(x, y, w, h, r, tab) {
    s := Look.s, q := 7 * s, f := 5 * s, a := tab.left, b := tab.right, top := tab.top
    DllCall("gdiplus\GdipCreatePath", "int", 0, "ptr*", &path := 0)
    for arc in [[x, y, 2 * r, 180, 90], [a - 2 * f, y - 2 * f, 2 * f, 90, -90], [a, top, 2 * q, 180, 90],
            [b - 2 * q, top, 2 * q, 270, 90], [b, y - 2 * f, 2 * f, 180, -90], [x + w - 2 * r, y, 2 * r, 270, 90],
            [x + w - 2 * r, y + h - 2 * r, 2 * r, 0, 90], [x, y + h - 2 * r, 2 * r, 90, 90]]
        DllCall("gdiplus\GdipAddPathArc", "ptr", path, "float", arc[1], "float", arc[2], "float", arc[3], "float", arc[3], "float", arc[4], "float", arc[5])
    DllCall("gdiplus\GdipClosePathFigure", "ptr", path)
    return path
}

; Where the tab joined to the box is (the one for the page Claude is on), from the box's top left
; (its top is above the box, so below 0), or "" while it isn't known which page Claude is on.
TabShape() {
    if (Page = "" || Anim.tabRight < 1)
        return ""
    return {left: Anim.tabLeft, right: Anim.tabRight, top: 0.5 - Look.tabH}
}

TabLabel(which) => which = "chat" ? "CHAT & COWORK" : which = "code" ? "CODE" : StrUpper(LinkSite(Browser.url))

; The color of the page Claude is on: blue for Code, Claude's orange for Chat and Cowork.
PageColor() => Page = "code" ? Look.colors.you : Look.colors.claude

; Voice mode's color right now (see Anim.tone): whoever's talking, in their own color, as their
; names are: your blue while it listens to you, Claude's orange while Claude talks, a soft neutral
; while it thinks, and in between as it changes.
VoiceColor() => Blend(Blend(Look.colors.you, Look.colors.claude, Anim.tone), Look.colors.text, 0.5 * Anim.think)

; A color partway (some, from 0 to 1) from one color to another.
Blend(from, to, some) => Round((from >> 16 & 0xFF) + ((to >> 16 & 0xFF) - (from >> 16 & 0xFF)) * some) << 16
    | Round((from >> 8 & 0xFF) + ((to >> 8 & 0xFF) - (from >> 8 & 0xFF)) * some) << 8
    | Round((from & 0xFF) + ((to & 0xFF) - (from & 0xFF)) * some)

; A color made darker (by some from 0 to 1).
Darker(rgb, some) => Round((rgb >> 16 & 0xFF) * (1 - some)) << 16 | Round((rgb >> 8 & 0xFF) * (1 - some)) << 8 | Round((rgb & 0xFF) * (1 - some))

; How wide a tab is: ☰, or a page's icon and name, with room around them.
TabWidth(which) => which = "menu" ? 24 * Look.s + (Look.icons.Has("menu") ? Look.icons["menu"].w : TextWidth("≡", Look.labelFont))
    : Look.compact && which != "page" && Look.icons.Has(which) ? 24 * Look.s + Look.icons[which].w   ; (just its icon)
    : 23 * Look.s + (Look.icons.Has(which) ? Look.icons[which].w + 6 * Look.s : 0) + TextWidth(TabLabel(which), Look.labelFont)

; The tabs that aren't joined to the box (☰, and the page Claude isn't on): softer and a little
; lower, and brighter while you point at them (or, for ☰, while its list is open).
DrawTabBacks(solid) {
    for which, slot in Look.slots {
        if (which = Page)
            continue
        lit := Anim.hot = "tab-" which || which = "menu" && Anim.panelTarget
        path := TopRoundedPath(slot.left, 2.5 - Look.tabH, slot.right - slot.left, Look.tabH - 2, 7 * Look.s)
        DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(solid * (lit ? 0.85 : 0.5), Look.colors.bg))
        DllCall("gdiplus\GdipFillPath", "ptr", Canvas.g, "ptr", Brush, "ptr", path)
        DllCall("gdiplus\GdipDeletePath", "ptr", path)
    }
}

; What's on the tabs: ☰, then each page with its icon (a speech bubble in Claude's color for Chat
; and Cowork, brackets in blue for Code). The page Claude is on stands out; the others are
; quieter, brighter while you point at them.
DrawTabs(shadow) {
    s := Look.s, rowTop := (Look.tabH - Look.labelH) / 2 + s - Look.tabH
    for which, slot in Look.slots {
        a := which = Page ? 0.8 : which = "menu" && Anim.panelTarget ? 0.95 : Anim.hot = "tab-" which ? 0.75 : 0.4
        if (which = "menu") {
            if Look.icons.Has("menu") {
                icon := Look.icons["menu"]
                DrawWord(icon.glyph, Look.iconFont, slot.left + (slot.right - slot.left - icon.w) / 2, rowTop + icon.dy, a,
                    Anim.panelTarget ? PageColor() : Look.colors.text, shadow)
            } else {
                DrawWord("≡", Look.labelFont, slot.left + 12 * s, rowTop + Look.labelDy, a, Look.colors.text, shadow)
            }
            continue
        }
        if (Look.compact && which != "page" && Look.icons.Has(which)) {   ; just its icon, in the middle (see PlacePageTab)
            icon := Look.icons[which]
            DrawWord(icon.glyph, Look.iconFont, slot.left + (slot.right - slot.left - icon.w) / 2, rowTop + icon.dy, Min(1, a + 0.1),
                which = "chat" ? Look.colors.claude : Look.colors.you, shadow)
            continue
        }
        x := slot.left + 11 * s
        if Look.icons.Has(which) {
            icon := Look.icons[which]
            DrawWord(icon.glyph, Look.iconFont, x, rowTop + icon.dy, Min(1, a + 0.1),
                which = "chat" ? Look.colors.claude : which = "code" ? Look.colors.you : Look.colors.text, shadow)
            x += icon.w + 6 * s
        }
        DrawWord(FitWidth(TabLabel(which), Look.labelFont, slot.right - x - 10 * s), Look.labelFont, x, rowTop + Look.labelDy, a, Look.colors.text, shadow)
    }
    for which, slot in Look.slots
        if (Settings.TuckCount && (which = "code" || which = "chat") && Anim.peekCounts.%which%)
            DrawTabBadge(which, slot)
        else if (Settings.TuckCount && which = "code" && Anim.codeWorking && Page = "chat")
            DrawTabDot(slot)
}

; A dot on the Code tab's top corner, in its blue: a Code session is working while you're on the Chat
; and Cowork page (see WatchCodeSessions). It pops a little as it comes.
DrawTabDot(slot) {
    s := Look.s, age := FrameNow - Anim.badgeAt
    pop := Settings.Animate && Anim.badgePage = "code" && age >= 0 && age < 400 ? 1 + 0.4 * Sin(age / 400 * 3.1416) : 1
    r := 4 * s, cx := Min(slot.right - 4 * s, Look.W - r - 3 * s), cy := r + 4 * s - Look.tabH
    FillCircle(cx, cy, (r + 1.5 * s) * pop, ARGB(0.6, 0x000000))
    FillCircle(cx, cy, r * pop, ARGB(1, Look.colors.you))
}

; How many new messages on a page you haven't read yet, on its tab's top corner, in the page's color
; as on Claude's logo (blue for Code, red for Chat and Cowork). It pops a little as one is counted.
DrawTabBadge(which, slot) {
    static spot := Buffer(16)
    s := Look.s, count := Anim.peekCounts.%which%, age := FrameNow - Anim.badgeAt
    pop := Settings.Animate && Anim.badgePage = which && age >= 0 && age < 400 ? 1 + 0.3 * Sin(age / 400 * 3.1416) : 1
    r := 7.5 * s, cx := Min(slot.right - 2 * s, Look.W - r - 2 * s), cy := r + 1.5 * s - Look.tabH
    FillCircle(cx, cy, (r + 1.5 * s) * pop, ARGB(0.6, 0x000000))
    FillCircle(cx, cy, r * pop, ARGB(1, which = "code" ? Look.colors.you : 0xE5484D))
    NumPut("float", cx - r, "float", cy - r, "float", 2 * r, "float", 2 * r, spot)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", 0xFFFFFFFF)
    DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", count > 9 ? "9+" : count "", "int", -1, "ptr", Look.labelFont.font,
        "ptr", spot, "ptr", CenterFormat, "ptr", Brush)
}

; A rectangle with only its top corners rounded, as a GDI+ path (for whoever asked for it to delete).
TopRoundedPath(x, y, w, h, r) {
    DllCall("gdiplus\GdipCreatePath", "int", 0, "ptr*", &path := 0)
    DllCall("gdiplus\GdipAddPathArc", "ptr", path, "float", x, "float", y, "float", 2 * r, "float", 2 * r, "float", 180, "float", 90)
    DllCall("gdiplus\GdipAddPathArc", "ptr", path, "float", x + w - 2 * r, "float", y, "float", 2 * r, "float", 2 * r, "float", 270, "float", 90)
    DllCall("gdiplus\GdipAddPathLine", "ptr", path, "float", x + w, "float", y + h, "float", x, "float", y + h)
    DllCall("gdiplus\GdipClosePathFigure", "ptr", path)
    return path
}

; In voice mode, a soft light rising from the bottom of the box, like the one in Claude's own voice
; mode: your blue while it listens to you, breathing (and swelling as you talk), Claude's orange
; while Claude talks, pulsing with its voice, and a soft neutral shimmer while it thinks.
DrawVoiceLight(h) {
    static ends := Buffer(16)
    state := VoiceState(), t := FrameNow / 1000, color := VoiceColor()
    breathe := (Sin(t * 6.2832 / 2.4) + 1) / 2   ; a breath every 2.4 seconds
    level := state = "speaking" ? 0.45 + 0.7 * Min(1, Voice.claudeLevel * 2.2)
        : state = "listening" ? 0.5 + 0.3 * breathe + 0.5 * Min(1, Voice.mic * 3)
        : 0.3 + 0.2 * (Sin(t * 6.2832 / 0.9) + 1) / 2
    strength := Min(1, Anim.listen * level)
    glowH := Min(h * 0.7, 80 * Look.s), top := h - glowH
    NumPut("float", 0, "float", top, "float", 0, "float", h, ends)
    DllCall("gdiplus\GdipCreateLineBrush", "ptr", ends, "ptr", ends.Ptr + 8, "uint", ARGB(0, color),
        "uint", ARGB(strength * 0.7, color), "int", 3, "ptr*", &brush := 0)
    path := RoundedPath(0.5, 0.5, Look.W - 1, h - 1, Look.radius)   ; kept inside the box's rounded corners
    DllCall("gdiplus\GdipSetClipPath", "ptr", Canvas.g, "ptr", path, "int", 0)
    DllCall("gdiplus\GdipFillRectangle", "ptr", Canvas.g, "ptr", brush, "float", 0, "float", top, "float", Look.W, "float", glowH)
    DllCall("gdiplus\GdipResetClip", "ptr", Canvas.g)
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
    DllCall("gdiplus\GdipDeleteBrush", "ptr", brush)
}

; ☰ opens or closes the list beside the box.
TogglePanel() {
    Anim.panelTarget := Anim.panelTarget ? 0 : 1
    if (!Anim.panelTarget && ModelMenu)   ; (the list of models goes with it, and Claude's menu)
        SetTimer(CloseModelMenu, -1)
    Kick()
    UpdateVisibility()
}

; The list beside the box of Claude's sessions (on the Code page) or chats (on the Chat and Cowork
; page), as in Claude's sidebar: a little darker than the box, on a rounded outline. The one showing
; is highlighted in the page's color, and each has a dot for what it's doing (orange and breathing
; while it runs, red if something went wrong). It slides out from the side of the box facing the
; middle of the screen, in its own window, since it takes clicks.
DrawPanel(enterAlpha) {
    global Canvas
    static showing := false, drawn := ""
    if (Anim.panel <= 0 || enterAlpha <= 0) {
        if showing
            DllCall("ShowWindow", "ptr", PanelGui.Hwnd, "int", 0), showing := false
        return
    }
    s := Look.s, c := Look.colors, list := Sessions.list, rows := Min(list.Length, PANEL_ROWS)
    if ModelMenu   ; (the models, instead of the sessions, while you pick one)
        rows := Min(ModelMenu.items.Length, PANEL_ROWS)
    w := Look.panelW, h := Look.panelHead + Max(1, rows) * Look.rowH + Look.panelPad + ModelBarH()
    settle := 1 - (1 - Anim.panel) ** 3, slide := (1 - settle) * 16 * s
    x := Round(InStr(Settings.Corner, "left") ? Anim.baseX + Look.W + 8 * s - slide : Anim.baseX - w - 8 * s + slide)
    y := Anim.baseY + Look.tabH
    Anim.panelX := x, Anim.panelY := y, Anim.panelH := h
    ; Nothing in it has changed (a running session's dot breathes a few times a second): it just moves.
    running := InStr(Sessions.key, "Running") || CompactingNow()
    key := Format("{:.3f}|{}|{}|{}|{}|{:.2f}|{}|{}|{}|{}|{}|{}|{}", settle, Anim.panelHot, Sessions.key, Sessions.current, Page, enterAlpha, c.bg, running ? Floor(FrameNow / 120) : 0,
        Bar().model, Bar().effort, Bar().usage, ModelMenu ? ModelMenu.key "|" ModelMenu.title : "", Page = "code" ? CanCompact() : "")
    if (showing && key = drawn) {
        DllCall("SetWindowPos", "ptr", PanelGui.Hwnd, "ptr", 0, "int", x, "int", y, "int", 0, "int", 0, "uint", 0x15)   ; SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE
        return
    }
    drawn := key
    saved := Canvas, Canvas := PanelCanvas   ; the drawing helpers draw on Canvas
    DllCall("gdiplus\GdipGraphicsClear", "ptr", Canvas.g, "uint", 0)
    solid := Max(0.92, Settings.Background / 100)   ; solid enough to read over anything
    RoundedBox(h, ARGB(solid, Darker(c.bg, c.light ? 0.06 : 0.3)), ARGB(0.22, c.text), "", w, 16 * s)
    pad := Look.panelPad + 6 * s
    ; The heading. In one of the model menu's submenus, "‹" before it goes back to the menu.
    headY := (Look.panelHead - Look.labelH) / 2 + 2 * s + Look.labelDy
    if (ModelMenu && ModelMenu.before) {
        back := Anim.panelHot = "back"
        if back
            FillRoundRect(Look.panelPad, 4 * s, w - 2 * Look.panelPad, Look.panelHead - 6 * s, 9 * s, ARGB(0.08, c.text))
        DrawWord("‹   " ModelMenu.title, Look.labelFont, pad, headY, back ? 0.9 : 0.55, c.text, 0)
    } else
        DrawWord(ModelMenu ? ModelMenu.title : Page = "chat" ? "CHATS" : "SESSIONS", Look.labelFont, pad, headY, 0.55, c.text, 0)
    if !ModelMenu {   ; (at its other end, the eraser that clears the box, see ClearChat)
        sp := ClearSpot(), hot := Anim.panelHot = "clear"
        if hot
            FillRoundRect(sp.x, sp.y, sp.w, sp.h, 9 * s, ARGB(0.08, c.text))
        if sp.icon
            DrawWord(sp.icon, Look.iconFont, sp.x + 8 * s, headY - Look.labelDy + Look.icons["menu"].dy, hot ? 0.9 : 0.5, c.text, 0)
        DrawWord(sp.text, Look.labelFont, sp.x + sp.w - 8 * s - sp.textW, headY, hot ? 0.9 : 0.5, c.text, 0)
    }
    if ModelBarH()
        DrawModelBar(Look.panelHead + Max(1, rows) * Look.rowH + Look.panelPad, w, pad)
    if ModelMenu {
        DrawModelMenu(rows, w, pad)
        rows := 0
    } else if !rows
        DrawWord(Sessions.HasOwnProp("unread") ? "Reading Claude's sidebar…" : "Open Claude's sidebar to see them here", Look.smallFont, pad,
            Look.panelHead + (Look.rowH - Look.smallH) / 2 + Look.smallDy, 0.5, c.text, 0)
    breathe := (Sin(FrameNow / 1000 * 6.2832 / 1.6) + 1) / 2
    loop rows {
        row := list[A_Index], top := Look.panelHead + (A_Index - 1) * Look.rowH
        here := row.title == Sessions.current, hot := Anim.panelHot = A_Index
        if (here || hot)
            FillRoundRect(Look.panelPad, top + 2 * s, w - 2 * Look.panelPad, Look.rowH - 4 * s, 9 * s, here ? ARGB(0.2, PageColor()) : ARGB(0.08, c.text))
        r := Look.dotR * 1.2, cx := pad + r, cy := top + Look.rowH / 2
        if InStr(row.status, "Running")
            FillCircle(cx, cy, r * (0.8 + 0.3 * breathe), ARGB(0.45 + 0.5 * breathe, c.claude))
        else if InStr(row.status, "wrong")
            FillCircle(cx, cy, r, ARGB(0.9, 0xE5484D))
        else
            FillCircle(cx, cy, r * 0.8, ARGB(0.3, c.text))
        tx := pad + 2 * r + 9 * s
        DrawWord(FitWidth(row.title, Look.smallFont, w - tx - pad), Look.smallFont, tx, top + (Look.rowH - Look.smallH) / 2 + Look.smallDy,
            here ? 1 : hot ? 0.9 : 0.7, c.text, 0)
    }
    Canvas := saved
    ShowLayered(PanelGui.Hwnd, PanelCanvas, x, y, 255 * enterAlpha * settle, w, h)
    if !showing
        DllCall("ShowWindow", "ptr", PanelGui.Hwnd, "int", 8), showing := true   ; SW_SHOWNA
}

; Whether mx, my on screen is on the list beside the box, and which of its rows (counting from 1, or
; 0); or "clear" ("Clear box", in its heading); or in the model bar, "model", "compact" (the ring,
; when it can compact the session, or "compact-wait" while Claude's working), or "effort-" and the
; step of the slider (0 to 5); or, while the list of models is open, "item-" and which of them, or
; "back" (the heading of a submenu).
OverPanel(mx, my) => Anim.panel > 0 && mx >= Anim.panelX && mx < Anim.panelX + Look.panelW && my >= Anim.panelY && my < Anim.panelY + Anim.panelH
PanelRowAt(mx, my) {
    if (Anim.panel < 0.9 || !OverPanel(mx, my))
        return 0
    px := mx - Anim.panelX, py := my - Anim.panelY
    if (ModelBarH() && py >= (top := ModelBarTop())) {
        sp := ModelBarSpots(top), m := sp.model
        if (py >= m.y && py < m.y + m.h && px >= m.x && px < m.x + m.w)
            return "model"
        if (sp.HasOwnProp("ring") && (r := sp.ring) && py >= m.y && py < m.y + m.h && px >= m.x + m.w && px < Look.panelW - Look.panelPad)
            return CanCompact() ? "compact" : "compact-wait"
        if (sp.HasOwnProp("effort") && (e := sp.effort) && py >= e.y && py < e.y + e.h && px >= e.x0 - 12 * Look.s && px <= e.x1 + 12 * Look.s)
            return "effort-" Max(0, Min(EFFORT_TOP, Round((px - e.x0) / (e.x1 - e.x0) * EFFORT_TOP)))
        return 0
    }
    if (py < Look.panelHead) {
        if (!ModelMenu && (sp := ClearSpot()) && px >= sp.x && px < sp.x + sp.w && py >= sp.y && py < sp.y + sp.h)
            return "clear"
        return ModelMenu && ModelMenu.before ? "back" : 0
    }
    i := Floor((py - Look.panelHead) / Look.rowH) + 1
    if ModelMenu
        return i >= 1 && i <= Min(ModelMenu.items.Length, PANEL_ROWS) ? "item-" i : 0
    return i >= 1 && i <= Min(Sessions.list.Length, PANEL_ROWS) ? i : 0
}

; Where "Clear box" is in the list's heading (from the list's top left), at its right end: an eraser
; and its label.
ClearSpot() {
    s := Look.s, text := "CLEAR BOX", icon := Look.icons.Has("menu") ? Chr(0xE75C) : ""   ; (EraseTool)
    textW := TextWidth(text, Look.labelFont), iconW := icon != "" ? TextWidth(icon, Look.iconFont) + 6 * s : 0
    w := 8 * s + iconW + textW + 8 * s
    return {x: Look.panelW - Look.panelPad - w, y: 4 * s, w: w, h: Look.panelHead - 6 * s, text: text, textW: textW, icon: icon}
}

; ---- The model bar: the model, effort and usage, at the bottom of the list beside the box ------------

; The model bar for the page Claude is on (see ModelBars).
Bar() => ModelBars.%(Page = "chat" ? "chat" : "code")%

; How tall the model bar is (0 until Claude's buttons have been read): a hairline, the model (with a
; ring for how full the context is, on the Code page), then on the Code page the effort slider and a
; line about the plan's usage.
ModelBarH() {
    b := Bar(), s := Look.s
    if (b.model = "")
        return 0
    h := Round(10 * s) + Look.rowH
    if (Page != "chat" && b.effort != "")
        h += Look.rowH
    if (Page != "chat" && UsageText(b.usage) != "")
        h += UsageLineH()
    return h + Round(4 * s)
}
UsageLineH() => Round(Look.smallH + 6 * Look.s)
ModelBarTop() => Look.panelHead + Max(1, ModelMenu ? Min(ModelMenu.items.Length, PANEL_ROWS) : Min(Sessions.list.Length, PANEL_ROWS)) * Look.rowH + Look.panelPad

; Where each part of the model bar is in the list (from its top): the model's row, the ring, the
; effort slider's track (from x0 to x1) and the usage line.
ModelBarSpots(top) {
    s := Look.s, w := Look.panelW, b := Bar(), pad := Look.panelPad + 6 * s
    y := top + Round(10 * s), ringR := Round(9 * s)
    ring := Page != "chat" && UsagePercent(b.usage) != ""
    spots := {model: {x: Look.panelPad, y: y, w: w - 2 * Look.panelPad - (ring ? 2 * ringR + 48 * s : 0), h: Look.rowH}}
    if ring
        spots.ring := {cx: w - pad - ringR, cy: y + Look.rowH / 2, r: ringR}
    y += Look.rowH
    if (Page != "chat" && b.effort != "")
        spots.effort := {y: y, h: Look.rowH, x0: pad + 100 * s, x1: w - pad - 8 * s}, y += Look.rowH
    if (Page != "chat" && UsageText(b.usage) != "")
        spots.usage := {y: y}
    return spots
}

; How full the context is, in percent, from the Usage button ("Context 613.7k / 1M (61%), ..."), or "".
UsagePercent(usage) => RegExMatch(usage, "Context [^(]*\((\d+)%\)", &m) ? Integer(m[1]) : ""

; The plan's usage, shortly, from what the Usage button says after the context (which the ring
; shows): "52% of 5-hour limit, Resets in 2 hr 42 min" as "5-hr limit 52% · resets 2 hr 42 min", and
; "Weekly · all models: 26%, Resets Tue 8:00 AM" as "weekly 26% · resets Tue 8:00 AM". Anything
; else it says shows as it is.
UsageText(usage) {
    text := ""
    for part in StrSplit(usage, ",") {
        part := Trim(part)
        if (part = "" || StartsWith(part, "Context "))
            continue
        part := RegExReplace(part, "^(\d+)% of 5-hour limit$", "5-hr limit $1%")
        part := RegExReplace(part, "i)^weekly\b[^:]*:\s*(\d+)%$", "weekly $1%")
        part := RegExReplace(part, "^Resets (in )?", "resets ")
        text .= (text = "" ? "" : " · ") part
    }
    return text
}

; Draws the model bar in the list, from top down (w: the list's width, pad: its text's margin).
DrawModelBar(top, w, pad) {
    s := Look.s, c := Look.colors, b := Bar(), sp := ModelBarSpots(top), hot := Anim.panelHot
    FillRect(pad, top + 5 * s, w - 2 * pad, Max(1, Round(s)), ARGB(0.14, c.text))   ; a hairline above it
    ; The model, and ⌄ to pick another (on the Chat page, its effort is part of its name, as Claude
    ; shows it).
    m := sp.model
    if (hot = "model" || ModelMenu)
        FillRoundRect(m.x, m.y + 2 * s, m.w, m.h - 4 * s, 9 * s, ModelMenu ? ARGB(0.2, PageColor()) : ARGB(0.08, c.text))
    textY := m.y + (m.h - Look.smallH) / 2 + Look.smallDy
    chevW := 14 * s
    DrawWord(FitWidth(b.model, Look.smallFont, m.x + m.w - pad - chevW - 6 * s), Look.smallFont, pad, textY, 0.95, c.text, 0)
    if Look.iconFont
        DrawWord(Chr(ModelMenu ? 0xE70E : 0xE70D), Look.iconFont, m.x + m.w - 6 * s - chevW, m.y + (m.h - Look.labelH) / 2 + Look.icons["menu"].dy, 0.6, c.text, 0)   ; ChevronUp / ChevronDown
    ; How full the context is: a ring in blue, like Claude's own, with the percent beside it. Clicked
    ; once Claude's done, it compacts the session (see CompactSession): while it does, the ring
    ; breathes, and the line under the slider says so.
    hint := ""
    if sp.HasOwnProp("ring") {
        r := sp.ring, pct := UsagePercent(b.usage), pulsing := CompactingNow()
        if (hot = "compact")
            FillRoundRect(m.x + m.w, m.y + 2 * s, w - Look.panelPad - m.x - m.w, m.h - 4 * s, 9 * s, ARGB(0.1, c.you))
        DrawArc(r.cx, r.cy, r.r, 0, 360, 2.6 * s, ARGB(0.2, c.text))
        if pct
            DrawArc(r.cx, r.cy, r.r, -90, 3.6 * Min(100, pct), 2.6 * s, ARGB(pulsing ? 0.35 + 0.65 * (Sin(FrameNow / 1000 * 6.2832 / 1.2) + 1) / 2 : 1, c.you))
        label := pct "%"
        DrawWord(label, Look.smallFont, r.cx - r.r - 7 * s - TextWidth(label, Look.smallFont), r.cy - Look.smallH / 2 + Look.smallDy, hot = "compact" ? 1 : 0.75, c.text, 0)
        hint := pulsing ? "Compacting the session…" : hot = "compact" ? "Click to compact the session" : hot = "compact-wait" ? "Compact once Claude's done" : ""
    }
    ; The effort (Code page): its name, and a slider of its steps, from Faster to Smarter.
    if sp.HasOwnProp("effort") {
        e := sp.effort, cy := e.y + e.h / 2, n := EffortSteps.Has(b.effort) ? EffortSteps[b.effort] : ""
        DrawWord(FitWidth(b.effort, Look.smallFont, e.x0 - pad - 10 * s), Look.smallFont, pad, e.y + (e.h - Look.smallH) / 2 + Look.smallDy, 0.9, c.text, 0)
        span := e.x1 - e.x0
        FillPill(e.x0, cy - 1.5 * s, span, 3 * s, ARGB(0.2, c.text))
        if (n != "")
            FillPill(e.x0, cy - 1.5 * s, span * n / EFFORT_TOP, 3 * s, ARGB(0.85, c.you))
        loop EFFORT_TOP + 1
            FillCircle(e.x0 + span * (A_Index - 1) / EFFORT_TOP, cy, 2.2 * s, ARGB(0.45, c.text))
        if (InStr(hot, "effort-") = 1)   ; (where you point, the step it'd go to)
            FillCircle(e.x0 + span * Integer(SubStr(hot, 8)) / EFFORT_TOP, cy, 7 * s, ARGB(0.25, c.you))
        if (n != "") {
            x := e.x0 + span * n / EFFORT_TOP
            FillCircle(x, cy, 7 * s, ARGB(0.5, 0x000000)), FillCircle(x, cy, 6 * s, ARGB(1, 0xFFFFFF))
        }
    }
    ; The plan's usage (Code page), in small words (or what the ring does, see above).
    if sp.HasOwnProp("usage")
        DrawWord(FitWidth(hint != "" ? hint : UsageText(b.usage), Look.smallFont, w - 2 * pad), Look.smallFont, pad, sp.usage.y + (UsageLineH() - Look.smallH) / 2 + Look.smallDy,
            hint != "" && hot != "compact-wait" ? 0.9 : 0.55, hint != "" && hot != "compact-wait" ? c.you : c.text, 0)
}

; Whether the ring can compact the Code session now (see CompactSession): Claude's done with it (no
; reply being worked on, and it isn't running in Claude's sidebar), and it isn't compacting already.
CanCompact() {
    if (Page != "code" || ModelMenu || CompactingNow() || ClaudeWorking || ClaudeBusy() || PageAsked.page != "")
        return false
    for row in Sessions.list
        if (row.title == Sessions.current && InStr(row.status, "Running"))
            return false
    return true
}

; Whether the session is still compacting, from the ring (see CompactDone): for three minutes at most.
CompactingNow() => Compacting.at && (A_TickCount - Compacting.at < 180000 || CompactDone("still not done after 3 minutes"))

; The ring was clicked: the session compacts (see CompactSession).
StartCompacting() {
    Compacting.at := A_TickCount, Compacting.from := UsagePercent(Bar().usage)
    NoteEvent("compacting the Code session, from the ring in the list (context " Compacting.from "%)")
    Kick()
    if !CompactAction.Call()
        CompactDone("Claude's window isn't open")
}

; Compacting's over (why): it's done, or it couldn't be. Claude's window is read again straight away,
; for its message saying so ("Compacted session · saved …"). Returns false.
CompactDone(why) {
    if Compacting.at {
        Compacting.at := 0
        NoteEvent("compacting: " why)
        Kick()
        ReadSoon()
    }
    return false
}

; Compacts the Code session showing. Claude's own Usage menu has "Compact session" once the context
; is fairly full (at 61% it did, at a third full it doesn't): its Usage button opens the menu, and
; that's clicked, from behind (see ClickClaude). Without it, it's done as you would: /compact in
; Claude's message box (see TypeCompact). Whether it could start.
CompactSession() {
    Critical   ; (runs to the end: see ClickClaude)
    front := WinExist("A")
    if !(hwnd := ClaudeToClick())
        return false
    if ((btn := ClaudeButton(hwnd, "Usage: ")) && ClickClaude(btn.el, hwnd))
        SetTimer(PressCompact.Bind(hwnd, btn, front, 0), -250)
    else
        SetTimer(TypeCompact.Bind(front), -1)
    return true
}

; Claude's Usage menu, once it's open: "Compact session" is clicked, or if it isn't there, the menu's
; closed again and /compact typed instead (front: the window in front when the ring was clicked).
PressCompact(hwnd, btn, front, tries) {
    Critical   ; (runs to the end: see ClickClaude)
    compact := open := ""
    try {
        for item in GetElements(hwnd, UIA_BUTTON)
            if StartsWith(item.name, "Compact session")
                compact := item
            else if (item.name = "See detailed breakdown" || StartsWith(item.name, "Context window "))
                open := item
    }
    if compact {
        ClickClaude(compact.el, hwnd)
        NoteEvent("compacting: clicked Compact session in Claude's Usage menu")
        SetTimer(() => FindByPrefix(hwnd, UIA_BUTTON, "Compact session") && ClickClaude(btn.el, hwnd), -500)   ; (its menu closes, if it didn't by itself; looked for in the whole window, as above, see ClaudeButton)
        return ReadSoon()
    }
    if (!open && tries < 4)   ; (not open yet: looks again shortly)
        return SetTimer(PressCompact.Bind(hwnd, btn, front, tries + 1), -250)
    if open
        ClickClaude(btn.el, hwnd)   ; (its menu closes again)
    SetTimer(TypeCompact.Bind(front), open ? -300 : -1)
}

; Compacts the session with /compact in Claude's message box, as you would: Claude comes to the front
; for a moment, as when you send from the typing box (see SendToClaude), then the window that was in
; front (front) gets it back. Not over something you've started writing there.
TypeCompact(front) {
    try said := PromptText(FindClaudeWindow())
    catch
        said := ""
    if (said != "") {
        ShowNote("Claude's message box has something in it, so /compact wasn't typed over it.")
        return CompactDone("Claude's message box wasn't empty")
    }
    NoteEvent("compacting: typing /compact in Claude's message box")
    if !SendToClaude("/compact", front)
        return CompactDone("/compact didn't send")
    NoteEvent("compacting: /compact sent")
    ReadSoon()
}

; An arc (or a whole circle) around cx, cy, from start (degrees, clockwise from the right) for sweep.
DrawArc(cx, cy, r, start, sweep, width, color) {
    DllCall("gdiplus\GdipCreatePen1", "uint", color, "float", width, "int", 2, "ptr*", &pen := 0)   ; UnitPixel
    DllCall("gdiplus\GdipSetPenStartCap", "ptr", pen, "int", 2), DllCall("gdiplus\GdipSetPenEndCap", "ptr", pen, "int", 2)   ; LineCapRound
    DllCall("gdiplus\GdipDrawArc", "ptr", Canvas.g, "ptr", pen, "float", cx - r, "float", cy - r, "float", 2 * r, "float", 2 * r, "float", start, "float", sweep)
    DllCall("gdiplus\GdipDeletePen", "ptr", pen)
}

; The list of models (or efforts) in the list, where its sessions go, while you pick one (see
; OpenModelMenu): each with a dot, bright for the one picked, › for one that opens more, and a
; switch for one that's on or off (like Haiku's Extended).
DrawModelMenu(rows, w, pad) {
    s := Look.s, c := Look.colors
    if !rows {
        DrawWord("Opening Claude's menu…", Look.smallFont, pad, Look.panelHead + (Look.rowH - Look.smallH) / 2 + Look.smallDy, 0.5, c.text, 0)
        return
    }
    loop rows {
        it := ModelMenu.items[A_Index], top := Look.panelHead + (A_Index - 1) * Look.rowH, hot := Anim.panelHot = "item-" A_Index
        toggle := it.kind = "toggle", lit := it.picked && !toggle
        if (lit || hot)
            FillRoundRect(Look.panelPad, top + 2 * s, w - 2 * Look.panelPad, Look.rowH - 4 * s, 9 * s, lit ? ARGB(0.2, PageColor()) : ARGB(0.08, c.text))
        r := Look.dotR * 1.2, cx := pad + r, cy := top + Look.rowH / 2, right := w - pad
        if toggle {   ; (its switch, at the right: in the page's color when it's on, its knob dark on a light one)
            sw := 26 * s, sh := 15 * s, right -= sw + 8 * s, on := PageColor()
            FillRoundRect(w - pad - sw, cy - sh / 2, sw, sh, sh / 2, it.picked ? ARGB(1, on) : ARGB(0.25, c.text))
            FillCircle(it.picked ? w - pad - sh / 2 : w - pad - sw + sh / 2, cy, sh / 2 - 2 * s, ARGB(1, it.picked && Lum(on) > 0.45 ? 0x1E1E1E : 0xFFFFFF))
        } else
            FillCircle(cx, cy, it.picked ? r : r * 0.8, it.picked ? ARGB(1, PageColor()) : ARGB(0.3, c.text))
        tx := pad + 2 * r + 9 * s, y := top + (Look.rowH - Look.smallH) / 2 + Look.smallDy
        ; A model's name, then what Claude says about it, dimmer ("Fastest for quick answers"); an
        ; effort's the same ("Extended", then "Always uses deep reasoning").
        name := it.name, note := ""
        if RegExMatch(name, "^(\S+ \d[\d.]*)\s+(.+)$", &m)
            name := m[1], note := m[2]
        else if ((toggle || ModelMenu.title = "EFFORT") && RegExMatch(name, "^(\S+)\s+(.+)$", &m))
            name := m[1], note := m[2]
        if (it.kind = "more")
            name .= "  ›"
        DrawWord(name := FitWidth(name, Look.smallFont, right - tx), Look.smallFont, tx, y, lit || hot || toggle && it.picked ? 1 : 0.8, c.text, 0)
        if (note != "") {
            nx := tx + TextWidth(name, Look.smallFont) + 8 * s
            if (nx < right - 20 * s)
                DrawWord(FitWidth(note, Look.smallFont, right - nx), Look.smallFont, nx, y, 0.45, c.text, 0)
        }
    }
}

; Clicks one of Claude's buttons (el, in its window hwnd) with click messages all at once: no mouse,
; Claude doesn't come forward, and nothing waits (a wait here would let FrameLoop in first, see
; ApplySettings). Whether it could. (It's claude-voice-on-off-send.ahk's PostClick but for the 30 ms
; that waits between the button going down and up; the two could be one if PostClick took how long
; to wait, as PostClickAt does.)
ClickClaude(el, hwnd) {
    if (hwnd = Unhid.hwnd)   ; (restored unseen to click in: kept so a while longer, see HideClaudeAgain)
        Unhid.at := A_TickCount
    if !(at := SpotIn(hwnd, el))   ; (see claude-voice-on-off-send.ahk)
        return false
    PostClickAt(hwnd, at)
    return true
}

; One of Claude's buttons whose name starts with prefix, or "": its Model, Effort and Usage buttons,
; under its message box. They're looked for around Claude's list of messages (see ElementsAround), as
; each read of Claude's window finds them (see ModelBarOf), not among every button in the window, each
; of a long session's steps too: that held the box up for a moment with each click on the model bar.
; (What Claude's menus have, once they open over the page, is still looked for in the whole window.)
ClaudeButton(hwnd, prefix) {
    for item in ElementsAround(hwnd, UIA_BUTTON)
        if StartsWith(item.name, prefix)
            return item
    return ""
}

; Claude's window, ready to click in from behind (see ReadyToClick), or 0 if it isn't open.
ClaudeToClick() => (hwnd := FindClaudeWindow()) ? ReadyToClick(hwnd) : 0

; A window of Claude's (hwnd), ready to click in from behind: restored if it's minimized, but not
; brought forward, and kept behind your other windows. Restored, it's given a moment to lay itself out
; again first: a click straight away went nowhere (on a laptop, where Claude's window is often
; minimized, the model menu never opened until you opened it in Claude yourself). And unseen: see-
; through while it's restored, and minimized again once the box is done with it (see HideClaudeAgain).
; (On one screen, with nothing in front of it, it came up every time you switched a chat or a model
; in the box.) Still to be tried on the laptop, where it matters: whether Claude takes a click while
; it's restored like this but covered up, behind a maximized window or a game. Chromium pays no mind
; to clicks sent to a window it takes to be out of sight, which is why it's restored at all, and right
; at the bottom, under a window that fills the screen, it may still take itself to be. If so, this
; only restores Claude and minimizes it again, and the box's fallbacks through UI Automation (see
; KeyOpen, PressInClaude, OpenedYet) are what do the work there, a moment later. Not tried either:
; whether Windows flashes Claude's taskbar button when the lock turns its coming forward down.
ReadyToClick(hwnd) {
    if DllCall("IsIconic", "ptr", hwnd) {
        ; (Restored, Claude comes to the front by itself, as if you'd clicked it: Windows' foreground
        ; lock keeps it from doing so meanwhile, and if it does, whatever was in front gets it back, see
        ; HideClaudeAgain.)
        Unhid.front := WinExist("A"), Unhid.since := Unhid.at := A_TickCount
        try WinSetTransparent(0, hwnd)
        DllCall("LockSetForegroundWindow", "uint", 1)   ; LSFW_LOCK
        DllCall("ShowWindow", "ptr", hwnd, "int", 4)   ; SW_SHOWNOACTIVATE
        DllCall("SetWindowPos", "ptr", hwnd, "ptr", 1, "int", 0, "int", 0, "int", 0, "int", 0, "uint", 0x13)   ; HWND_BOTTOM: behind your windows; SWP_NOSIZE | SWP_NOMOVE | SWP_NOACTIVATE
        Unhid.hwnd := hwnd
        SetTimer(HideClaudeAgain, 100)
        NoteEvent("Claude's window was minimized: restored unseen behind your other windows, so the box can click in it")
        ; The moment it's given to lay itself out: nothing else runs meanwhile, as the box's actions
        ; that click in Claude run to the end (see ClickClaude), and letting other things in here could
        ; let FrameLoop start, which would keep this waiting as long as the box moves (see TakeMouse).
        ; So the box's frames are drawn here instead, one after another, and it doesn't freeze for it
        ; (it did, for about a third of a second, at the first click on a model, the effort or the ring
        ; with Claude minimized). Only once for each restore: restored, it isn't minimized next time.
        was := A_IsCritical
        Critical
        try {
            while (A_TickCount - Unhid.since < 300) {
                if Anim.running
                    try Frame()
                Sleep 16
            }
        } finally {   ; (whatever happens, the lock isn't left on: other programs would open behind yours)
            Critical(was)
            ; The lock's let go of again, unless a game's in front: then it's kept, as GuardGame has
            ; it. (Let go of, the game could lose the front to Claude after all, until the next check
            ; took it again, up to a second later. With the Claude key, the box's own window has the
            ; front, and the lock stays off, see ShowVeil.)
            DllCall("LockSetForegroundWindow", "uint", 2)   ; LSFW_UNLOCK
            if !Handed
                GuardGame(GameFront)
        }
    }
    if (hwnd = Unhid.hwnd)
        Unhid.at := A_TickCount
    return hwnd
}

; Claude's window, restored unseen for the box to click in (see ReadyToClick): minimized again once
; the box has been done with it for UNHID_MS (Claude's model menu closed, Claude on the page you
; switched it to), and then seen again, so it's as you left it. If you go to it meanwhile (it comes to
; the front), or minimize it yourself, it's seen straight away, and left as it is. (In front just after
; it was restored, it came by itself: whatever was in front, like a game, gets the front back. When the
; box brings it to the front itself, it's seen first, see RevealClaude.) What it waits for besides
; (the model menu, the page) doesn't count while captions are hidden (Hide captions), where there's
; nothing to pick from and the reads that say Claude's on the page wait, nor past UNHID_MAX_MS, so it's
; never left restored and unseen for long: hidden with the list of models open, it stayed that way for
; as long as captions were. (The box going away by itself closes the list of models, see DrawBox.)
HideClaudeAgain() {
    hwnd := Unhid.hwnd
    if !(hwnd && DllCall("IsWindow", "ptr", hwnd))
        return (Unhid.hwnd := 0, SetTimer(HideClaudeAgain, 0))
    if (DllCall("GetForegroundWindow", "ptr") = hwnd && A_TickCount - Unhid.since < 2000 && Unhid.front && Unhid.front != hwnd && WinExist(Unhid.front)) {
        try SetWinDelay(-1), WinActivate(Unhid.front)
        return
    }
    if (DllCall("GetForegroundWindow", "ptr") = hwnd || DllCall("IsIconic", "ptr", hwnd)) {
        try WinSetTransparent("Off", hwnd)
        return (Unhid.hwnd := 0, SetTimer(HideClaudeAgain, 0))
    }
    if (A_TickCount - Unhid.at < UNHID_MS
        || A_TickCount - Unhid.at < UNHID_MAX_MS && !Hidden && (ModelMenu || PageAsked.page != "")) {
        try if (WinGetTransparent(hwnd) != 0)   ; (Claude's own window sets its styles anew now and then)
            WinSetTransparent(0, hwnd)
        return
    }
    DllCall("ShowWindow", "ptr", hwnd, "int", 7)   ; SW_SHOWMINNOACTIVE
    try WinSetTransparent("Off", hwnd)
    Unhid.hwnd := 0, SetTimer(HideClaudeAgain, 0)
}

; Claude's window (hwnd), as the box brings it to the front on purpose (to send to it, or to show the
; page it switched to): if the box had it restored unseen (see ReadyToClick), it's seen again, and left
; as it is from then on. Otherwise, just after it was restored, HideClaudeAgain took it for Claude
; coming forward by itself, and gave the front straight back to whatever had it: with Claude
; minimized, the ring's /compact never got typed ("Couldn't bring Claude to the front").
RevealClaude(hwnd) {
    if !(hwnd && hwnd = Unhid.hwnd)
        return
    SetTimer(HideClaudeAgain, 0)
    try WinSetTransparent("Off", hwnd)
    Unhid.hwnd := 0
}

; One of Claude's buttons that opens a menu (el), opened as a keyboard would: put in focus through UI
; Automation, then the Down arrow once it has the focus (a fifth of a second at most). It doesn't
; depend on where the button is on screen, for when a click didn't take. (Down, never Enter: if the
; focus were still in the message box, Enter would send what's in it.)
KeyOpen(el, hwnd) {
    PressInClaude(el, e => ComCall(3, e))   ; SetFocus
    since := A_TickCount, focused := false
    while (!focused && A_TickCount - since < 200) {
        try focused := HasFocus(el)
        if !focused
            Sleep 20
    }
    PostKey(hwnd, 0x28, 0x50)   ; Down
    return focused
}

; The model's ⌄: opens Claude's own Model menu (from behind, whatever's in front), and the list shows
; what's in it once it has opened (see ReadModelMenu). Claude's menu stays open while you pick.
OpenModelMenu() {
    Critical   ; (runs to the end: see ClickClaude)
    global ModelMenu
    hwnd := ClaudeToClick()
    ; What's in Claude's window that looks like a menu's choices before the menu opens isn't in it
    ; (like the Chat and Cowork switch on a new chat: taken for models, picking them switched Claude
    ; between Chat and Cowork, back and forth).
    pre := Map()
    try for c in MenuReader.Call(hwnd)
        pre[c.name] := true
    if !(hwnd && (btn := ClaudeButton(hwnd, "Model: "))) {
        NoteEvent("couldn't open Claude's model menu (" (!hwnd ? "Claude's window wasn't found" : "its Model button wasn't found") ")")
        return
    }
    if !ClickClaude(btn.el, hwnd) {   ; (not where it can be clicked: opened with the keyboard instead)
        NoteEvent("Claude's Model button isn't where it can be clicked; opening its menu with the keyboard")
        KeyOpen(btn.el, hwnd)
    }
    ; (before: in a submenu, what Claude's window offered before it was opened, see PickFromModelMenu;
    ; top: the menu's own choices, for going back to; subs: each submenu's, once seen; seen: every
    ; choice in the last read; pickedAt, keyAt, focusMs: opening a submenu, see WatchSubmenu)
    ModelMenu := {title: "MODEL", items: [], key: "opening", hwnd: hwnd, btn: btn, tries: 0, before: "", top: [], subs: Map(), seen: Map(), trigger: "",
        pickedAt: 0, keyAt: 0, focusMs: -1, pre: pre}
    Kick()
    SetTimer(ReadModelMenu, -350)
    SetTimer(WatchModelMenu, 400)
}

; While the list shows Claude's model menu: if Claude's menu has closed meanwhile (you clicked in
; Claude's window, or switched chats there), the list closes too, rather than offer choices that
; are gone.
WatchModelMenu() {
    Critical   ; (runs to the end: see ClickClaude)
    global ModelMenu
    if !(m := ModelMenu)
        return SetTimer(WatchModelMenu, 0)
    if (m.key == "opening" || !m.items.Length)
        return
    ; (While you look at the list, Claude's window, if the box had it restored unseen for this, isn't
    ; minimized again: that closed its menu, and the list with it, 30 s on, under your pointer. Only
    ; when the box can't be seen does that stop, see HideClaudeAgain.)
    if (Unhid.hwnd = m.hwnd && Anim.shown && !Hidden)
        Unhid.at := A_TickCount
    for it in m.items
        if SpotIn(m.hwnd, it.el)
            return
    NoteEvent("Claude's " StrLower(m.title) " menu closed, so the list did too")
    ModelMenu := ""
    Kick()
}

; What Claude's open menus offer, as {name, el, type}: their radio buttons, menu items and
; checkboxes (but not Claude's page switch, which is radio buttons too).
MenuChoices(hwnd) {
    out := []
    for type in [UIA_RADIO, 50011, 50002]   ; UIA_MenuItemControlTypeId, UIA_CheckBoxControlTypeId
        for item in GetElements(hwnd, type)
            if !(type = UIA_RADIO && item.name ~= "^(Chat and Cowork|Code)")
                out.Push({name: item.name, el: item.el, type: type})
    return out
}

; Whether one of a menu's choices (el) is the one picked: selected, or ticked.
IsPicked(el) {
    try {
        if IsSelected(el)
            return true
        if (toggle := GetPattern(el, 10015, "{94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70}")) {   ; Toggle
            ComCall(4, toggle, "int*", &state := 0)   ; CurrentToggleState (3 is Toggle itself, which switches it!)
            return state = 1
        }
    }
    return false
}

; What one of Claude's menu choices (c, see MenuChoices) is: "pick" (a model or an effort), "more" (it
; opens a submenu, like More models), "toggle" (an on/off switch, like Haiku's Extended) or "" (something
; else, like a note with a link in it).
MenuKind(c) {
    if (c.type = UIA_RADIO)
        return "pick"
    if (c.name ~= "^(More models|Effort)")
        return "more"
    if (c.type = 50002 || HasPattern(c.el, 10015, "{94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70}"))   ; (a checkbox, or anything that toggles)
        return "toggle"
    if HasPattern(c.el, 10005, "{619be086-1f4e-4ee4-bafa-210128738730}")   ; (ExpandCollapse: it opens a submenu)
        return "more"
    return ""
}

HasPattern(el, id, iid) {
    try return el && GetPattern(el, id, iid) != ""
    return false
}

; Opens one of Claude's submenus (m.trigger, like "More models") from behind, as a keyboard would: it's
; put in focus through UI Automation, and the Right arrow key opens it once it has the focus (see
; SubmenuKey). (Tried on the real Claude: a click from behind doesn't open one, nor do UI
; Automation's Invoke or Expand; the mouse resting on it does, but only while your mouse is over
; Claude's window, see HoverOver.) WatchSubmenu sees it open, or tries again.
OpenSubmenu(m) {
    m.keyAt := 0, m.focusMs := -1
    PressInClaude(m.trigger.el, e => ComCall(3, e))   ; SetFocus
    SetTimer(SubmenuKey.Bind(m, A_TickCount), -20)
}

; The Right arrow key for OpenSubmenu. Claude's window takes the focus a moment after it's asked to,
; and a key that comes before it does goes nowhere: it waits for it, a fifth of a second at most.
SubmenuKey(m, since) {
    if (ModelMenu !== m)
        return
    focused := false
    try focused := m.trigger.el && HasFocus(m.trigger.el)
    if (!focused && A_TickCount - since < 200)
        return SetTimer(SubmenuKey.Bind(m, since), -20)
    m.focusMs := focused ? A_TickCount - since : -1
    PostKey(m.hwnd, 0x27, 0x4D)   ; Right
    m.keyAt := A_TickCount
}

; Watches one of Claude's submenus (m.trigger) open (see PickFromModelMenu), every 40 ms: once Claude
; says it's open, the list shows what's in it (see ShowMenuNow). If it isn't a fifth of a second
; after the Right arrow key, the key's pressed again; then it's put in focus again and the key
; pressed; then the mouse rests on it (see HoverOver); then the list goes back to the menu. A try
; that was needed is noted, with how long the focus took, to see why.
WatchSubmenu(m, step) {
    Critical   ; (runs to the end: see ClickClaude)
    if !(ModelMenu == m && m.key == "opening")   ; (gone, or showing it already)
        return
    open := IsExpanded(m.trigger.el)   ; (true, false, or "" if Claude doesn't say)
    if ((open == "" || open) && ShowMenuNow(m)) {
        if step
            NoteEvent(Format("Claude's {} submenu opened on try {}, {} ms after it was picked in the list", StrLower(m.title), step + 1, A_TickCount - m.pickedAt))
        return
    }
    waited := A_TickCount - m.keyAt
    if (!m.keyAt || (open == 1 && waited < 1000) || waited < (step = 3 ? 500 : 200))
        return SetTimer(WatchSubmenu.Bind(m, step), open == "" ? -120 : -40)
    what := "Claude's " StrLower(m.title) " submenu", focus := m.focusMs < 0 ? "it never had the focus" : "it had the focus after " m.focusMs " ms"
    if (step = 0) {
        NoteEvent(what " didn't open with the Right arrow key (" focus "); pressing it again")
        PostKey(m.hwnd, 0x27, 0x4D), m.keyAt := A_TickCount
    } else if (step = 1) {
        NoteEvent(what " still didn't open; putting it in focus again")
        OpenSubmenu(m)
    } else if (step = 2) {
        NoteEvent(what " still didn't open (" focus "); resting the mouse on it instead")
        HoverOver(m.trigger.el, m.hwnd), m.keyAt := A_TickCount
    } else {
        NoteEvent(what " didn't open")
        return BackToModelMenu()
    }
    SetTimer(WatchSubmenu.Bind(m, step + 1), -40)
}

; Whether one of Claude's controls (el) that opens something is open: true or false, or "" if it
; doesn't say.
IsExpanded(el) {
    try if (p := GetPattern(el, 10005, "{619be086-1f4e-4ee4-bafa-210128738730}")) {   ; ExpandCollapse
        ComCall(5, p, "int*", &state := 0)   ; CurrentExpandCollapseState (3 is Expand itself)
        return state = 1 || state = 2
    }
    return ""
}

; The mouse resting on one of Claude's controls (el), as mouse messages.
HoverOver(el, hwnd) {
    if !(at := SpotIn(hwnd, el))
        return
    loop 2
        DllCall("PostMessage", "ptr", hwnd, "uint", 0x200, "ptr", 0, "ptr", (at.y & 0xFFFF) << 16 | (at.x + A_Index - 1 & 0xFFFF))   ; WM_MOUSEMOVE
}

; A key pressed and let go in Claude's window (hwnd), as key messages: vk, its scan code, and whether
; it's one of the extended keys (like the arrows). (Never Esc: on the Code page, it stops Claude.)
PostKey(hwnd, vk, scan, extended := true) {
    if !hwnd   ; (to no window, it'd go to this script itself)
        return
    bits := 1 | scan << 16 | (extended ? 1 << 24 : 0)
    DllCall("PostMessage", "ptr", hwnd, "uint", 0x100, "ptr", vk, "ptr", bits)                        ; WM_KEYDOWN
    DllCall("PostMessage", "ptr", hwnd, "uint", 0x101, "ptr", vk, "ptr", bits | 1 << 30 | 1 << 31)    ; WM_KEYUP
}

; Claude's model menu, shown in the list once it has opened (see OpenModelMenu, ShowMenuNow). If the
; click on its button didn't open it, it's opened with the keyboard (see KeyOpen), then clicked once
; more; if it still hasn't in a couple of seconds, the list closes, and it's noted why. (It used to
; just wait, and on a laptop it waited for you to open the menu in Claude yourself.)
ReadModelMenu() {
    Critical   ; (runs to the end: see ClickClaude)
    global ModelMenu
    m := ModelMenu
    if (!m || ShowMenuNow(m))
        return
    ++m.tries
    if (m.tries = 3) {
        focused := KeyOpen(m.btn.el, m.hwnd)
        NoteEvent("Claude's model menu didn't open with a click; opening it with the keyboard" (focused ? "" : " (its button didn't take the focus)"))
    } else if (m.tries = 6) {
        NoteEvent("Claude's model menu still didn't open; clicking its button again")
        ClickClaude(m.btn.el, m.hwnd)
    }
    if (m.tries < 9)
        return SetTimer(ReadModelMenu, -250)
    why := !DllCall("IsWindow", "ptr", m.hwnd) ? "Claude's window is gone" : DllCall("IsIconic", "ptr", m.hwnd) ? "Claude's window is minimized"
        : SpotIn(m.hwnd, m.btn.el) ? "its button is showing" : "its button isn't showing"
    NoteEvent("Claude's model menu didn't open (" why ")")
    ModelMenu := ""
    Kick()
}

; What Claude's open menu (m) has now, shown in the list: its choices (radio buttons, the one picked
; marked), what opens more of them ("More models", and on the Chat page "Effort") and on/off switches
; (see MenuKind). In one of those submenus, whatever showed up in Claude's window once it opened (see
; WatchSubmenu). False if there's nothing (yet).
ShowMenuNow(m) {
    items := [], seen := Map()
    try {
        for c in MenuReader.Call(m.hwnd) {
            seen[c.name] := c
            kind := MenuKind(c)
            if m.before {
                if !(m.before.Has(c.name) || c.name ~= "i)learn more$")
                    items.Push({name: c.name, el: c.el, kind: kind = "toggle" ? "toggle" : "pick", picked: IsPicked(c.el)})
            } else if (kind != "" && !(m.HasOwnProp("pre") && m.pre.Has(c.name)))   ; (not what was there before it opened, see OpenModelMenu)
                items.Push({name: c.name, el: c.el, kind: kind, picked: kind != "more" && IsPicked(c.el)})
        }
    }
    ; A submenu that's been opened before and is still open (you went back to the menu, see
    ; BackToModelMenu, and it stayed open in Claude's window): what it had.
    if (!items.Length && m.before && m.subs.Has(m.trigger.name)) {
        for it in m.subs[m.trigger.name]
            if seen.Has(it.name)
                items.Push({name: it.name, el: seen[it.name].el, kind: it.kind, picked: IsPicked(seen[it.name].el)})
        if (items.Length < m.subs[m.trigger.name].Length)
            items := []
    }
    if !items.Length
        return false
    m.items := items, m.seen := seen, m.key := A_TickCount
    if m.before {
        m.subs[m.trigger.name] := items
        names := ""
        for it in items
            names .= (names = "" ? "" : ", ") it.name
        NoteEvent("Claude's " StrLower(m.title) " submenu has: " names)
    } else
        m.top := items
    Kick()
    return true
}

; The list goes back from a submenu to the model menu (its heading's ‹ clicked, see PanelRowAt).
BackToModelMenu() {
    m := ModelMenu
    m.title := "MODEL", m.before := "", m.items := m.top, m.key := A_TickCount
    Kick()
}

; One of the list's models (or efforts) picked (i): Claude's own is clicked (and its menu closes by
; itself; if the click didn't take from behind, it's pressed through UI Automation, see CheckPicked).
; One that opens more ("More models", "Effort") opens it, and the list shows what's in it (see
; WatchSubmenu).
PickFromModelMenu(i) {
    Critical   ; (runs to the end: see ClickClaude)
    global ModelMenu
    m := ModelMenu
    if !(m && i <= m.items.Length)
        return
    it := m.items[i]
    if (it.kind = "more") {
        m.before := m.seen, m.trigger := it, m.title := StartsWith(it.name, "Effort") ? "EFFORT" : "MORE MODELS"
        m.items := [], m.key := "opening", m.pickedAt := A_TickCount
        OpenSubmenu(m)
        Kick()
        SetTimer(WatchSubmenu.Bind(m, 0), -40)
        return
    }
    if (it.kind = "toggle") {   ; (switched right away in the list, the other way from how it shows; see CheckToggled)
        ClickClaude(it.el, m.hwnd)
        it.picked := !it.picked, it.at := A_TickCount, m.key := A_TickCount
        NoteEvent("turned '" it.name "' " (it.picked ? "on" : "off") " in Claude's " StrLower(m.title) " menu")
        Kick()
        SetTimer(CheckToggled.Bind(m, it, it.at), -400)
        return
    }
    ClickClaude(it.el, m.hwnd)
    NoteEvent("picked '" it.name "' from Claude's " StrLower(m.title) " menu")
    if (m.title != "EFFORT" && RegExMatch(it.name, "^(\S+ \d[\d.]*)", &name))   ; (shown right away; the next read of Claude's buttons says for sure)
        Bar().model := name[1], ModelBars.setAt := A_TickCount
    ModelMenu := ""
    Kick()
    SetTimer(CheckPicked.Bind(m, it), -400)
}

; A while after one of Claude's choices (it) was clicked from behind (see PickFromModelMenu): if its
; menu (m) is still open with it not picked, the click didn't take, and it's pressed through UI
; Automation instead. If the menu's still open after that, it's closed.
CheckPicked(m, it) {
    Critical   ; (runs to the end: see ClickClaude)
    if !SpotIn(m.hwnd, it.el) {   ; (gone: the menu closed, as it does once something's picked)
        ReadSoon()
        return
    }
    if !IsPicked(it.el) {
        NoteEvent("picking '" it.name "' with a click from behind didn't take; pressing it instead")
        PressInClaude(it.el, SelectOrInvoke)
    }
    SetTimer(() => SpotIn(m.hwnd, it.el) && ClickClaude(m.btn.el, m.hwnd), -300)
    ReadSoon()
}

; A while after one of Claude's on/off switches (it) was clicked from behind at "at" (see
; PickFromModelMenu), to be the way the list shows it: if its menu (m) closed, the list closes too.
; If it's still there and not that way, the click didn't take, and it's switched through UI
; Automation instead: only then, as a switch pressed twice is back where it was. Then, shortly, the
; list shows it the way Claude has it. (Clicked again meanwhile, that click's own check does this.)
CheckToggled(m, it, at, tries := 0) {
    Critical   ; (runs to the end: see ClickClaude)
    global ModelMenu
    if (it.at != at)
        return
    if !SpotIn(m.hwnd, it.el) {   ; (gone: the menu closed)
        if (ModelMenu == m)
            ModelMenu := "", Kick()
        return ReadSoon()
    }
    if (IsPicked(it.el) != it.picked) {
        if !tries {
            NoteEvent("turning '" it.name "' " (it.picked ? "on" : "off") " with a click from behind didn't take; switching it instead")
            PressInClaude(it.el, ToggleOrInvoke)
            return SetTimer(CheckToggled.Bind(m, it, at, 1), -300)
        }
        NoteEvent("'" it.name "' is still " (it.picked ? "off" : "on") " in Claude's menu")
        it.picked := !it.picked, m.key := A_TickCount
        Kick()
    }
    ReadSoon()
}

; Switches one of a menu's on/off switches (el) through UI Automation, or presses it.
ToggleOrInvoke(el) {
    if (toggle := GetPattern(el, 10015, "{94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70}"))
        ComCall(3, toggle)   ; Toggle
    else
        SelectOrInvoke(el)
}

; Picks one of a menu's choices (el) through UI Automation: selects it, or presses it.
SelectOrInvoke(el) {
    if (item := GetPattern(el, 10010, "{a8efa66a-0fda-421a-9194-38021f3578ea}"))   ; SelectionItem
        ComCall(3, item)   ; Select
    else
        Invoke(el)
}

; Does something to one of Claude's controls (el) through UI Automation (press, like Invoke), for
; when click messages from behind don't do: Claude could come forward for it, so Windows' foreground
; lock keeps it from taking the front meanwhile, and whatever was in front (a game) gets it back if
; it did. Then the lock's taken again if a game's in front, as GuardGame has it (see ReadyToClick).
PressInClaude(el, press) {
    if Unhid.hwnd   ; (restored unseen to click in: kept so a while longer, see HideClaudeAgain)
        Unhid.at := A_TickCount
    front := WinExist("A")
    DllCall("LockSetForegroundWindow", "uint", 1)   ; LSFW_LOCK
    try press(el)
    DllCall("LockSetForegroundWindow", "uint", 2)   ; LSFW_UNLOCK
    if (front && WinExist("A") != front)
        try SetWinDelay(-1), WinActivate(front)
    if !Handed
        GuardGame(GameFront)
}

; Closes the list of models, and Claude's menu with it (by clicking its button again) if it's still open.
CloseModelMenu() {
    Critical   ; (runs to the end: see ClickClaude)
    global ModelMenu
    m := ModelMenu, ModelMenu := ""
    Kick()
    if !m
        return
    try {
        for item in GetElements(m.hwnd, UIA_RADIO)
            if !(item.name ~= "^(Chat and Cowork|Code)") {   ; (still open)
                ClickClaude(m.btn.el, m.hwnd)
                return
            }
    }
}

; A step of the effort slider clicked (n, 0 to 5): Claude's Effort button opens its slider, which is
; set to it, and closed again (see SetEffortSlider, FinishEffort).
SetEffort(n) {
    Critical   ; (runs to the end: see ClickClaude)
    hwnd := ClaudeToClick()
    if !(hwnd && (btn := ClaudeButton(hwnd, "Effort: ")) && ClickClaude(btn.el, hwnd)) {
        NoteEvent("couldn't open Claude's effort slider")
        return
    }
    for name, step in EffortSteps   ; (shown right away, if its name is known)
        if (step = n)
            Bar().effort := name
    ModelBars.setAt := A_TickCount
    Kick()
    SetTimer(() => SetEffortSlider(hwnd, n, 0), -500)
}

SetEffortSlider(hwnd, n, tries) {
    Critical   ; (runs to the end: see ClickClaude)
    slider := ""
    try {
        for item in GetElements(hwnd, 50015)   ; UIA_SliderControlTypeId
            if (item.name = "Effort")
                slider := item
    }
    if !slider {
        if (tries < 3)
            SetTimer(() => SetEffortSlider(hwnd, n, tries + 1), -300)
        else
            NoteEvent("Claude's effort slider didn't show")
        return
    }
    ; (Set through UI Automation, see PressInClaude.)
    PressInClaude(slider.el, el => (range := GetPattern(el, 10003, "{59213F4F-7346-49E5-B120-80555987A148}")) && ComCall(3, range, "double", n))   ; RangeValue.SetValue
    SetTimer(() => FinishEffort(hwnd, n), -300)
}

; The effort's new name (from Claude's Effort button, which is then clicked again to close its
; slider), remembered as that step of the slider.
FinishEffort(hwnd, n) {
    Critical   ; (runs to the end: see ClickClaude)
    if (btn := ClaudeButton(hwnd, "Effort: ")) {
        name := SubStr(btn.name, 9)
        EffortSteps[name] := n, Bar().effort := name, ModelBars.setAt := A_TickCount
        NoteEvent("set Claude's effort to " name " (step " n ")")
        ClickClaude(btn.el, hwnd)
    }
    Kick()
}

; A click on the list beside the box: goes to the session or chat clicked (the list stays open), or
; clears the box ("Clear box", in its heading). Or, in the model bar at its bottom, opens (or closes)
; the list of models, picks one from it (or goes back to it from a submenu), sets the effort or
; compacts the session (see ModelBarH).
PanelClick() {
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    if !(row := PanelRowAt(mx, my))
        return 0
    if (row = "model") {
        SetTimer(ModelMenu ? CloseModelMenu : OpenModelMenu, -1)
        return 0
    }
    if (row = "back") {
        BackToModelMenu()
        return 0
    }
    if (row = "clear") {   ; ("Clear box", in its heading)
        SetTimer(ClearChat, -1)
        return 0
    }
    if (row = "compact") {   ; (only once Claude's done, see CanCompact)
        SetTimer(StartCompacting, -1)
        return 0
    }
    if (row = "compact-wait")
        return 0
    if (InStr(row, "effort-") = 1) {
        SetTimer(SetEffort.Bind(Integer(SubStr(row, 8))), -1)
        return 0
    }
    if (InStr(row, "item-") = 1) {
        SetTimer(PickFromModelMenu.Bind(Integer(SubStr(row, 6))), -1)
        return 0
    }
    title := Sessions.list[row].title
    Sessions.current := title   ; highlighted right away (the list stays open, till its tab's clicked again)
    Kick()
    ; What you picked is what's opened: nothing the box had open before is opened again over it (see
    ; SetReopen), even if Claude goes to the other page for it.
    ListPick.title := title, ListPick.at := A_TickCount, Reopen.key := ""
    SetTimer(() => OpenSession(title), -1)
    return 0
}

; A rounded rectangle as a GDI+ path, for whoever asked for it to delete.
RoundedPath(x, y, w, h, r) {
    d := 2 * r
    DllCall("gdiplus\GdipCreatePath", "int", 0, "ptr*", &path := 0)
    for arc in [[x, y, 180], [x + w - d, y, 270], [x + w - d, y + h - d, 0], [x, y + h - d, 90]]
        DllCall("gdiplus\GdipAddPathArc", "ptr", path, "float", arc[1], "float", arc[2], "float", d, "float", d, "float", arc[3], "float", 90)
    DllCall("gdiplus\GdipClosePathFigure", "ptr", path)
    return path
}

FillRoundRect(x, y, w, h, r, color) {
    path := RoundedPath(x, y, w, h, Min(r, w / 2, h / 2))
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", color)
    DllCall("gdiplus\GdipFillPath", "ptr", Canvas.g, "ptr", Brush, "ptr", path)
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
}

; A pill shape (a rectangle with fully rounded ends), like the bar that shows where you've scrolled to.
FillPill(x, y, w, h, color) => FillRoundRect(x, y, w, h, w / 2, color)

FillRect(x, y, w, h, color) {
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", color)
    DllCall("gdiplus\GdipFillRectangle", "ptr", Canvas.g, "ptr", Brush, "float", x, "float", y, "float", w, "float", h)
}

FillCircle(cx, cy, r, color) {
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", color)
    DllCall("gdiplus\GdipFillEllipse", "ptr", Canvas.g, "ptr", Brush, "float", cx - r, "float", cy - r, "float", 2 * r, "float", 2 * r)
}

SetClip(top, height) => DllCall("gdiplus\GdipSetClipRect", "ptr", Canvas.g, "float", 0, "float", top, "float", Look.W, "float", height, "int", 0)

DrawWord(text, f, x, y, alpha, color, shadow) {
    static spot := Buffer(16, 0), around := [[-1, -1], [1, -1], [-1, 1], [1, 1]]
    if (alpha < 0.004)
        return
    alpha := Faint(alpha)
    if shadow {
        ; A soft halo: the word drawn faintly a pixel off in each direction, in the opposite color.
        DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(alpha * shadow * 0.5, Look.colors.shadow))
        for off in around {
            NumPut("float", x + off[1] * Look.s, "float", y + off[2] * Look.s, spot)
            DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", text, "int", -1, "ptr", f.font, "ptr", spot, "ptr", TextFormat, "ptr", Brush)
        }
    }
    NumPut("float", x, "float", y, spot)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(alpha, color))
    DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", text, "int", -1, "ptr", f.font, "ptr", spot, "ptr", TextFormat, "ptr", Brush)
}

; The box's handles, which show while you point at it: the settings cog in its top corner, a grip
; at the top middle for moving it, and marks in its corners for resizing it. The one you're
; pointing at stands out.
DrawHandles(h) {
    static spot := Buffer(16, 0)
    if (Anim.hover < 0.01)
        return
    c := Look.colors, r := Look.cogR, s := Look.s, a := Anim.hover
    ; The grip: two rows of three dots.
    strength := Anim.hot = "move" || Drag.mode = "move" ? 0.8 : 0.35
    loop 6
        FillCircle(Look.W / 2 + (Mod(A_Index - 1, 3) - 1) * 6 * s, Look.pad / 2 + (A_Index > 3 ? 2.5 : -2.5) * s, 1.3 * s,
            ARGB(a * strength, c.text))
    ; The corners: a short bent line in each.
    arm := 9 * s, thick := 2 * s, inset := 4 * s
    for which in ["tl", "tr", "bl", "br"] {
        hot := Anim.hot = "resize-" which || Drag.mode = "resize-" which
        x := InStr(which, "l") ? inset : Look.W - inset - thick, y := InStr(which, "t") ? inset : h - inset - thick
        color := ARGB(a * (hot ? 0.8 : 0.3), c.text)
        FillRect(InStr(which, "l") ? x : x - arm + thick, y, arm, thick, color)
        FillRect(x, InStr(which, "t") ? y : y - arm + thick, thick, arm, color)
    }
    ; The settings cog, and beside it the – that tucks the box into its tab at the side of the screen,
    ; up by the tabs (on the box's color, like them).
    back := ARGB(a * Max(0.85, Settings.Background / 100), c.bg)
    for button in [["cog", Look.cogX, Look.cogGlyph], ["mini", Look.miniX, Look.icons.Has("menu") ? Chr(0xE921) : "–"]] {
        x := button[2], y := Look.cogY
        FillCircle(x, y, r, back)
        FillCircle(x, y, r, ARGB(a * (Anim.hot = button[1] ? 0.24 : 0.10), c.text))
        NumPut("float", x - r, "float", y - r, "float", 2 * r, "float", 2 * r, spot)
        DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(a * 0.9, c.text))
        DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", button[3], "int", -1, "ptr", Look.cogFont.font, "ptr", spot, "ptr", CenterFormat, "ptr", Brush)
    }
    ; Above it, level with the tab, a hint that the wheel scrolls back, when there's something
    ; earlier to see and the "new message" badge isn't there.
    if (!View.scrolled && HasEarlier() && !(Current.newAt && FrameNow - Current.newAt < NEW_BADGE_MS)) {
        hint := "SCROLL FOR EARLIER"
        if ((x := TabRoom(TextWidth(hint, Look.labelFont) + 2 * s)) != "")
            DrawWord(hint, Look.labelFont, x, -Look.tabH + (Look.tabH - Look.labelH) / 2 + s + Look.labelDy, Anim.hover * 0.5, c.text, 0)
    }
}

; While the box is away, lets Windows take back the memory it isn't using right now (it comes back
; as it's needed).
TrimMemory() {
    if !Anim.shown
        DllCall("SetProcessWorkingSetSize", "ptr", -1, "ptr", -1, "ptr", -1)
}

; A color with alpha (0 to 1) as GDI+ wants it.
ARGB(alpha, rgb) => Round(Max(0, Min(1, alpha)) * 255) << 24 | rgb

; A see-through picture w by h pixels to draw on, which can be put on screen as the box.
MakeCanvas(w, h) {
    info := Buffer(40, 0)   ; BITMAPINFOHEADER; a negative height makes the rows go top to bottom
    NumPut("uint", 40, "int", w, "int", -h, "ushort", 1, "ushort", 32, info)
    hdc := DllCall("CreateCompatibleDC", "ptr", 0, "ptr")
    hbm := DllCall("CreateDIBSection", "ptr", hdc, "ptr", info, "uint", 0, "ptr*", &bits := 0, "ptr", 0, "uint", 0, "ptr")
    old := DllCall("SelectObject", "ptr", hdc, "ptr", hbm, "ptr")
    ; GDI+ draws straight into the same pixels, 32-bit with premultiplied alpha as the screen wants them.
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", w, "int", h, "int", w * 4, "int", 0xE200B, "ptr", bits, "ptr*", &bitmap := 0)
    DllCall("gdiplus\GdipGetImageGraphicsContext", "ptr", bitmap, "ptr*", &g := 0)
    DllCall("gdiplus\GdipSetSmoothingMode", "ptr", g, "int", 4)       ; smooth edges
    DllCall("gdiplus\GdipSetTextRenderingHint", "ptr", g, "int", 4)   ; smooth text that works on a see-through background, and glides
                                                                    ; smoothly as the box floats (pixel-snapped text would jitter)
    return {w: w, h: h, hdc: hdc, hbm: hbm, old: old, bitmap: bitmap, g: g}
}

FreeCanvas(c) {
    DllCall("gdiplus\GdipDeleteGraphics", "ptr", c.g)
    DllCall("gdiplus\GdipDisposeImage", "ptr", c.bitmap)
    DllCall("SelectObject", "ptr", c.hdc, "ptr", c.old)
    DllCall("DeleteObject", "ptr", c.hbm)
    DllCall("DeleteDC", "ptr", c.hdc)
}

; A font, falling back to Segoe UI if the one asked for can't be used, and to another style of it
; if it doesn't come in the one asked for (like a font with no bold).
MakeFont(name, px, style) {
    if DllCall("gdiplus\GdipCreateFontFamilyFromName", "wstr", name, "ptr", 0, "ptr*", &family := 0)
        DllCall("gdiplus\GdipCreateFontFamilyFromName", "wstr", "Segoe UI", "ptr", 0, "ptr*", &family := 0)
    used := style
    for tryStyle in [style, 0, 1, 2, 3]
        if !DllCall("gdiplus\GdipCreateFont", "ptr", family, "float", px, "int", tryStyle, "int", 2, "ptr*", &font := 0) {   ; 2: size in pixels
            used := tryStyle   ; (a loop's variable doesn't keep its value after the loop)
            break
        }
    return {family: family, font: font, px: px, style: used}
}

; Where the ink of some text sits when it's drawn at a y of 0: its top, and its height. By default
; the text is letters that reach up to the top of a capital and down below the line.
Ink(f, sample := "Hxgy") {
    static layout := Buffer(16, 0), bounds := Buffer(16, 0)
    DllCall("gdiplus\GdipCreatePath", "int", 0, "ptr*", &path := 0)
    DllCall("gdiplus\GdipAddPathString", "ptr", path, "wstr", sample, "int", -1, "ptr", f.family, "int", f.style,
        "float", f.px, "ptr", layout, "ptr", TextFormat)
    DllCall("gdiplus\GdipGetPathWorldBounds", "ptr", path, "ptr", bounds, "ptr", 0, "ptr", 0)
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
    return {top: NumGet(bounds, 4, "float"), h: Max(1, NumGet(bounds, 12, "float"))}
}

FreeFonts(look) {
    for f in [look.font, look.boldFont, look.labelFont, look.codeFont, look.smallFont, look.cogFont, look.iconFont] {
        if !f
            continue
        DllCall("gdiplus\GdipDeleteFont", "ptr", f.font)
        DllCall("gdiplus\GdipDeleteFontFamily", "ptr", f.family)
    }
}

FontExists(name) {
    if DllCall("gdiplus\GdipCreateFontFamilyFromName", "wstr", name, "ptr", 0, "ptr*", &family := 0)
        return false
    DllCall("gdiplus\GdipDeleteFontFamily", "ptr", family)
    return true
}

; How wide some text is in a font, in pixels. Widths are remembered, since the same words come up a lot.
TextWidth(text, f) {
    static layout := Buffer(16, 0), box := Buffer(16, 0)
    key := f.font "|" text
    if Look.widths.Has(key)
        return Look.widths[key]
    if (Look.widths.Count > 20000)   ; (a long conversation has a lot of different words)
        Look.widths.Clear()
    NumPut("float", 100000, "float", 10000, layout, 8)
    DllCall("gdiplus\GdipMeasureString", "ptr", Measurer.g, "wstr", text, "int", -1, "ptr", f.font, "ptr", layout,
        "ptr", TextFormat, "ptr", box, "ptr", 0, "ptr", 0)
    return Look.widths[key] := NumGet(box, 8, "float")
}

; ---- Settings -----------------------------------------------------------------------

DefaultSettings() => {Font: FONT, FontSize: FONT_SIZE, Theme: THEME, Background: BACKGROUND, Corner: CORNER,
    Width: BOX_WIDTH, Lines: BOX_LINES, Animate: ANIMATE ? 1 : 0, WordSpeed: WORD_SPEED, ScrollSmooth: SCROLL_SMOOTH, Appear: APPEAR,
    HideAfter: HIDE_AFTER, FollowVoice: FOLLOW_VOICE ? 1 : 0, GlowDelay: GLOW_DELAY, Bubbles: BUBBLES ? 1 : 0, Float: FLOAT_BOX ? 1 : 0,
    TypingSound: TYPING_SOUND, CustomColors: CUSTOM_COLORS, Tuck: TUCK ? 1 : 0, TuckCount: TUCK_COUNT ? 1 : 0,
    TuckWiggle: TUCK_WIGGLE ? 1 : 0, AutoLinks: AUTO_LINKS ? 1 : 0, TuckStyle: TUCK_STYLE, SoundVolume: SOUND_VOLUME,
    TextReveal: TEXT_REVEAL, TypeBox: TYPE_BOX ? 1 : 0, ClaudeVoice: CLAUDE_VOICE ? 1 : 0, ReadCode: READ_CODE ? 1 : 0,
    ReadVoice: READ_VOICE, ReadSpeed: READ_SPEED, HighFps: HIGH_FPS ? 1 : 0, GameMode: GAME_MODE ? 1 : 0, ClaudeKey: CLAUDE_KEY, OffsetX: 0, OffsetY: 0, PeekEdge: "", PeekAt: -1, Monitor: 0}

LoadSettings() {
    global Settings
    Settings := DefaultSettings()
    for key, value in DefaultSettings().OwnProps() {
        saved := IniRead(SETTINGS_FILE, "captions", key, value)
        if IsNumber(value)
            saved := IsNumber(saved) ? Number(saved) : value
        Settings.%key% := saved
    }
    ; An earlier version set lines for you and for Claude separately; the box now has one height.
    if (IniRead(SETTINGS_FILE, "captions", "Lines", "") = "") {
        you := IniRead(SETTINGS_FILE, "captions", "YouLines", ""), claude := IniRead(SETTINGS_FILE, "captions", "ClaudeLines", "")
        if (IsNumber(you) && IsNumber(claude))
            Settings.Lines := you + claude
    }
    if !HasValue(THEMES, Settings.Theme)
        Settings.Theme := THEME
    if !HasValue(CORNERS, Settings.Corner)
        Settings.Corner := CORNER
    if !HasValue(APPEAR_STYLES, Settings.Appear)
        Settings.Appear := APPEAR
    if !HasValue(TYPING_SOUNDS, Settings.TypingSound)
        Settings.TypingSound := TYPING_SOUND
    if !HasValue(REVEALS, Settings.TextReveal)
        Settings.TextReveal := TEXT_REVEAL
    if !HasValue(TUCK_STYLES, Settings.TuckStyle)
        Settings.TuckStyle := TUCK_STYLE
    if !HasValue(CLAUDE_KEYS, Settings.ClaudeKey)
        Settings.ClaudeKey := CLAUDE_KEY
    if !HasValue(["", "left", "right", "top", "bottom"], Settings.PeekEdge)
        Settings.PeekEdge := ""
    Settings.SoundVolume := Whole(Settings.SoundVolume, 0, 100, SOUND_VOLUME)
    Settings.ReadSpeed := Whole(Settings.ReadSpeed, 1, 10, READ_SPEED)
    if !(Settings.CustomColors ~= "^([0-9A-Fa-f]{6},){4}[0-9A-Fa-f]{6}$")
        Settings.CustomColors := CUSTOM_COLORS
    Settings.WordSpeed := Whole(Settings.WordSpeed, 1, 10, WORD_SPEED)
    Settings.ScrollSmooth := Whole(Settings.ScrollSmooth, 1, 10, SCROLL_SMOOTH)
    Settings.Lines := Whole(Settings.Lines, 4, 30, BOX_LINES)
    Settings.GlowDelay := Whole(Settings.GlowDelay, 0, 800, GLOW_DELAY)
    ; Claude's pace, as it was last worked out following Claude's voice.
    rate := IniRead(SETTINGS_FILE, "voice", "rate", "")
    if (IsNumber(rate) && rate >= 1.5 && rate <= 6)
        Voice.rate := Number(rate)
}

; Saves the settings, all in one go: the whole [captions] section is written at once (a setting at a
; time, it was written over forty times).
SaveSettings() {
    pairs := ""
    for key, value in Settings.OwnProps()
        pairs .= key "=" value "`n"
    try IniWrite(pairs, SETTINGS_FILE, "captions")
}

; The settings window, drawn like the box itself and in its colors: tabs along the top for each
; group of settings (SETTINGS_TABS), and a row for each setting (see SettingRows) with a short name,
; a little ? that says what it does while you point at it, and its control on the right: a switch,
; a slider, a list to pick from, – and + for numbers, or swatches for your own colors. Changes show
; on the box right away (with an example conversation if there isn't one) and are saved as you make
; them. Drag it by its top to move it; Done, its ✕, or Esc (while you point at it) closes it. It's a
; window of its own, which takes clicks but never the keyboard. SetUI holds how it's doing: which
; tab shows, what you're pointing at (hot) or dragging, the list dropped down from a picker (popup),
; the explanation showing (tip, for the tipFor-th setting), where everything is (spots), and how
; far it has popped in (p).
OpenSettings(*) {
    global SettingsGui, SetUI
    if SettingsGui
        return
    s := Look.s
    SetUI := {tab: 1, hot: "", drag: "", popup: "", tip: "", tipFor: 0, tipA: 0.0, tabX: 0.0, tabW: 0.0, tabSX: 0.0, tabSW: 0.0,
        knobs: Map(), spots: [], sliders: Map(), choices: Map(), helps: Map(), p: 0.0, closing: false, showing: false,
        running: false, last: 0, resetAt: 0, colorsResetAt: 0, dx: 0, dy: 0,
        W: Round(560 * s), rowH: Round(48 * s), head: Round(58 * s), tabsH: Round(40 * s), foot: Round(64 * s), tipText: "", tipAt: "",
        swatches: Map(), hidden: false}
    most := 0, counts := Map()   ; (as tall as the tab with the most settings)
    for row in SettingRows()
        counts[row.tab] := (counts.Has(row.tab) ? counts[row.tab] : 0) + 1, most := Max(most, counts[row.tab])
    SetUI.H := SetUI.head + SetUI.tabsH + Round(10 * s) + most * SetUI.rowH + SetUI.foot
    SetUI.fonts := SettingsFonts()
    SetUI.canvas := MakeCanvas(SetUI.W, SetUI.H)
    ; The tabs, side by side in the middle (a little narrower around their names if they wouldn't fit).
    spots := [], total := 0, words := 0
    for name in SETTINGS_TABS
        words += TextWidth(name, Look.labelFont)
    pad := Max(10 * s, Min(26 * s, (SetUI.W - 32 * s - words) / SETTINGS_TABS.Length - 4 * s))
    for name in SETTINGS_TABS
        w := TextWidth(name, Look.labelFont) + pad, spots.Push({w: w}), total += w + 4 * s
    x := (SetUI.W - total + 4 * s) / 2
    for spot in spots
        spot.x := x, x += spot.w + 4 * s
    SetUI.tabSpots := spots, SetUI.tabX := spots[1].x, SetUI.tabW := spots[1].w
    ; Where it goes: beside the box, toward the middle of the screen, or else in the middle.
    MonitorGetWorkArea(BoxMonitor(), &left, &top, &right, &bottom)
    gap := Round(16 * s)
    x := InStr(Settings.Corner, "left") ? Anim.baseX + Look.W + gap : Anim.baseX - gap - SetUI.W
    if (!Anim.shown || x < left || x + SetUI.W > right)
        x := left + (right - left - SetUI.W) // 2
    SetUI.x := Round(x), SetUI.y := top + (bottom - top - SetUI.H) // 2
    SettingsGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x80000 +E0x08000000")
    SetTimer(SettingsWatch, 60)
    UpdateCaptions()   ; shows the box, with an example if there's no conversation to show
    SettingsKick()
}

; Every setting in the settings window, in order: which tab it's on, its key in Settings, its short
; name, what kind of control it has (with the choices for a list: "fonts" and "voices" are looked
; up), the lowest and highest values and step for a number, how its value is shown (show), when it
; can be changed (when; it's greyed out otherwise), and what it does (help, shown by its ?).
SettingRows() {
    static rows := ""
    if rows
        return rows
    speeds := ["Slowest", "Very slow", "Slow", "Relaxed", "Medium", "Brisk", "Quick", "Faster", "Very fast", "Fastest"]
    paces := ["Slowest", "Slower", "Slow", "Easy", "Normal", "Brisk", "Quick", "Faster", "Very fast", "Fastest"]
    ; Grouped the way settings usually are, each tab about one thing: what the box does (General), its
    ; colors and text (Look), where it sits and how big it is (Layout), everything that moves
    ; (Animation), everything you hear (Sound), and games (Gaming). Each has one plain sentence, so a
    ; setting is easy to find and to understand. A few are two settings in one (Motion, ShowHide,
    ; NewAlerts: see RowValue and ChangeSetting).
    rows := [
        {tab: 1, key: "HideAfter", name: "Hide after", kind: "choice", list: HIDE_CHOICES,
            help: "How long the box stays up once things go quiet."},
        {tab: 1, key: "Tuck", name: "Tuck away", kind: "toggle",
            help: "When the box hides, it tucks into Claude's logo at the edge of the screen. Click the logo to bring it back."},
        {tab: 1, key: "NewAlerts", name: "Unread alerts", kind: "choice", list: ["Count & spin", "Count", "Spin", "Off"],
            help: "How Claude's logo and the tabs show messages you haven't read yet."},
        {tab: 1, key: "TypeBox", name: "Typing box", kind: "toggle",
            help: "A place at the bottom of the box to type to Claude. Enter sends."},
        {tab: 1, key: "AutoLinks", name: "Open links", kind: "toggle",
            help: "Opens the first link in each reply by itself."},
        {tab: 2, key: "Theme", name: "Theme", kind: "choice", list: THEMES,
            help: "The box's colors. Custom lets you pick your own."},
        {tab: 2, key: "CustomColors", name: "Your colors", kind: "colors", when: () => Settings.Theme = "Custom",
            help: "Click a color to change it. Click Default twice to start over."},
        {tab: 2, key: "Background", name: "Background", kind: "slider", low: 0, high: 100, step: 5,
            show: v => v = 0 ? "Words only" : v = 100 ? "Solid" : v "%",
            help: "How solid the box is. All the way left shows just the words."},
        {tab: 2, key: "Bubbles", name: "Chat bubbles", kind: "toggle",
            help: "On the Chat page, messages sit in bubbles, like texting."},
        {tab: 2, key: "Font", name: "Font", kind: "choice", list: "fonts",
            help: "The font for messages."},
        {tab: 2, key: "FontSize", name: "Text size", kind: "stepper", low: 8, high: 40, show: v => v " pt",
            help: "How big the words are."},
        {tab: 3, key: "Corner", name: "Position", kind: "choice", list: CORNERS,
            help: "Which corner of the screen the box sits in. You can also drag it anywhere."},
        {tab: 3, key: "Width", name: "Width", kind: "slider", low: 300, high: 900, step: 10, show: v => v " px",
            help: "How wide the box is. You can also drag its corners."},
        {tab: 3, key: "Lines", name: "Height", kind: "stepper", low: 4, high: 30, show: v => v " lines",
            help: "How many lines tall the box gets before you scroll."},
        {tab: 4, key: "Motion", name: "Animations", kind: "choice", list: ["Off", "Smooth", "Extra smooth"],
            help: "Turns animations off, or picks how smooth they are. Extra smooth matches your screen's refresh rate."},
        {tab: 4, key: "Float", name: "Floating", kind: "toggle", when: () => Settings.Animate,
            help: "The box floats gently and leans toward your mouse."},
        {tab: 4, key: "ShowHide", name: "Show & hide", kind: "choice", list: "showhide", when: () => Settings.Animate,
            help: "How the box comes and goes: into Claude's logo when Tuck away is on (General), or on the spot when it's off."},
        {tab: 4, key: "TextReveal", name: "Words appear", kind: "choice", list: REVEALS,
            show: v => v = "Match the sound" ? "Match the sound (" StrLower(MatchedReveal()) ")" : v,   ; (what it does, with the sounds picked)
            help: "Fade in word by word, or type out letter by letter. Match the sound types letters with the Animal Crossing and Undertale sounds, and fades in otherwise."},
        {tab: 4, key: "WordSpeed", name: "Word speed", kind: "slider", low: 1, high: 10, show: v => speeds[v],
            help: "How fast Claude's words come in."},
        {tab: 4, key: "FollowVoice", name: "Word glow", kind: "toggle",
            help: "In voice mode, each word lights up as Claude says it."},
        {tab: 4, key: "GlowDelay", name: "Glow timing", kind: "slider", low: 0, high: 600, step: 10, show: v => v " ms later",
            when: () => Settings.FollowVoice,
            help: "If the glow runs ahead of Claude's voice, slide it right."},
        {tab: 5, key: "TypingSound", name: "Typing sounds", kind: "choice", list: TYPING_SOUNDS,
            help: "Little sounds as Claude's words appear."},
        {tab: 5, key: "SoundVolume", name: "Volume", kind: "slider", low: 0, high: 100, step: 5, show: v => v "%",
            when: () => Settings.TypingSound != "Off",
            help: "How loud the typing sounds are."},
        {tab: 5, key: "ClaudeVoice", name: "Claude's voice", kind: "toggle",
            help: "Hear Claude talk in voice mode. Off, you read along instead."},
        {tab: 5, key: "ReadCode", name: "Read Code aloud", kind: "toggle",
            help: "A Windows voice reads Code replies out loud."},
        {tab: 5, key: "ReadVoice", name: "Voice", kind: "choice", list: "voices", show: v => RegExReplace(v, "^Microsoft (\S+).*$", "$1"),
            when: () => Settings.ReadCode,
            help: "Which voice reads Code replies."},
        {tab: 5, key: "ReadSpeed", name: "Reading speed", kind: "slider", low: 1, high: 10, show: v => paces[v], when: () => Settings.ReadCode,
            help: "How fast Code replies are read."},
        {tab: 6, key: "GameMode", name: "Gaming mode", kind: "toggle",
            help: "More FPS in full-screen games: the box draws less often and holds still."},
        {tab: 6, key: "ClaudeKey", name: "Claude key", kind: "choice", list: CLAUDE_KEYS,
            help: "Opens the box with a cursor, even in games. Press it again to go back."}
    ]
    return rows
}

; A setting's value as its control shows it (for HideAfter, its choice; for ReadVoice, the first
; voice until one is picked), and as words (show).
RowValue(row) {
    switch row.key {   ; (two settings in one)
        case "Motion": return !Settings.Animate ? "Off" : Settings.HighFps ? "Extra smooth" : "Smooth"
        case "ShowHide": return Settings.Tuck ? Settings.TuckStyle : Settings.Appear
        case "NewAlerts": return Settings.TuckCount ? (Settings.TuckWiggle ? "Count & spin" : "Count") : Settings.TuckWiggle ? "Spin" : "Off"
    }
    if (row.key = "HideAfter")
        return HIDE_CHOICES[HideChoice(Settings.HideAfter)]
    if (row.key = "ReadVoice" && Settings.ReadVoice = "")
        return (voices := ReaderVoices()).Length ? voices[1] : "None"
    return Settings.%row.key%
}
RowShow(row, v) => row.HasOwnProp("show") ? row.show.Call(v) : v ""

; The settings window's fonts (made once): for the settings' names, their values, the title, the
; explanations, the lists and the Done button, each with where its letters sit (ink), for lining up.
SettingsFonts() {
    static fonts := "", madeAt := 0
    if (fonts && madeAt = Look.s && fonts.HasOwnProp("tiny"))
        return fonts
    s := Look.s, madeAt := s, fonts := {}
    for name, spec in Map("name", [14, 0], "value", [13, 0], "title", [16, 1], "help", [12.5, 0], "list", [13, 0], "button", [13.5, 1], "tiny", [10.5, 0]) {
        f := MakeFont("Segoe UI", spec[1] * s, spec[2])
        f.ink := Ink(f, "HO0")   ; (centered by its capitals, so words sit in the middle of buttons)
        fonts.%name% := f
    }
    return fonts
}

; Where to draw text in font f for it to sit in the middle of a line at mid.
TextY(f, mid) => mid - f.ink.h / 2 - f.ink.top

; Somewhere on the settings window that can be pointed at or clicked (see SettingsHit). Later ones
; are on top.
AddSpot(id, x, y, w, h) => SetUI.spots.Push({id: id, x: x, y: y, w: w, h: h})

; Starts the settings window's animation, if it isn't running.
SettingsKick() {
    if (!SettingsGui || SetUI.running)
        return
    SetUI.running := true, SetUI.last := MsNow()
    SetTimer(SettingsTick, 10)   ; (see FrameLoop, which draws its frames with High FPS)
    KeepPace()
}

; One step of the settings window's animation: popping in (or out), switches sliding, the pill under
; the tabs gliding to the one picked, and explanations fading in and out. It draws the window, and
; stops once everything has settled.
SettingsFrame() {
    u := SetUI, now := MsNow(), dt := Min(100, now - u.last), u.last := now
    to := u.closing ? 0 : 1
    u.p := Approach(u.p, to, dt / (u.closing ? 160 : 240))
    moving := u.p != to
    for row in SettingRows()
        if (row.kind = "toggle") {
            want := Settings.%row.key% ? 1 : 0, k := u.knobs.Has(row.key) ? u.knobs[row.key] : want
            u.knobs[row.key] := Approach(k, want, dt / 150)
            moving := moving || u.knobs[row.key] != want
        }
    spot := u.tabSpots[u.tab]
    speed := u.tabSX, u.tabX := Spring(u.tabX, spot.x, &speed, dt, 180), u.tabSX := speed
    speed := u.tabSW, u.tabW := Spring(u.tabW, spot.w, &speed, dt, 180), u.tabSW := speed
    moving := moving || u.tabX != spot.x || u.tabW != spot.w
    tipTo := u.tip != "" ? 1 : 0
    u.tipA := Approach(u.tipA, tipTo, dt / 140)
    moving := moving || u.tipA != tipTo || u.resetAt && now - u.resetAt < 3100 || u.colorsResetAt && now - u.colorsResetAt < 3100
    if (u.closing && u.p = 0)
        return FinishClosingSettings()
    DrawSettings()
    if !moving
        SetTimer(SettingsTick, 0), u.running := false
}

; The timer's frame of the settings window: left to FrameLoop while it's keeping up.
SettingsTick() {
    if (Anim.looping && MsNow() - Anim.loopAt < 25)
        return
    SettingsFrame()
}

; Draws the settings window and puts it on screen, all in one go (see Draw).
DrawSettings() {
    if !SettingsGui
        return
    global Canvas, FrameNow
    was := A_IsCritical, saved := Canvas
    Critical
    FrameNow := MsNow()
    try DrawSettingsNow()
    catch as e
        DrawFailed(e)
    finally Canvas := saved, Critical(was)   ; (even if drawing went wrong partway)
}

DrawSettingsNow() {
    global Canvas
    s := Look.s, c := Look.colors, u := SetUI, W := u.W, H := u.H, f := u.fonts
    saved := Canvas, Canvas := u.canvas, g := Canvas.g
    DllCall("gdiplus\GdipGraphicsClear", "ptr", g, "uint", 0)
    DllCall("gdiplus\GdipResetWorldTransform", "ptr", g)
    grow := 1 - (1 - u.p) ** 3, scale := 0.94 + 0.06 * grow   ; it pops in from its middle (and back out)
    if (scale < 1) {
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", -W / 2, "float", -H / 2, "int", 1)
        DllCall("gdiplus\GdipScaleWorldTransform", "ptr", g, "float", scale, "float", scale, "int", 1)
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", W / 2, "float", H / 2, "int", 1)
    }
    u.spots := []
    RoundedBox(H, ARGB(0.98, c.bg), ARGB(0.22, c.text), "", W, 16 * s)
    ; Its top: Claude's logo, the title and version, and ✕. Dragging the top moves the window.
    AddSpot("head", 0, 0, W, u.head)
    d := 24 * s, lx := 22 * s, mid := u.head / 2 + 3 * s
    if (logo := ClaudeLogo()) {
        DllCall("gdiplus\GdipDrawImageRect", "ptr", g, "ptr", logo, "float", lx, "float", mid - d / 2, "float", d, "float", d)
    } else {
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", lx + d / 2, "float", mid, "int", 0)
        DrawSpark(d / 2)
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", -lx - d / 2, "float", -mid, "int", 0)
    }
    title := "Captions settings", tx := lx + d + 12 * s
    DrawWord(title, f.title, tx, TextY(f.title, mid), 0.95, c.text, 0)
    ; The version, on a soft pill with an arrow: click it to switch to another version (see RunVersion).
    vx := tx + TextWidth(title, f.title) + 10 * s, vw := TextWidth(CAPTIONS_VERSION, f.help) + 26 * s, vh := 22 * s, hot := u.hot = "version"
    FillRoundRect(vx, mid - vh / 2, vw, vh, vh / 2, ARGB(hot || u.popup && u.popup.n = 0 ? 0.16 : 0.07, c.text))
    DrawWord(CAPTIONS_VERSION, f.help, vx + 9 * s, TextY(f.help, mid), hot ? 0.9 : 0.6, c.text, 0)
    arm := 3.5 * s, ax := vx + vw - 10 * s, points := Buffer(24)
    NumPut("float", ax - arm, "float", mid - arm / 2, "float", ax, "float", mid + arm / 2, "float", ax + arm, "float", mid - arm / 2, points)
    DrawLines(points, 3, 1.4 * s, ARGB(hot ? 0.8 : 0.5, c.text))
    u.versionSpot := {x: vx, y: mid - vh / 2, w: Max(vw, 150 * s), h: vh}
    AddSpot("version", vx, mid - vh / 2, vw, vh)
    r := 14 * s, cx := W - 32 * s, hot := u.hot = "close", arm := 4.5 * s, points := Buffer(24)
    FillCircle(cx, mid, r, ARGB(hot ? 0.16 : 0.06, c.text))
    NumPut("float", cx - arm, "float", mid - arm, "float", cx + arm, "float", mid + arm, points)
    DrawLines(points, 2, 1.6 * s, ARGB(hot ? 0.9 : 0.6, c.text))
    NumPut("float", cx - arm, "float", mid + arm, "float", cx + arm, "float", mid - arm, points)
    DrawLines(points, 2, 1.6 * s, ARGB(hot ? 0.9 : 0.6, c.text))
    AddSpot("close", cx - r, mid - r, 2 * r, 2 * r)
    ; The tabs: the one showing is in Claude's color, on a soft pill that glides over to it.
    ty := u.head, th := u.tabsH - 10 * s, tmid := ty + u.tabsH / 2
    FillRoundRect(u.tabX, tmid - th / 2, u.tabW, th, th / 2, ARGB(0.17, c.claude))
    for i, name in SETTINGS_TABS {
        spot := u.tabSpots[i], on := i = u.tab
        DrawWord(name, Look.labelFont, spot.x + 13 * s, tmid - Look.labelH / 2 + Look.labelDy, on ? 1 : u.hot = "tab-" i ? 0.85 : 0.55,
            on ? c.claude : c.text, 0)
        AddSpot("tab-" i, spot.x, ty, spot.w, u.tabsH)
    }
    FillRect(22 * s, ty + u.tabsH + 3 * s, W - 44 * s, Max(1, s), ARGB(0.08, c.text))
    ; The settings on the tab showing.
    y := ty + u.tabsH + 10 * s
    for n, row in SettingRows()
        if (row.tab = u.tab)
            DrawSettingRow(row, n, y), y += u.rowH
    ; Along the bottom: Reset to defaults (click twice), and Done.
    by := H - u.foot / 2 - 2 * s, bh := 34 * s, bw := 104 * s, bx := W - 22 * s - bw
    FillRoundRect(bx, by - bh / 2, bw, bh, 11 * s, ARGB(u.hot = "done" ? 1 : 0.88, c.claude))
    DrawWord("Done", f.button, bx + (bw - TextWidth("Done", f.button)) / 2, TextY(f.button, by), 1, 0xFFFFFF, 0)
    AddSpot("done", bx, by - bh / 2, bw, bh)
    armed := u.resetAt && FrameNow - u.resetAt < 3000
    text := armed ? "Click again to reset everything" : "Reset to defaults", hot := u.hot = "reset"
    rx := 22 * s, rw := TextWidth(text, f.value) + 30 * s
    FillRoundRect(rx, by - bh / 2, rw, bh, 11 * s, ARGB(armed ? 0.2 : hot ? 0.15 : 0.08, armed ? c.claude : c.text))
    DrawWord(text, f.value, rx + 15 * s, TextY(f.value, by), armed || hot ? 1 : 0.85, armed ? c.claude : c.text, 0)
    AddSpot("reset", rx, by - bh / 2, rw, bh)
    ; On top: a list dropped down from a picker, and a setting's explanation.
    if u.popup
        DrawPopup()
    if (u.tipA > 0.01 && u.tipText != "")
        DrawTip()
    Canvas := saved
    ShowLayered(SettingsGui.Hwnd, u.canvas, u.x, u.y, 255 * Min(1, grow * 1.3))
    if !u.showing
        DllCall("ShowWindow", "ptr", SettingsGui.Hwnd, "int", 8), u.showing := true   ; SW_SHOWNA
}

; One setting's row (the n-th, see SettingRows), at y: its name, its ? (a little raised, by the
; name's top right), and its control on the right. A setting that can't be changed right now (see
; when) is greyed out.
DrawSettingRow(row, n, y) {
    s := Look.s, c := Look.colors, u := SetUI, f := u.fonts, x := 26 * s, xr := u.W - 26 * s, mid := y + u.rowH / 2
    on := !row.HasOwnProp("when") || row.when.Call()
    a := on ? 1 : 0.38
    DrawWord(row.name, f.name, x, TextY(f.name, mid), 0.92 * a, c.text, 0)
    qr := 7 * s, qx := x + TextWidth(row.name, f.name) + 6 * s + qr, qy := mid - 6 * s, lit := u.tip = "help-" n
    FillCircle(qx, qy, qr, ARGB(lit ? 0.24 : 0.09, lit ? c.claude : c.text))
    DrawWord("?", Look.labelFont, qx - TextWidth("?", Look.labelFont) / 2, qy - Look.labelH / 2 + Look.labelDy, lit ? 1 : 0.55,
        lit ? c.claude : c.text, 0)
    u.helps[n] := {x: qx, y: qy}
    AddSpot("help-" n, qx - qr - 4 * s, qy - qr - 4 * s, 2 * qr + 8 * s, 2 * qr + 8 * s)
    switch row.kind {
        case "toggle":  DrawSwitch(row, n, xr, mid, a, on)
        case "slider":  DrawSlider(row, n, xr, mid, a, on)
        case "choice":  DrawPicker(row, n, xr, mid, a, on)
        case "stepper": DrawStepper(row, n, xr, mid, a, on)
        case "colors":  DrawSwatches(row, n, xr, mid, a, on)
    }
    FillRect(x, y + u.rowH - 0.5 * s, u.W - 2 * x, Max(1, 0.6 * s), ARGB(0.05, c.text))
}

; A switch: a pill that fills with Claude's color as its knob slides over, when it's on.
DrawSwitch(row, n, xr, mid, a, on) {
    s := Look.s, c := Look.colors, w := 42 * s, h := 24 * s, x := xr - w
    k := SetUI.knobs.Has(row.key) ? SetUI.knobs[row.key] : (Settings.%row.key% ? 1 : 0)
    off := c.light ? Darker(c.bg, 0.16) : Blend(c.bg, 0xFFFFFF, 0.2)
    FillRoundRect(x, mid - h / 2, w, h, h / 2, ARGB(a, Blend(off, c.claude, k)))
    r := h / 2 - 3 * s + (on && SetUI.hot = "ctl-" n ? s : 0)
    FillCircle(x + h / 2 + (w - h) * k, mid, r, ARGB(a, 0xFFFFFF))
    if on
        AddSpot("ctl-" n, x - 8 * s, mid - h / 2 - 6 * s, w + 16 * s, h + 12 * s)
}

; A slider: a thin track, filled in Claude's color up to its knob, with its value on the right.
DrawSlider(row, n, xr, mid, a, on) {
    s := Look.s, c := Look.colors, f := SetUI.fonts.value
    w := 170 * s, x := xr - 96 * s - w, v := Settings.%row.key%
    k := Max(0, Min(1, (v - row.low) / (row.high - row.low)))
    FillRoundRect(x, mid - 2 * s, w, 4 * s, 2 * s, ARGB(0.14 * a, c.text))
    FillRoundRect(x, mid - 2 * s, Max(4 * s, w * k), 4 * s, 2 * s, ARGB(a, c.claude))
    hot := on && (SetUI.hot = "ctl-" n || SetUI.drag = "ctl-" n), r := (hot ? 8.5 : 7.5) * s
    FillCircle(x + w * k, mid, r + 1.2 * s, ARGB(0.2 * a, 0x000000))
    FillCircle(x + w * k, mid, r, ARGB(a, 0xFFFFFF))
    text := RowShow(row, v)
    DrawWord(text, f, xr - TextWidth(text, f), TextY(f, mid), 0.72 * a, c.text, 0)
    SetUI.sliders[n] := {x: x, w: w}
    if on
        AddSpot("ctl-" n, x - 10 * s, mid - 13 * s, w + 20 * s, 26 * s)
}

; A picker: what's picked, on a soft rounded field with an arrow; click it for the list (see OpenPopup).
DrawPicker(row, n, xr, mid, a, on) {
    s := Look.s, c := Look.colors, f := SetUI.fonts.value, w := 236 * s, h := 32 * s, x := xr - w, y := mid - h / 2
    open := SetUI.popup && SetUI.popup.n = n, hot := on && SetUI.hot = "ctl-" n
    FillRoundRect(x, y, w, h, 10 * s, ARGB(a * (open ? 0.15 : hot ? 0.11 : 0.07), c.text))
    DrawWord(FitWidth(RowShow(row, RowValue(row)), f, w - 44 * s), f, x + 13 * s, TextY(f, mid), 0.92 * a, c.text, 0)
    cx := x + w - 17 * s, arm := 4.5 * s, tip := open ? -arm / 2 : arm / 2, points := Buffer(24)
    NumPut("float", cx - arm, "float", mid - tip, "float", cx, "float", mid + tip, "float", cx + arm, "float", mid - tip, points)
    DrawLines(points, 3, 1.6 * s, ARGB(0.6 * a, c.text))
    SetUI.choices[n] := {x: x, y: y, w: w, h: h}
    if on
        AddSpot("ctl-" n, x, y, w, h)
}

; A number, with – and + on either side.
DrawStepper(row, n, xr, mid, a, on) {
    s := Look.s, c := Look.colors, f := SetUI.fonts.value, d := 28 * s, valueW := 90 * s, v := Settings.%row.key%
    left := xr - 2 * d - valueW, points := Buffer(16), arm := 5 * s
    for i, cx in [left + d / 2, xr - d / 2] {
        can := i = 1 ? v > row.low : v < row.high, hot := on && can && SetUI.hot = "step-" n "-" i
        FillCircle(cx, mid, d / 2, ARGB(a * (hot ? 0.2 : 0.08), c.text))
        inkColor := ARGB(a * (can ? 0.8 : 0.3), c.text)
        NumPut("float", cx - arm, "float", mid, "float", cx + arm, "float", mid, points)
        DrawLines(points, 2, 1.6 * s, inkColor)
        if (i = 2) {
            NumPut("float", cx, "float", mid - arm, "float", cx, "float", mid + arm, points)
            DrawLines(points, 2, 1.6 * s, inkColor)
        }
        if (on && can)
            AddSpot("step-" n "-" i, cx - d / 2, mid - d / 2, d, d)
    }
    text := RowShow(row, v)
    DrawWord(text, f, left + d + (valueW - TextWidth(text, f)) / 2, TextY(f, mid), 0.9 * a, c.text, 0)
}

; Your own colors, as round swatches; click one to change it. To their left, Default puts them all
; back (click it twice: the first click asks "Sure?").
DrawSwatches(row, n, xr, mid, a, on) {
    s := Look.s, c := Look.colors, swatchHexes := StrSplit(Settings.CustomColors, ","), r := 10 * s, step := 46 * s, f := SetUI.fonts.tiny
    custom := Settings.Theme = "Custom", cy := mid - 7 * s
    for i, hex in swatchHexes {
        cx := xr - step / 2 - (swatchHexes.Length - i) * step, hot := on && SetUI.hot = "color-" n "-" i, name := COLOR_NAMES[i]
        FillCircle(cx, cy, r + (hot ? 3 : 1.5) * s, ARGB(a * (hot ? 0.55 : 0.25), c.text))
        FillCircle(cx, cy, r, ARGB(a * (custom ? 1 : 0.6), Integer("0x" hex)))   ; (softer while another theme is picked)
        DrawWord(name, f, cx - TextWidth(name, f) / 2, TextY(f, cy + r + 9 * s), a * (hot ? 0.95 : 0.55), c.text, 0)
        SetUI.swatches[i] := {x: cx, y: cy + r}
        if on
            AddSpot("color-" n "-" i, cx - step / 2, cy - r - 4 * s, step, 2 * r + 24 * s)
    }
    cx := xr - step / 2 - swatchHexes.Length * step - 6 * s, hot := on && SetUI.hot = "colors-default"
    armed := SetUI.colorsResetAt && FrameNow - SetUI.colorsResetAt < 3000, inkColor := armed ? c.claude : c.text
    FillCircle(cx, cy, r + (hot ? 3 : 1.5) * s, ARGB(a * (armed ? 0.6 : hot ? 0.55 : 0.25), inkColor))
    FillCircle(cx, cy, r, ARGB(a, c.bg))
    ; A circle with an arrow at its end, going around to the left: back to how it was.
    ar := r * 0.5, arc := 280, start := 300
    DrawArc(cx, cy, ar, start, -arc, 1.6 * s, ARGB(a * (armed || hot ? 1 : 0.75), inkColor))
    end :=(start - arc) * 0.0174533, ex := cx + ar * Cos(end), ey := cy + ar * Sin(end)
    dx := Sin(end), dy := -Cos(end), len := 4.2 * s, points := Buffer(24)   ; (the way the arrow is going: around to the left)
    NumPut("float", ex - len * (dx * 0.77 - dy * 0.64), "float", ey - len * (dy * 0.77 + dx * 0.64), "float", ex, "float", ey,
        "float", ex - len * (dx * 0.77 + dy * 0.64), "float", ey - len * (dy * 0.77 - dx * 0.64), points)
    DrawLines(points, 3, 1.6 * s, ARGB(a * (armed || hot ? 1 : 0.75), inkColor))
    name := armed ? "Sure?" : "Default"
    DrawWord(name, f, cx - TextWidth(name, f) / 2, TextY(f, cy + r + 9 * s), a * (armed || hot ? 0.95 : 0.55), inkColor, 0)
    SetUI.defaultSpot := {x: cx, y: cy + r}
    if on
        AddSpot("colors-default", cx - step / 2, cy - r - 4 * s, step, 2 * r + 24 * s)
}

; Puts your own colors back to how they started.
DefaultColors() {
    Settings.CustomColors := CUSTOM_COLORS
    SaveSettings()
    ApplySettings()
    SettingsKick()
}

; Opens the list of choices for a picker (the n-th setting), under it (or over it, if there's more
; room there), scrolled to the one picked.
OpenPopup(row, n, spot := "", items := "") {
    s := Look.s, u := SetUI, spot := spot || u.choices[n], rowH := Round(30 * s)
    items := items || (row.list = "fonts" ? FontList() : row.list = "voices" ? ReaderVoices()
        : row.list = "showhide" ? (Settings.Tuck ? TUCK_STYLES : APPEAR_STYLES) : row.list)
    if !items.Length
        return
    below := u.H - 12 * s - (spot.y + spot.h + 4 * s), above := spot.y - 16 * s
    down := below >= Min(items.Length, 8) * rowH + 8 * s || below >= above
    rowsShown := Max(1, Min(items.Length, 8, Floor(((down ? below : above) - 8 * s) / rowH)))
    value := n ? RowValue(row) : row.value, at := 1
    for i, item in items
        if (item = value)
            at := i
    h := rowsShown * rowH + 8 * s
    u.popup := {row: row, n: n, items: items, value: value, shown: rowsShown, rowH: rowH, x: spot.x, w: spot.w, h: h,
        y: down ? spot.y + spot.h + 4 * s : spot.y - 4 * s - h, first: Max(1, Min(at - rowsShown // 2, items.Length - rowsShown + 1))}
    u.tip := ""
    SettingsKick()
}

; The list dropped down from a picker: its choices, the one picked in Claude's color, the one you're
; pointing at highlighted, and a thin bar showing where it's scrolled to if there are more than fit
; (the mouse wheel scrolls it).
DrawPopup() {
    s := Look.s, c := Look.colors, u := SetUI, pp := u.popup, f := u.fonts.list
    FillRoundRect(pp.x + 2 * s, pp.y + 5 * s, pp.w, pp.h, 12 * s, ARGB(0.22, 0x000000))   ; a soft shadow
    FillRoundRect(pp.x, pp.y, pp.w, pp.h, 12 * s, ARGB(1, c.light ? Blend(c.bg, 0xFFFFFF, 0.7) : Blend(c.bg, 0xFFFFFF, 0.09)))
    path := RoundedPath(pp.x + 0.5, pp.y + 0.5, pp.w - 1, pp.h - 1, 12 * s)
    Stroke(Canvas.g, path, s, ARGB(0.18, c.text))
    DllCall("gdiplus\GdipDeletePath", "ptr", path)
    AddSpot("popup", pp.x, pp.y, pp.w, pp.h)
    loop pp.shown {
        i := pp.first + A_Index - 1, item := pp.items[i], ry := pp.y + 4 * s + (A_Index - 1) * pp.rowH
        picked := item = pp.value, hot := u.hot = "pop-" i
        if (picked || hot)
            FillRoundRect(pp.x + 4 * s, ry, pp.w - 8 * s, pp.rowH, 8 * s, ARGB(picked ? 0.2 : 0.1, picked ? c.claude : c.text))
        DrawWord(FitWidth(RowShow(pp.row, item), f, pp.w - 30 * s), f, pp.x + 13 * s, TextY(f, ry + pp.rowH / 2), picked ? 1 : 0.88,
            picked ? c.claude : c.text, 0)
        AddSpot("pop-" i, pp.x, ry, pp.w, pp.rowH)
    }
    if (pp.items.Length > pp.shown) {
        room := pp.h - 12 * s, barH := Max(18 * s, room * pp.shown / pp.items.Length)
        where := (pp.first - 1) / (pp.items.Length - pp.shown)
        FillPill(pp.x + pp.w - 7 * s, pp.y + 6 * s + (room - barH) * where, 3 * s, barH, ARGB(0.35, c.text))
    }
}

; What something on the settings window does (a setting's ?, one of your colors, the version), in a
; bubble by it while you point at it, fading in and out.
DrawTip() {
    s := Look.s, c := Look.colors, u := SetUI, f := u.fonts.help
    if !u.tipAt
        return
    at := u.tipAt, pad := 12 * s, lineH := Round(f.px * 1.45), lines := WrapText(u.tipText, f, 280 * s), w := 0
    for line in lines
        w := Max(w, TextWidth(line, f))
    w += 2 * pad, h := lines.Length * lineH + 2 * pad - 6 * s
    x := Max(12 * s, Min(at.x - 22 * s, u.W - w - 12 * s)), y := at.y + 16 * s
    if (y + h > u.H - 8 * s)
        y := at.y - 16 * s - h
    a := u.tipA, fill := c.light ? 0x2B2A28 : Blend(c.bg, 0xFFFFFF, 0.16), inkColor := c.light ? 0xF5F4EE : c.text
    FillRoundRect(x + s, y + 4 * s, w, h, 10 * s, ARGB(a * 0.22, 0x000000))
    FillRoundRect(x, y, w, h, 10 * s, ARGB(a, fill))
    for i, line in lines
        DrawWord(line, f, x + pad, TextY(f, y + pad - 3 * s + (i - 0.5) * lineH), a * 0.95, inkColor, 0)
}

; Text broken into lines no wider than width, at spaces.
WrapText(text, f, width) {
    lines := [], line := ""
    for word in StrSplit(text, " ") {
        longer := line = "" ? word : line " " word
        if (line != "" && TextWidth(longer, f) > width)
            lines.Push(line), line := word
        else
            line := longer
    }
    if (line != "")
        lines.Push(line)
    return lines
}

; What's under the mouse (at mx, my on screen) on the settings window: one of its spots (see
; AddSpot), "window" elsewhere on it, or "" off it.
SettingsHit(mx, my) {
    u := SetUI, x := mx - u.x, y := my - u.y
    if (x < 0 || y < 0 || x >= u.W || y >= u.H)
        return ""
    i := u.spots.Length
    while (i >= 1) {
        spot := u.spots[i--]
        if (x >= spot.x && x < spot.x + spot.w && y >= spot.y && y < spot.y + spot.h)
            return spot.id
    }
    return "window"
}

OverSettings() {
    if (!SettingsGui || SetUI.hidden)
        return false
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    return SettingsHit(mx, my) != ""
}

; Every 60 ms while the settings are open: notices what you're pointing at, on or off the window.
SettingsWatch() {
    if (!SettingsGui || SetUI.drag != "")
        return
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    PointAt(SettingsHit(mx, my))
}

; You're pointing at something else on the settings window (id): it lights up, and a ? shows what
; its setting does.
PointAt(id) {
    u := SetUI
    if (id = u.hot)
        return
    u.hot := id, u.tip := ""
    if u.popup {
    } else if (InStr(id, "help-") = 1 && u.helps.Has(n := Integer(SubStr(id, 6)))) {
        u.tip := id, u.tipText := SettingRows()[n].help, u.tipAt := u.helps[n]
    } else if (InStr(id, "color-") = 1 && u.swatches.Has(i := Integer(StrSplit(id, "-")[3]))) {
        u.tip := id, u.tipText := COLOR_NAMES[i] ": " COLOR_TIPS[i], u.tipAt := u.swatches[i]
    } else if (id = "colors-default" && u.HasOwnProp("defaultSpot")) {
        u.tip := id, u.tipText := "Default: puts your custom colors back to how they started. Click it twice.", u.tipAt := u.defaultSpot
    } else if (id = "version") {
        u.tip := id, u.tipText := "The version running. Click to switch to another one; to come back, turn captions off and on again.",
            u.tipAt := {x: u.versionSpot.x + 20 * Look.s, y: u.versionSpot.y + u.versionSpot.h - 8 * Look.s}
    }
    SettingsKick()
}

; A click on the settings window.
SettingsDown() {
    u := SetUI
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    id := SettingsHit(mx, my)
    NoteEvent(Format("settings clicked: '{}'{}", id, u.popup ? " (a list was open)" : u.drag != "" ? " (while dragging " u.drag ")" : ""))   ; (see BoxMouseDown)
    if u.popup {   ; a list is open: a click picks from it, and anywhere else closes it
        if (InStr(id, "pop-") = 1)
            PickFromPopup(Integer(SubStr(id, 5)))
        else if (id != "popup")
            u.popup := "", SettingsKick()
        return 0
    }
    if (id = "version") {
        OpenPopup({key: "", list: [], value: CAPTIONS_VERSION " (this one)"}, 0, u.versionSpot, Versions())
    } else if (id = "close" || id = "done") {
        CloseSettings()
    } else if (id = "reset") {
        if (u.resetAt && A_TickCount - u.resetAt < 3000)
            u.resetAt := 0, ResetSettings()
        else
            u.resetAt := A_TickCount, SettingsKick()
    } else if (id = "head") {
        u.drag := "window", u.dx := mx - u.x, u.dy := my - u.y
        DllCall("SetCapture", "ptr", SettingsGui.Hwnd)
    } else if (InStr(id, "tab-") = 1) {
        u.tab := Integer(SubStr(id, 5)), u.tip := ""
        SettingsKick()
    } else if (InStr(id, "ctl-") = 1) {
        n := Integer(SubStr(id, 5)), row := SettingRows()[n]
        switch row.kind {
            case "toggle":
                ChangeSetting(row.key, Settings.%row.key% ? 0 : 1)
            case "choice":
                OpenPopup(row, n)
            case "slider":
                u.drag := id
                DllCall("SetCapture", "ptr", SettingsGui.Hwnd)
                SlideTo(n, mx)
        }
    } else if (InStr(id, "step-") = 1) {
        bits := StrSplit(id, "-"), row := SettingRows()[Integer(bits[2])]
        ChangeSetting(row.key, Max(row.low, Min(row.high, Settings.%row.key% + (bits[3] = 1 ? -1 : 1))))
    } else if (id = "colors-default") {
        if (u.colorsResetAt && A_TickCount - u.colorsResetAt < 3000)
            u.colorsResetAt := 0, SetTimer(DefaultColors, -1)
        else
            u.colorsResetAt := A_TickCount, SettingsKick()
    } else if (InStr(id, "color-") = 1) {
        SetTimer(PickColor.Bind(Integer(StrSplit(id, "-")[3])), -1)
    }
    return 0
}

; The mouse moving over the settings window: dragging the window or a slider, or pointing at things.
SettingsMove() {
    u := SetUI
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    if (u.drag = "window") {
        u.x := mx - u.dx, u.y := my - u.dy
        DllCall("SetWindowPos", "ptr", SettingsGui.Hwnd, "ptr", 0, "int", u.x, "int", u.y, "int", 0, "int", 0, "uint", 0x15)   ; SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE
    } else if (InStr(u.drag, "ctl-") = 1) {
        SlideTo(Integer(SubStr(u.drag, 5)), mx)
    } else {
        PointAt(SettingsHit(mx, my))
    }
    return 0
}

; Letting go after dragging the window or a slider.
SettingsUp(msg) {
    u := SetUI
    if (u.drag = "")
        return 0
    wasSlider := InStr(u.drag, "ctl-") = 1, row := wasSlider ? SettingRows()[Integer(SubStr(u.drag, 5))] : ""
    u.drag := ""
    if (msg != 0x215)
        DllCall("ReleaseCapture")
    if wasSlider {
        SaveSettings()
        if (row.key = "Width")
            ApplySettings()   ; (every word, at the width you let go at)
    }
    if (wasSlider && row.key = "ReadSpeed" && Settings.ReadCode)
        SetTimer(SampleReading, -100)
    SettingsKick()
    return 0
}

; A slider (the n-th setting) follows the mouse (at mx on screen), in its steps.
SlideTo(n, mx) {
    row := SettingRows()[n], sliderBar := SetUI.sliders[n]
    k := Max(0, Min(1, (mx - SetUI.x - sliderBar.x) / sliderBar.w)), step := row.HasOwnProp("step") ? row.step : 1
    ChangeSetting(row.key, Round((row.low + k * (row.high - row.low)) / step) * step, false)
}

; The mouse wheel over the settings window scrolls a list that's open, or moves the slider you're
; pointing at.
SettingsWheel(dir) {
    Critical   ; (see BoxMouseDown)
    u := SetUI
    if u.popup {
        pp := u.popup
        pp.first := Max(1, Min(pp.items.Length - pp.shown + 1, pp.first + dir * 3))
        u.hot := ""
        DrawSettings()
        SettingsWatch()
        return
    }
    if (InStr(u.hot, "ctl-") = 1 && (row := SettingRows()[Integer(SubStr(u.hot, 5))]).kind = "slider") {
        step := row.HasOwnProp("step") ? row.step : 1
        ChangeSetting(row.key, Max(row.low, Min(row.high, Settings.%row.key% - dir * step)))
    }
}

PickFromPopup(i) {
    pp := SetUI.popup, SetUI.popup := ""
    if !pp.n   ; (the versions)
        return RunVersion(pp.items[i])
    ChangeSetting(pp.row.key, pp.items[i])
}

; The versions there are to run: this one first, then the earlier ones kept in VERSIONS_DIR (each in
; a folder named for it, with its own copy of what it needs), newest first, and an "experimental"
; one if there is.
Versions() {
    list := [CAPTIONS_VERSION " (this one)"], found := []
    loop files VERSIONS_DIR "\*", "D"
        if FileExist(A_LoopFileFullPath "\claude-captions.ahk")
            found.Push(A_LoopFileName)
    loop found.Length {   ; newest first, by their numbers
        best := 0
        for i, name in found
            if (!best || VerCompare(name, found[best]) > 0)
                best := i
        list.Push(found.RemoveAt(best))
    }
    return list
}

; Switches to another version (name, from Versions): it gets your settings as they are now, and this
; one closes. To come back, turn captions off and on again (as you usually do, with its button).
RunVersion(name) {
    if InStr(name, "(this one)")
        return
    dir := VERSIONS_DIR "\" name
    if !FileExist(dir "\claude-captions.ahk")
        return
    try FileCopy(SETTINGS_FILE, dir "\claude-captions.ini", true)
    Run('"' RegExReplace(A_AhkPath, "i)_UIA(?=\.exe$)") '" "' dir '\claude-captions.ahk"', dir)   ; (as usual, not with UI Access: it wouldn't hear turning it off)
    ExitApp
}

; An earlier version you switched to from the settings (see RunVersion) that's running, or 0. (Seeing
; hidden windows and matching part of a title are both put back as they were after, as OtherCaptions
; does, for the same reason.)
OlderCaptions() {
    wasHidden := A_DetectHiddenWindows, wasMatch := A_TitleMatchMode
    DetectHiddenWindows true
    SetTitleMatchMode 2
    found := 0
    try {
        for hwnd in WinGetList("\captions-versions\ ahk_class AutoHotkey")
            if (hwnd != A_ScriptHwnd && InStr(WinGetTitle(hwnd), "claude-captions.ahk")) {
                found := hwnd
                break
            }
    }
    DetectHiddenWindows wasHidden
    SetTitleMatchMode wasMatch
    return found
}

; Changes a setting from the settings window (save: and saves it). It shows on the box right away,
; and some show off what they do: the voice glow, typing sounds and speed, how the box shows up or
; tucks away, and the reading voice.
ChangeSetting(key, value, save := true) {
    switch key {   ; the settings window's two-in-one settings (see SettingRows), as the two
        case "Motion":
            ChangeSetting("Animate", value != "Off" ? 1 : 0, save)
            return ChangeSetting("HighFps", value = "Extra smooth" ? 1 : 0, save)
        case "ShowHide":   ; (the tucking style with Tuck away on, and how it shows and hides on the spot with it off)
            return ChangeSetting(Settings.Tuck ? "TuckStyle" : "Appear", value, save)
        case "NewAlerts":
            ChangeSetting("TuckCount", InStr(value, "Count") ? 1 : 0, save)
            return ChangeSetting("TuckWiggle", InStr(value, "spin") ? 1 : 0, save)
    }
    if (key = "HideAfter" && !IsNumber(value))
        for i, choice in HIDE_CHOICES
            if (choice = value)
                value := HIDE_SECONDS[i]
    if (Settings.%key% = value && StrLen(Settings.%key%) = StrLen(value))
        return
    Settings.%key% := value
    switch key {
        case "Corner":
            Settings.OffsetX := Settings.OffsetY := 0, Settings.PeekEdge := "", Settings.PeekAt := -1
        case "TypingSound", "TextReveal", "WordSpeed", "SoundVolume", "Appear", "TuckStyle", "FollowVoice":
            if (key != "FollowVoice" || value)   ; a test message, done the new way (see PreviewSetting)
                Preview.key := key, SetTimer(PreviewSetting, -300)   ; (once you stop sliding)
        case "HighFps":
            KeepPace()   ; (and turned off, FrameLoop stops by itself)
        case "ClaudeVoice":
            MuteClaude()
        case "ReadCode", "ReadVoice", "ReadSpeed":
            UseReaderVoice()
            if !Settings.ReadCode
                StopReading()
            else if save   ; (a slider's sample plays once you let go of it; see SettingsUp)
                SetTimer(SampleReading, key = "ReadSpeed" ? -700 : -300)
    }
    if save
        SaveSettings()
    if HasValue(["SoundVolume", "ReadCode", "ReadVoice", "ReadSpeed", "ClaudeVoice", "AutoLinks", "TuckCount", "TuckWiggle", "Tuck",
            "TuckStyle", "HideAfter", "TypingSound", "TextReveal", "GlowDelay", "FollowVoice", "Float", "HighFps", "GameMode"], key)
        Kick(), UpdateVisibility()
    else
        ApplySettings(!save)   ; (while a slider is dragged, quick: all of it once you let go, see SettingsUp)
    SettingsKick()
}

; Picks one of your colors (the i-th: background, words, you, Claude, code) in Windows' color
; picker, and switches the box to your colors.
PickColor(i) {
    swatchHexes := StrSplit(Settings.CustomColors, ",")
    if ((picked := ChooseColor(swatchHexes[i], SettingsGui ? SettingsGui.Hwnd : 0)) = "")
        return
    swatchHexes[i] := picked, joined := ""
    for j, color in swatchHexes
        joined .= (j > 1 ? "," : "") color
    Settings.CustomColors := joined, Settings.Theme := "Custom"
    SaveSettings()
    ApplySettings()
    SettingsKick()
}

; Windows' color picker, starting at a color ("RRGGBB"). Returns the color picked, or "" if you
; cancelled. (Windows keeps colors the other way round: blue, green, red.)
ChooseColor(hex, owner) {
    static custom := Buffer(64, 0)   ; its 16 "custom colors", kept while captions are on
    rgb := Integer("0x" hex), picker := Buffer(72, 0)   ; CHOOSECOLOR
    NumPut("uint", 72, picker, 0), NumPut("ptr", owner, picker, 8)
    NumPut("uint", (rgb & 0xFF) << 16 | rgb & 0xFF00 | rgb >> 16 & 0xFF, picker, 24)
    NumPut("ptr", custom.Ptr, picker, 32), NumPut("uint", 0x3, picker, 40)   ; CC_RGBINIT | CC_FULLOPEN
    if !DllCall("comdlg32\ChooseColorW", "ptr", picker)
        return ""
    bgr := NumGet(picker, 24, "uint")
    return Format("{:06X}", (bgr & 0xFF) << 16 | bgr & 0xFF00 | bgr >> 16 & 0xFF)
}

; Hides the box and brings it back, to show off how it shows up.
ShowAppearing() {
    Anim.tucking := false, Anim.p := 0, Anim.last := MsNow()
    ReplayWords()
    Kick()
}

; Shows the box coming out of its Claude tab, in the tuck animation just picked.
ShowTucking() {
    Anim.tucking := true, Anim.p := 0, Anim.last := MsNow()
    ReplayWords()
    Kick()
}

; Reads a line out loud in the reading voice and speed just picked (once; not while you're still
; sliding the speed).
SampleReading() {
    if (SetUI && InStr(SetUI.drag, "ctl-") = 1)
        return
    StopReading()
    UseReaderVoice()
    try Speaker().Speak("This is how Claude's replies will sound on the Code page.", 1)
    SetTimer(CheckReading, 250)
}

; Puts every setting back to how it started (the box goes back to its corner too).
ResetSettings() {
    for key, value in DefaultSettings().OwnProps()
        Settings.%key% := value
    SaveSettings()
    ApplySettings()
    MuteClaude(), UseReaderVoice(), StopReading()
    SettingsKick()
}

; Closes the settings window: it pops away (see SettingsFrame), and the box goes back from the
; example to the conversation.
CloseSettings(*) {
    if (!SettingsGui || SetUI.closing)
        return
    SetTimer(PreviewSetting, 0), EndPreview()   ; (the conversation, rather than a test message)
    SetUI.closing := true, SetUI.popup := "", SetUI.tip := ""
    SettingsKick()
}

FinishClosingSettings() {
    global SettingsGui, Shown
    SetTimer(SettingsTick, 0), SetTimer(SettingsWatch, 0)
    SetUI.running := false
    SettingsGui.Destroy(), FreeCanvas(SetUI.canvas)
    SettingsGui := ""
    SaveSettings()
    Shown := NothingRead()
    UpdateCaptions()
}

; The fonts Windows has that the box can draw with (TrueType ones), in order.
FontList() {
    static names := ""
    if names
        return names
    found := Map()
    logFont := Buffer(92, 0)
    NumPut("uchar", 1, logFont, 23)   ; DEFAULT_CHARSET: fonts for every language
    callback := CallbackCreate(FontFound, "F", 4)
    hdc := DllCall("GetDC", "ptr", 0, "ptr")
    DllCall("gdi32\EnumFontFamiliesExW", "ptr", hdc, "ptr", logFont, "ptr", callback, "ptr", ObjPtr(found), "uint", 0)
    DllCall("ReleaseDC", "ptr", 0, "ptr", hdc)
    CallbackFree(callback)
    names := []
    for name in found
        names.Push(name)
    return names
}

; Called by Windows once for each font. "@" fonts are sideways copies for vertical writing.
FontFound(logFont, metrics, fontType, list) {
    name := StrGet(logFont + 28, 32, "UTF-16")
    if (fontType & 4 && SubStr(name, 1, 1) != "@")   ; 4: TrueType
        ObjFromPtrAddRef(list)[name] := true
    return 1
}

HideChoice(seconds) {
    for i, value in HIDE_SECONDS
        if (value = seconds)
            return i
    return 3
}

Whole(value, low, high, otherwise) => IsNumber(value) ? Max(low, Min(high, Integer(value))) : otherwise

HasValue(list, value) {
    for item in list
        if (item = value)
            return true
    return false
}

; ---- Tray menu ------------------------------------------------------------------

ToggleHidden(itemName, *) {
    global Hidden, Shown
    Hidden := !Hidden
    A_TrayMenu.ToggleCheck(itemName)
    A_IconTip := "Claude captions " CAPTIONS_VERSION (Hidden ? " (hidden)" : "")
    ToLive()
    if !Hidden
        Shown := NothingRead()   ; show the current exchange again
    ; The list of models closes, and Claude's menu with it (left open, Claude's window was kept
    ; restored unseen for as long as the box was hidden, see HideClaudeAgain).
    if (Hidden && ModelMenu)
        SetTimer(CloseModelMenu, -1)
    UpdateVisibility()
    ; The page open under the box goes out of sight while it's hidden, and comes back after.
    if PageOpen() {
        if Hidden
            DllCall("ShowWindow", "ptr", Browser.hwnd, "int", 0), Browser.min := true   ; SW_HIDE
        else if (!Minimized && !Browser.tucked)
            BringPageBack()
        CatchPage()
    }
}
