; On-screen captions for Claude, version 1.3.1 (see CAPTIONS_VERSION)
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
; since captions were turned on (up to HISTORY_KEEP of them), two whole lines a notch, gliding to
; a stop as smoothly as the Scroll smoothness setting says, or drag the scroll bar on its right.
; Scroll back down past the newest, or move the mouse away, to return to the live captions, and
; "LIVE" shows at the bottom for a moment.
;
; When the start of Claude's newest reply is above what the box shows (the box keeps up with the
; reply's newest sections), a small arrow at the top of the box says there's more up there to
; read. It nudges upward a few times as it shows up, then rests, and goes away once you've
; scrolled up to the start of the reply.
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
; settings, if you like); on the Code page, they go one under the other. While voice mode is on,
; a VOICE MODE tag sits by what you say, and while Claude talks, its label says SPEAKING. Once
; Claude has finished and voice mode is listening for you, a soft blue light breathes at the
; bottom of the box, swelling as you talk.
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
; Point at the box and a settings cog shows in its corner. Click it to change the font and size,
; the colors (dark, light, or whichever Windows uses), how solid the background is (all the way
; down to just the words), which corner the box sits in, its size, how quickly words fade in, how
; the box shows up, how long it stays up, whether words light up as Claude says them (and how
; long after the sound), and whether
; what you say sits in bubbles on the Chat page. Changes show right away and are saved in
; claude-captions.ini next to this file.
;
; Running this file is an on/off toggle, like claude-hey-claude.ahk: the first time turns captions
; on, the next time turns them off (a double-click or a Stream Deck System > Open button both work).
; Its icon sits in the corner of the taskbar while it's on. Right-click the icon for:
;   Settings...     - the same as the cog (double-clicking the icon opens it too)
;   Hide captions   - stops showing the box until you pick it again
;   Exit
; To have it start with Windows, put a shortcut to this file in your Startup folder
; (press Win+R and type shell:startup).

#Requires AutoHotkey v2.0 64-bit
CAPTIONS_VERSION := "1.3.1"   ; shown in the tray icon's tooltip and the settings window's title
; Uses the voice button's code for finding and reading Claude's window.
#Include %A_LineFile%\..\claude-voice-on-off-send.ahk
#SingleInstance Off   ; after the #Include, so it wins over the voice button's setting; CaptionsMain handles a second copy

; ---- Settings ---------------------------------------------------------------
; How the box starts out. The settings window (the cog on the box) changes these, and your choices
; are saved in claude-captions.ini, which wins over what's here. "Reset to defaults" comes back here.
FONT           := "Segoe UI"
FONT_SIZE      := 12            ; in points
THEME          := "Dark"        ; "Dark", "Light" or "Match Windows"
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
FOLLOW_VOICE   := true          ; in voice mode, each word lights up as Claude says it
BUBBLES        := false         ; on the Chat page, what you say sits in a bubble on the right (otherwise it's just on the right)
GLOW_DELAY     := 250           ; how long after Claude's sound the glow follows it (ms): the sound takes a moment to reach your ears
; These aren't in the settings window:
LABEL_FONT     := "Segoe UI"    ; the labels and little indicators (YOU, CLAUDE, times, the badge) stay in this font
LISTENING_TEXT := "I'm listening…"   ; shown (softly) after "Hey Claude", until you start talking
SENT_WAIT_MS   := 4000          ; after you speak, how long to wait for your message to show up in Claude's window (ms)
NEW_BADGE_MS   := 2600          ; how long the "new message" badge shows, fading out at the end (ms)
NEW_AFTER_MS   := 3000          ; Claude's words after it's been quiet (or taking steps) this long count as a new message (ms)
LIVE_BADGE_MS  := 2200          ; how long "LIVE" shows at the bottom after you scroll back to the live captions (ms)
APPEAR_MS      := 450           ; how long the box takes to show up (ms)
DISAPPEAR_MS   := 320           ; how long it takes to go away (ms)
HISTORY_KEEP   := 50            ; how many earlier exchanges you can scroll back to
MARGIN         := 16            ; space between the box and the edges of the screen
CHECK_EVERY_MS := 400           ; how often Claude's window is read (ms)
IDLE_CHECK_MS  := 1200          ; ...and while the box is hidden and nobody's talking, to go easy on Claude's window
TALKING_CHECK_MS := 1200        ; ...and while Claude reads out a reply that has all come in
YOUR_WORDS_MS  := 100           ; while voice mode or dictation is listening, how often the message box is read (ms)
VOICE_CHECK_MS := 30            ; while voice mode is on, how often Claude's voice is listened to (ms)
PANEL_ROWS     := 12            ; how many sessions or chats the list beside the box shows
SIDEBAR_ROW    := "w-full shrink-0 border-none text-left"   ; how a session or chat in Claude's sidebar starts its class
SETTINGS_FILE  := A_ScriptDir "\claude-captions.ini"
; -----------------------------------------------------------------------------

THEMES := ["Dark", "Light", "Match Windows"]
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
; is (panelX, panelY, panelH), how much the listening light shows (listen), and whether something
; changed that needs drawing (dirty).
Anim := {running: false, last: 0, lastDraw: 0, p: 0.0, target: 0, hover: 0.0, hoverTarget: 0,
    hot: "", shown: false, x: 0, y: 0, h: 0, bar: "", liveAt: 0, above: 0.0, aboveAt: 0,
    tabLeft: 0.0, tabRight: 0.0, tabSpeedL: 0.0, tabSpeedR: 0.0, panel: 0.0, panelTarget: 0, panelHot: 0,
    panelX: 0, panelY: 0, panelH: 0, listen: 0.0, dirty: false}
; Dragging a handle with the mouse: which (mode), where it started, and the box as it was then.
Drag := {mode: "", resizing: false}
; Following Claude's voice (see FollowClaudesVoice): whether it is (on), which of the reply's
; spoken words (list, from the reply's laid-out part) Claude is on (word, counting from 0, with how
; far through it as a fraction, and pos, which glides after it), Claude's pace (rate, in words a
; second while it talks), how loud it is (env) and has been lately (level), how long it has talked
; (talkMs), where it has been lately (trail, for the glow to follow a moment behind), and how bright
; the glow on the words is (shown, glow). Also when Claude was last heard (loudAt) and how loud your
; mic is (mic), for the listening light. A pretend voice (fake) can stand in for Claude's, to show
; what it looks like (demo).
Voice := {on: false, ticking: false, fake: "", demo: false, ex: "", parts: "", part: "", list: [], word: 0.0,
    pos: 0.0, posSpeed: 0.0, rate: 4.0, env: 0.0, level: 0.0, at: 0, loudMs: 0, quietMs: 0, heldMs: 0,
    talkMs: 0, paused: true, finished: false, snapTo: "", passed: 0, phraseStart: 0.0, phraseMs: 0,
    shown: 0.0, glow: 0.0, trail: [], loudAt: 0, mic: 0.0, micMeter: "", micTried: false}
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
SettingsGui := "", SettingsControls := "", Filling := false

