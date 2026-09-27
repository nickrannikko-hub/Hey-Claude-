; On-screen captions for Claude, version 1.6.0 (see CAPTIONS_VERSION)
;
; Shows a small box in the top right corner of your main monitor with what you're saying to Claude
; and what Claude is saying back, so you can follow a voice conversation without looking at
; Claude's window. It works alongside claude-hey-claude.ahk and the voice buttons, or on its own:
; it only reads Claude's window, the same way the "Hey Claude" listener watches for a goodbye.
;
; It reads like a little chat: what you said, then Claude's reply under it, laid out the way
; Claude's window shows it, with its paragraphs, bullet points, headings and `code`. While Claude
; is thinking, before the first words come, three dots pulse. While it works on the Code page, a
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
; you stop (the one you're pointing at stays).
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
; Claude's sidebar; click one to go to it. On the Chat and Cowork page, what you say goes on the
; right and Claude's replies on the left, like a chat (put what you say in bubbles in the
; settings, if you like); on the Code page, they go one under the other. Each page, and each
; session or chat, keeps its own conversation in the box: going to another slides it in, and
; coming back brings back what was there. While voice mode is on, a VOICE MODE tag sits by what
; you say, and a pill at the top says LISTENING (blinking), THINKING or SPEAKING, like Claude's
; own voice mode. A soft light rises from the bottom of the box: Claude's orange while it's
; listening to you, breathing and swelling as you talk, and blue while Claude talks, pulsing with
; its voice. In
; voice mode the box stays up while someone is talking, and goes away once things go quiet.
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
; the box, each saying where it goes ("youtube.com"). Click one to open the page in a browser
; window attached to the box (under it, or above or beside it if there isn't room), which moves
; with the box, as the box does with it if you move the page; click the pill again to close it.
; While a page is open, the box stays up. In the settings, the first link in each reply can open
; by itself. (The page opens in Edge as a bare app window; without Edge, it opens in your usual
; browser.)
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
; the box itself, with a tab for each group: LOOK (the colors, with themes like Midnight, Ocean,
; Paper or Rosé or your own, how solid the background is, chat bubbles), TEXT (the font and size,
; how Claude's words appear and how fast, the word glow in voice mode), SOUND (the typing sounds and
; how loud, Claude's voice, and reading Code replies out loud), MOTION (smooth motion, High FPS,
; floating, scrolling, how the box shows up), BOX (its corner and size, how long it stays up, the
; typing box) and TUCK & LINKS. Point at a setting's little ? to see what it does. Changes show
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
CAPTIONS_VERSION := "1.6.3"   ; shown in the tray icon's tooltip and the settings window's title
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
HIGH_FPS       := false         ; draw as often as the screen refreshes (144 times a second on a 144 Hz screen), not 60
GAME_MODE      := true          ; while a game (or anything full screen) is in front, the box keeps still and draws only when
                                ; something changes, at most 60 times a second, and the Claude tab hides (see Gaming)
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
FOCUS_LOG      := A_ScriptDir "\claude-captions-log.txt"     ; when a game (or anything full screen) lost the foreground, and to what (see WatchForeground)
; -----------------------------------------------------------------------------

THEMES := ["Dark", "Light", "Match Windows", "Midnight", "Ocean", "Forest", "Sunset", "Paper", "Rosé", "Mono", "Custom"]
TYPING_SOUNDS := ["Off", "Soft clicks", "Animal Crossing", "Undertale"]
REVEALS := ["Match the sound", "Fade in", "Letter by letter"]
SETTINGS_TABS := ["LOOK", "TEXT", "SOUND", "MOTION", "BOX", "TUCK & LINKS"]
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
Measurer := ""                  ; a tiny canvas for measuring words
Brush := 0, TextFormat := 0, CenterFormat := 0
BoxGui := ""
Page := ""                      ; which of Claude's pages it's on: "chat" (Chat and Cowork) or "code" ("" until known)
PageAt := 0                     ; when that was last checked
VoiceMode := false              ; voice mode is on
VoiceMicLive := false           ; ...with its mic on (not muted)
Sessions := {list: [], current: "", key: ""}   ; the sessions or chats in Claude's sidebar, and the one showing
PanelGui := "", PanelCanvas := ""   ; the list of them beside the box
; Each chat and session keeps its own history (see SwitchConversation): the one showing (ConvKey,
; like "chat|General chat"), and the others put away, each as {current, history}.
ConvKey := "", Conversations := Map()
Minimized := false              ; you tucked the box away (with its –), so it stays in its tab until you click it
PeekGui := "", PeekCanvas := "" ; the tab with Claude's logo the box tucks into
; The page from Claude's reply open under the box, if there is one: its window, address, which side
; of the box it's on (side), where the box last put it (set), the size you gave it (w, h; 0 until
; you do), whether it's down on the taskbar (min), and what notices you moving it (hook).
Browser := {hwnd: 0, url: "", side: "", set: "", w: 0, h: 0, min: false, hook: 0}
Opened := false                 ; you opened the box from its Claude tab, so it shows even with nothing to show
LoadingEarlier := false         ; Claude's window is scrolled up for a moment, to read older messages (see LoadOlder)
Composing := false              ; you're typing to Claude in the box at the bottom (see StartTyping)
EditGui := "", EditBox := ""    ; the real text box laid over it while you type
Typed := "", TypedFrom := 0     ; what you've typed but not sent yet, and the window you were in before
; Reading Claude's replies out loud on the Code page (see ReadAloud): whether it's talking, which
; exchange it's reading, how many of its lines it has read (or passed over), and for each line
; handed to the voice, which of the voice's streams it is (0 for lines that aren't read out, like
; code) and how long it is.
Reader := {speaking: false, ex: "", said: 0, lines: Map()}
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
; much you're pointing at it (peekHover, peekHot), where it is (peekX, peekY, peekW, peekH), how many
; replies came while tucked away on each page (peekCounts), when it last wiggled and spun (wiggleAt,
; spinAt), when the box last
; jiggled landing out of it (jiggleAt), how much the row of links at the
; bottom shows (links) and where each is (linkSpots), voice mode's light's color (tone: 0 Claude's
; orange while it listens to you, 1 blue while it talks; think: toward a soft neutral while it
; thinks), and whether something changed that needs drawing (dirty).
Anim := {running: false, last: 0, lastDraw: 0, p: 0.0, target: 0, hover: 0.0, hoverTarget: 0,
    hot: "", shown: false, x: 0, y: 0, h: 0, bar: "", liveAt: 0, above: 0.0, aboveAt: 0,
    tabLeft: 0.0, tabRight: 0.0, tabSpeedL: 0.0, tabSpeedR: 0.0, panel: 0.0, panelTarget: 0, panelHot: 0,
    panelX: 0, panelY: 0, panelH: 0, listen: 0.0, switchAt: 0, switchDir: 0, sticky: 0.0, times: 0.0, mouseY: "",
    lineGoneAt: 0, leanX: 0.0, leanY: 0.0, leanSX: 0.0, leanSY: 0.0, floatK: 0.0, baseX: 0, baseY: 0, tucking: false, peek: 0.0, peekHover: 0.0,
    peekHot: false, peekX: 0, peekY: 0, peekW: 0, peekH: 0, peekCounts: {code: 0, chat: 0}, wiggleAt: 0, spinAt: 0, tuckedAt: 0, jiggleAt: 0, links: 0.0,
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
Shown := {you: "", claude: "", live: false, streaming: false, thinking: false, work: ""}   ; what was last read from Claude's window
LastChange := 0
Hidden := false                 ; "Hide captions" is ticked
LastHwnd := 0
Listening := false              ; voice mode or dictation is listening, so your words are checked more often
Waiting := false                ; showing "I'm listening…" until you start talking
Reads := 0
Started := A_TickCount          ; when captions started, so the conversation already there isn't "new"
SettledAt := 0                  ; until when what Claude's window shows counts as already there (after going to another conversation)
SettingsGui := "", SetUI := ""   ; the settings window, and how it's doing (see OpenSettings)
Times := Map()                  ; when your messages were sent and replied to, by their words (see GiveTimes)
GameFront := false              ; a game (or anything full screen) is in front (see Gaming)

if (A_LineFile = A_ScriptFullPath)
    CaptionsMain()

CaptionsMain() {
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
    Persistent
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
    ; Windows' timers normally tick every 15.6 ms, which makes animation frames come unevenly.
    ; Asking for 1 ms ticks (for this script only) keeps them evenly spaced, so motion looks smooth.
    DllCall("winmm\timeBeginPeriod", "uint", 1)
    StartDrawing()
    OnMessage(0x201, BoxMouseDown)   ; WM_LBUTTONDOWN
    OnMessage(0x200, BoxMouseMove)   ; WM_MOUSEMOVE
    OnMessage(0x202, BoxMouseUp)     ; WM_LBUTTONUP
    OnMessage(0x215, BoxMouseUp)     ; WM_CAPTURECHANGED: something else took the mouse mid-drag
    OnMessage(0x20, BoxCursor)       ; WM_SETCURSOR
    OnExit(GoAway)
    ; claude-hey-claude.ahk sends this the moment it hears "Hey Claude".
    OnMessage(DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.HeyClaude", "uint"), HeardHeyClaude)
    SetTimer(UpdateCaptions, CHECK_EVERY_MS)
    UpdateCaptions()
    LoadNotedTimes()
    WatchForeground()
    SetTimer(ReadTranscripts, -2000)   ; when older messages were sent, for scrolling back
    ; If there's no conversation to show, a note says captions are on. It waits a moment, since
    ; Claude's window can take a read or two to answer.
    SetTimer(SayCaptionsAreOn, -1000)
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
    MuteClaude(true)
    try StopReading()
    GuardGame(false)
    if (Browser.hwnd && WinExist(Browser.hwnd))
        try WinClose(Browser.hwnd)
    if !Anim.shown
        return
    Anim.target := 0, Anim.last := A_TickCount
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
; MSI Afterburner's or ReShade's), so the box does as little of that as it can.
Gaming() => Settings.GameMode && GameFront

CheckGameFront() {
    global GameFront
    front := false
    try front := CoversScreen(WinExist("A"))   ; (see claude-voice-on-off-send.ahk)
    if (front != GameFront) {
        GameFront := front
        Kick()
        UpdateVisibility()
    }
    GuardGame(Gaming())
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
; never take it (they're made so they can't).
WatchForeground() {
    static callback := CallbackCreate(ForegroundChanged, "F", 7)
    DllCall("SetWinEventHook", "uint", 3, "uint", 3, "ptr", 0, "ptr", callback, "uint", 0, "uint", 0, "uint", 0, "ptr")   ; EVENT_SYSTEM_FOREGROUND
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
}

; The window of another copy of this script that's already running, if there is one.
OtherCaptions() {
    DetectHiddenWindows true
    for hwnd in WinGetList(A_ScriptFullPath " ahk_class AutoHotkey")
        if (hwnd != A_ScriptHwnd)
            return hwnd
    return 0
}

; ---- Keeping up with the conversation ----------------------------------------------

; Every CHECK_EVERY_MS: read Claude's window, and update the box if anything changed.
UpdateCaptions() {
    global Shown, LastChange, LastHwnd, Reads, Listening, Waiting, VoiceModeAt, VoiceMode, VoiceMicLive, PageAt, Sessions
    if (Mod(++Reads, 5) = 0)
        CheckWindowsColors()
    CheckGameFront()
    if (Browser.hwnd && !WinExist(Browser.hwnd))   ; you closed the page under the box
        ClosePage()
    if Hidden
        return UpdateVisibility()
    ; While you scroll or drag the box, reading waits: a read takes long enough to make the motion stutter.
    ; So does it while Claude's window is scrolled up for older messages (it'd read those as the newest).
    if (Drag.mode || A_TickCount - ScrollAt < 700 || LoadingEarlier)
        return
    try {
        hwnd := FindClaudeWindow()
        if (hwnd && hwnd != LastHwnd)
            WakeAccessibility(hwnd)
        LastHwnd := hwnd
        now := hwnd ? ReadConversation(hwnd) : {you: "", claude: "", live: false, streaming: false, thinking: false, work: "", listening: false, voice: false,
            micLive: false, sessions: [], session: "", convo: ""}
    } catch {
        UpdateVisibility()   ; (so the box still goes away on time)
        return   ; the window changed while it was being read; try again next time
    }
    micOn := now.listening
    if now.voice {   ; voice mode: Claude reads its replies out loud, so the words can light up as it does
        VoiceModeAt := A_TickCount
        StartFollowing()   ; which also notices when it's your turn to talk
    }
    if (now.voice != VoiceMode || now.micLive != VoiceMicLive)   ; the VOICE MODE tag and the listening light go with it
        VoiceMode := now.voice, VoiceMicLive := now.micLive, Kick()
    MuteClaude()
    ; Claude's sidebar, for the list beside the box.
    key := now.session "|"
    for row in now.sessions
        key .= row.status " " row.title "|"
    if (key != Sessions.key) {
        ; Another session in Claude's sidebar (not the one showing) finished while the box is
        ; tucked away: the tab counts it too.
        for before in Sessions.list
            if InStr(before.status, "Running")
                for after in now.sessions
                    if (after.title == before.title && !InStr(after.status, "Running") && after.title != now.session)
                        Nudge("done", Page = "chat" ? "chat" : "code", true)
        Sessions := {list: now.sessions, current: now.session, key: key}
        Kick()
    }
    ; Each chat and session keeps its own history: when Claude shows another one (or the other
    ; page), the box puts this one away and brings that one back. The conversation's title bar also
    ; says which page it's on.
    if (now.convo != "") {
        NoticePage(StrSplit(now.convo, "|")[1])
        if (now.convo != ConvKey)
            SwitchConversation(now.convo)
    }
    ; Which page Claude is on, for the tab on top of the box. It's checked now and then: it's slow to find.
    if (hwnd && A_TickCount - PageAt > 1500) {
        PageAt := A_TickCount
        try NoticePage(PageOf(hwnd))
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
        ; The mic just turned on. Unless the box is still showing a reply you might be reading, it
        ; shows that Claude is listening. If the mic turns off before you say anything, it goes back.
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

; Which page Claude is showing: "chat" (Chat and Cowork) or "code", or "" if its page switch isn't there.
PageOf(hwnd) {
    tab := FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork")
    return !tab ? "" : IsSelected(tab.el) ? "chat" : "code"
}

; Claude is showing a page (which): its tab joins the box, gliding over from the other. If the
; page wasn't known yet, the exchange showing is laid out again to suit it.
NoticePage(which) {
    global Page
    if (which = "" || which = Page)
        return
    first := Page = ""
    Page := which
    if first {
        Critical
        Current.chat := Page = "chat"
        LayOutExchange(Current), Place()
        Critical "Off"
    }
    Kick()
}

; Switches Claude to one of its pages ("chat" or "code"), as its switch at the top of Claude's
; window does. The tab on the box glides over right away.
SelectPage(which) {
    global PageAt
    NoticePage(which)
    PageAt := A_TickCount   ; gives Claude a moment before checking again
    try {
        tab := FindByPrefix(FindClaudeWindow(), UIA_RADIO, which = "chat" ? "Chat and Cowork" : "Code")
        if (tab && (pattern := GetPattern(tab.el, 10010, "{a8efa66a-0fda-421a-9194-38021f3578ea}")))
            ComCall(3, pattern)   ; Select
    }
}

; Goes to one of Claude's sessions or chats (by its title), as clicking it in Claude's sidebar does.
OpenSession(title) {
    try {
        for button in GetElements(FindClaudeWindow(), UIA_BUTTON) {
            name := button.name
            if !(name == title || SubStr(name, -StrLen(title) - 1) == " " title) || StartsWith(name, "More options for ")
                continue
            cls := ""
            try cls := ElementClass(button.el)
            if StartsWith(cls, SIDEBAR_ROW) {
                Invoke(button.el)
                return
            }
        }
    }
}

; Claude is showing another conversation: a different chat or session, or the other page. Each
; keeps its own history, so this one's is put away and that one's brought back (or started fresh),
; and the box slides over to it, from the side its tab is on (or from below, for another chat or
; session on the same page), just as it was when you left it.
SwitchConversation(key) {
    global Current, History, ConvKey, Waiting
    if (ConvKey = "") {   ; the first one: it's the one showing already
        ConvKey := key
        SetTimer(LoadEarlier, -1500)
        return
    }
    Critical
    Conversations[ConvKey] := {current: Current.sample ? NewExchange() : Current, history: History}
    was := StrSplit(ConvKey, "|")[1], now := StrSplit(key, "|")[1]
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
    global SettledAt := A_TickCount + 3000
    Critical "Off"
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
    if (at <= 1)
        return
    earlier := []
    loop at - 1
        earlier.Push(LoadedExchange(list[A_Index]))
    AddEarlier(earlier)
}

; Puts what was read from Claude's window (now) in the box, if it's changed. Returns what it went by.
TakeRead(now) {
    global Shown, LastChange, Waiting
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
        Shown := now, LastChange := A_TickCount
        ; While showing "I'm listening…", the exchange from before "Hey Claude" can still change a
        ; little (its reply finishing). That doesn't count as you saying something.
        if !(Waiting && Current.dim && !now.live && History.Length && now.you == History[History.Length].you) {
            Waiting := false
            ShowExchange(now)
        }
        Critical "Off"
        Kick()
    }
    return now
}

; Changes how often Claude's window is read.
ReadEvery(ms) {
    static every := CHECK_EVERY_MS
    if (ms != every)
        SetTimer(UpdateCaptions, every := ms)
}

; An exchange: what you said and Claude's reply, as the box shows them, plus a note while there's
; no conversation. parts holds each one laid out: its label, and its words with where each goes.
; chat notes that it's from the Chat page, where what you said goes on the right, queued what you
; said next while Claude was still busy with this reply (see ShowExchange),
; loaded that it's from a conversation just switched to, so what it shows next was already there,
; and which of its reply's words you've seen (see CheckSeen): seen, since when others have been in
; view, and where the first you haven't seen starts (unseenAt, its paragraph's y in the exchange,
; or ""; lastUnseenAt and newGoneAt for the NEW line fading once you have).
NewExchange() => {note: "", you: "", youStatus: "", dim: false, claude: "", claudeStatus: "", thinking: false, chat: Page = "chat", queued: "", loaded: false,
    work: "", time: FormatTime(, "h:mm tt"), replyTime: "", newAt: 0, newTime: "", words: "", wordsAt: 0, saidAt: 0, sample: false, restores: false,
    parts: [], stops: [], lineStops: [], anyStops: [], spans: [], height: 0, y: 0, fadeUntil: 0,
    since: Map(), unseenAt: "", lastUnseenAt: "", newGoneAt: 0, sounded: 0, links: [], linkOpened: false, revealEnd: 0,
    old: false, doneAt: 0, took: "", saidStamp: A_Now}

HasConversation() => Current.you != "" || Current.claude != "" || Current.thinking

; Puts what was read from Claude's window in the box. When you've said something new since Claude's
; last reply (or the chat is now empty), the exchange showing moves up into the history.
ShowExchange(now, spreadMs := CHECK_EVERY_MS) {
    global Current
    isSample := now = SAMPLE
    empty := now.you = "" && now.claude = "" && !now.thinking
    fresh := Current.loaded || A_TickCount < SettledAt, Current.loaded := false
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
    if RegExMatch(now.work, "^(.*\S)\s*·\s*[^·]*$", &took)   ; how long it's taken, and how many tokens (for "Finished")
        Current.took := took[1]
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
    ; new (and counts as seen: you'd have read it in Claude's window).
    already := fresh || A_TickCount - Started < 3000
    if ((now.claude != "" || now.thinking) && Current.replyTime = "") {   ; a new reply: note when, for its label (and for later)
        Current.replyTime := FormatTime(, "h:mm tt")
        if (!isSample && !already && Current.you != "" && !Current.dim && !now.live && Current.HasOwnProp("saidStamp"))
            NoteTime(Current.you, Current.saidStamp, A_Now)
    }
    ; A new message gets the "new message" badge: Claude's first words, or new words after it's
    ; been quiet (or busy taking steps) for a while.
    words := ReplyWords(now.claude)
    if (words != Current.words) {
        if (words != "" && (Current.words = "" || A_TickCount - Current.wordsAt > NEW_AFTER_MS) && !isSample && !already)
            Current.newAt := A_TickCount, Current.newTime := FormatTime(, "h:mm tt"), Nudge("new")
        Current.words := words, Current.wordsAt := A_TickCount
    }
    LayOutExchange(Current, spreadMs, !already && !isSample)
    if already {   ; (it was already there: it just shows, as it was, and counts as seen)
        for part in Current.parts
            for t in part.tokens
                t.born := 0, t.per := 0
        MarkAllSeen(Current)
    }
    Place()
    ReadAloud(Current, already)
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
                if !(SameLine(a, b) || i + A_Index = have.Length && StartsWith(SameLine(b), SameLine(a)))
                    ok := false
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
ReplyWords(markup) {
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
    return Trim(RegExReplace(text, " ([,.;:!?…)])", "$1"))
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
    ToLive()
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

; claude-hey-claude.ahk heard "Hey Claude". This shows before the mic has even turned on.
HeardHeyClaude(*) {
    StartWaiting()
    ReadEvery(CHECK_EVERY_MS)   ; to catch your words soon
    SetTimer(GiveUpWaiting, -6000)   ; in case the mic never turns on
}

GiveUpWaiting() {
    if !Listening
        StopWaiting()
}

; While voice mode or dictation is listening: reads just the message box, several times as often as
; the whole window, so your words show up almost as soon as Claude writes them down.
WatchYourWords() {
    if (Hidden || !LastHwnd)
        return
    try said := PromptText(LastHwnd)
    catch
        return
    if (said != "" && !(Shown.live && said == Shown.you))
        ShowYourWords(said)
}

ShowYourWords(said) {
    global Shown, LastChange, Waiting
    ToLive()   ; you're talking, so back to what's happening now
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
    groups := GetElements(hwnd, UIA_GROUP)
    chat := ""
    for g in groups
        if (g.name == "Chat messages")
            chat := g.el
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
    buttons := GetElements(hwnd, UIA_BUTTON)
    for button in buttons {
        micOn := micOn || IsDictationStop(button.name) || IsVoiceModeControl(button.name)
        voiceOn := voiceOn || IsVoiceModeControl(button.name)
        micLive := micLive || button.name == "Turn off microphone"
        working := working || IsStopReplyButton(button.name)
    }
    side := SidebarRows(buttons)
    if (micOn && (said := PromptText(hwnd)) != "")
        return {you: said, claude: "", live: true, streaming: false, thinking: false, work: "", listening: true, voice: voiceOn,
            micLive: micLive, sessions: side.rows, session: side.current, convo: side.convo, prevYou: "", prevClaude: "", away: false}
    replyText := PartsToMarkup(parts)
    links := [], seen := Map()   ; the web pages the reply links to, up to three
    for part in parts
        if (part.type = "link" && !seen.Has(part.url) && links.Length < 3)
            links.Push({text: part.text, url: part.url}), seen[part.url] := true
    ; Thinking: working on your newest message, with no words of the reply yet.
    thinking := found.you != "" && replyText = "" && (working || found.streaming)
    ; Reading got to the top of what Claude's window has loaded without finding your message: in a
    ; long reply, Claude's window only keeps the part of it near the bottom (see UpdateCaptions).
    partial := found.newest = "" && replyText != ""
    return {you: found.you, claude: replyText, live: false, streaming: found.streaming, thinking: thinking,
        work: working ? found.work : "", listening: micOn, voice: voiceOn, micLive: micLive, sessions: side.rows, session: side.current,
        convo: side.convo, prevYou: found.prevYou, prevClaude: prevClaude, links: links, partial: partial, away: away}
}

; The exchanges Claude's window has loaded, oldest first, as {you, claude, no} (no: the number of
; your message in the conversation): up to the newest most of them. Claude's window only keeps the
; part of a long conversation near where it's scrolled to (see LoadOlder for the rest).
ReadWholeChat(hwnd, most := 40) => (chat := ChatList(hwnd)) ? ReadChat(chat, most) : []

; Claude's list of messages (it scrolls), or "".
ChatList(hwnd) {
    for g in GetElements(hwnd, UIA_GROUP)
        if (g.name == "Chat messages")
            return g.el
    return ""
}

ReadChat(chat, most := 40) {
    found := {you: "", parts: [], newest: "", prevYou: "", streaming: false, done: false, work: "", all: [], most: most}
    ReadBack(chat, found)
    out := [], i := found.all.Length
    while (i >= 1) {
        e := found.all[i--]
        out.Push({you: e.you, claude: PartsToMarkup(OldestFirst(e.parts)), no: e.no})
    }
    return out
}

; Keeps one of Claude's messages (msg, with its kids and first line, label) in byNo under its number
; in the conversation: yours as {you}, and Claude's as {parts}, in order. (A reply still being
; written has no number, and isn't kept.)
KeepMessage(msg, kids, label, byNo) {
    if !RegExMatch(msg.name, "^Message (\d+)", &m)
        return
    if StartsWith(label, "You said: ") {
        text := ""
        loop kids.Length - 1 {
            kid := kids.Get(A_Index + 1), name := Trim(kid.name)
            if (kid.type = UIA_TEXT && name != "" && !IsWhenLabel(name))
                text .= (text = "" ? "" : " ") name
        }
        byNo[Integer(m[1])] := {you: text != "" ? text : SubStr(label, 11)}
        return
    }
    piece := []
    loop kids.Length {
        kid := kids.Get(A_Index)
        if !(A_Index = 1 && StartsWith(Trim(kid.name), "Claude responded: "))
            CollectParts(kid, piece)
    }
    byNo[Integer(m[1])] := {parts: piece}
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
            out.InsertAt(1, {you: m.you, claude: PartsToMarkup(parts), no: k + 1})
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
; time and never skipping any. Reading Claude's window waits meanwhile.
LoadOlder() {
    global LoadingEarlier
    static reached := Map()
    key := ConvKey, first := History.Length ? History[1] : Current
    if (LoadingEarlier || key = "" || !first.HasOwnProp("no") || first.no <= 1 || !LastHwnd)
        return
    if !((chat := ChatList(LastHwnd)) && (scroller := GetPattern(chat, 10004, "{88f4d42a-e881-459d-a77c-73bbbb7e02dc}")))   ; ScrollPattern
        return
    LoadingEarlier := true, byNo := Map(), older := [], was := 100.0
    try {
        ComCall(6, scroller, "double*", &was)    ; CurrentVerticalScrollPercent
        ComCall(8, scroller, "double*", &view := 0.0)   ; CurrentVerticalViewSize (how much shows, in percent)
        at := Min(was, reached.Has(key) ? reached[key] : was), step := Max(0.3, view * 0.9)   ; (every message shows at some step: they're gathered by number)
        loop 25 {
            if (A_Index > 1 || at != was) {   ; (first, what's loaded where it is)
                at := A_Index > 1 ? Max(0, at - step) : at
                ComCall(4, scroller, "double", -1, "double", at)   ; SetScrollPercent (UIA_ScrollPatternNoScroll sideways)
                Sleep 80
            }
            ReadBack(chat, {you: "", parts: [], newest: "", prevYou: "", streaming: false, done: false, work: "", byNo: byNo})
            older := ExchangesBefore(byNo, first.no, 8)
            if (older.Length >= 8 || at <= 0)
                break
        }
        reached[key] := at
    }
    ; Back where it was. It loads messages as it goes, so it can take a few tries to get there.
    target := Max(0, Min(100, was))
    loop 12 {
        try {
            ComCall(4, scroller, "double", -1, "double", target)
            Sleep 90
            ComCall(6, scroller, "double*", &now := 0.0)
            if (target >= 99 ? now >= 99.5 : Abs(now - target) < 0.5)
                break
        }
    }
    LoadingEarlier := false
    if (!older.Length || key != ConvKey)
        return
    earlier := []
    for e in older
        earlier.Push(LoadedExchange(e))
    AddEarlier(earlier)
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
; "chat|General chat"), or "" if there's no title to go by.
SidebarRows(buttons) {
    titles := [], current := "", convo := ""
    for button in buttons {
        if StartsWith(button.name, "More options for ")
            titles.Push(SubStr(button.name, 18))
        else if RegExMatch(button.name, "^(.+), rename (\w+)$", &m)
            current := m[1], convo := (m[2] = "session" ? "code" : "chat") "|" m[1]
    }
    rows := [], seen := Map()
    for button in buttons {
        name := button.name, best := ""
        for title in titles   ; the longest title the name ends with
            if (StrLen(title) > StrLen(best) && (name == title || SubStr(name, -StrLen(title) - 1) == " " title))
                best := title
        if (best = "" || seen.Has(best) || StartsWith(name, "More options for "))
            continue
        cls := ""
        try cls := ElementClass(button.el)
        if !StartsWith(cls, SIDEBAR_ROW)
            continue
        seen[best] := true
        rows.Push({title: best, status: Trim(SubStr(name, 1, StrLen(name) - StrLen(best)))})
    }
    return {rows: rows, current: current, convo: convo}
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
        text := ""
        loop kids.Length - 1 {   ; the message itself, leaving out its buttons and when it was sent
            kid := kids.Get(A_Index + 1), name := Trim(kid.name)
            if (kid.type = UIA_TEXT && name != "" && !IsWhenLabel(name))
                text .= (text = "" ? "" : " ") name
        }
        said := text != "" ? text : SubStr(label, 11)
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
    piece := []
    loop kids.Length {
        kid := kids.Get(A_Index)
        if !(A_Index = 1 && StartsWith(Trim(kid.name), "Claude responded: "))
            CollectParts(kid, piece)
    }
    AddNewestFirst(found.parts, piece)
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
        return {el: el, type: ctype, name: RegExReplace(CachedText(el, 55), "\s+", " "), kind: CachedText(el, 54),
            cls: CachedText(el, 62), top: NumGet(rect, 4, "int"), bottom: NumGet(rect, 12, "int")}
    }
}

; One of an element's properties that's text, as read along with it (see UIChildren): method 54
; for its kind, 55 for its name, 62 for its class.
CachedText(el, method) {
    ComCall(method, el, "ptr*", &bstr := 0)
    text := bstr ? StrGet(bstr, "UTF-16") : ""
    DllCall("OleAut32\SysFreeString", "ptr", bstr)
    return text
}

; The newest message shows when it was sent ("just now", "5 seconds ago"). That isn't part of what
; was said, so it's left out.
IsWhenLabel(text) => Trim(text) = ""
    || text ~= "i)^\s*(just now|now|yesterday|a moment ago|an? (second|minute|hour|day|week|month|year) ago|\d+ (seconds?|minutes?|hours?|days?|weeks?|months?|years?) ago|\d{1,2}:\d{2}\s*([ap]m)?)\s*$"

; ---- Laying out the words ----------------------------------------------------------

; Lays out an exchange: a label and words for each part there is (a note, what you said, Claude's
; reply, or its thinking dots), with room between them. On the Chat page, what you said goes on
; the right (see LayOutRight). Words that were already there keep fading in from when they first
; came; new ones take turns, spread over spreadMs.
LayOutExchange(ex, spreadMs := 0, paced := false) {
    before := Map()
    for part in ex.parts
        before[part.key] := part.tokens
    parts := [], y := 0
    for spec in [["note", "CAPTIONS", "claude", ex.note, false], ["you", "YOU", "you", ex.you, false],
            ["claude", "CLAUDE", "claude", ex.claude, true]] {
        ; Claude thinking, before its first words: just its name, with the line at the end saying so.
        dots := false
        if (spec[4] = "" && !(spec[1] = "claude" && (ex.thinking || ex.work != "")))
            continue
        if parts.Length
            y += Look.gap
        tokens := dots ? [] : Tokenize(spec[4], spec[5])
        right := ex.chat && spec[1] = "you"
        laid := dots ? {h: Look.lineH, bubble: ""} : right ? LayOutRight(tokens) : {h: LayOutTokens(tokens), bubble: ""}
        KeepFading(before.Has(spec[1]) ? before[spec[1]] : [], tokens, spreadMs, ex, paced && spec[1] = "claude")
        parts.Push({key: spec[1], label: spec[2], color: spec[3], y: y, textY: y + Look.labelH + Look.labelGap,
            tokens: tokens, dots: dots, align: right ? "right" : "", bubble: laid.bubble})
        y += Look.labelH + Look.labelGap + laid.h
    }
    ; At the end of Claude's newest reply, one line with Claude's spark and what Claude is doing, or
    ; that it's finished (see DrawWork).
    if (!ex.old && (ex.claude != "" || ex.thinking || ex.work != "")) {
        y += Look.labelGap * 2
        parts.Push({key: "work", y: y, textY: y, tokens: [], dots: false, line: FitWidth(ex.work, Look.smallFont, Look.inner - Look.workIndent)})
        y += Look.smallH
    }
    ; What you said while Claude was still busy, waiting its turn at the bottom (see ShowExchange).
    if (ex.queued != "") {
        y += Look.gap
        tokens := Tokenize(ex.queued, false)
        laid := ex.chat ? LayOutRight(tokens) : {h: LayOutTokens(tokens), bubble: ""}
        KeepFading(before.Has("queued") ? before["queued"] : [], tokens, spreadMs, ex)
        parts.Push({key: "queued", label: "YOU", color: "you", y: y, textY: y + Look.labelH + Look.labelGap,
            tokens: tokens, dots: false, align: ex.chat ? "right" : "", bubble: laid.bubble})
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
        if part.dots
            spans.Push({top: part.textY, bottom: part.textY + Look.lineH})
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
    if (at = "" && ex.unseenAt != "")   ; all seen now: the NEW line fades away
        ex.lastUnseenAt := ex.unseenAt, ex.newGoneAt := Anim.lineGoneAt := A_TickCount
    ex.unseenAt := at
}

; Counts all of an exchange's reply as seen (it was already there when it showed up).
MarkAllSeen(ex) {
    if !(part := ReplyPart(ex))
        return
    for t in part.tokens
        t.seen := true
    ex.unseenAt := "", ex.lastUnseenAt := "", ex.sounded := part.tokens.Length   ; (and makes no typing sounds)
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
        for t in showing {
            if !ex.since.Has(t)
                ex.since[t] := now
            else if (now - ex.since[t] >= SEEN_MS)
                t.seen := true, changed := true
        }
        gone := []
        for t in ex.since
            if (!showing.Has(t) || t.seen)
                gone.Push(t)
        for t in gone
            ex.since.Delete(t)
        if changed
            UpdateUnseen(ex), any := true
    }
    if any
        Kick()
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
; how long each character takes (ms, from the Text speed setting), and how far behind they can fall
; before they speed up (most), and how long a short pause is (rest; see Rest). "Match the sound" types out letters with the Animal Crossing and
; Undertale sounds, and fades words in otherwise. In voice mode, words fade in, for the glow.
RevealPace() {
    mode := Settings.TextReveal, sound := Settings.TypingSound
    if (mode = "Match the sound")
        mode := sound = "Animal Crossing" || sound = "Undertale" ? "Letter by letter" : "Fade in"
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
        j := i, w := TokenWidth(t)
        while (j < n && !tokens[j + 1].space && tokens[j + 1].block = block)
            j++, w += TokenWidth(tokens[j])
        gapW := (x > indent && t.space) ? Look.space : 0
        if (x > indent && x + gapW + w > width)
            y += lineH, x := indent, gapW := 0
        x += gapW
        loop j - i + 1 {
            tk := tokens[i + A_Index - 1]
            tk.x := x, tk.y := y, tk.w := TokenWidth(tk)
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

TokenWidth(t) => TextWidth(t.text, FontOf(t.style)) + (t.style = "code" ? 2 * Look.codePad : 0)
FontOf(style) => (style = "code" || style = "pre") ? Look.codeFont : style = "bold" ? Look.boldFont
    : style = "step" ? Look.smallFont : Look.font

; Works out where each exchange sits, top to bottom, and where every line in the conversation is
; (View.spans). Scrolled back, the box keeps its place by line (View.topLine), so what you're
; looking at stays put as things change below it.
Place() {
    y := 0, spans := []
    loop History.Length + 1 {
        ex := A_Index <= History.Length ? History[A_Index] : Current
        ex.y := y
        for s in ex.spans
            spans.Push({top: y + s.top, bottom: y + s.bottom})
        if (A_Index <= History.Length)
            y += ex.height + Look.exGap
    }
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
; there's a note; but not while you've tucked it away (the settings go too). Voice mode listening
; for you only keeps it up while things are recent, so the box goes
; away once a voice chat goes quiet.
UpdateVisibility() {
    global Opened
    recent := !Settings.HideAfter || A_TickCount - LastChange < Settings.HideAfter * 1000
    state := VoiceState()
    busy := Shown.live || Shown.streaming || Shown.thinking || Shown.work != "" || Listening && !VoiceMode
        || state = "speaking" || state = "thinking" || Reader.speaking
    show := !Hidden && !Minimized && (SettingsGui || Current.note != "" || Waiting || View.scrolled || Anim.panelTarget || Composing
        || Browser.hwnd || Anim.hoverTarget || (HasConversation() || Opened) && (recent || busy)) ? 1 : 0
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

; As the box shows up, the words showing in it flow in again one after another, top to bottom,
; all within about the time the box takes to show up.
ReplayWords() {
    t := ViewTarget(), viewTop := t.bottom - t.h, showing := []
    for part in Current.parts
        for tk in part.tokens
            if (Current.y + part.textY + tk.y >= viewTop - 1)
                showing.Push(tk)
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
WatchMouse() {
    global LastChange
    if Drag.mode
        return   ; mid-drag, the box has the mouse to itself
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    part := Anim.shown ? HitTest(mx - Anim.x, my - Anim.y) : ""
    mouseY := part != "" ? my - Anim.y - Look.tabH : ""   ; from the top of the box
    if (mouseY != Anim.mouseY && (mouseY = "" || Anim.mouseY = "" || Abs(mouseY - Anim.mouseY) > 2))
        Anim.mouseY := mouseY, Kick()
    row := PanelRowAt(mx, my)   ; the list beside the box counts as part of it
    over := part != "" || OverPanel(mx, my) ? 1 : 0, hot := part = "box" ? "" : part
    if (row != Anim.panelHot)
        Anim.panelHot := row, Kick()
    if (hot != Anim.hot) {
        Anim.hot := hot
        ClickThrough(hot = "")
        Kick()
    }
    if (over != Anim.hoverTarget) {
        Anim.hoverTarget := over
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

ClickThrough(on) {
    style := DllCall("GetWindowLongPtr", "ptr", BoxGui.Hwnd, "int", -20, "ptr")   ; GWL_EXSTYLE
    DllCall("SetWindowLongPtr", "ptr", BoxGui.Hwnd, "int", -20, "ptr", on ? style | 0x20 : style & ~0x20)
}

; A click on one of the box's handles: the cog opens the settings; the grip, a corner or the
; scroll bar starts dragging it.
BoxMouseDown(wParam, lParam, msg, hwnd) {
    global Drag
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
        else
            SetTimer(SelectPage.Bind(which), -1)
        return 0
    }
    if (hot = "" || hot = "box")
        return 0
    Anim.hot := hot
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
        bar := Anim.bar, pointY := my - Anim.y - Look.tabH   ; from the top of the box
        Drag.grab := bar && pointY >= bar.y && pointY < bar.y + bar.h ? pointY - bar.y : Drag.barH / 2
        ScrollToBar(pointY)
    }
    DllCall("SetCapture", "ptr", BoxGui.Hwnd)
    return 0
}

BoxMouseMove(wParam, lParam, msg, hwnd) {
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
    if SettingsGui
        SettingsKick()   ; the settings window shows the new size too
    if wasResizing
        Kick()   ; back to sizing itself to what it's showing
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
    ApplySettings()
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
        "resize-tr", 32643, "resize-bl", 32643, "tab-menu", 32649, "tab-chat", 32649, "tab-code", 32649, "mini", 32649,
        "input", 32513, "send", 32649)
    if (PanelGui && wParam = PanelGui.Hwnd && Anim.panelHot || PeekGui && wParam = PeekGui.Hwnd || BoxGui && wParam = BoxGui.Hwnd && InStr(Anim.hot, "link-") = 1) {   ; a hand over the list's rows, the Claude tab and links
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

; How often the box is drawn while it moves (ms): as often as its monitor refreshes with High FPS on
; (checked now and then), and 60 times a second otherwise.
FramePeriod() {
    static hz := 60, checkedAt := -60000
    if (!Settings.HighFps || Gaming())
        return 16
    if (A_TickCount - checkedAt > 10000) {
        checkedAt := A_TickCount, mode := Buffer(220, 0)   ; DEVMODEW
        NumPut("ushort", 220, mode, 68)
        if DllCall("EnumDisplaySettingsW", "str", MonitorGetName(BoxMonitor()), "int", -1, "ptr", mode)   ; ENUM_CURRENT_SETTINGS
            hz := Max(30, NumGet(mode, 184, "uint"))   ; dmDisplayFrequency
    }
    return Max(4, Floor(1000 / hz))
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

; The mouse wheel scrolls the box only while the pointer is over it; anywhere else it works as
; usual. Wheel down only belongs to the box while it's scrolled back.
#HotIf OverBox() && HasEarlier()
WheelUp::Scroll(1)
#HotIf OverBox() && View.scrolled
WheelDown::Scroll(-1)
#HotIf

OverBox() {
    if !Anim.shown
        return false
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    return HitTest(mx - Anim.x, my - Anim.y) != ""
}

; Something to scroll back to: an earlier exchange, or more of the one showing than fits.
HasEarlier() => History.Length || Current.height > Settings.Lines * Look.lineH

; Up scrolls back through earlier words and exchanges, two whole lines for each notch of the
; wheel (a wheel spinning fast counts as a few notches at once, up to three), so it always stops
; with whole lines showing. Down comes forward again, and one more notch down once you're at the
; newest goes back to the live captions. That last notch has to come after the wheel has stopped,
; so a spin down doesn't carry you past.
Scroll(dir) {
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
    notches := A_EventInfo ? Min(A_EventInfo, 3) : 0.5   ; 0: a touchpad's less-than-a-notch
    View.topLine := Max(1, Min(newest, View.topLine - dir * Max(1, Round(2 * notches))))
    View.scrolled := true
    if (dir > 0 && View.topLine <= 3)   ; at the oldest thing the box has: more from Claude's window
        SetTimer(LoadOlder, -60)
    Kick()
    UpdateVisibility()
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
; go, so they're looked up again every 2 seconds.
ClaudeLoudness() {
    static meters := [], found := 0
    if (A_TickCount - found > 2000) {
        try meters := ClaudeSoundMeters()
        found := A_TickCount
    }
    loudest := 0.0
    for meter in meters {
        try {
            ComCall(3, meter, "float*", &peak := 0)   ; GetPeakValue
            loudest := Max(loudest, peak)
        }
    }
    return loudest
}

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
; you tucked it away yourself, or when Tuck is on, so you can always bring it back.
PeekWanted() => !Hidden && (Minimized || Settings.Tuck && !Gaming())

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
; (down to the taskbar) too, and the typing sounds stop. It all comes back where it was.
Minimize() {
    global Minimized
    if Composing
        StopTyping(false)
    Minimized := true, Anim.peekCounts := {code: 0, chat: 0}, Anim.tuckedAt := A_TickCount
    Anim.panelTarget := 0, Anim.hoverTarget := 0
    DllCall("winmm\PlaySoundW", "ptr", 0, "ptr", 0, "uint", 0)   ; (stops a sound playing)
    if (SettingsGui && !SetUI.closing)
        DllCall("ShowWindow", "ptr", SettingsGui.Hwnd, "int", 0), SetUI.hidden := true
    ToLive()
    UpdateVisibility()
    if (Browser.hwnd && WinExist(Browser.hwnd))
        try WinMinimize(Browser.hwnd), Browser.min := true
}

; Brings the box back out of its tab (it grows out of it), and clears the count; and the page that
; was open under it, if there was one. With nothing to show yet, it says how to start.
OpenFromPeek(*) {
    global Minimized, LastChange, Opened
    Minimized := false, Opened := true, Anim.peekCounts := {code: 0, chat: 0}, Anim.peekHot := false
    if (SettingsGui && SetUI.HasOwnProp("hidden") && SetUI.hidden)   ; the settings, back where they were
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
    if (Browser.hwnd && WinExist(Browser.hwnd) && WinGetMinMax(Browser.hwnd) = -1)
        try WinRestore(Browser.hwnd), Browser.min := false, Browser.set := ""
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
    onPage := onPage != "" ? onPage : Page = "chat" ? "chat" : "code"
    if (what = "new" || count)
        Anim.peekCounts.%onPage% += 1
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
    s := Look.s, size := Look.peekSize, where := PeekSpot(), edge := where.edge, now := A_TickCount
    ; How it moves: a full spin that pops it up a little when Claude finishes, rocking back and forth
    ; while Claude works, or a quick wiggle when there's something new.
    turn := 0, pop := 1, spun := now - Anim.spinAt
    if (Anim.spinAt && spun < 800) {
        k := spun / 800, turn := 360 * (k < 0.5 ? 4 * k ** 3 : 1 - (2 - 2 * k) ** 3 / 2), pop := 1 + 0.28 * Sin(3.1416 * k)
    } else if ClaudeBusy() {
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
            if !(count := Anim.peekCounts.%which%)
                continue
            bx := cx + toward[1] * (logoW * 0.5 - n * 2.3 * r), by := cy + toward[2] * logoW * 0.5, n++
            FillCircle(bx, by, r + 1.5 * s, ARGB(0.6, 0x000000))
            FillCircle(bx, by, r, ARGB(1, color))
            NumPut("float", bx - r, "float", by - r, "float", 2 * r, "float", 2 * r, spot)
            DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", 0xFFFFFFFF)
            DllCall("gdiplus\GdipDrawString", "ptr", g, "wstr", count > 9 ? "9+" : count "", "int", -1, "ptr", Look.labelFont.font,
                "ptr", spot, "ptr", CenterFormat, "ptr", Brush)
        }
    }
    Canvas := saved
    pt := Buffer(8), box := Buffer(8), origin := Buffer(8, 0)
    NumPut("int", x, "int", y, pt), NumPut("int", w, "int", h, box)
    DllCall("UpdateLayeredWindow", "ptr", PeekGui.Hwnd, "ptr", 0, "ptr", pt, "ptr", box, "ptr", PeekCanvas.hdc,
        "ptr", origin, "uint", 0, "uint*", Round(255 * Min(1, Anim.peek * 1.5)) << 16 | 1 << 24, "uint", 2)
    if !showing
        DllCall("ShowWindow", "ptr", PeekGui.Hwnd, "int", 8), showing := true, SetTimer(WatchPeek, 50)
}

; While the Claude tab shows: notices when you point at it.
WatchPeek() {
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    over := Drag.mode = "peek" || mx >= Anim.peekX && mx < Anim.peekX + Anim.peekW && my >= Anim.peekY && my < Anim.peekY + Anim.peekH
    if (over != Anim.peekHot)
        Anim.peekHot := over, Kick()
}

; Claude's own app icon, read from Claude's app (while it's running) as a picture with its
; see-through corners kept, or "" if it can't be read. Tried again now and then until it can.
ClaudeLogo() {
    static logo := "", triedAt := -60000, bits := ""
    if (logo || A_TickCount - triedAt < 30000)
        return logo
    triedAt := A_TickCount
    try {
        if !DllCall("PrivateExtractIconsW", "str", ProcessGetPath("claude.exe"), "int", 0, "int", 128, "int", 128, "ptr*", &icon := 0, "ptr", 0, "uint", 1, "uint", 0) || !icon
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

; The links in Claude's newest reply, as pills along the bottom of the box, each saying where it
; goes ("youtube.com"). Click one to open the page in a browser window attached under the box;
; while it's open, its pill turns blue with a ✕, and clicking it again closes the page.
DrawLinks(top, rowH) {
    Anim.linkSpots := []
    if (rowH < 2 || !Current.links.Length)
        return
    s := Look.s, c := Look.colors, h := Look.labelH + 2 * s, x := Look.pad, y := top + (rowH - h) / 2 - 2 * s
    a := Anim.links, iconW := Look.icons.Has("link") ? Look.icons["link"].w + 5 * s : 0
    sites := Map()
    for link in Current.links
        site := LinkSite(link.url), sites[site] := sites.Has(site) ? sites[site] + 1 : 1
    for i, link in Current.links {
        open := Browser.url = link.url, color := open ? c.you : c.claude, site := LinkSite(link.url)
        if (sites[site] > 1 && RegExMatch(link.url, "i)^https?://[^/]+/([^/?#]+)", &m))
            site .= "/" (StrLen(m[1]) > 16 ? SubStr(m[1], 1, 15) "…" : m[1])
        text := (open ? "✕  " : "") site
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

; Where a link goes, as "youtube.com".
LinkSite(url) => RegExReplace(url, "i)^https?://(www\.)?([^/:?#]+).*$", "$2")

; Opens a web page from Claude's reply in a bare browser window (Edge as an app: no tabs or address
; bar) attached to the box (see BrowserSpot). While it's open, the box stays up. Opening the page
; that's open again closes it. Without Edge, the page opens in your usual browser instead. Only web
; pages (http and https) open.
OpenPage(url) {
    global Browser
    if !(url ~= "i)^https?://[^\s`"<>]+$")
        return
    if Browser.hwnd {
        same := Browser.url = url
        ClosePage()
        if same
            return
    }
    edge := A_ProgramFiles " (x86)\Microsoft\Edge\Application\msedge.exe"
    if !FileExist(edge)
        edge := A_ProgramFiles "\Microsoft\Edge\Application\msedge.exe"
    if !FileExist(edge) {
        Run(url)
        return
    }
    Browser := {hwnd: 0, url: url, side: "", set: "", w: 0, h: 0, min: false, hook: 0}
    spot := BrowserSpot(), before := Map()
    for hwnd in WinGetList("ahk_exe msedge.exe")
        before[hwnd] := true
    Run('"' edge '" --app="' url '" --new-window --window-size=' spot.w ',' spot.h ' --window-position=' spot.x ',' spot.y)
    Kick()
    deadline := A_TickCount + 8000
    while (A_TickCount < deadline && Browser.url = url) {   ; its window: the new one Edge opens
        Sleep 150
        for hwnd in WinGetList("ahk_exe msedge.exe ahk_class Chrome_WidgetWin_1")
            if (!before.Has(hwnd) && DllCall("IsWindowVisible", "ptr", hwnd) && WinGetTitle(hwnd) != "") {
                Browser.hwnd := hwnd
                WatchPage()
                MoveBrowser()
                UpdateVisibility()
                return
            }
    }
}

; Closes the page under the box (if it's still open), and lets go of it. Only the page goes: the box
; stays up a while as usual (it counts as something happening), rather than going away with it.
ClosePage() {
    global Browser, LastChange, Opened
    if (Browser.hwnd && WinExist(Browser.hwnd))
        try WinClose(Browser.hwnd)
    if Browser.hook
        DllCall("UnhookWinEvent", "ptr", Browser.hook)
    Browser := {hwnd: 0, url: "", side: "", set: "", w: 0, h: 0, min: false, hook: 0}
    LastChange := A_TickCount, Opened := true
    Kick()
    UpdateVisibility()
}

; Where the page goes: right under the box, or above it if there isn't room under it, or beside it if
; there's room for neither, so it's never behind the box. It's as wide as the box and half the
; screen tall, unless you've resized it. It keeps to the side it opened on while the box grows and
; shrinks, as long as there's room there.
BrowserSpot() {
    MonitorGetWorkArea(BoxMonitor(), &left, &top, &right, &bottom)
    s := Look.s, gap := Round(8 * s), least := Round(220 * s)
    w := Browser.w || Max(Look.W, Round(420 * s)), want := Browser.h || Round((bottom - top) * 0.5)
    onLeft := InStr(Settings.Corner, "left")
    below := bottom - (Anim.baseY + Anim.h + gap), above := Anim.baseY - gap - top
    side := Browser.side
    if (side = "" || side = "below" && below < least || side = "above" && above < least || side = "beside" && Max(below, above) >= want) {
        side := below >= Min(want, 2 * least) || below >= above ? "below" : "above"
        if (Max(below, above) < least)
            side := "beside"
        Browser.side := side
    }
    x := onLeft ? Anim.baseX : Anim.baseX + Look.W - w
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
        if !WinExist(Browser.hwnd)
            return ClosePage()
        Browser.min := WinGetMinMax(Browser.hwnd) != 0   ; down on the taskbar, or made full screen
    }
    if Browser.min
        return
    spot := BrowserSpot(), set := Browser.set
    if (set && spot.x = set.x && spot.y = set.y && spot.w = set.w && spot.h = set.h)
        return
    sized := set && spot.w = set.w && spot.h = set.h
    Browser.set := spot
    ; SWP_NOZORDER | SWP_NOACTIVATE | SWP_ASYNCWINDOWPOS, and SWP_NOSIZE if it's only moving
    DllCall("SetWindowPos", "ptr", Browser.hwnd, "ptr", 0, "int", spot.x, "int", spot.y, "int", spot.w, "int", spot.h, "uint", 0x4014 | (sized ? 1 : 0))
}

; Notices you moving or resizing the page yourself, by its title bar or its edges (see PageMoved).
WatchPage() {
    static callback := CallbackCreate(PageMoved, "F", 7)
    Browser.hook := DllCall("SetWinEventHook", "uint", 0x800B, "uint", 0x800B, "ptr", 0, "ptr", callback,
        "uint", WinGetPID(Browser.hwnd), "uint", 0, "uint", 0, "ptr")   ; EVENT_OBJECT_LOCATIONCHANGE, from Edge
}

; You moved the page (or resized it): the box follows it, so they stay together, and the page keeps
; the size you gave it.
PageMoved(hook, event, hwnd, idObject, idChild, thread, time) {
    if (hwnd != Browser.hwnd || idObject != 0 || !Browser.set || Drag.mode || Browser.min)
        return
    try {
        WinGetPos(&x, &y, &w, &h, hwnd)
        if (WinGetMinMax(hwnd) != 0)
            return
    } catch {
        return
    }
    set := Browser.set
    if (Abs(x - set.x) <= 2 && Abs(y - set.y) <= 2 && Abs(w - set.w) <= 2 && Abs(h - set.h) <= 2)
        return   ; where the box put it
    if (Abs(w - set.w) > 2 || Abs(h - set.h) > 2)
        Browser.w := w, Browser.h := h
    Browser.set := {x: x, y: y, w: w, h: h}
    gap := Round(8 * Look.s), onLeft := InStr(Settings.Corner, "left")
    switch Browser.side {
        case "below": bx := onLeft ? x : x + w - Look.W, by := y - gap - Anim.h
        case "above": bx := onLeft ? x : x + w - Look.W, by := y + h + gap
        default: bx := onLeft ? x - gap - Look.W : x + w + gap, by := y
    }
    PlaceBoxAt(bx, by)
    SetTimer(SaveSettings, -1000)
}

; Moves the box so its window's top left is at x, y (as how far that is from its place in its corner).
PlaceBoxAt(x, y) {
    MonitorGetWorkArea(BoxMonitor(), &left, &top, &right, &bottom)
    m := Round(MARGIN * Look.s)
    Settings.OffsetX := Round(x - (InStr(Settings.Corner, "left") ? left + m : right - Look.W - m))
    Settings.OffsetY := Round(y - (InStr(Settings.Corner, "bottom") ? bottom - Anim.h - m : top + m))
    Kick()
}

; ---- When older messages were sent ------------------------------------------------

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
    try FileAppend(key "`t" said "`t" replied "`n", TIMES_FILE, "UTF-8")
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

; Reads the transcripts from the last 30 days, newest first, about 20 ms at a time so the box stays
; smooth, going on from where it got to in each (they grow as a session goes on). Once it has read
; them all, the older messages in the box get their times (see FillTimes), and it checks again for
; new ones a minute later.
ReadTranscripts() {
    static files := [], at := Map(), next := 1, open := "", pending := ""
    if (next = 1 && !open && !files.Length) {
        loop files EnvGet("USERPROFILE") "\.claude\projects\*.jsonl", "R"
            if (DateDiff(A_Now, A_LoopFileTimeModified, "Days") <= 30)
                files.Push({path: A_LoopFileFullPath, time: A_LoopFileTimeModified})
        loop files.Length - 1 {   ; newest first
            i := A_Index
            loop files.Length - i
                if (files[A_Index].time < files[A_Index + 1].time)
                    t := files[A_Index], files[A_Index] := files[A_Index + 1], files[A_Index + 1] := t
        }
    }
    started := A_TickCount
    while (A_TickCount - started < 20) {
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
            pending := ""
        }
        if open.AtEOF {
            at[files[next].path] := open.Pos, open.Close(), open := "", next++
            continue
        }
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

; A transcript's time (its year, month, day, hour, minute and second, in UTC) as a time here.
LocalTime(m) {
    static offset := Round(DateDiff(A_Now, A_NowUTC, "Seconds") / 900) * 15
    return DateAdd(m[1] m[2] m[3] m[4] m[5] m[6], offset, "Minutes")
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
    DllCall("gdiplus\GdipCreatePen1", "uint", ARGB(Composing ? 0.45 : Faint(hot ? 0.24 : 0.13), Composing ? PageColor() : c.text), "float", s, "int", 2, "ptr*", &pen := 0)
    DllCall("gdiplus\GdipDrawPath", "ptr", Canvas.g, "ptr", pen, "ptr", path)
    DllCall("gdiplus\GdipDeletePen", "ptr", pen), DllCall("gdiplus\GdipDeletePath", "ptr", path)
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
    c := Look.colors, fill := Format("{:06X}", InputFill()), ink := Format("{:06X}", c.text)
    if !EditGui {
        EditGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +Owner" BoxGui.Hwnd)
        EditGui.MarginX := EditGui.MarginY := 0
        EditBox := EditGui.Add("Edit", "x0 y0 w100 h20 -E0x200 -VScroll +Multi +Wrap")
        EditBox.OnEvent("Change", TypingChanged)
        EditGui.OnEvent("Escape", StopTyping)
    }
    EditGui.BackColor := fill
    EditBox.SetFont("s" Settings.FontSize " c" ink, Settings.Font)
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
SendToClaude(text, backTo) {
    if !(hwnd := FindClaudeWindow())
        return ShowNote("Claude isn't open, so that wasn't sent.")
    saved := ClipboardAll()
    try {
        PressInMessageBox(hwnd, "^{End}")
        before := PromptText(hwnd)
        A_Clipboard := (before != "" ? " " : "") text
        if !ClipWait(1)
            throw Error("What you typed couldn't be put on the clipboard, so it wasn't sent.")
        Send "^v"
        want := RegExReplace(Trim(text), "\s+", " "), deadline := A_TickCount + 2500
        while (!InStr(PromptText(hwnd), want) && A_TickCount < deadline)
            Sleep 60
        if !InStr(PromptText(hwnd), want)
            throw Error("What you typed didn't show up in Claude's message box, so it wasn't sent.")
        Send "{Enter}"
        Sleep 200
    } catch as e {
        ShowNote(e.Message)
    }
    A_Clipboard := saved
    if (backTo && backTo != hwnd && WinExist(backTo))
        try WinActivate(backTo)
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
    waiting := 0, came := false, block := 0, spot := 0
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
            waiting++
    }
    if came
        ex.fadeUntil := Max(ex.fadeUntil, now + Look.motion.fade), Kick()
    if !waiting {
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
    static voice := ""
    if !voice {
        voice := ComObject("SAPI.SpVoice")
        UseReaderVoice(voice)
    }
    return voice
}

UseReaderVoice(voice := Speaker()) {
    try {
        voices := voice.GetVoices()
        loop voices.Count
            if (voices.Item(A_Index - 1).GetDescription() = Settings.ReadVoice)
                voice.Voice := voices.Item(A_Index - 1)
        voice.Rate := Round((Settings.ReadSpeed - 5) * 1.6)
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

; Something about each sound Claude's app has open (the interface iid of its audio session).
ClaudeAudio(iid) {
    out := []
    try {
        devices := ComObject("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")   ; MMDeviceEnumerator
        ComCall(3, devices, "int", 0, "uint", 1, "ptr*", &p := 0)   ; EnumAudioEndpoints(speakers, active)
        speakers := ComPtr(p)
        ComCall(3, speakers, "uint*", &count := 0)
        loop count {
            try {
                ComCall(4, speakers, "uint", A_Index - 1, "ptr*", &p := 0)
                device := ComPtr(p)
                ComCall(3, device, "ptr", Guid("{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}"), "uint", 23, "ptr", 0, "ptr*", &p := 0)   ; IAudioSessionManager2
                manager := ComPtr(p)
                ComCall(5, manager, "ptr*", &p := 0)   ; GetSessionEnumerator
                sessions := ComPtr(p)
                ComCall(3, sessions, "int*", &n := 0)
                loop n {
                    try {
                        ComCall(4, sessions, "int", A_Index - 1, "ptr*", &p := 0)
                        session := ComPtr(p)
                        ComCall(14, ComObjQuery(session, "{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}"), "uint*", &pid := 0)   ; GetProcessId
                        if (ProcessGetName(pid) = "claude.exe")
                            out.Push(ComObjQuery(session, iid))
                    }
                }
            }
        }
    }
    return out
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
; in memory.
Blips(kind, volume := 100) {
    static made := Map()
    key := kind "|" volume
    if made.Has(key)
        return made[key]
    if (made.Count > 8)
        made.Clear()
    rate := 22050, list := [], gain := (volume / 100) ** 1.6   ; (loudness goes by the square, roughly)
    switch kind {
        case "Soft clicks":   ; a tiny tick of noise, dying away fast
            loop 5 {
                wave := [], last := 0.0, n := Round(rate * 0.012)
                loop n {
                    last := last * 0.55 + (Random() * 2 - 1) * 0.45   ; noise, softened
                    wave.Push(last * Exp(-(A_Index / rate) / 0.0022) * 0.5)
                }
                list.Push(Recording(wave, rate, gain))
            }
        case "Undertale":   ; a short square-wave beep, like its text boxes
            for pitch in [520, 490, 550] {
                wave := [], n := Round(rate * 0.034)
                loop n {
                    t := A_Index / rate
                    wave.Push((Mod(t * pitch, 1) < 0.5 ? 0.22 : -0.22) * Min(1, (n - A_Index) / (rate * 0.006)))
                }
                list.Push(Recording(wave, rate, gain))
            }
        default:   ; Animal Crossing: a quick sung syllable on a vowel, each at its own pitch, sliding down
            vowels := [[730, 1090], [530, 1840], [300, 2250], [570, 840], [440, 1020]]   ; a, e, i, o, u
            for pitch in [240, 280, 320, 360, 300, 420, 260, 380] {
                vowel := vowels[Mod(A_Index, vowels.Length) + 1], wave := [], n := Round(rate * 0.06), peak := 0.001
                loop n {
                    t := A_Index / rate, f0 := pitch * (1.18 - 0.18 * A_Index / n), v := 0.0
                    loop 7 {   ; the voice's harmonics, loudest near the vowel's two formants
                        f := f0 * A_Index
                        v += Sin(6.2832 * f * t) * (Exp(-((f - vowel[1]) / 260) ** 2) + 0.6 * Exp(-((f - vowel[2]) / 380) ** 2) + 0.12) / A_Index ** 0.5
                    }
                    v *= Min(1, t / 0.006) * Exp(-t / 0.035)
                    wave.Push(v), peak := Max(peak, Abs(v))
                }
                loop n
                    wave[A_Index] *= 0.35 / peak
                list.Push(Recording(wave, rate, gain))
            }
    }
    return made[key] := list
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

; Shows and plays how Claude's words appear, with the sounds and speed you just picked: the words
; of Claude's reply showing come in again.
PreviewTyping() {
    if !(part := ClaudePart())
        return
    t := ViewTarget(), viewTop := t.bottom - t.h, list := [], first := 0
    for i, tk in part.tokens
        if (Current.y + part.textY + tk.y >= viewTop - 1 && tk.born < HELD)
            list.Push(tk), first := first || i
    if !list.Length
        return
    Current.revealEnd := 0
    PaceWords(list, Current)
    Current.sounded := first - 1
    Kick()
}

; ---- Animation ------------------------------------------------------------------

; Starts the animation if it isn't running, and has the box drawn again (something changed). The
; animation stops by itself once everything has settled.
Kick() {
    Anim.dirty := true
    if Anim.running
        return
    Anim.running := true, Anim.last := A_TickCount
    SetTimer(Frame, FramePeriod())
}

; One step of the animation: moves everything a little closer to where it's headed, and draws the box.
Frame() {
    Critical   ; so a new read of Claude's window waits until this frame is drawn
    now := A_TickCount, dt := Min(100, now - Anim.last), Anim.last := now
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
    state := VoiceState(), listening := state != "" ? 1 : 0, toneTo := state = "speaking" ? 1 : 0, thinkTo := state = "thinking" ? 1 : 0
    Anim.listen := Approach(Anim.listen, listening, smooth ? dt / 400 : 1)
    Anim.tone := Approach(Anim.tone, toneTo, smooth ? dt / 350 : 1)
    Anim.think := Approach(Anim.think, thinkTo, smooth ? dt / 350 : 1)
    ; While you scroll back, a strip at the top holds the name of whose words you're reading (see
    ; DrawStickyLabel), and the messages' times show until TIMES_MS after you stop.
    stickyTo := View.scrolled ? 1 : 0, timesTo := View.scrolled && (now - ScrollAt < TIMES_MS || Drag.mode = "scroll") ? 1 : 0
    Anim.sticky := Approach(Anim.sticky, stickyTo, smooth ? dt / 200 : 1)
    Anim.times := Approach(Anim.times, timesTo, smooth ? dt / (timesTo ? 200 : 600) : 1)
    ; Tucked away, the Claude tab slides out from the side of the screen once the box has shrunk
    ; into it, and back in as the box comes out; pointing at it slides it out a little more. The row
    ; of links at the bottom of the box opens when the reply has links.
    peekTo := Anim.target = 0 && Anim.p < 0.35 && PeekWanted() ? 1 : 0, hoverTo := Anim.peekHot ? 1 : 0
    Anim.peek := Approach(Anim.peek, peekTo, smooth ? dt / 260 : 1)
    Anim.peekHover := Approach(Anim.peekHover, hoverTo, smooth ? dt / 150 : 1)
    linksTo := Current.links.Length && !Current.sample ? 1 : 0
    Anim.links := Approach(Anim.links, linksTo, smooth ? dt / 200 : 1)
    moving := Anim.p != Anim.target || Anim.hover != Anim.hoverTarget || View.h != t.h || View.bottom != t.bottom
        || (smooth && now < Current.fadeUntil) || (Current.newAt && now - Current.newAt < NEW_BADGE_MS)
        || (Anim.liveAt && now - Anim.liveAt < LIVE_BADGE_MS)
        || Anim.above != above || (Anim.above && now - Anim.aboveAt < 3300) || slot && (Anim.tabLeft != slot.left || Anim.tabRight != slot.right)
        || Anim.panel != Anim.panelTarget || Anim.listen != listening || Anim.tone != toneTo || Anim.think != thinkTo || smooth && now - Anim.switchAt < 360
        || Anim.sticky != stickyTo || Anim.times != timesTo || now - Anim.lineGoneAt < 900
        || Anim.peek != peekTo || Anim.peekHover != hoverTo || now - Anim.wiggleAt < 900 || Anim.links != linksTo
        || now - Anim.jiggleAt < 700 || now - Current.doneAt < 600 || now - Anim.spinAt < 900 || Anim.peek > 0 && ClaudeBusy()
    ; With Float on, the box drifts gently (see Draw), leaning a little toward the mouse when it's
    ; near, but not while you're pointing at it or dragging it.
    floating := Settings.Float && smooth && Anim.target && !Drag.mode && !Gaming()
    if floating {
        CoordMode("Mouse", "Screen")
        MouseGetPos(&mx, &my)
        dx := mx - (Anim.x + Look.W / 2), dy := my - (Anim.y + Anim.h / 2), dist := Sqrt(dx * dx + dy * dy)
        near := Anim.hoverTarget || !dist ? 0 : Max(0, 1 - dist / 700) * 6 * Look.s / dist
        speed := Anim.leanSX, Anim.leanX := Spring(Anim.leanX, dx * near, &speed, dt, 500), Anim.leanSX := speed
        speed := Anim.leanSY, Anim.leanY := Spring(Anim.leanY, dy * near, &speed, dt, 500), Anim.leanSY := speed
    }
    ; The drift eases away while you type in the box, so the text box laid over it (a window of its
    ; own, which can only move by whole pixels) sits still with it; and back once you're done.
    floatTo := floating && !Composing ? 1 : 0
    if (Anim.floatK != floatTo)
        Anim.floatK := Approach(Anim.floatK, floatTo, dt / 350), moving := true
    TypingSounds(now)
    ; The glow following Claude's voice, which is drawn up to 60 times a second while it moves.
    following := FollowFrame(now, dt, smooth)
    ; "Listening", "Thinking" and "Responding" pulse gently, which only needs drawing now and then
    ; (a little more often for the thinking dots).
    pulsing := Anim.target && (Current.note != "" || Current.youStatus != "" || Current.claudeStatus != "" || Current.work != "" || Current.queued != ""
        || Anim.listen > 0 || Anim.panel > 0)
    ; With nothing left to do, the last frame is drawn and the animation stops, unless Claude is
    ; talking, when the glow can move on at any moment, or the times are waiting to fade.
    idle := !(moving || following || pulsing || floating || Voice.on || View.scrolled && Anim.times > 0)
    period := FramePeriod(), quick := Current.thinking || Current.work != "" || Current.claudeStatus != "" || Anim.listen > 0
    if (moving || idle || Anim.dirty || (following || floating) && now - Anim.lastDraw >= period - 1
        || pulsing && now - Anim.lastDraw >= (quick ? (Settings.HighFps ? period - 1 : 33) : 100)) {
        Anim.dirty := false
        try Draw()
    }
    if idle {
        SetTimer(Frame, 0)
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

; Works out sizes, fonts and colors from Settings, and lays the words out again to match.
ApplySettings() {
    global Look, Canvas, PanelCanvas, PeekCanvas
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
        ; bubble for Chat and Cowork and brackets for Code, and the VOICE MODE tag's microphone.
        Look.icons := Map()
        if Look.iconFont {
            icon := Ink(Look.iconFont, Look.messageGlyph)
            Look.iconDy := (Look.labelH - icon.h) / 2 - icon.top
            for name, glyph in Map("chat", Chr(0xE8BD), "code", Chr(0xE943), "mic", Chr(0xE720), "menu", Chr(0xE700), "link", Chr(0xE71B),
                    "speaker", Chr(0xE767)) {
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
    Look.mirror := InStr(Settings.Corner, "left") > 0
    Look.slots := Map(), x := Look.radius + 8 * s
    for which in ["menu", "chat", "code"] {
        w := TabWidth(which)
        Look.slots[which] := Look.mirror ? {left: Look.W - x - w, right: Look.W - x} : {left: x, right: x + w}
        x += w + 4 * s
    }
    ; The cog and the – that tucks the box away: level with the tabs, at the other end from them.
    Look.cogR := 11 * s, Look.cogY := -Look.tabH / 2 + s
    Look.cogX := Look.mirror ? Look.pad + Look.cogR : Look.W - Look.pad - Look.cogR
    Look.miniX := Look.mirror ? Look.cogX + 2 * Look.cogR + 6 * s : Look.cogX - 2 * Look.cogR - 6 * s
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
    if (!PanelCanvas || PanelCanvas.w != Look.panelW || PanelCanvas.h != panelTallest) {
        if PanelCanvas
            FreeCanvas(PanelCanvas)
        PanelCanvas := MakeCanvas(Look.panelW, panelTallest)
    }
    for ex in History
        LayOutExchange(ex)
    LayOutExchange(Current)
    for key, saved in Conversations {   ; (the others too, for when you go back to them)
        for ex in saved.history
            LayOutExchange(ex)
        LayOutExchange(saved.current)
    }
    Place()
    SnapView()
    Critical "Off"
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

; Draws the box on Canvas and puts it on screen.
Draw() {
    if (!Anim.shown && !Anim.target && Anim.p <= 0) {   ; the box is away: just its tab (and the page under it)
        DrawPeek()
        if Browser.hwnd
            MoveBrowser()
        return
    }
    g := Canvas.g, c := Look.colors
    ; The box, sized to what it shows (and, while you scroll back, the strip at its top that holds a
    ; name), and its window, which has room on top for the tab.
    stripH := Round(Anim.sticky * Look.labelH), linksH := Round(Anim.links * Look.linkRowH), inputH := TypingBoxH()
    hb := Min(Canvas.h - Look.tabH, Round(2 * Look.pad + View.h + stripH + linksH + inputH)), h := hb + Look.tabH
    viewH := hb - 2 * Look.pad - stripH - linksH - inputH
    enter := Entrance()
    pos := BoxPosition(h)
    pos.x += Round(InStr(Settings.Corner, "left") ? -enter.shift : enter.shift)
    ; With Float on, it drifts gently, and leans toward the mouse: the window moves by whole pixels,
    ; and what's in it by the rest, so the drift is smooth. Only the box drifts: what's attached to it
    ; (the page under it, the list beside it) goes by where it'd be without it (baseX, baseY), and
    ; stays still, since windows like those can only move by whole pixels.
    Anim.baseX := pos.x, Anim.baseY := pos.y
    fx := fy := 0
    if (Anim.floatK > 0 && Settings.Animate && !Drag.mode) {
        t := A_TickCount / 1000, k := Anim.floatK
        fx := (Sin(t * 0.8) * 2.5 * Look.s + Anim.leanX) * k, fy := (Sin(t * 1.1 + 1) * 2 * Look.s + Anim.leanY) * k
        pos.x += Floor(fx), pos.y += Floor(fy), fx -= Floor(fx), fy -= Floor(fy)
    }
    Anim.x := pos.x, Anim.y := pos.y, Anim.h := h, Anim.lastDraw := A_TickCount
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
    age := A_TickCount - Anim.jiggleAt
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
    age := A_TickCount - Anim.switchAt, dx := dy := 0
    if (Settings.Animate && age < 360) {
        off := (1 - (1 - age / 360) ** 3) * 24 * Look.s - 24 * Look.s
        dx := Anim.switchDir * -off, dy := Anim.switchDir ? 0 : -off
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", dx, "float", dy, "int", 0)
    }
    DrawConversation(Look.pad + stripH, viewH, shadow)
    if (dx || dy)
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", -dx, "float", -dy, "int", 0)
    DrawStickyLabel(Look.pad, stripH, View.bottom - viewH, shadow)
    DrawLinks(hb - Look.pad - linksH - inputH + Round(4 * Look.s), linksH)
    if inputH
        DrawInput(hb - Look.pad - inputH + Look.gap, inputH - Look.gap)
    if (Anim.above > 0.01)
        DrawMoreAbove(shadow)
    if (Current.newAt && A_TickCount - Current.newAt < NEW_BADGE_MS)
        DrawNewBadge(Current)
    else if (Anim.listen > 0.01)
        DrawVoicePill()
    if (Anim.liveAt && A_TickCount - Anim.liveAt < LIVE_BADGE_MS)
        DrawLiveBadge(hb)
    DrawHandles(hb)
    alpha := Round(255 * enter.alpha)
    pt := Buffer(8), size := Buffer(8), origin := Buffer(8, 0)
    NumPut("int", pos.x, "int", pos.y, pt), NumPut("int", Look.W, "int", h, size)
    ; Puts the picture on screen, each pixel as see-through as it was drawn, all of it times alpha.
    DllCall("UpdateLayeredWindow", "ptr", BoxGui.Hwnd, "ptr", 0, "ptr", pt, "ptr", size, "ptr", Canvas.hdc,
        "ptr", origin, "uint", 0, "uint*", alpha << 16 | 1 << 24, "uint", 2)
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
        SetTimer(TrimMemory, -5000)
        global Opened := false
        if (Anim.hot != "")
            Anim.hot := "", ClickThrough(true)
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

; Draws the part of the conversation the box is showing, viewH tall from top: the exchange
; happening now and, above it, the earlier ones. The box settles on whole lines, so only a line
; sliding in or out past an edge fades, and a thin bar shows where you are when there's more than
; fits. While Claude reads its reply out loud, the letters it's saying glow.
DrawConversation(top, viewH, shadow) {
    lineH := Look.lineH, now := A_TickCount
    viewTop := View.bottom - viewH
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
            if part.dots {
                DrawThinking(textTop, EdgeFade(edges, textTop, lineH))
                continue
            }
            dim := !live ? 1 : part.key = "queued" ? 0.7 : part.key = "you" && ex.dim ? 0.55 : 1
            if part.bubble   ; what you said, in a bubble (on the Chat page, with Bubbles on)
                FillRoundRect(Look.pad + part.bubble.x, textTop, part.bubble.w, part.bubble.h, Min(part.bubble.h / 2, 16 * Look.s),
                    ARGB(dim * (Look.colors.light ? 0.13 : 0.2), Look.colors.you))
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
                if (t.style = "pre" && t.y != preLine) {   ; a code block's lines sit on a soft band
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
        ; Scrolled back, where the words you haven't seen yet start is marked by a thin line with
        ; NEW on it, which fades away once you've seen them.
        at := ex.unseenAt != "" ? ex.unseenAt : ex.lastUnseenAt, fade := ex.unseenAt != "" ? 1 : 1 - (now - ex.newGoneAt) / 900
        if (at != "" && fade > 0 && View.scrolled) {
            ly := top + ex.y + at - viewTop
            if (ly > top - lineH && ly < top + viewH)
                DrawNewLine(ly, fade * EdgeFade(edges, ly - Look.labelH / 2, Look.labelH))
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
; few seconds after), or on the message you're pointing at (focus). While voice mode is on, what
; you're saying gets a VOICE MODE tag, and while Claude reads its reply out loud, its label says
; SPEAKING. Claude's newest reply has Claude's spark before its name, like in Claude's own window:
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
    tag := live && part.key = "you" && VoiceMode ? "VOICE MODE" : ""
    s := Look.s, labelW := TextWidth(part.label, Look.labelFont)
    statusW := status != "" ? (Look.labelSpace + TextWidth("·  " status, Look.labelFont)) * shows : 0
    tagW := tag != "" ? 8 * s + TagWidth(tag) : 0
    statusA := a * shows * (pulse ? 0.7 + 0.3 * Cos(A_TickCount / 1800 * 6.2832) : 0.6)
    if (part.align = "right") {
        x := Look.pad + Look.inner - labelW
        DrawWord(part.label, Look.labelFont, x, y + Look.labelDy, a, color, shadow)
        if (status != "" && shows > 0.01) {
            text := status "  ·"
            DrawWord(text, Look.labelFont, x - Look.labelSpace - TextWidth(text, Look.labelFont), y + Look.labelDy, statusA, color, shadow)
        }
        if (tag != "")
            DrawTag(tag, x - statusW - tagW, y, a, color)
    } else {
        x := Look.pad
        if (live && part.key = "claude") {   ; Claude's spark, by its name (and at the end of the reply, see DrawWork)
            r := Look.labelH * 0.36, moving := ex.thinking || ex.claudeStatus != "" || ex.work != "" || Voice.on && Voice.ex = ex
            age := A_TickCount - ex.doneAt, grow := !moving && ex.doneAt && age < 500 ? 1 - (1 - age / 500) ** 3 : 1
            ClaudeSpark(x + r, y + Look.labelH / 2, r * (0.55 + 0.45 * grow), a * (0.4 + 0.6 * grow), moving, (1 - grow) * 1.5)
            x += 2 * r + 6 * s
        }
        DrawWord(part.label, Look.labelFont, x, y + Look.labelDy, a, color, shadow)
        if (status != "" && shows > 0.01)
            DrawWord("·  " status, Look.labelFont, x + labelW + Look.labelSpace, y + Look.labelDy, statusA, color, shadow)
        if (tag != "")
            DrawTag(tag, x + labelW + statusW + 8 * s, y, a, color)
    }
}

; A little tag in a label's row, like VOICE MODE by what you said while voice mode is on: a
; microphone and the words, on a soft pill of the label's color.
DrawTag(text, x, y, a, color) {
    s := Look.s, h := Look.labelH - 2 * s
    FillRoundRect(x, y + s, TagWidth(text), h, h / 2, ARGB(a * 0.16, color))
    x += 7 * s
    if Look.icons.Has("mic") {
        mic := Look.icons["mic"]
        DrawWord(mic.glyph, Look.iconFont, x, y + mic.dy, a * 0.9, color, 0)
        x += mic.w + 4 * s
    }
    DrawWord(text, Look.labelFont, x, y + Look.labelDy, a * 0.9, color, 0)
}

TagWidth(text) => 14 * Look.s + (Look.icons.Has("mic") ? Look.icons["mic"].w + 4 * Look.s : 0) + TextWidth(text, Look.labelFont)

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
            return DrawPill(x, 2 * s - Look.tabH, w, A_TickCount - ex.newAt, NEW_BADGE_MS, 1100, iconW, text, true, h)
    }
}

; Where something w wide goes level with the tabs, beside them (on the right, or on the left while
; the tabs are the other way round), or "" if it doesn't fit.
TabRoom(w) {
    gap := 8 * Look.s, controls := 4 * Look.cogR + 14 * Look.s   ; (the cog and – are at the end)
    if Look.mirror
        return Look.slots["code"].left - gap - Look.pad - controls >= w ? Look.pad + controls : ""
    return Look.W - Look.pad - controls - Look.slots["code"].right - gap >= w ? Look.W - Look.pad - controls - w : ""
}

; While voice mode is on, what it's doing, in a pill level with the tabs on the right, in voice
; mode's color (see VoiceColor): a microphone and LISTENING (blinking, so you know it's your turn
; to talk), a speaker and SPEAKING, or a dot and THINKING. The icon (or dot) swells with the voice.
DrawVoicePill() {
    state := VoiceState()
    if (state = "")
        return
    s := Look.s, h := Look.tabH - 4 * s, c := Look.colors, text := StrUpper(state), t := A_TickCount / 1000
    icon := state = "listening" ? "mic" : state = "speaking" ? "speaker" : ""
    icon := Look.icons.Has(icon) ? Look.icons[icon] : ""
    lead := icon ? icon.w : 2 * Look.dotR
    w := 16 * s + lead + 7 * s + TextWidth(text, Look.labelFont)
    if ((x := TabRoom(w)) = "")
        return
    y := 2 * s - Look.tabH, a := Anim.listen
    blink := state = "listening" ? 0.45 + 0.55 * (Cos(t * 6.2832 / 1.3) + 1) / 2 : 1
    level := state = "speaking" ? Min(1, Voice.claudeLevel * 2.2) : state = "listening" ? Min(1, Voice.mic * 3) : (Sin(t * 6.2832 / 0.9) + 1) / 4
    FillRoundRect(x, y, w, h, h / 2, ARGB(a * Max(0.85, Settings.Background / 100), c.bg))
    color := VoiceColor()
    FillRoundRect(x, y, w, h, h / 2, ARGB(a * 0.2, color))
    if icon {   ; with a soft halo that swells with the voice
        FillCircle(x + 8 * s + lead / 2, y + h / 2, lead * (0.35 + 0.35 * level), ARGB(a * 0.25 * level, color))
        DrawWord(icon.glyph, Look.iconFont, x + 8 * s, y + (h - Look.labelH) / 2 + icon.dy, a * (0.6 + 0.4 * blink), color, 0)
    } else {
        FillCircle(x + 8 * s + Look.dotR, y + h / 2, Look.dotR * (0.9 + 0.6 * level), ARGB(a * (0.55 + 0.45 * blink), color))
    }
    DrawWord(text, Look.labelFont, x + 8 * s + lead + 7 * s, y + (h - Look.labelH) / 2 + Look.labelDy, a * blink, color, 0)
}

; "LIVE" at the bottom of the box when you've scrolled back to the live captions, with a red dot.
; It stays a moment, then fades away.
DrawLiveBadge(h) {
    s := Look.s, dotW := 2 * Look.dotR + 6 * s, text := "LIVE"
    w := 8 * s + dotW + TextWidth(text, Look.labelFont) + 8 * s, pillH := Look.labelH + 4 * s
    x := Look.W - Look.pad - w, y := h - pillH - 6 * s
    vis := DrawPill(x, y, w, A_TickCount - Anim.liveAt, LIVE_BADGE_MS, 1000, dotW, text)
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
    age := A_TickCount - ex.doneAt, grow := !moving && ex.doneAt && age < 500 ? 1 - (1 - age / 500) ** 3 : 1   ; (settling with a little pop)
    ClaudeSpark(Look.pad + r + s, y + Look.smallH / 2, r * (0.55 + 0.45 * grow), a * (0.4 + 0.6 * grow), moving, (1 - grow) * 1.5)
    text := line != "" ? line : ex.thinking ? "Thinking…" : ex.claudeStatus != "" ? "Responding…" : talking ? "Speaking…"
        : "Finished" (ex.took != "" ? "  ·  " ex.took : "")
    DrawWord(FitWidth(text, Look.smallFont, Look.inner - Look.workIndent), Look.smallFont, Look.pad + Look.workIndent, y + Look.smallDy,
        a * (moving ? 0.6 : 0.6 * grow), Look.colors.text, shadow)
}

; Claude thinking, before the first words of its reply (with no line saying what it's doing):
; three little dots and "Thinking".
DrawThinking(textTop, a) {
    cy := textTop + Look.lineH / 2
    WaitingDots(Look.pad, cy, a)
    DrawWord("Thinking", Look.smallFont, Look.pad + Look.workIndent, cy - Look.smallH / 2 + Look.smallDy, a * 0.6, Look.colors.text, 0)
}

; Three little dots, each swelling and rising in turn, like someone typing, from x, around the
; middle height cy.
WaitingDots(x, cy, a) {
    r := Look.smallH * 0.11, t := A_TickCount / 1000
    loop 3 {
        wave := (Sin((t - A_Index * 0.18) * 6.2832 / 1.2) + 1) / 2
        FillCircle(x + r + (A_Index - 1) * r * 3.3, cy - wave * r * 0.8, r * (0.8 + 0.25 * wave), ARGB(a * (0.3 + 0.6 * wave), Look.colors.text))
    }
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
            breathe := (Sin(A_TickCount / 1000 * 6.2832 / 1.6) + 1) / 2
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
    colors := Buffer(4 * (n + 2)), places := Buffer(4 * (n + 2))
    NumPut("uint", ARGB(a * lit[1] * 0.65, Look.colors.claude), colors, 0), NumPut("float", 0, places, 0)
    for j, letter in letters {
        right := j < n ? letters[j + 1].x : w
        NumPut("uint", ARGB(a * lit[j] * 0.65, Look.colors.claude), colors, 4 * j)
        NumPut("float", Max(0.001, Min(0.999, (letter.x + right) / 2 / w)), places, 4 * j)
    }
    NumPut("uint", ARGB(a * lit[n] * 0.65, Look.colors.claude), colors, 4 * (n + 1)), NumPut("float", 1, places, 4 * (n + 1))
    NumPut("float", x, "float", 0, "float", x + w, "float", 0, ends)
    DllCall("gdiplus\GdipCreateLineBrush", "ptr", ends, "ptr", ends.Ptr + 8, "uint", 0, "uint", 0, "int", 0, "ptr*", &brush := 0)
    DllCall("gdiplus\GdipSetLinePresetBlend", "ptr", brush, "ptr", colors, "ptr", places, "int", n + 2)
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
    s := Look.s, age := A_TickCount - Anim.aboveAt
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
    DllCall("gdiplus\GdipCreatePen1", "uint", edge, "float", Look.s, "int", 2, "ptr*", &pen := 0)
    DllCall("gdiplus\GdipDrawPath", "ptr", Canvas.g, "ptr", pen, "ptr", path)
    DllCall("gdiplus\GdipDeletePen", "ptr", pen)
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

TabLabel(which) => which = "chat" ? "CHAT & COWORK" : "CODE"

; The color of the page Claude is on: blue for Code, Claude's orange for Chat and Cowork.
PageColor() => Page = "code" ? Look.colors.you : Look.colors.claude

; Voice mode's color right now (see Anim.tone): Claude's orange while it listens to you, blue while
; it talks, a soft neutral while it thinks, and in between as it changes.
VoiceColor() => Blend(Blend(Look.colors.claude, Look.colors.you, Anim.tone), Look.colors.text, 0.5 * Anim.think)

; A color partway (some, from 0 to 1) from one color to another.
Blend(from, to, some) => Round((from >> 16 & 0xFF) + ((to >> 16 & 0xFF) - (from >> 16 & 0xFF)) * some) << 16
    | Round((from >> 8 & 0xFF) + ((to >> 8 & 0xFF) - (from >> 8 & 0xFF)) * some) << 8
    | Round((from & 0xFF) + ((to & 0xFF) - (from & 0xFF)) * some)

; A color made darker (by some from 0 to 1).
Darker(rgb, some) => Round((rgb >> 16 & 0xFF) * (1 - some)) << 16 | Round((rgb >> 8 & 0xFF) * (1 - some)) << 8 | Round((rgb & 0xFF) * (1 - some))

; How wide a tab is: ☰, or a page's icon and name, with room around them.
TabWidth(which) => which = "menu" ? 24 * Look.s + (Look.icons.Has("menu") ? Look.icons["menu"].w : TextWidth("≡", Look.labelFont))
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
        x := slot.left + 11 * s
        if Look.icons.Has(which) {
            icon := Look.icons[which]
            DrawWord(icon.glyph, Look.iconFont, x, rowTop + icon.dy, Min(1, a + 0.1), which = "chat" ? Look.colors.claude : Look.colors.you, shadow)
            x += icon.w + 6 * s
        }
        DrawWord(TabLabel(which), Look.labelFont, x, rowTop + Look.labelDy, a, Look.colors.text, shadow)
    }
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
; mode: Claude's orange while it listens to you, breathing (and swelling as you talk), blue while
; Claude talks, pulsing with its voice, and a soft neutral shimmer while it thinks.
DrawVoiceLight(h) {
    static ends := Buffer(16)
    state := VoiceState(), t := A_TickCount / 1000, color := VoiceColor()
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
    static showing := false
    if (Anim.panel <= 0 || enterAlpha <= 0) {
        if showing
            DllCall("ShowWindow", "ptr", PanelGui.Hwnd, "int", 0), showing := false
        return
    }
    static drawn := ""
    s := Look.s, c := Look.colors, list := Sessions.list, rows := Min(list.Length, PANEL_ROWS)
    w := Look.panelW, h := Look.panelHead + Max(1, rows) * Look.rowH + Look.panelPad
    settle := 1 - (1 - Anim.panel) ** 3, slide := (1 - settle) * 16 * s
    x := Round(InStr(Settings.Corner, "left") ? Anim.baseX + Look.W + 8 * s - slide : Anim.baseX - w - 8 * s + slide)
    y := Anim.baseY + Look.tabH
    Anim.panelX := x, Anim.panelY := y, Anim.panelH := h
    ; Nothing in it has changed (a running session's dot breathes a few times a second): it just moves.
    running := InStr(Sessions.key, "Running")
    key := Format("{:.3f}|{}|{}|{}|{}|{:.2f}|{}|{}", settle, Anim.panelHot, Sessions.key, Sessions.current, Page, enterAlpha, c.bg, running ? A_TickCount // 120 : 0)
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
    DrawWord(Page = "chat" ? "CHATS" : "SESSIONS", Look.labelFont, pad, (Look.panelHead - Look.labelH) / 2 + 2 * s + Look.labelDy, 0.55, c.text, 0)
    if !rows
        DrawWord("Open Claude's sidebar to see them here", Look.smallFont, pad, Look.panelHead + (Look.rowH - Look.smallH) / 2 + Look.smallDy, 0.5, c.text, 0)
    breathe := (Sin(A_TickCount / 1000 * 6.2832 / 1.6) + 1) / 2
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
    pt := Buffer(8), size := Buffer(8), origin := Buffer(8, 0)
    NumPut("int", x, "int", y, pt), NumPut("int", w, "int", h, size)
    DllCall("UpdateLayeredWindow", "ptr", PanelGui.Hwnd, "ptr", 0, "ptr", pt, "ptr", size, "ptr", PanelCanvas.hdc,
        "ptr", origin, "uint", 0, "uint*", Round(255 * enterAlpha * settle) << 16 | 1 << 24, "uint", 2)
    if !showing
        DllCall("ShowWindow", "ptr", PanelGui.Hwnd, "int", 8), showing := true   ; SW_SHOWNA
}

; Whether mx, my on screen is on the list beside the box, and which of its rows (counting from 1, or 0).
OverPanel(mx, my) => Anim.panel > 0 && mx >= Anim.panelX && mx < Anim.panelX + Look.panelW && my >= Anim.panelY && my < Anim.panelY + Anim.panelH
PanelRowAt(mx, my) {
    if (Anim.panel < 0.9 || !OverPanel(mx, my))
        return 0
    i := Floor((my - Anim.panelY - Look.panelHead) / Look.rowH) + 1
    return i >= 1 && i <= Min(Sessions.list.Length, PANEL_ROWS) ? i : 0
}

; A click on the list beside the box: goes to the session or chat clicked, and closes the list.
PanelClick() {
    CoordMode("Mouse", "Screen")
    MouseGetPos(&mx, &my)
    if !(row := PanelRowAt(mx, my))
        return 0
    title := Sessions.list[row].title
    Sessions.current := title   ; highlighted right away
    Anim.panelTarget := 0
    Kick()
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
    back := ARGB(a * Max(0.85, Settings.Background / 100), c.bg)   ; (up by the tabs, on the box's color, like them)
    FillCircle(Look.cogX, Look.cogY, r, back), FillCircle(Look.miniX, Look.cogY, r, back)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(a * (Anim.hot = "cog" ? 0.24 : 0.10), c.text))
    DllCall("gdiplus\GdipFillEllipse", "ptr", Canvas.g, "ptr", Brush, "float", Look.cogX - r, "float", Look.cogY - r, "float", 2 * r, "float", 2 * r)
    NumPut("float", Look.cogX - r, "float", Look.cogY - r, "float", 2 * r, "float", 2 * r, spot)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(Anim.hover * 0.9, c.text))
    DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", Look.cogGlyph, "int", -1, "ptr", Look.cogFont.font, "ptr", spot, "ptr", CenterFormat, "ptr", Brush)
    ; Beside it, the – that tucks the box into its tab at the side of the screen.
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(a * (Anim.hot = "mini" ? 0.24 : 0.10), c.text))
    DllCall("gdiplus\GdipFillEllipse", "ptr", Canvas.g, "ptr", Brush, "float", Look.miniX - r, "float", Look.cogY - r, "float", 2 * r, "float", 2 * r)
    NumPut("float", Look.miniX - r, "float", Look.cogY - r, "float", 2 * r, "float", 2 * r, spot)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(Anim.hover * 0.9, c.text))
    DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", Look.icons.Has("menu") ? Chr(0xE921) : "–", "int", -1, "ptr", Look.cogFont.font, "ptr", spot, "ptr", CenterFormat, "ptr", Brush)
    ; Above it, level with the tab, a hint that the wheel scrolls back, when there's something
    ; earlier to see and the "new message" badge isn't there.
    if (!View.scrolled && HasEarlier() && !(Current.newAt && A_TickCount - Current.newAt < NEW_BADGE_MS)) {
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
    if (Look.widths.Count > 5000)
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
    ReadVoice: READ_VOICE, ReadSpeed: READ_SPEED, HighFps: HIGH_FPS ? 1 : 0, GameMode: GAME_MODE ? 1 : 0, OffsetX: 0, OffsetY: 0, PeekEdge: "", PeekAt: -1, Monitor: 0}

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

SaveSettings() {
    for key, value in Settings.OwnProps()
        IniWrite(value, SETTINGS_FILE, "captions", key)
    for old in ["YouLines", "ClaudeLines"]   ; from an earlier version
        try IniDelete(SETTINGS_FILE, "captions", old)
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
    ; The tabs, side by side in the middle.
    spots := [], total := 0
    for name in SETTINGS_TABS
        w := TextWidth(name, Look.labelFont) + 26 * s, spots.Push({w: w}), total += w + 4 * s
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
    glides := ["Snappiest", "Snappy", "Quick", "Brisk", "Easy", "Smooth", "Smoother", "Silky", "Buttery", "Floaty"]
    paces := ["Slowest", "Slower", "Slow", "Easy", "Normal", "Brisk", "Quick", "Faster", "Very fast", "Fastest"]
    rows := [
        {tab: 1, key: "Theme", name: "Theme", kind: "choice", list: THEMES,
            help: "The box's colors. Match Windows follows Windows' light or dark mode. Custom uses your own colors, just below."},
        {tab: 1, key: "CustomColors", name: "Custom colors", kind: "colors",
            help: "Your own colors, for the Custom theme. Point at one to see what it colors, and click it to change it (that switches the theme to Custom). Any that would be hard to read on the box are made lighter or darker so they can be read. Default (click it twice) puts them all back."},
        {tab: 1, key: "Background", name: "Background", kind: "slider", low: 0, high: 100, step: 5,
            show: v => v = 0 ? "Words only" : v = 100 ? "Solid" : v "%",
            help: "How solid the box is. All the way left shows just the words, with a soft shadow so they can be read on anything."},
        {tab: 1, key: "Bubbles", name: "Chat bubbles", kind: "toggle",
            help: "On the Chat & Cowork page, what you say sits in a bubble on the right, like a text message."},
        {tab: 2, key: "Font", name: "Font", kind: "choice", list: "fonts",
            help: "The font what you and Claude say is shown in. The names and labels stay in Segoe UI."},
        {tab: 2, key: "FontSize", name: "Text size", kind: "stepper", low: 8, high: 40, show: v => v " pt",
            help: "How big the words are."},
        {tab: 2, key: "TextReveal", name: "Text appears", kind: "choice", list: REVEALS,
            help: "How Claude's words come in: fading in a word at a time, or typed out a letter at a time. Match the sound types them out with the Animal Crossing and Undertale sounds, and fades them in otherwise."},
        {tab: 2, key: "WordSpeed", name: "Text speed", kind: "slider", low: 1, high: 10, show: v => speeds[v],
            help: "How fast Claude's words come in. If a lot arrives at once, they speed up so they never fall far behind."},
        {tab: 2, key: "FollowVoice", name: "Word glow", kind: "toggle",
            help: "In voice mode, each word lights up as Claude says it."},
        {tab: 2, key: "GlowDelay", name: "Glow timing", kind: "slider", low: 0, high: 600, step: 10, show: v => v " ms later",
            when: () => Settings.FollowVoice,
            help: "If the glow runs ahead of Claude's voice (common with sound mixers or wireless headphones), slide it right."},
        {tab: 3, key: "TypingSound", name: "Typing sounds", kind: "choice", list: TYPING_SOUNDS,
            help: "Little sounds as Claude's words appear: soft clicks, or chatter like Animal Crossing's or Undertale's, following the letters as they're typed out. Only while the box is up, and not in voice mode."},
        {tab: 3, key: "SoundVolume", name: "Sound volume", kind: "slider", low: 0, high: 100, step: 5, show: v => v "%",
            when: () => Settings.TypingSound != "Off",
            help: "How loud the typing sounds are."},
        {tab: 3, key: "ClaudeVoice", name: "Claude's voice", kind: "toggle",
            help: "In voice mode on the Chat & Cowork page, you hear Claude talk. Turn it off to mute Claude and read along instead; the box still shows when Claude is speaking."},
        {tab: 3, key: "ReadCode", name: "Read Code replies", kind: "toggle",
            help: "Reads Claude's replies out loud on the Code page in a Windows voice, a paragraph at a time, leaving out code and Claude's steps. The words show up as they're read, and the typing sounds stay quiet meanwhile."},
        {tab: 3, key: "ReadVoice", name: "Reading voice", kind: "choice", list: "voices", show: v => RegExReplace(v, "^Microsoft (\S+).*$", "$1"),
            when: () => Settings.ReadCode,
            help: "Which Windows voice reads Code replies. Windows' own settings can add more voices."},
        {tab: 3, key: "ReadSpeed", name: "Reading speed", kind: "slider", low: 1, high: 10, show: v => paces[v], when: () => Settings.ReadCode,
            help: "How fast Code replies are read out."},
        {tab: 4, key: "Animate", name: "Smooth motion", kind: "toggle",
            help: "Words fade in and the box glides. Turn it off to have everything change at once."},
        {tab: 4, key: "HighFps", name: "High FPS", kind: "toggle", when: () => Settings.Animate,
            help: "Draws the box as often as your screen refreshes (like 144 times a second on a 144 Hz screen), for the smoothest motion. Off, it's 60 times a second, which is lighter on your computer."},
        {tab: 4, key: "Float", name: "Float", kind: "toggle", when: () => Settings.Animate,
            help: "The box drifts gently, and leans a little toward the mouse. What's attached to it (a page open under it, the list beside it) and its tab at the edge of the screen stay still."},
        {tab: 4, key: "GameMode", name: "Game mode", kind: "toggle",
            help: "While a game (or anything else full screen, like a video) is in front, the box keeps still, only redraws when something changes (at most 60 times a second), and the Claude tab hides unless you tucked the box away yourself. Easier on the game and its overlays."},
        {tab: 4, key: "ScrollSmooth", name: "Scroll glide", kind: "slider", low: 1, high: 10, show: v => glides[v], when: () => Settings.Animate,
            help: "How long scrolling back through the conversation glides before it stops."},
        {tab: 4, key: "Appear", name: "Show & hide", kind: "choice", list: APPEAR_STYLES, when: () => Settings.Animate,
            help: "How the box shows up and goes away: growing out of its corner, sliding in, or fading. When it tucks into its Claude tab, the tuck animation is used instead."},
        {tab: 5, key: "Corner", name: "Corner", kind: "choice", list: CORNERS,
            help: "Which corner of the screen the box sits in. You can also drag the box, or its Claude tab, anywhere, on any monitor."},
        {tab: 5, key: "Width", name: "Width", kind: "slider", low: 300, high: 900, step: 10, show: v => v " px",
            help: "How wide the box is. You can also drag one of the box's corners."},
        {tab: 5, key: "Lines", name: "Height", kind: "stepper", low: 4, high: 30, show: v => v " lines",
            help: "How many lines tall the box grows before you scroll back for more."},
        {tab: 5, key: "HideAfter", name: "Hide after", kind: "choice", list: HIDE_CHOICES,
            help: "How long the box stays up once nothing new is happening. It stays while someone is talking, Claude is working, or you're pointing at it."},
        {tab: 5, key: "TypeBox", name: "Typing box", kind: "toggle",
            help: "A box along the bottom for typing to Claude instead of talking. Enter sends, and Shift+Enter starts a new line."},
        {tab: 6, key: "Tuck", name: "Tuck away", kind: "toggle",
            help: "When the box hides, it shrinks into Claude's logo at the edge of the screen. Click the logo to bring it back, or drag it to any edge. The – by the cog always tucks it away."},
        {tab: 6, key: "TuckStyle", name: "Tuck animation", kind: "choice", list: TUCK_STYLES, when: () => Settings.Animate,
            help: "How the box shrinks into the logo and comes back out. Swoosh comes out slowly, then rushes out and lands with a jiggle, and goes back in fast, settling in."},
        {tab: 6, key: "TuckCount", name: "Reply count", kind: "toggle",
            help: "The logo counts Claude's new messages while the box is tucked away (including in the middle of a long job, and other sessions finishing): blue for the Code page, red for Chat & Cowork. Opening the box then shows you where the new messages start."},
        {tab: 6, key: "TuckWiggle", name: "Spin & wiggle", kind: "toggle",
            help: "The logo does a full spin when Claude finishes a reply, and wiggles when there's something new."},
        {tab: 6, key: "AutoLinks", name: "Open links", kind: "toggle",
            help: "Opens the first link in each of Claude's replies in the page under the box by itself. You can always click a link's pill at the bottom of the box."}
    ]
    return rows
}

; A setting's value as its control shows it (for HideAfter, its choice; for ReadVoice, the first
; voice until one is picked), and as words (show).
RowValue(row) {
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
    SetUI.running := true, SetUI.last := A_TickCount
    SetTimer(SettingsFrame, 10)
}

; One step of the settings window's animation: popping in (or out), switches sliding, the pill under
; the tabs gliding to the one picked, and explanations fading in and out. It draws the window, and
; stops once everything has settled.
SettingsFrame() {
    u := SetUI, now := A_TickCount, dt := Min(100, now - u.last), u.last := now
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
        SetTimer(SettingsFrame, 0), u.running := false
}

; Draws the settings window and puts it on screen.
DrawSettings() {
    global Canvas
    if !SettingsGui
        return
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
    armed := u.resetAt && A_TickCount - u.resetAt < 3000
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
    pt := Buffer(8), size := Buffer(8), origin := Buffer(8, 0)
    NumPut("int", u.x, "int", u.y, pt), NumPut("int", W, "int", H, size)
    DllCall("UpdateLayeredWindow", "ptr", SettingsGui.Hwnd, "ptr", 0, "ptr", pt, "ptr", size, "ptr", u.canvas.hdc,
        "ptr", origin, "uint", 0, "uint*", Round(255 * Min(1, grow * 1.3)) << 16 | 1 << 24, "uint", 2)
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
        ink := ARGB(a * (can ? 0.8 : 0.3), c.text)
        NumPut("float", cx - arm, "float", mid, "float", cx + arm, "float", mid, points)
        DrawLines(points, 2, 1.6 * s, ink)
        if (i = 2) {
            NumPut("float", cx, "float", mid - arm, "float", cx, "float", mid + arm, points)
            DrawLines(points, 2, 1.6 * s, ink)
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
    s := Look.s, c := Look.colors, colors := StrSplit(Settings.CustomColors, ","), r := 10 * s, step := 46 * s, f := SetUI.fonts.tiny
    custom := Settings.Theme = "Custom", cy := mid - 7 * s
    for i, hex in colors {
        cx := xr - step / 2 - (colors.Length - i) * step, hot := on && SetUI.hot = "color-" n "-" i, name := COLOR_NAMES[i]
        FillCircle(cx, cy, r + (hot ? 3 : 1.5) * s, ARGB(a * (hot ? 0.55 : 0.25), c.text))
        FillCircle(cx, cy, r, ARGB(a * (custom ? 1 : 0.6), Integer("0x" hex)))   ; (softer while another theme is picked)
        DrawWord(name, f, cx - TextWidth(name, f) / 2, TextY(f, cy + r + 9 * s), a * (hot ? 0.95 : 0.55), c.text, 0)
        SetUI.swatches[i] := {x: cx, y: cy + r}
        if on
            AddSpot("color-" n "-" i, cx - step / 2, cy - r - 4 * s, step, 2 * r + 24 * s)
    }
    cx := xr - step / 2 - colors.Length * step - 6 * s, hot := on && SetUI.hot = "colors-default"
    armed := SetUI.colorsResetAt && A_TickCount - SetUI.colorsResetAt < 3000, ink := armed ? c.claude : c.text
    FillCircle(cx, cy, r + (hot ? 3 : 1.5) * s, ARGB(a * (armed ? 0.6 : hot ? 0.55 : 0.25), ink))
    FillCircle(cx, cy, r, ARGB(a, c.bg))
    ; A circle with an arrow at its end, going around to the left: back to how it was.
    ar := r * 0.5, arc := 280, start := 300, pen := 0
    DllCall("gdiplus\GdipCreatePen1", "uint", ARGB(a * (armed || hot ? 1 : 0.75), ink), "float", 1.6 * s, "int", 2, "ptr*", &pen)
    DllCall("gdiplus\GdipSetPenStartCap", "ptr", pen, "int", 2), DllCall("gdiplus\GdipSetPenEndCap", "ptr", pen, "int", 2)
    DllCall("gdiplus\GdipDrawArc", "ptr", Canvas.g, "ptr", pen, "float", cx - ar, "float", cy - ar, "float", 2 * ar, "float", 2 * ar,
        "float", start, "float", -arc)
    DllCall("gdiplus\GdipDeletePen", "ptr", pen)
    end := (start - arc) * 0.0174533, ex := cx + ar * Cos(end), ey := cy + ar * Sin(end)
    dx := Sin(end), dy := -Cos(end), len := 4.2 * s, points := Buffer(24)   ; (the way the arrow is going: around to the left)
    NumPut("float", ex - len * (dx * 0.77 - dy * 0.64), "float", ey - len * (dy * 0.77 + dx * 0.64), "float", ex, "float", ey,
        "float", ex - len * (dx * 0.77 + dy * 0.64), "float", ey - len * (dy * 0.77 - dx * 0.64), points)
    DrawLines(points, 3, 1.6 * s, ARGB(a * (armed || hot ? 1 : 0.75), ink))
    name := armed ? "Sure?" : "Default"
    DrawWord(name, f, cx - TextWidth(name, f) / 2, TextY(f, cy + r + 9 * s), a * (armed || hot ? 0.95 : 0.55), ink, 0)
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
    items := items || (row.list = "fonts" ? FontList() : row.list = "voices" ? ReaderVoices() : row.list)
    if !items.Length
        return
    below := u.H - 12 * s - (spot.y + spot.h + 4 * s), above := spot.y - 16 * s
    down := below >= Min(items.Length, 8) * rowH + 8 * s || below >= above
    shown := Max(1, Min(items.Length, 8, Floor(((down ? below : above) - 8 * s) / rowH)))
    value := n ? RowValue(row) : row.value, at := 1
    for i, item in items
        if (item = value)
            at := i
    h := shown * rowH + 8 * s
    u.popup := {row: row, n: n, items: items, value: value, shown: shown, rowH: rowH, x: spot.x, w: spot.w, h: h,
        y: down ? spot.y + spot.h + 4 * s : spot.y - 4 * s - h, first: Max(1, Min(at - shown // 2, items.Length - shown + 1))}
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
    DllCall("gdiplus\GdipCreatePen1", "uint", ARGB(0.18, c.text), "float", s, "int", 2, "ptr*", &pen := 0)
    DllCall("gdiplus\GdipDrawPath", "ptr", Canvas.g, "ptr", pen, "ptr", path)
    DllCall("gdiplus\GdipDeletePen", "ptr", pen), DllCall("gdiplus\GdipDeletePath", "ptr", path)
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
    a := u.tipA, fill := c.light ? 0x2B2A28 : Blend(c.bg, 0xFFFFFF, 0.16), ink := c.light ? 0xF5F4EE : c.text
    FillRoundRect(x + s, y + 4 * s, w, h, 10 * s, ARGB(a * 0.22, 0x000000))
    FillRoundRect(x, y, w, h, 10 * s, ARGB(a, fill))
    for i, line in lines
        DrawWord(line, f, x + pad, TextY(f, y + pad - 3 * s + (i - 0.5) * lineH), a * 0.95, ink, 0)
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
    if (!SettingsGui || SetUI.HasOwnProp("hidden") && SetUI.hidden)
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
    if wasSlider
        SaveSettings()
    if (wasSlider && row.key = "ReadSpeed" && Settings.ReadCode)
        SetTimer(SampleReading, -100)
    SettingsKick()
    return 0
}

; A slider (the n-th setting) follows the mouse (at mx on screen), in its steps.
SlideTo(n, mx) {
    row := SettingRows()[n], bar := SetUI.sliders[n]
    k := Max(0, Min(1, (mx - SetUI.x - bar.x) / bar.w)), step := row.HasOwnProp("step") ? row.step : 1
    ChangeSetting(row.key, Round((row.low + k * (row.high - row.low)) / step) * step, false)
}

; The mouse wheel over the settings window scrolls a list that's open, or moves the slider you're
; pointing at.
SettingsWheel(dir) {
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

; An earlier version you switched to from the settings (see RunVersion) that's running, or 0.
OlderCaptions() {
    DetectHiddenWindows true
    SetTitleMatchMode 2
    for hwnd in WinGetList("\captions-versions\ ahk_class AutoHotkey")
        if (hwnd != A_ScriptHwnd && InStr(WinGetTitle(hwnd), "claude-captions.ahk"))
            return hwnd
    return 0
}

; Changes a setting from the settings window (save: and saves it). It shows on the box right away,
; and some show off what they do: the voice glow, typing sounds and speed, how the box shows up or
; tucks away, and the reading voice.
ChangeSetting(key, value, save := true) {
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
        case "FollowVoice":
            if value
                SetTimer(DemoVoice, -10)
        case "TypingSound", "TextReveal", "WordSpeed", "SoundVolume":
            if (key != "TypingSound" || value != "Off")
                SetTimer(PreviewTyping, -300)   ; (once you stop sliding)
        case "Appear":
            SetTimer(ShowAppearing, -10)
        case "TuckStyle":
            SetTimer(ShowTucking, -10)
        case "HighFps":
            if Anim.running
                SetTimer(Frame, FramePeriod())
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
        ApplySettings()
    SettingsKick()
}

; Picks one of your colors (the i-th: background, words, you, Claude, code) in Windows' color
; picker, and switches the box to your colors.
PickColor(i) {
    colors := StrSplit(Settings.CustomColors, ",")
    if ((picked := ChooseColor(colors[i], SettingsGui ? SettingsGui.Hwnd : 0)) = "")
        return
    colors[i] := picked, joined := ""
    for j, color in colors
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
    Anim.tucking := false, Anim.p := 0, Anim.last := A_TickCount
    ReplayWords()
    Kick()
}

; Shows the box coming out of its Claude tab, in the tuck animation just picked.
ShowTucking() {
    Anim.tucking := true, Anim.p := 0, Anim.last := A_TickCount
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
    SetUI.closing := true, SetUI.popup := "", SetUI.tip := ""
    SettingsKick()
}

FinishClosingSettings() {
    global SettingsGui, Shown
    SetTimer(SettingsFrame, 0), SetTimer(SettingsWatch, 0)
    SetUI.running := false
    SettingsGui.Destroy(), FreeCanvas(SetUI.canvas)
    SettingsGui := ""
    SaveSettings()
    Shown := {you: "", claude: "", live: false, streaming: false, thinking: false, work: ""}
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
        Shown := {you: "", claude: "", live: false, streaming: false, thinking: false, work: ""}   ; show the current exchange again
    UpdateVisibility()
    ; The page open under the box goes down to the taskbar while it's hidden, and comes back after.
    if (Browser.hwnd && WinExist(Browser.hwnd)) {
        if Hidden {
            try WinMinimize(Browser.hwnd), Browser.min := true
        } else if (!Minimized && WinGetMinMax(Browser.hwnd) = -1) {
            try WinRestore(Browser.hwnd), Browser.min := false, Browser.set := ""
        }
    }
}