if (A_LineFile = A_ScriptFullPath)
    CaptionsMain()

CaptionsMain() {
    ; Running it again while it's already on turns it off.
    if (running := OtherCaptions()) {
        WinClose(running)   ; asks the running copy to exit
        ToolTip("Captions are off")
        Sleep 2000
        ExitApp
    }
    Persistent
    A_IconHidden := false   ; the voice button's code hides the tray icon; this script wants it
    A_IconTip := "Claude captions " CAPTIONS_VERSION
    A_TrayMenu.Delete()
    A_TrayMenu.Add("Settings...", (*) => OpenSettings())
    A_TrayMenu.Add("Hide captions", ToggleHidden)
    A_TrayMenu.Add("Put the box back in its corner", (*) => PutBack())
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

; On the way out, the box animates away instead of vanishing.
GoAway(*) {
    if !Anim.shown
        return
    Anim.target := 0, Anim.last := A_TickCount
    deadline := A_TickCount + DISAPPEAR_MS + 200
    while (Anim.shown && A_TickCount < deadline) {
        Frame()
        Sleep 15
    }
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
    if Hidden
        return UpdateVisibility()
    ; While you scroll or drag the box, reading waits: a read takes long enough to make the motion stutter.
    if (Drag.mode || A_TickCount - ScrollAt < 700)
        return
    try {
        hwnd := FindClaudeWindow()
        if (hwnd && hwnd != LastHwnd)
            WakeAccessibility(hwnd)
        LastHwnd := hwnd
        now := hwnd ? ReadConversation(hwnd) : {you: "", claude: "", live: false, streaming: false, thinking: false, work: "", listening: false, voice: false,
            micLive: false, sessions: [], session: ""}
    } catch {
        return   ; the window changed while it was being read; try again next time
    }
    micOn := now.listening
    if now.voice {   ; voice mode: Claude reads its replies out loud, so the words can light up as it does
        VoiceModeAt := A_TickCount
        StartFollowing()   ; which also notices when it's your turn to talk
    }
    if (now.voice != VoiceMode || now.micLive != VoiceMicLive)   ; the VOICE MODE tag and the listening light go with it
        VoiceMode := now.voice, VoiceMicLive := now.micLive, Kick()
    ; Claude's sidebar, for the list beside the box.
    key := now.session "|"
    for row in now.sessions
        key .= row.status " " row.title "|"
    if (key != Sessions.key) {
        Sessions := {list: now.sessions, current: now.session, key: key}
        Kick()
    }
    ; Which page Claude is on, for the tab on top of the box. It's checked now and then: it's slow to find.
    if (hwnd && A_TickCount - PageAt > 1500) {
        PageAt := A_TickCount
        try NoticePage(PageOf(hwnd))
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
    ; What Claude said before your newest message can still change after it: a reply you talked
    ; over goes on until Claude gets to what you said, and your message then lands in the middle of
    ; it. So the exchange before is kept up to date in the history, and new words there that you
    ; haven't seen get the arrow at the top of the box.
    if (now.HasOwnProp("prevYou") && now.prevYou != "" && now.prevClaude != "" && History.Length) {
        last := History[History.Length]
        if (last.you == now.prevYou && last.claude != now.prevClaude) {
            Critical
            words := ReplyWords(now.prevClaude)
            if (words != last.words)
                last.unseen := true, last.words := words
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

; Changes how often Claude's window is read.
ReadEvery(ms) {
    static every := CHECK_EVERY_MS
    if (ms != every)
        SetTimer(UpdateCaptions, every := ms)
}

; An exchange: what you said and Claude's reply, as the box shows them, plus a note while there's
; no conversation. parts holds each one laid out: its label, and its words with where each goes.
; sawTop notes that you've scrolled up to the start of the reply, so the arrow saying there's more
; above stays away, chat that it's from the Chat page, where what you said goes on the right, and
; queued what you said next while Claude was still busy with this reply (see ShowExchange), and
; unseen that new words came into its reply after it moved up into the history.
NewExchange() => {note: "", you: "", youStatus: "", dim: false, claude: "", claudeStatus: "", thinking: false, chat: Page = "chat", queued: "", unseen: false,
    work: "", time: FormatTime(, "h:mm tt"), replyTime: "", newAt: 0, newTime: "", words: "", wordsAt: 0, saidAt: 0, sample: false, restores: false,
    parts: [], stops: [], lineStops: [], anyStops: [], height: 0, y: 0, fadeUntil: 0, sawTop: false}

HasConversation() => Current.you != "" || Current.claude != "" || Current.thinking

; Puts what was read from Claude's window in the box. When you've said something new since Claude's
; last reply (or the chat is now empty), the exchange showing moves up into the history.
ShowExchange(now, spreadMs := CHECK_EVERY_MS) {
    global Current
    isSample := now = SAMPLE
    empty := now.you = "" && now.claude = "" && !now.thinking
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
        Current := History.Pop()
        ; If Claude is still busy with that reply, what you said is most likely waiting its turn:
        ; Claude gets to it at its next stopping point (on the Code page, between its steps). Until
        ; it turns up, it stays at the bottom of the reply, marked QUEUED.
        if (said != "" && (now.work != "" || now.streaming || now.thinking))
            Current.queued := said
    }
    if !empty
        Current.note := ""
    if (now.you != Current.you)
        Current.saidAt := A_TickCount
    Current.you := now.you, Current.dim := false, Current.youStatus := now.live ? "LISTENING" : ""
    Current.claude := now.claude, Current.thinking := now.thinking, Current.work := now.work
    Current.claudeStatus := now.thinking ? "THINKING" : now.streaming ? "RESPONDING" : ""
    if ((now.claude != "" || now.thinking) && Current.replyTime = "")   ; a new reply: note when, for its label
        Current.replyTime := FormatTime(, "h:mm tt")
    ; A new message gets the "new message" badge: Claude's first words, or new words after it's
    ; been quiet (or busy taking steps) for a while.
    words := ReplyWords(now.claude)
    if (words != Current.words) {
        if (words != "" && (Current.words = "" || A_TickCount - Current.wordsAt > NEW_AFTER_MS)
            && !isSample && A_TickCount - Started > 3000)
            Current.newAt := A_TickCount, Current.newTime := FormatTime(, "h:mm tt")
        Current.words := words, Current.wordsAt := A_TickCount
    }
    LayOutExchange(Current, spreadMs)
    Place()
}

; Shows what was last read from Claude's window again, for a decision that had to wait a moment.
ShowLatestRead() {
    Critical
    ShowExchange(Shown)
    Critical "Off"
    Kick()
    UpdateVisibility()
}

; A reply's words, leaving out its steps, to notice new words rather than new steps.
ReplyWords(markup) {
    text := ""
    for line in StrSplit(markup, "`n")
        if !(StartsWith(line, STEP) || StartsWith(line, STEP_RUNNING))
            text .= line "`n"
    return text
}

; Moves the exchange showing into the history, which keeps HISTORY_KEEP of them.
PushCurrent() {
    if (Current.dim || Current.sample || Current.you = "" && Current.claude = "")
        return false
    Current.youStatus := Current.claudeStatus := "", Current.note := ""
    if (Current.thinking || Current.work != "" || Current.queued != "") {   ; no dots (the reply never came), status line or queued words in the history
        Current.thinking := false, Current.work := "", Current.queued := ""
        LayOutExchange(Current)
    }
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
    Place()
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
            micLive: micLive, sessions: side.rows, session: side.current, prevYou: "", prevClaude: ""}
    replyText := PartsToMarkup(parts)
    ; Thinking: working on your newest message, with no words of the reply yet.
    thinking := found.you != "" && replyText = "" && (working || found.streaming)
    return {you: found.you, claude: replyText, live: false, streaming: found.streaming, thinking: thinking,
        work: working ? found.work : "", listening: micOn, voice: voiceOn, micLive: micLive, sessions: side.rows, session: side.current,
        prevYou: found.prevYou, prevClaude: prevClaude}
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
; showing (current), whose title has a rename button, like "General chat, rename chat".
SidebarRows(buttons) {
    titles := [], current := ""
    for button in buttons {
        if StartsWith(button.name, "More options for ")
            titles.Push(SubStr(button.name, 18))
        else if RegExMatch(button.name, "^(.+), rename (session|chat)$", &m)
            current := m[1]
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
    return {rows: rows, current: current}
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
    if StartsWith(label, "You said: ") {
        text := ""
        loop kids.Length - 1 {   ; the message itself, leaving out its buttons and when it was sent
            kid := kids.Get(A_Index + 1), name := Trim(kid.name)
            if (kid.type = UIA_TEXT && name != "" && !IsWhenLabel(name))
                text .= (text = "" ? "" : " ") name
        }
        said := text != "" ? text : SubStr(label, 11)
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
        if (part.type = "space") {
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
LayOutExchange(ex, spreadMs := 0) {
    before := Map()
    for part in ex.parts
        before[part.key] := part.tokens
    parts := [], y := 0
    for spec in [["note", "CAPTIONS", "claude", ex.note, false], ["you", "YOU", "you", ex.you, false],
            ["claude", "CLAUDE", "claude", ex.claude, true]] {
        dots := spec[1] = "claude" && ex.thinking
        if (spec[4] = "" && !dots)
            continue
        if parts.Length
            y += Look.gap
        tokens := dots ? [] : Tokenize(spec[4], spec[5])
        right := ex.chat && spec[1] = "you"
        laid := dots ? {h: Look.lineH, bubble: ""} : right ? LayOutRight(tokens) : {h: LayOutTokens(tokens), bubble: ""}
        KeepFading(before.Has(spec[1]) ? before[spec[1]] : [], tokens, spreadMs, ex)
        parts.Push({key: spec[1], label: spec[2], color: spec[3], y: y, textY: y + Look.labelH + Look.labelGap,
            tokens: tokens, dots: dots, align: right ? "right" : "", bubble: laid.bubble})
        y += Look.labelH + Look.labelGap + laid.h
    }
    ; While Claude works, what it's doing goes under its reply: "2m 5s · 1.3k tokens · Thinking…".
    if (ex.work != "") {
        y += Look.labelGap * 2
        parts.Push({key: "work", y: y, textY: y, tokens: [], dots: false,
            line: FitWidth(ex.work, Look.smallFont, Look.inner - Look.workIndent)})
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
}

; The earliest of the stops (top to bottom) from which the rest of something height tall fits in
; room, or "" if even the last doesn't.
FirstFit(stops, height, room) {
    found := "", i := stops.Length
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

; Words that match the ones before keep their fade-in; the rest take turns fading in.
KeepFading(old, tokens, spreadMs, ex) {
    same := 0
    while (same < tokens.Length && same < old.Length && tokens[same + 1].text == old[same + 1].text
        && tokens[same + 1].style == old[same + 1].style)
        same++, tokens[same].born := old[same].born
    fresh := tokens.Length - same
    step := fresh ? Min(Look.motion.step, spreadMs / fresh) : 0
    next := same ? Max(A_TickCount, tokens[same].born + step) : A_TickCount
    loop fresh
        tokens[same + A_Index].born := next + (A_Index - 1) * step
    if fresh
        ex.fadeUntil := Max(ex.fadeUntil, tokens[tokens.Length].born + Look.motion.fade)
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
            tokens.Push({text: "•", style: "bullet", space: false, block: block, kind: kind})
        else if IsStepKind(kind)   ; a small dot, which breathes while the step is still going
            tokens.Push({text: "", style: kind = "step" ? "stepdot" : "rundot", space: false, block: block, kind: kind})
        spaced := false, first := true
        for i, segment in ((markup && kind != "pre") ? StrSplit(line, TICK) : [line]) {
            style := kind = "pre" ? "pre" : IsStepKind(kind) ? "step" : Mod(i, 2) = 0 ? "code" : kind = "h" ? "bold" : "plain"
            for j, word in StrSplit(segment, " ") {
                if (j > 1)
                    spaced := true
                if (word = "")
                    continue
                tokens.Push({text: word, style: style, space: spaced && !first, block: block, kind: kind})
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
    h := Current.height
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
    return {h: h, bottom: View.total}
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

; The box shows when there's something to show and it's recent, or someone is talking, or you're
; pointing at it or scrolled back, or the settings are open, or there's a note.
UpdateVisibility() {
    recent := !Settings.HideAfter || A_TickCount - LastChange < Settings.HideAfter * 1000
    show := !Hidden && (Current.note != "" || Waiting || View.scrolled || Anim.panelTarget || HasConversation()
        && (recent || Listening || Shown.live || Shown.streaming || Shown.thinking || Shown.work != "" || Anim.hoverTarget || SettingsGui)) ? 1 : 0
    if (show != Anim.target) {
        if (show && !Anim.p) {   ; coming back from hidden
            SnapView()
            ReplayWords()
        }
        Anim.target := show
        Kick()
    }
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
        tk.born := next, next += step
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
; "tab-code"), "box" (anywhere else on it, the tab joined to it included), or "" (not on the box).
HitTest(x, y) {
    w := Look.W, c := Look.cornerSize
    y -= Look.tabH, h := Anim.h - Look.tabH   ; from the top of the box, under the tab
    if (x < 0 || x >= w || y < -Look.tabH || y >= h)
        return ""
    if (y < 0) {   ; up by the tabs
        for which, slot in Look.slots
            if (x >= slot.left && x < slot.right)
                return which = Page ? "box" : "tab-" which
        return ""
    }
    if ((x - Look.cogX) ** 2 + (y - Look.cogY) ** 2 <= (Look.cogR + 2) ** 2)
        return "cog"
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
    if (PanelGui && hwnd = PanelGui.Hwnd)
        return PanelClick()
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
        Drag.barTop := Look.pad, Drag.barH := Max(24 * Look.s, Drag.fixedH * Drag.fixedH / Max(1, View.total))
        ; Grabbing the bar keeps it where you grabbed it; clicking beside it jumps it there.
        bar := Anim.bar, pointY := my - Anim.y - Look.tabH   ; from the top of the box
        Drag.grab := bar && pointY >= bar.y && pointY < bar.y + bar.h ? pointY - bar.y : Drag.barH / 2
        ScrollToBar(pointY)
    }
    DllCall("SetCapture", "ptr", BoxGui.Hwnd)
    return 0
}

BoxMouseMove(wParam, lParam, msg, hwnd) {
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
    if !(Drag.mode && BoxGui && hwnd = BoxGui.Hwnd)
        return
    wasResizing := Drag.resizing
    Drag := {mode: "", resizing: false}
    if (msg != 0x215)
        DllCall("ReleaseCapture")
    SaveSettings()
    if SettingsGui
        FillSettings(Settings)   ; the settings window shows the new size too
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
    MonitorGetWorkArea(MonitorGetPrimary(), &areaLeft, &areaTop, &areaRight, &areaBottom)
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
        "resize-tr", 32643, "resize-bl", 32643, "tab-menu", 32649, "tab-chat", 32649, "tab-code", 32649)
    if (PanelGui && wParam = PanelGui.Hwnd && Anim.panelHot) {   ; a hand over the list's rows
        DllCall("SetCursor", "ptr", DllCall("LoadCursor", "ptr", 0, "ptr", 32649, "ptr"))
        return true
    }
    if (BoxGui && wParam = BoxGui.Hwnd && shapes.Has(Anim.hot)) {
        DllCall("SetCursor", "ptr", DllCall("LoadCursor", "ptr", 0, "ptr", shapes[Anim.hot], "ptr"))
        return true
    }
}

; Where the box goes: its corner of the main monitor, leaving out the taskbar, moved by however
; far you've dragged it from there (OffsetX, OffsetY).
BoxPosition(h) {
    MonitorGetWorkArea(MonitorGetPrimary(), &left, &top, &right, &bottom)
    m := Round(MARGIN * Look.s)
    return {x: (InStr(Settings.Corner, "left") ? left + m : right - Look.W - m) + Settings.OffsetX,
        y: (InStr(Settings.Corner, "bottom") ? bottom - h - m : top + m) + Settings.OffsetY}
}

PutBack() {
    Settings.OffsetX := Settings.OffsetY := 0
    SaveSettings()
    Kick()
}

; ---- Scrolling back -----------------------------------------------------------------

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
ClaudePart() {
    for part in Current.parts
        if (part.key = "claude")
            return part
    return ""
}

; Whether there's something above what the box is headed to show (t) that you haven't read, so
; the arrow at the top says so: the start of Claude's newest reply, or new words in the exchange
; before it (see UpdateCaptions). Scrolled back, the scroll bar says that instead, and once you've
; scrolled up to them, you've seen them.
MoreAbove(t) {
    if (View.scrolled || Drag.resizing)
        return false
    if (History.Length && History[History.Length].unseen)
        return true
    if (Current.sawTop || !(part := ClaudePart()))
        return false
    return Current.y + part.textY < t.bottom - t.h - 1
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
        Voice.loudAt := now   ; for when it's your turn to talk (see IsListening)
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

; ---- Animation ------------------------------------------------------------------

; Starts the animation if it isn't running, and has the box drawn again (something changed). The
; animation stops by itself once everything has settled.
Kick() {
    Anim.dirty := true
    if Anim.running
        return
    Anim.running := true, Anim.last := A_TickCount
    SetTimer(Frame, 10)
}

; One step of the animation: moves everything a little closer to where it's headed, and draws the box.
Frame() {
    Critical   ; so a new read of Claude's window waits until this frame is drawn
    now := A_TickCount, dt := Min(100, now - Anim.last), Anim.last := now
    smooth := Settings.Animate, easeMs := Look.motion.ease
    Anim.p := Approach(Anim.p, Anim.target, smooth ? dt / (Anim.target ? APPEAR_MS : DISAPPEAR_MS) : 1)
    Anim.hover := Approach(Anim.hover, Anim.hoverTarget, smooth ? dt / 150 : 1)
    t := ViewTarget()
    ; The view glides on a spring: scrolling back takes as long as the Scroll smoothness setting
    ; says, dragging the scroll bar follows the mouse closely, and live it keeps up at word speed.
    glideMs := !smooth ? 0 : Drag.mode = "scroll" ? 40 : View.scrolled ? SmoothMs() : easeMs * 2
    speed := View.bottomSpeed, View.bottom := Spring(View.bottom, t.bottom, &speed, dt, glideMs), View.bottomSpeed := speed
    speed := View.hSpeed, View.h := Spring(View.h, t.h, &speed, dt, glideMs), View.hSpeed := speed
    ; The arrow saying there's more of Claude's reply above comes and goes softly. Once you've
    ; scrolled up to the start of the reply, it stays away.
    if (View.scrolled && !Current.sawTop && (part := ClaudePart()) && Current.y + part.textY >= View.bottom - View.h - 1)
        Current.sawTop := true
    ; New words in the exchange before count as seen once you've scrolled up to them (or it all fits).
    if (History.Length && (prev := History[History.Length]).unseen && View.bottom - View.h < prev.y + (View.scrolled ? prev.height : 1))
        prev.unseen := false
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
    ; The list beside the box opens and closes softly, and while voice mode is listening for you, a
    ; blue light breathes at the bottom of the box.
    Anim.panel := Approach(Anim.panel, Anim.panelTarget, smooth ? dt / 180 : 1)
    listening := IsListening() ? 1 : 0
    Anim.listen := Approach(Anim.listen, listening, smooth ? dt / 400 : 1)
    moving := Anim.p != Anim.target || Anim.hover != Anim.hoverTarget || View.h != t.h || View.bottom != t.bottom
        || (smooth && now < Current.fadeUntil) || (Current.newAt && now - Current.newAt < NEW_BADGE_MS)
        || (Anim.liveAt && now - Anim.liveAt < LIVE_BADGE_MS)
        || Anim.above != above || (Anim.above && now - Anim.aboveAt < 3300) || slot && (Anim.tabLeft != slot.left || Anim.tabRight != slot.right)
        || Anim.panel != Anim.panelTarget || Anim.listen != listening
    ; The glow following Claude's voice, which is drawn up to 60 times a second while it moves.
    following := FollowFrame(now, dt, smooth)
    ; "Listening", "Thinking" and "Responding" pulse gently, which only needs drawing now and then
    ; (a little more often for the thinking dots).
    pulsing := Anim.target && (Current.note != "" || Current.youStatus != "" || Current.claudeStatus != "" || Current.work != "" || Current.queued != ""
        || Anim.listen > 0 || Anim.panel > 0)
    ; With nothing left to do, the last frame is drawn and the animation stops, unless Claude is
    ; talking, when the glow can move on at any moment.
    idle := !(moving || following || pulsing || Voice.on)
    if (moving || idle || Anim.dirty || following && now - Anim.lastDraw >= 16 || pulsing && now - Anim.lastDraw >= (Current.thinking || Anim.listen > 0 ? 40 : 100)) {
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

; Whether voice mode is listening for you: its mic is on, and Claude isn't talking, thinking, or
; writing a reply.
IsListening() => VoiceMode && VoiceMicLive && !Voice.on && A_TickCount - Voice.loudAt > 700 && !Current.thinking
    && Current.claudeStatus = ""

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
    global Brush, TextFormat, CenterFormat, Measurer, BoxGui, PanelGui
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
    ApplySettings()
}

; Works out sizes, fonts and colors from Settings, and lays the words out again to match.
ApplySettings() {
    global Look, Canvas, PanelCanvas
    Critical
    s := A_ScreenDPI / 96
    key := Settings.Font "|" Settings.FontSize   ; the fonts only change with these
    if (!Look || Look.key != key) {
        if Look
            FreeFonts(Look)
        px := Settings.FontSize * A_ScreenDPI / 72
        Look := {key: key, s: s, widths: Map()}
        ; What was said is in your font; the labels and indicators around it are always in
        ; LABEL_FONT, sized to go with it, so they look the same whatever font you pick.
        Look.font := MakeFont(Settings.Font, px, 0)
        Look.boldFont := MakeFont(Settings.Font, px, 1)
        Look.codeFont := MakeFont(FontExists("Cascadia Mono") ? "Cascadia Mono" : "Consolas", px * 0.9, 0)
        Look.labelFont := MakeFont(LABEL_FONT, Max(px * 0.72, 9 * s), 1)   ; bold
        Look.smallFont := MakeFont(LABEL_FONT, Max(px * 0.8, 9.5 * s), 0)
        icons := FontExists("Segoe Fluent Icons") ? "Segoe Fluent Icons" : FontExists("Segoe MDL2 Assets") ? "Segoe MDL2 Assets" : ""
        Look.cogFont := MakeFont(icons != "" ? icons : "Segoe UI Symbol", 15 * s, 0)
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
        Look.workIndent := Round(14 * s)
        ; Icons, lined up in a label's row: the badge's message, and (in icons) the tab's speech
        ; bubble for Chat and Cowork and brackets for Code, and the VOICE MODE tag's microphone.
        Look.icons := Map()
        if Look.iconFont {
            icon := Ink(Look.iconFont, Look.messageGlyph)
            Look.iconDy := (Look.labelH - icon.h) / 2 - icon.top
            for name, glyph in Map("chat", Chr(0xE8BD), "code", Chr(0xE943), "mic", Chr(0xE720), "menu", Chr(0xE700)) {
                icon := Ink(Look.iconFont, glyph)
                Look.icons[name] := {glyph: glyph, dy: (Look.labelH - icon.h) / 2 - icon.top, w: TextWidth(glyph, Look.iconFont)}
            }
        }
        Look.cornerSize := Round(14 * s), Look.gripW := Round(18 * s), Look.barZone := Round(14 * s)
        ; The tabs on top of the box (from its left: ☰, then Chat and Cowork, then Code), and the
        ; bubble around what you said on the Chat page (with Bubbles on).
        Look.tabH := Round(Look.labelH + 6 * s)
        Look.slots := Map(), x := Look.radius + 8 * s
        for which in ["menu", "chat", "code"] {
            w := TabWidth(which)
            Look.slots[which] := {left: x, right: x + w}
            x += w + 4 * s
        }
        Look.bubblePadX := Round(11 * s), Look.bubblePadY := Round(2 * s)
        ; The list beside the box: its width, the height of its heading and of each row, and its padding.
        Look.panelW := Round(260 * s), Look.panelHead := Round(Look.labelH + 12 * s)
        Look.rowH := Round(Look.smallH + 12 * s), Look.panelPad := Round(8 * s)
    }
    ; The width can change on its own (dragging a corner), without the fonts changing.
    Look.W := Round(Settings.Width * s), Look.inner := Look.W - 2 * Look.pad
    Look.cogR := 13 * s, Look.cogX := Look.W - Look.pad - 7 * s, Look.cogY := Look.pad + Look.labelH / 2
    Look.colors := Colors()
    Look.motion := Motion()
    tallest := Look.tabH + 2 * Look.pad + Settings.Lines * Look.lineH + Round(4 * s)   ; the tab, and the box at its tallest
    if (!Canvas || Canvas.w != Look.W || Canvas.h != tallest) {
        if Canvas
            FreeCanvas(Canvas)
        Canvas := MakeCanvas(Look.W, tallest)
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
    Place()
    SnapView()
    Critical "Off"
    Kick()
}

; The colors for the box: dark, light, or whichever Windows is using for apps.
Colors() {
    if (Settings.Theme = "Light" || (Settings.Theme = "Match Windows" && WindowsUsesLight()))
        return {light: true, bg: 0xFAF9F5, text: 0x1F1E1D, you: 0x2F6FD8, claude: 0xC15F3C, code: 0x9A3F22,
            edge: 0x000000, shadow: 0xFFFFFF}
    return {light: false, bg: 0x1F1E1D, text: 0xF5F4EE, you: 0x8AB4F8, claude: 0xE08A6D, code: 0xF2C4A8,
        edge: 0xFFFFFF, shadow: 0x000000}
}

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
    g := Canvas.g, c := Look.colors
    ; The box, sized to what it shows, and its window, which has room on top for the tab.
    hb := Min(Canvas.h - Look.tabH, Round(2 * Look.pad + View.h)), h := hb + Look.tabH
    enter := Entrance()
    pos := BoxPosition(h)
    pos.x += Round(InStr(Settings.Corner, "left") ? -enter.shift : enter.shift)
    Anim.x := pos.x, Anim.y := pos.y, Anim.h := h, Anim.lastDraw := A_TickCount
    DllCall("gdiplus\GdipGraphicsClear", "ptr", g, "uint", 0)
    ; While popping in or out, everything is drawn a little smaller, growing from the box's corner.
    DllCall("gdiplus\GdipResetWorldTransform", "ptr", g)
    if (enter.scale != 1) {
        ox := InStr(Settings.Corner, "left") ? 0 : Look.W, oy := InStr(Settings.Corner, "bottom") ? h : 0
        DllCall("gdiplus\GdipTranslateWorldTransform", "ptr", g, "float", -ox, "float", -oy, "int", 1)
        DllCall("gdiplus\GdipScaleWorldTransform", "ptr", g, "float", enter.scale, "float", enter.scale, "int", 1)
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
        DrawListening(hb)
    DrawConversation(Look.pad, hb - 2 * Look.pad, shadow)
    if (Anim.above > 0.01)
        DrawMoreAbove(shadow)
    if (Current.newAt && A_TickCount - Current.newAt < NEW_BADGE_MS)
        DrawNewBadge(Current)
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
        SetTimer(WatchMouse, 50)
    } else if (!alpha && Anim.shown) {
        DllCall("ShowWindow", "ptr", BoxGui.Hwnd, "int", 0)
        Anim.shown := false
        SetTimer(WatchMouse, 0)
        Anim.hover := Anim.hoverTarget := 0
        Anim.panel := Anim.panelTarget := 0   ; the list beside it closes too
        if (Anim.hot != "")
            Anim.hot := "", ClickThrough(true)
    }
    DrawPanel(enter.alpha)
}

; How the box looks partway through showing up (Anim.p heading to 1) or going away (heading to 0):
; how see-through it is, how big (Pop grows out of its corner), and how far it still has to slide
; in from the edge of the screen (Slide). Going away runs the same curve backwards, so it starts
; gently and finishes quickly.
Entrance() {
    p := Anim.p
    settle := 1 - (1 - p) ** 3   ; quick at first, then settling
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
        for part in ex.parts {
            y := top + ex.y + part.y - viewTop
            if (part.key = "work") {
                if (y < top + viewH && y + Look.smallH > top)
                    DrawWork(part.line, y, EdgeFade(edges, y, Look.smallH), shadow)
                continue
            }
            if (y < top + viewH && y + Look.labelH > top)
                DrawLabel(ex, part, y, EdgeFade(edges, y, Look.labelH), shadow)
            textTop := top + ex.y + part.textY - viewTop
            if part.dots {
                DrawDots(textTop, EdgeFade(edges, textTop, lineH))
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

; A part's label, like "YOU · 10:32 AM", "YOU · LISTENING" or "CLAUDE · RESPONDING". What's
; happening now pulses gently; the time is dimmer. While voice mode is on, what you're saying gets
; a VOICE MODE tag after its label, and while Claude reads its reply out loud, its label says
; SPEAKING. On the Chat page, what you said is on the right, and so is its label.
DrawLabel(ex, part, y, a, shadow) {
    color := Look.colors.%part.color%
    live := ex = Current, status := "", pulse := false
    switch part.key {
        case "note": status := "ON", pulse := true
        case "you": pulse := live && ex.youStatus != "", status := pulse ? ex.youStatus : ex.time
        case "queued": status := "QUEUED", pulse := true
        case "claude":
            if (live && Voice.on && Voice.ex = ex)
                status := "SPEAKING", pulse := true
            else
                pulse := live && ex.claudeStatus != "", status := pulse ? ex.claudeStatus : ex.replyTime
    }
    status := status != "" ? "·  " status : ""
    tag := live && part.key = "you" && VoiceMode ? "VOICE MODE" : ""
    labelW := TextWidth(part.label, Look.labelFont)
    width := labelW + (status != "" ? Look.labelSpace + TextWidth(status, Look.labelFont) : 0) + (tag != "" ? 8 * Look.s + TagWidth(tag) : 0)
    x := part.align = "right" ? Look.pad + Look.inner - width : Look.pad
    DrawWord(part.label, Look.labelFont, x, y + Look.labelDy, a, color, shadow)
    x += labelW
    if (status != "") {
        x += Look.labelSpace
        DrawWord(status, Look.labelFont, x, y + Look.labelDy, a * (pulse ? 0.7 + 0.3 * Cos(A_TickCount / 1800 * 6.2832) : 0.6), color, shadow)
        x += TextWidth(status, Look.labelFont)
    }
    if (tag != "")
        DrawTag(tag, x + 8 * Look.s, y, a, color)
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
; right corner, level with the tab, so it shows wherever in the reply the new words are and never
; covers any. It pops in, stays a moment, then fades away.
DrawNewBadge(ex) {
    s := Look.s, text := "NEW  ·  " ex.newTime
    iconW := Look.iconFont ? TextWidth(Look.messageGlyph, Look.iconFont) + 5 * s : 0
    w := 8 * s + iconW + TextWidth(text, Look.labelFont) + 8 * s
    DrawPill(Look.W - Look.pad - w, -Look.tabH + s, w, A_TickCount - ex.newAt, NEW_BADGE_MS, 1100, iconW, text, true)
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

; A pill that pops in (growing a touch from its right end), stays, and fades away over fadeMs
; before lastsMs is up: its label in Claude's color, after room (lead) for a message icon (if
; icon) or a dot. It sits on the box's own color, so what's under it doesn't
; show through. Returns how visible it is, from 0 to 1.
DrawPill(x, y, w, age, lastsMs, fadeMs, lead, text, icon := false) {
    s := Look.s, h := Look.labelH + 4 * s
    vis := age < 200 ? age / 200 : age > lastsMs - fadeMs ? (lastsMs - age) / fadeMs : 1
    vis := Max(0, Min(1, vis)), vis := vis * vis * (3 - 2 * vis)   ; soft at both ends
    grow := 0.9 + 0.1 * Min(1, age / 200), gx := x + w * (1 - grow), gy := y + h * (1 - grow) / 2
    FillRoundRect(gx, gy, w * grow, h * grow, h / 2, ARGB(vis * Max(0.85, Settings.Background / 100), Look.colors.bg))
    FillRoundRect(gx, gy, w * grow, h * grow, h / 2, ARGB(vis * 0.22, Look.colors.claude))
    if (icon && Look.iconFont)
        DrawWord(Look.messageGlyph, Look.iconFont, x + 8 * s, y + 2 * s + Look.iconDy, vis, Look.colors.claude, 0)
    DrawWord(text, Look.labelFont, x + 8 * s + lead, y + 2 * s + Look.labelDy, vis, Look.colors.claude, 0)
    return vis
}

; What Claude is doing, small and quiet under its reply, after a dot that breathes while it works.
DrawWork(line, y, a, shadow) {
    breathe := (Sin(A_TickCount / 1000 * 6.2832 / 1.6) + 1) / 2
    r := Look.smallH * 0.16
    FillCircle(Look.pad + r + Look.s, y + Look.smallH / 2, r * (0.8 + 0.3 * breathe), ARGB(a * (0.45 + 0.5 * breathe), Look.colors.claude))
    DrawWord(line, Look.smallFont, Look.pad + Look.workIndent, y + Look.smallDy, a * 0.6, Look.colors.text, shadow)
}

; Claude thinking: three dots, each swelling and rising in turn, like someone typing.
DrawDots(textTop, a) {
    r := Look.lineH * 0.15, t := A_TickCount / 1000
    loop 3 {
        wave := (Sin((t - A_Index * 0.18) * 6.2832 / 1.2) + 1) / 2
        FillCircle(Look.pad + r + (A_Index - 1) * r * 3.2, textTop + Look.lineH / 2 - wave * r * 0.7, r * (0.8 + 0.25 * wave),
            ARGB(a * (0.3 + 0.6 * wave), Look.colors.text))
    }
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

; The box's background (or, given w, another box that wide): a rectangle with rounded corners and
; a faint edge, with the tab on top of it (if there's a tab), all one shape.
RoundedBox(h, fill, edge, tab := "", w := 0) {
    w := w || Look.W
    path := tab ? TabbedPath(0.5, 0.5, w - 1, h - 1, Look.radius, tab) : RoundedPath(0.5, 0.5, w - 1, h - 1, Look.radius)
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
                    Anim.panelTarget ? Look.colors.claude : Look.colors.text, shadow)
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

; While voice mode is listening for you, a soft blue light breathes up from the bottom of the box,
; swelling as you talk, like the glow in Claude's own voice mode.
DrawListening(h) {
    static ends := Buffer(16)
    breathe := (Sin(A_TickCount / 1000 * 6.2832 / 2.4) + 1) / 2   ; a breath every 2.4 seconds
    strength := Min(1, Anim.listen * (0.5 + 0.3 * breathe + 0.5 * Min(1, Voice.mic * 3)))
    glowH := Min(h * 0.7, 80 * Look.s), top := h - glowH
    NumPut("float", 0, "float", top, "float", 0, "float", h, ends)
    DllCall("gdiplus\GdipCreateLineBrush", "ptr", ends, "ptr", ends.Ptr + 8, "uint", ARGB(0, Look.colors.you),
        "uint", ARGB(strength * 0.7, Look.colors.you), "int", 3, "ptr*", &brush := 0)
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
; page), as in Claude's sidebar: the one showing is highlighted, and each has a dot for what it's
; doing (orange and breathing while it runs, red if something went wrong). It slides out from the
; side of the box facing the middle of the screen, in its own window, since it takes clicks.
DrawPanel(enterAlpha) {
    global Canvas
    static showing := false
    if (Anim.panel <= 0 || enterAlpha <= 0) {
        if showing
            DllCall("ShowWindow", "ptr", PanelGui.Hwnd, "int", 0), showing := false
        return
    }
    s := Look.s, c := Look.colors, list := Sessions.list, rows := Min(list.Length, PANEL_ROWS)
    w := Look.panelW, h := Look.panelHead + Max(1, rows) * Look.rowH + Look.panelPad
    settle := 1 - (1 - Anim.panel) ** 3, slide := (1 - settle) * 16 * s
    x := Round(InStr(Settings.Corner, "left") ? Anim.x + Look.W + 8 * s - slide : Anim.x - w - 8 * s + slide)
    y := Anim.y + Look.tabH
    Anim.panelX := x, Anim.panelY := y, Anim.panelH := h
    saved := Canvas, Canvas := PanelCanvas   ; the drawing helpers draw on Canvas
    DllCall("gdiplus\GdipGraphicsClear", "ptr", Canvas.g, "uint", 0)
    solid := Max(0.92, Settings.Background / 100)   ; solid enough to read over anything
    RoundedBox(h, ARGB(solid, c.bg), ARGB(solid * 0.12, c.edge), "", w)
    pad := Look.panelPad + 6 * s
    DrawWord(Page = "chat" ? "CHATS" : "SESSIONS", Look.labelFont, pad, (Look.panelHead - Look.labelH) / 2 + 2 * s + Look.labelDy, 0.55, c.text, 0)
    if !rows
        DrawWord("Open Claude's sidebar to see them here", Look.smallFont, pad, Look.panelHead + (Look.rowH - Look.smallH) / 2 + Look.smallDy, 0.5, c.text, 0)
    breathe := (Sin(A_TickCount / 1000 * 6.2832 / 1.6) + 1) / 2
    loop rows {
        row := list[A_Index], top := Look.panelHead + (A_Index - 1) * Look.rowH
        here := row.title == Sessions.current, hot := Anim.panelHot = A_Index
        if (here || hot)
            FillRoundRect(Look.panelPad, top + 2 * s, w - 2 * Look.panelPad, Look.rowH - 4 * s, 7 * s, here ? ARGB(0.18, c.claude) : ARGB(0.08, c.text))
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
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(a * (Anim.hot = "cog" ? 0.24 : 0.10), c.text))
    DllCall("gdiplus\GdipFillEllipse", "ptr", Canvas.g, "ptr", Brush, "float", Look.cogX - r, "float", Look.cogY - r, "float", 2 * r, "float", 2 * r)
    NumPut("float", Look.cogX - r, "float", Look.cogY - r, "float", 2 * r, "float", 2 * r, spot)
    DllCall("gdiplus\GdipSetSolidFillColor", "ptr", Brush, "uint", ARGB(Anim.hover * 0.9, c.text))
    DllCall("gdiplus\GdipDrawString", "ptr", Canvas.g, "wstr", Look.cogGlyph, "int", -1, "ptr", Look.cogFont.font, "ptr", spot, "ptr", CenterFormat, "ptr", Brush)
    ; Above it, level with the tab, a hint that the wheel scrolls back, when there's something
    ; earlier to see and the "new message" badge isn't there.
    if (!View.scrolled && HasEarlier() && !(Current.newAt && A_TickCount - Current.newAt < NEW_BADGE_MS)) {
        hint := "SCROLL FOR EARLIER"
        x := Look.W - Look.pad - TextWidth(hint, Look.labelFont)
        if (x > Look.slots["code"].right + 10 * s)
            DrawWord(hint, Look.labelFont, x, -Look.tabH + (Look.tabH - Look.labelH) / 2 + s + Look.labelDy, Anim.hover * 0.5, c.text, 0)
    }
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
    DllCall("gdiplus\GdipSetTextRenderingHint", "ptr", g, "int", 4)   ; smooth text that works on a see-through background
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
    HideAfter: HIDE_AFTER, FollowVoice: FOLLOW_VOICE ? 1 : 0, GlowDelay: GLOW_DELAY, Bubbles: BUBBLES ? 1 : 0, OffsetX: 0, OffsetY: 0}

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

OpenSettings(*) {
    global SettingsGui, SettingsControls
    if SettingsGui {
        SettingsGui.Show()
        return
    }
    g := Gui("+AlwaysOnTop -MinimizeBox", "Claude captions " CAPTIONS_VERSION)
    g.SetFont("s10", "Segoe UI")
    g.MarginX := 20, g.MarginY := 16
    c := {}
    g.Add("Text", "xm", "Font")
    c.Font := g.Add("ComboBox", "xm w250 r16", FontList())
    c.FontSize := g.Add("Edit", "x+8 yp w70 Number")
    g.Add("UpDown", "Range8-40")
    g.Add("Text", "xm y+16", "Colors")
    c.Theme := g.Add("DropDownList", "xm w328", THEMES)
    g.Add("Text", "xm y+16", "Background")
    c.Background := g.Add("Slider", "xm w250 Range0-100 NoTicks")
    c.BackgroundText := g.Add("Text", "x+8 yp+4 w70")
    g.Add("Text", "xm y+12", "Corner of the screen")
    c.Corner := g.Add("DropDownList", "xm w328", CORNERS)
    g.Add("Text", "xm y+16", "Width")
    c.Width := g.Add("Slider", "xm w250 Range300-900 NoTicks")
    c.WidthText := g.Add("Text", "x+8 yp+4 w70")
    g.Add("Text", "xm y+12", "Lines tall (scroll for more)")
    c.Lines := g.Add("Edit", "xm w70 Number")
    g.Add("UpDown", "Range4-30")
    g.Add("Text", "xm y+16", "Hide the box after")
    c.HideAfter := g.Add("DropDownList", "xm w328", HIDE_CHOICES)
    c.FollowVoice := g.Add("Checkbox", "xm y+16", "In voice mode, light up each word as Claude says it")
    c.GlowLabel := g.Add("Text", "xm+18 y+8", "Glow timing (slide right if it runs ahead of the voice)")
    c.GlowDelay := g.Add("Slider", "xm+18 w232 Range0-600 Line10 Page50 TickInterval100")
    c.GlowDelayText := g.Add("Text", "x+8 yp+4 w90")
    c.Bubbles := g.Add("Checkbox", "xm y+10", "On the Chat page, put what you say in bubbles")
    c.Animate := g.Add("Checkbox", "xm y+10", "Words fade in and the box moves smoothly")
    g.Add("Text", "xm y+12", "Word speed")
    c.WordSpeed := g.Add("Slider", "xm w250 Range1-10 TickInterval1")
    c.WordSpeedText := g.Add("Text", "x+8 yp+4 w90")
    c.SmoothLabel := g.Add("Text", "xm y+12", "Scroll smoothness")
    c.ScrollSmooth := g.Add("Slider", "xm w250 Range1-10 TickInterval1")
    c.ScrollSmoothText := g.Add("Text", "x+8 yp+4 w90")
    c.AppearLabel := g.Add("Text", "xm y+12", "How the box shows up")
    c.Appear := g.Add("DropDownList", "xm w328", APPEAR_STYLES)
    g.Add("Button", "xm y+20 w150", "Reset to defaults").OnEvent("Click", ResetSettings)
    g.Add("Button", "x+78 w100 Default", "Done").OnEvent("Click", CloseSettings)
    g.OnEvent("Close", CloseSettings)
    g.OnEvent("Escape", CloseSettings)
    SettingsGui := g, SettingsControls := c
    FillSettings(Settings)
    for name, ctl in c.OwnProps()
        if (ctl.Type != "Text")
            ctl.OnEvent(ctl.Type = "CheckBox" ? "Click" : "Change", SettingsChanged)
    g.Show()
    UpdateCaptions()   ; shows the box, with an example if there's no conversation to show
}

; Puts settings into the settings window.
FillSettings(st) {
    global Filling
    c := SettingsControls
    Filling := true
    c.Font.Text := st.Font
    c.FontSize.Value := st.FontSize
    c.Theme.Choose(st.Theme)
    c.Background.Value := st.Background
    c.Corner.Choose(st.Corner)
    c.Width.Value := st.Width
    c.Lines.Value := st.Lines
    c.HideAfter.Value := HideChoice(st.HideAfter)
    c.FollowVoice.Value := st.FollowVoice
    c.GlowDelay.Value := st.GlowDelay
    c.Bubbles.Value := st.Bubbles
    c.Animate.Value := st.Animate
    c.WordSpeed.Value := st.WordSpeed
    c.ScrollSmooth.Value := st.ScrollSmooth
    c.Appear.Choose(st.Appear)
    ShowSliderValues()
    Filling := false
}

; Reads the settings window, and shows and saves each change right away.
SettingsChanged(*) {
    c := SettingsControls
    if (Filling || !c)
        return
    typed := Trim(c.Font.Text)
    if (typed != "" && FontExists(typed))   ; skips half-typed names
        Settings.Font := typed
    Settings.FontSize := Whole(c.FontSize.Value, 8, 40, Settings.FontSize)
    Settings.Theme := c.Theme.Text
    Settings.Background := c.Background.Value
    if (c.Corner.Text != Settings.Corner)
        Settings.OffsetX := Settings.OffsetY := 0   ; a new corner: the box goes right into it
    Settings.Corner := c.Corner.Text
    Settings.Width := c.Width.Value
    Settings.Lines := Whole(c.Lines.Value, 4, 30, Settings.Lines)
    Settings.HideAfter := HIDE_SECONDS[c.HideAfter.Value]
    if (c.FollowVoice.Value && !Settings.FollowVoice)
        SetTimer(DemoVoice, -10)   ; shows what it looks like
    Settings.FollowVoice := c.FollowVoice.Value
    Settings.GlowDelay := c.GlowDelay.Value
    Settings.Bubbles := c.Bubbles.Value
    Settings.Animate := c.Animate.Value
    Settings.WordSpeed := c.WordSpeed.Value
    Settings.ScrollSmooth := c.ScrollSmooth.Value
    style := c.Appear.Text
    if (style != Settings.Appear) {
        Settings.Appear := style
        SetTimer(ShowAppearing, -10)   ; plays the new style so you can see it
    }
    ShowSliderValues()
    SaveSettings()
    ApplySettings()
}

; Hides the box and brings it back, to show off how it shows up.
ShowAppearing() {
    Anim.p := 0, Anim.last := A_TickCount
    ReplayWords()
    Kick()
}

ShowSliderValues() {
    static speeds := ["Slowest", "Very slow", "Slow", "Relaxed", "Medium", "Brisk", "Quick", "Faster", "Very fast", "Fastest"]
    static smoothness := ["Snappiest", "Snappy", "Quick", "Brisk", "Easy", "Smooth", "Smoother", "Silky", "Buttery", "Floaty"]
    c := SettingsControls, bg := c.Background.Value
    c.BackgroundText.Text := bg = 0 ? "Words only" : bg = 100 ? "Solid" : bg "%"
    c.WidthText.Text := c.Width.Value " px"
    c.WordSpeedText.Text := speeds[c.WordSpeed.Value]
    c.ScrollSmoothText.Text := smoothness[c.ScrollSmooth.Value]
    c.GlowDelayText.Text := c.GlowDelay.Value " ms later"
    for ctl in [c.GlowLabel, c.GlowDelay, c.GlowDelayText]
        ctl.Enabled := c.FollowVoice.Value   ; only matters when the words light up
    for ctl in [c.WordSpeed, c.WordSpeedText, c.SmoothLabel, c.ScrollSmooth, c.ScrollSmoothText, c.Appear, c.AppearLabel]
        ctl.Enabled := c.Animate.Value   ; these only matter when things move
}

ResetSettings(*) {
    Settings.OffsetX := Settings.OffsetY := 0
    FillSettings(DefaultSettings())
    SettingsChanged()
}

CloseSettings(*) {
    global SettingsGui, SettingsControls, Shown
    if !SettingsGui
        return
    SettingsGui.Destroy()
    SettingsGui := "", SettingsControls := ""
    Shown := {you: "", claude: "", live: false, streaming: false, thinking: false, work: ""}   ; from the example back to the conversation
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
}
