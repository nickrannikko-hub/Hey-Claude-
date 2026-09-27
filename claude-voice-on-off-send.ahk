; Stream Deck button: Claude voice mode or dictation, on/off, with dictation sent automatically
;
; Same as claude-voice-on-off.ahk, except that when dictation ends, your words are sent.
;
; Chat and Cowork page: toggles voice mode in the chat that's showing.
; Code page, or anywhere voice mode isn't available: toggles dictation, which types what you
; say into the message box. Dictation ends by itself once you've been quiet for 2 seconds,
; then the message is sent. Pressing the button again ends dictation right away and sends it too.
;
; It keeps the conversation going: once Claude has finished replying, it beeps and listens again
; for your next message. The conversation ends when you:
;   - end a message with a sign-off like "goodbye", "bye", "I'm done" or "that's all"
;     (a message that's only a sign-off, like "Okay, I'm done.", isn't sent)
;   - don't start talking within 7 seconds of the beep
;   - press the button again, or switch to another page or chat
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.
; If something goes wrong, a message pops up and the details are saved in
; claude-voice-on-off-send-log.txt next to this file.
;
; claude-hey-claude.ahk borrows this script's code and calls RunVoiceButton(true), which only turns
; voice mode or dictation on, and leaves them alone if they're already on. Running this script with
; "start-only" does the same. The listener turns conversation mode off: one message per "Hey Claude".

#Requires AutoHotkey v2.0 64-bit
#SingleInstance Force   ; a second press replaces a running one, so it can end dictation early
#NoTrayIcon

; ---- Settings ---------------------------------------------------------------
SILENCE_MS     := 2000    ; end dictation after this much quiet (milliseconds)
FIRST_WORDS_MS := 7000    ; end dictation if you haven't started talking within this long
VOICE_LEVEL    := 0.02    ; mic level that counts as talking (0 to 1), at the least: talking also has to be well above
                          ; the room's own noise (see WatchForSilence). Raise it if background noise keeps dictation going
MAX_TALK_MS    := 180000  ; however it seems, stop dictation (and send what was said) after this long (milliseconds)
BEEP_WHEN_READY := true   ; beep once dictation is listening, so you know when to talk
KEEP_GOING_MS  := 1000    ; conversation mode: once Claude has finished replying, listen again this long after (ms). 0 = off (claude-hey-claude.ahk turns it off)
NEXT_WORDS_MS  := 7000    ; in conversation mode, how long it waits for your next message before it stops listening
; In conversation mode, a message ending with one of these ends the conversation. A message that's
; nothing but a sign-off (like "Okay, I'm done.") isn't sent. Longer phrases go before shorter ones
; they contain (like "see you later" before "see you").
SIGN_OFFS := ["talk to you later", "see you later", "talk later", "see you", "see ya", "good night",
    "bye bye", "goodbye", "good bye", "bye", "i'm done", "i am done", "we're done", "all done",
    "that's all", "that is all", "stop listening", "end conversation"]
CLAUDE_APP := "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"    ; how Windows starts the Claude app
LOG_FILE   := A_ScriptDir "\claude-voice-on-off-send-log.txt"
STATE_FILE := A_Temp "\claude-voice-on-off.ini"                 ; shared with claude-voice-on-off.ahk
; -----------------------------------------------------------------------------

; UI Automation lets the script find Claude's buttons by their names instead of by screen position.
; If Claude's window stops answering for a moment, each request gives up after 4 seconds instead of
; Windows' usual 20, so nothing hangs that long (like "Hey Claude" not hearing you meanwhile).
UIA := ComObject("{e22ad333-b25f-460c-83d0-0581107395c9}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")   ; CUIAutomation8
try ComCall(63, ComObjQuery(UIA, "{34723aff-0c9d-49d0-9896-7ab52df8cd8a}"), "uint", 4000)   ; IUIAutomation2 TransactionTimeout
UIA_BUTTON := 50000, UIA_EDIT := 50004, UIA_RADIO := 50013, UIA_TEXT := 50020, UIA_GROUP := 50026
LogLines := []

if (A_LineFile = A_ScriptFullPath)
    Main()

Main() => RunVoiceButton(A_Args.Length && A_Args[1] = "start-only")

; Does what one press of the button does. With startOnly, it only turns voice mode or
; dictation on, and leaves them alone if they're already on.
RunVoiceButton(startOnly := false) {
    LogLines.Length := 0
    Log("Starting")
    DllCall("SetThreadDpiAwarenessContext", "ptr", -4, "ptr")   ; work in real screen pixels
    try {
        hwnd := OpenClaude()
        Log("Claude is in front")
        ; Right after launch the page needs a moment to load.
        if !WaitFor(() => FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork"), 20000)
            throw Error("Couldn't read Claude's window. It may still be loading, so try the button again.")

        dictating := FindButton(hwnd, IsDictationStop)
        if (startOnly && dictating) {
            Log("Dictation is already on")
        } else if (!startOnly && !dictating && IniRead(STATE_FILE, "conversation", "active", 0) = 1) {
            ; A "Hey Claude" conversation is pausing between messages; this press ends it.
            IniWrite(0, STATE_FILE, "conversation", "active")
            Log("Ended the conversation")
        } else if !OnChatPage(hwnd) {
            Log("On the Code page, so using dictation")
            ToggleDictation(hwnd)
        } else if dictating {
            ToggleDictation(hwnd)
        } else if VoiceIsOn(hwnd) {
            if startOnly
                Log("Voice mode is already on")
            else
                StopVoice(hwnd)
        } else {
            ; Wait for the message box's mic buttons, so a page that's still loading
            ; isn't mistaken for one without voice mode.
            WaitFor(() => FindButton(hwnd, IsMicButton), 8000)
            if (voiceBtn := FindButton(hwnd, n => n == "Use voice mode")) {
                StartVoice(hwnd, voiceBtn)
            } else {
                Log("Voice mode isn't available here, so using dictation")
                ToggleDictation(hwnd)
            }
        }
    } catch as err {
        Log("FAILED: " err.Message)
        try Log("Switches Claude showed: " JoinNames(GetElements(FindClaudeWindow(), UIA_RADIO)))
        try Log("Buttons Claude showed: " JoinNames(GetElements(FindClaudeWindow(), UIA_BUTTON)))
        WriteLog()
        MsgBox(err.Message "`n`nDetails: " LOG_FILE, "Claude voice button", "Icon! T20")
        return
    }
    WriteLog()
}

; ---- Dictation --------------------------------------------------------------

ToggleDictation(hwnd) {
    if (stopBtn := FindButton(hwnd, IsDictationStop)) {
        PressButton(stopBtn.el)
        Log("Dictation stopped")
        try IniDelete(STATE_FILE, "conversation")   ; this press also ends any conversation it was part of
        SendWhenTranscribed(hwnd, IniRead(STATE_FILE, "dictation", "textBefore", ""), 8000)
        return
    }
    if !(dictateBtn := WaitFor(() => FindButton(hwnd, n => n == "Dictate"), 8000)) {
        if FindButton(hwnd, n => n == "Press and hold to record")
            throw Error("Claude's mic is set to 'Hold to record'. Turn that off in Dictation settings "
                . "(the arrow next to the mic) so this button can switch dictation on and off.")
        throw Error("Couldn't find Claude's 'Dictate' button.")
    }
    ; Conversation mode: after sending, listen again for your next message. It ends when you don't
    ; say anything, say a sign-off like "goodbye", or when the button or something else stops it.
    ; The "active" flag lets a button press during the pause between messages end it too.
    ; It also stays where it started: switching page, chat or session ends it, and nothing new
    ; turns on in the place you switched to.
    if KEEP_GOING_MS
        IniWrite(1, STATE_FILE, "conversation", "active")
    startedIn := WhereAmI(hwnd)
    try {
        firstWordsMs := FIRST_WORDS_MS
        loop {
            ; Remember what was already in the message box, so only new words trigger a send.
            textBefore := PromptText(hwnd)
            IniWrite(textBefore, STATE_FILE, "dictation", "textBefore")
            StartDictation(hwnd, dictateBtn)
            watch := WatchForSilence(hwnd, firstWordsMs)
            if !watch.talked {
                Log("Nothing was said, so nothing was sent")
            } else {
                text := WaitForTranscript(hwnd, textBefore, 15000)
                if (KEEP_GOING_MS && textBefore = "" && IsOnlySignOff(text)) {
                    PressInMessageBox(hwnd, "^a{Delete}")
                    Log("Heard '" text "', so the conversation is over (not sent)")
                    return
                }
                if (text != "") {
                    PressInMessageBox(hwnd, "{Enter}")
                    Log("Sent: " text)
                }
                if (KEEP_GOING_MS && EndsWithSignOff(text)) {
                    Log("You signed off, so the conversation is over")
                    return
                }
            }

            if (!KEEP_GOING_MS || watch.ended != "quiet")
                return
            ; Listen again only once Claude has finished replying, so you don't talk over the reply.
            if !WaitForReply(hwnd, startedIn)
                return
            Sleep KEEP_GOING_MS
            if !StillInConversation(hwnd, startedIn)
                return
            if !(dictateBtn := WaitFor(() => FindButton(hwnd, n => n == "Dictate"), 3000)) {
                Log("Ended the conversation: couldn't find 'Dictate' to listen again")
                return
            }
            Log("Listening again for your next message")
            firstWordsMs := NEXT_WORDS_MS
        }
    } finally {
        if KEEP_GOING_MS
            try IniDelete(STATE_FILE, "conversation")
    }
}

; True when the message ends with a sign-off phrase, like "...thanks, bye." Words tacked on
; after it, like "Claude" or "for now", don't count.
EndsWithSignOff(text) {
    words := PlainWords(text)
    loop 3
        for tail in ["claude", "for now", "then", "thanks", "thank you"]
            if (SubStr(words, -StrLen(tail) - 1) = " " tail)
                words := SubStr(words, 1, StrLen(words) - StrLen(tail) - 1)
    for phrase in SIGN_OFFS
        if (words = phrase || SubStr(words, -StrLen(phrase) - 1) = " " phrase)
            return true
    return false
}

; True when the message is nothing but a sign-off, like "Okay, I'm done."
IsOnlySignOff(text) {
    if !EndsWithSignOff(text)
        return false
    rest := " " PlainWords(text) " "
    loop 3 {
        for phrase in SIGN_OFFS
            rest := StrReplace(rest, " " phrase " ", " ")
        for filler in ["okay", "ok", "alright", "all right", "thanks", "thank you", "so", "well", "yeah", "yes", "claude", "hey", "and", "for now", "now", "then"]
            rest := StrReplace(rest, " " filler " ", " ")
    }
    return Trim(rest) = ""
}

; Just the lowercase words, for comparing what you said with the sign-off phrases.
PlainWords(text) => Trim(RegExReplace(RegExReplace(StrLower(StrReplace(text, "’", "'")), "[^a-z' ]+", " "), " +", " "))

; Waits until Claude has finished replying: its Stop button shows while it's working and goes away
; when it's done. Returns false if the conversation ended in the meantime.
WaitForReply(hwnd, startedIn) {
    WaitFor(() => FindButton(hwnd, IsStopReplyButton), 5000)   ; give the reply a moment to start
    Log("Waiting for Claude to finish replying")
    loop {
        if !StillInConversation(hwnd, startedIn)
            return false
        if !FindButton(hwnd, IsStopReplyButton)
            return true
        Sleep 500
    }
}

; False once the conversation should end: the button was pressed, or you (or Claude) switched
; to another page, chat or session.
StillInConversation(hwnd, startedIn) {
    if (IniRead(STATE_FILE, "conversation", "active", 0) != 1) {
        Log("The conversation was ended with the button")
        return false
    }
    now := WhereAmI(hwnd)
    if (now.page != startedIn.page) {
        Log("Switched from the " startedIn.page " page to the " now.page " page, so the conversation is over")
        return false
    }
    if (now.title != startedIn.title) {
        if !startedIn.renameOk {
            Log("Switched from '" startedIn.title "' to '" now.title "', so the conversation is over")
            return false
        }
        ; A brand-new chat just got its title from your first message; that's not a switch.
        startedIn.title := now.title, startedIn.renameOk := false
    }
    return true
}

; Where the conversation is: the page, the chat or session title (from the "<title>, rename ..."
; button at the top), and whether that chat was still empty. A new chat gets its title from the
; first message, so one title change is expected then.
WhereAmI(hwnd) {
    header := FindButton(hwnd, n => InStr(n, ", rename "))
    return {page: OnChatPage(hwnd) ? "Chat and Cowork" : "Code",
        title: header ? RegExReplace(header.name, ", rename .*$") : "",
        renameOk: !FindButton(hwnd, n => InStr(n, "Show message actions"))}
}

IsStopReplyButton(name) => name ~= "^Stop( response| generating)?$"

StartDictation(hwnd, dictateBtn) {
    PressButton(dictateBtn.el)
    if !WaitFor(() => FindButton(hwnd, IsDictationStop), 3000) {
        Log("Dictation didn't start from the button press, trying a real click")
        ClickEl(dictateBtn.el, hwnd)
        if !WaitFor(() => FindButton(hwnd, IsDictationStop), 3000)
            throw Error("Pressed 'Dictate' but dictation didn't start.")
    }
    Log("Dictation started")
    if BEEP_WHEN_READY
        SoundBeep(1200, 80)
}

; Ends dictation once you've been quiet for SILENCE_MS after talking, or if you haven't started
; talking within firstWordsMs, or after MAX_TALK_MS whatever happens. Talking is what's louder than
; VOICE_LEVEL and well above the room's own noise: the quietest moment of the last two seconds
; (there are gaps between words even while you talk), so a noisy room (a fan, a video playing)
; doesn't sound like talking that never ends. Returns how it ended ("quiet", "no talking", "too
; long", or "stopped" when something else ended it) and whether any talking was heard.
WatchForSilence(hwnd, firstWordsMs) {
    meter := OpenMicMeter()
    start := A_TickCount, lastVoice := 0, lastCheck := A_TickCount
    quietMax := 0.0, voiceMax := 0.0, recent := []
    loop {
        Sleep 100
        ComCall(3, meter, "float*", &level := 0)   ; GetPeakValue
        recent.Push(level)
        if (recent.Length > 20)
            recent.RemoveAt(1)
        noise := level
        for v in recent
            noise := Min(noise, v)
        if (level >= Max(VOICE_LEVEL, Min(0.15, noise * 2.5)))
            lastVoice := A_TickCount, voiceMax := Max(voiceMax, level)
        else
            quietMax := Max(quietMax, level)
        if (A_TickCount - start >= MAX_TALK_MS) {
            Log("Still hearing talking after " MAX_TALK_MS // 1000 " s, so dictation was stopped")
            ended := "too long"
            break
        }

        if (lastVoice && A_TickCount - lastVoice >= SILENCE_MS) {
            Log("Quiet for " SILENCE_MS " ms after talking")
            ended := "quiet"
            break
        }
        if (!lastVoice && A_TickCount - start >= firstWordsMs) {
            Log("Heard no talking within " firstWordsMs " ms")
            ended := "no talking"
            break
        }
        ; Stop watching if dictation was ended some other way, like clicking the mic.
        if (A_TickCount - lastCheck >= 500) {
            lastCheck := A_TickCount
            if !FindButton(hwnd, IsDictationStop) {
                Log("Dictation was already stopped")
                LogLevels(quietMax, voiceMax)
                return {ended: "stopped", talked: lastVoice != 0}
            }
        }
    }
    LogLevels(quietMax, voiceMax)
    if (stopBtn := FindButton(hwnd, IsDictationStop)) {
        PressButton(stopBtn.el)
        Log("Dictation stopped")
    }
    return {ended: ended, talked: lastVoice != 0}
}

; Waits for your words to show up in the message box, then sends it with Enter.
SendWhenTranscribed(hwnd, textBefore, timeoutMs) {
    if ((text := WaitForTranscript(hwnd, textBefore, timeoutMs)) != "") {
        PressInMessageBox(hwnd, "{Enter}")
        Log("Sent: " text)
    }
}

; Waits for your words to show up in the message box and returns the text, or "" if no new words came.
; Turning speech into text can take a moment after dictation stops, so wait until the text settles.
WaitForTranscript(hwnd, textBefore, timeoutMs) {
    try IniDelete(STATE_FILE, "dictation", "textBefore")
    deadline := A_TickCount + timeoutMs
    last := PromptText(hwnd), settledSince := A_TickCount
    loop {
        Sleep 200
        text := PromptText(hwnd)
        if (text != last) {
            last := text, settledSince := A_TickCount
            continue
        }
        if (text != "" && text != textBefore && A_TickCount - settledSince >= 1000)
            return text
        if (A_TickCount > deadline) {
            Log("No new words showed up in the message box, so nothing was sent")
            return ""
        }
    }
}

; Brings Claude to the front, puts the cursor in the message box, and presses keys there.
PressInMessageBox(hwnd, keys) {
    if !(box := PromptBox(hwnd))
        throw Error("Couldn't find Claude's message box, so no keys were pressed.")
    if !WinActive(hwnd)
        WinActivate hwnd
    if !WinActive(hwnd)
        throw Error("Couldn't bring Claude to the front. Anything you said is still in the message box.")
    ComCall(3, box.el)   ; SetFocus
    Sleep 100
    ; Only press keys once the message box really has the cursor, so they can't land anywhere else.
    if !HasFocus(box.el)
        throw Error("Couldn't put the cursor in Claude's message box, so no keys were pressed.")
    Send keys
}

; Claude's message box. It's picked by what it is rather than where it is on the page, because
; other text boxes can be there too, like a code file open next to the chat.
PromptBox(hwnd) {
    for item in GetElements(hwnd, UIA_EDIT)
        if (item.name == "Prompt" || item.name ~= "i)prompt to Claude|^Reply to Claude" || InStr(ElementClass(item.el), "ProseMirror"))
            return item
    return ""
}

; The text in the message box, with spacing tidied.
PromptText(hwnd) {
    if !(box := PromptBox(hwnd))
        return ""
    if !(pattern := GetPattern(box.el, 10002, "{a94cd8b1-0844-4cd6-9d2d-640537ab39e9}"))
        return ""
    ComCall(4, pattern, "ptr*", &bstr := 0)   ; CurrentValue
    text := bstr ? StrGet(bstr, "UTF-16") : ""
    DllCall("OleAut32\SysFreeString", "ptr", bstr)
    return Trim(RegExReplace(text, "\s+", " "))
}

LogLevels(quietMax, voiceMax) {
    Log(Format("Mic levels: loudest quiet {:.4f}, loudest talking {:.4f} (talking counts from {})", quietMax, voiceMax, VOICE_LEVEL))
    if (quietMax = 0 && voiceMax = 0)
        Log("The mic meter read nothing. Claude may be using a different microphone than Windows' default one.")
}

; Windows' level meter for the default microphone, which Claude uses unless you picked another in Dictation settings.
OpenMicMeter() {
    devices := ComObject("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")   ; MMDeviceEnumerator
    ComCall(4, devices, "int", 1, "int", 0, "ptr*", &p := 0)   ; GetDefaultAudioEndpoint(capture, console)
    mic := ComPtr(p)
    iid := Buffer(16)
    DllCall("ole32\CLSIDFromString", "wstr", "{C02216F6-8C67-4B5B-9D00-D008E73E0064}", "ptr", iid)   ; IAudioMeterInformation
    ComCall(3, mic, "ptr", iid, "uint", 23, "ptr", 0, "ptr*", &p := 0)   ; Activate
    return ComPtr(p)
}

IsMicButton(name) => name == "Use voice mode" || name == "Dictate" || IsDictationStop(name)

; The button that ends dictation while it's on: "Stop dictation" on the Code page,
; "Finish dictation" on the Chat and Cowork page.
IsDictationStop(name) => name == "Stop dictation" || name == "Finish dictation"

; ---- Voice mode -------------------------------------------------------------

StartVoice(hwnd, voiceBtn) {
    before := ButtonNames(hwnd)
    Sleep 400   ; let the chat finish settling before clicking
    ClickEl(voiceBtn.el, hwnd)
    Log("Clicked 'Use voice mode'")
    SaveState(true, hwnd, false)   ; saved right away in case the button is pressed again quickly

    ; Note what voice mode looks like, so the next press can tell whether it's still on.
    Sleep 2500
    after := ButtonNames(hwnd)
    startHides := !after.Has("Use voice mode")
    appeared := []
    for name in after
        if !before.Has(name)
            appeared.Push(name)
    Log("During voice mode the 'Use voice mode' button " (startHides ? "disappears" : "stays"))
    Log("Buttons that appeared: " JoinNames(appeared))
    SaveState(true, hwnd, startHides)
}

StopVoice(hwnd) {
    if (endBtn := FindButton(hwnd, IsEndVoiceButton)) {
        Log("Clicking '" endBtn.name "'")
        ClickEl(endBtn.el, hwnd)
    } else if (FindButton(hwnd, IsVoiceModeControl) && (stopBtn := FindButton(hwnd, n => n == "Stop"))) {
        ; During voice mode, the chat's Stop button ends it.
        Log("Clicking 'Stop'")
        ClickEl(stopBtn.el, hwnd)
        if WaitFor(() => !FindButton(hwnd, IsVoiceModeControl), 2000) {
            SaveState(false)
            return
        }
        Log("Voice mode is still on after clicking 'Stop', pressing Esc too")
        if (box := PromptBox(hwnd))
            try ComCall(3, box.el)   ; SetFocus
        Send "{Esc}"
    } else {
        ; Esc ends voice mode in the chat box. Only press it on the Chat page:
        ; on the Code page, Esc would interrupt a running session.
        if !OnChatPage(hwnd)
            throw Error("Claude isn't on the Chat and Cowork page, so voice mode wasn't ended.")
        ; Put the cursor in the message box if it's showing (voice mode can hide it). Esc can't
        ; change any text, so it's fine to press even when the message box isn't there.
        if (box := PromptBox(hwnd))
            try ComCall(3, box.el)   ; SetFocus
        if !WinActive(hwnd)
            WinActivate hwnd
        if !WinActive(hwnd)
            throw Error("Couldn't bring Claude to the front to end voice mode.")
        Log("No end button found, pressing Esc")
        Send "{Esc}"
    }
    SaveState(false)
}

; Voice mode counts as on if its controls are showing, and off if "Use voice mode" is showing.
; Only when neither shows (like while the page loads) does it go by what the last press did.
VoiceIsOn(hwnd) {
    if (endBtn := FindButton(hwnd, IsEndVoiceButton)) {
        Log("Voice mode is on ('" endBtn.name "' is showing)")
        return true
    }
    if FindButton(hwnd, IsVoiceModeControl) {
        Log("Voice mode is on (its microphone button is showing)")
        return true
    }
    if FindButton(hwnd, n => n == "Use voice mode") {
        Log("Voice mode is off ('Use voice mode' is showing)")
        if (IniRead(STATE_FILE, "voice", "on", 0) = 1)
            SaveState(false)   ; it was ended some other way, like clicking Stop
        return false
    }
    if (IniRead(STATE_FILE, "voice", "on", 0) != 1 || IniRead(STATE_FILE, "voice", "window", 0) != hwnd) {
        Log("Voice mode is off")
        return false
    }
    Log("Voice mode is on (the last press started it)")
    return true
}

SaveState(on, hwnd := 0, startHides := false) {
    IniWrite(on ? 1 : 0, STATE_FILE, "voice", "on")
    IniWrite(hwnd, STATE_FILE, "voice", "window")
    IniWrite(startHides ? 1 : 0, STATE_FILE, "voice", "startHides")
}

; A button that only shows during voice mode.
IsVoiceModeControl(name) => name ~= "^Turn (off|on) microphone$"

IsEndVoiceButton(name) {
    if (InStr(name, ", rename") || StartsWith(name, "More options for "))
        return false
    return name ~= "i)^(end|stop|exit|leave|turn off|hang up)\b.*\b(voice|call|conversation)\b"
        || name ~= "i)^(end|hang up)$"
}

; ---- Claude's sound -----------------------------------------------------------

; Windows' level meters for the sound Claude's app is playing, one per sound stream it has open.
ClaudeSoundMeters() {
    meters := []
    devices := ComObject("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")   ; MMDeviceEnumerator
    ComCall(3, devices, "int", 0, "uint", 1, "ptr*", &p := 0)   ; EnumAudioEndpoints(speakers, active)
    speakers := ComPtr(p)
    ComCall(3, speakers, "uint*", &count := 0)                  ; GetCount
    loop count {
        try {
            ComCall(4, speakers, "uint", A_Index - 1, "ptr*", &p := 0)   ; Item
            device := ComPtr(p)
            ComCall(3, device, "ptr", Guid("{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}"), "uint", 23, "ptr", 0, "ptr*", &p := 0)   ; Activate(IAudioSessionManager2)
            manager := ComPtr(p)
            ComCall(5, manager, "ptr*", &p := 0)                 ; GetSessionEnumerator
            sessions := ComPtr(p)
            ComCall(3, sessions, "int*", &n := 0)                ; GetCount
            loop n {
                try {
                    ComCall(4, sessions, "int", A_Index - 1, "ptr*", &p := 0)   ; GetSession
                    session := ComPtr(p)
                    ComCall(14, ComObjQuery(session, "{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}"), "uint*", &pid := 0)   ; IAudioSessionControl2.GetProcessId
                    if (ProcessGetName(pid) = "claude.exe")
                        meters.Push(ComObjQuery(session, "{C02216F6-8C67-4B5B-9D00-D008E73E0064}"))   ; IAudioMeterInformation
                }
            }
        }
    }
    return meters
}

Guid(text) {
    buf := Buffer(16)
    DllCall("ole32\CLSIDFromString", "wstr", text, "ptr", buf)
    return buf
}

; ---- Claude's window ----------------------------------------------------------

FindClaudeWindow() {
    best := 0, bestArea := 0
    for hwnd in WinGetList("ahk_exe claude.exe ahk_class Chrome_WidgetWin_1") {
        if (WinGetTitle(hwnd) = "")
            continue
        WinGetPos(, , &w, &h, hwnd)
        if (w * h > bestArea)
            best := hwnd, bestArea := w * h
    }
    return best
}

OpenClaude() {
    if !(hwnd := FindClaudeWindow()) {
        Log("Claude isn't open, starting it")
        Run CLAUDE_APP
        if !(hwnd := WaitFor(FindClaudeWindow, 30000))
            throw Error("Claude didn't open within 30 seconds.")
    }
    if (WinGetMinMax(hwnd) = -1)
        WinRestore hwnd
    WinActivate hwnd
    if !WinWaitActive(hwnd, , 3)
        Log("Claude didn't come to the front within 3 seconds")
    WakeAccessibility(hwnd)
    return hwnd
}

OnChatPage(hwnd) {
    tab := FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork")
    return tab && IsSelected(tab.el)
}

; Apps built on Chromium, like Claude, only list their buttons once something asks for them.
WakeAccessibility(hwnd) {
    target := hwnd
    try target := ControlGetHwnd("Chrome_RenderWidgetHostHWND1", hwnd)
    try SendMessage(0x3D, 0, 1, target)   ; WM_GETOBJECT, the ID Chromium treats as "a screen reader is here"
    iid := Buffer(16)
    DllCall("ole32\CLSIDFromString", "wstr", "{618736e0-3c3d-11cf-810c-00aa00389b71}", "ptr", iid)   ; IAccessible
    if (DllCall("oleacc\AccessibleObjectFromWindow", "ptr", target, "uint", 0xFFFFFFFC, "ptr", iid, "ptr*", &acc := 0) = 0 && acc)
        ObjRelease(acc)
}

; Clicks an element with the real mouse, like a person would, then puts the mouse back.
ClickEl(el, hwnd) {
    rect := Buffer(16, 0)
    ComCall(43, el, "ptr", rect)   ; CurrentBoundingRectangle
    left := NumGet(rect, 0, "int"), top := NumGet(rect, 4, "int")
    right := NumGet(rect, 8, "int"), bottom := NumGet(rect, 12, "int")
    if !WinActive(hwnd)
        WinActivate hwnd
    if (right <= left || bottom <= top || !WinActive(hwnd))
        return Invoke(el)
    x := (left + right) // 2, y := (top + bottom) // 2
    CoordMode "Mouse", "Screen"
    MouseGetPos &mouseX, &mouseY
    Click x, y
    MouseMove mouseX, mouseY, 0
}

; ---- UI Automation helpers ----------------------------------------------------

; Holds a COM pointer and releases it when no longer needed.
class ComPtr {
    __New(ptr) => this.Ptr := ptr
    __Delete() => (this.Ptr && ObjRelease(this.Ptr))
}

; Returns every element of one type in the window, as {el, name}.
GetElements(hwnd, controlType) {
    ComCall(6, UIA, "ptr", hwnd, "ptr*", &p := 0)               ; ElementFromHandle
    return ElementsUnder(ComPtr(p), controlType)
}

; Returns every element of one type inside root, as {el, name}.
ElementsUnder(root, controlType) {
    v := Buffer(24, 0)                                           ; VARIANT holding the control type
    NumPut("ushort", 3, v, 0), NumPut("int", controlType, v, 8)
    ComCall(23, UIA, "int", 30003, "ptr", v, "ptr*", &p := 0)    ; CreatePropertyCondition(ControlType)
    cond := ComPtr(p)
    ComCall(6, root, "int", 4, "ptr", cond, "ptr*", &p := 0)     ; FindAll(descendants)
    found := ComPtr(p)
    ComCall(3, found, "int*", &count := 0)                       ; Length
    items := []
    loop count {
        try {
            ComCall(4, found, "int", A_Index - 1, "ptr*", &p := 0)   ; GetElement
            el := ComPtr(p)
            ComCall(23, el, "ptr*", &bstr := 0)                     ; CurrentName
            name := bstr ? StrGet(bstr, "UTF-16") : ""
            DllCall("OleAut32\SysFreeString", "ptr", bstr)
            items.Push({el: el, name: Trim(RegExReplace(name, "\s+", " "))})
        }
    }
    return items
}

FindButton(hwnd, test) {
    for item in GetElements(hwnd, UIA_BUTTON)
        if test(item.name)
            return item
    return ""
}

FindByPrefix(hwnd, controlType, prefix) {
    for item in GetElements(hwnd, controlType)
        if StartsWith(item.name, prefix)
            return item
    return ""
}

ElementClass(el) {
    ComCall(30, el, "ptr*", &bstr := 0)   ; CurrentClassName
    name := bstr ? StrGet(bstr, "UTF-16") : ""
    DllCall("OleAut32\SysFreeString", "ptr", bstr)
    return name
}

HasFocus(el) {
    ComCall(26, el, "int*", &focused := 0)   ; CurrentHasKeyboardFocus
    return focused != 0
}

ButtonNames(hwnd) {
    names := Map()
    for item in GetElements(hwnd, UIA_BUTTON)
        names[item.name] := true
    return names
}

GetPattern(el, patternId, iid) {
    guid := Buffer(16)
    DllCall("ole32\CLSIDFromString", "wstr", iid, "ptr", guid)
    ComCall(14, el, "int", patternId, "ptr", guid, "ptr*", &p := 0)   ; GetCurrentPatternAs
    return p ? ComPtr(p) : ""
}

Invoke(el) {
    if !(pattern := GetPattern(el, 10000, "{fb377fbe-8ea6-46d5-9c73-6499642d3059}"))
        throw Error("One of Claude's buttons couldn't be pressed.")
    ComCall(3, pattern)   ; Invoke
}

; Presses a button that's either an on/off switch (like Dictate on the Code page) or a plain button.
PressButton(el) {
    if (pattern := GetPattern(el, 10015, "{94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70}")) {
        ComCall(3, pattern)   ; Toggle
        return
    }
    Invoke(el)
}

IsSelected(el) {
    if !(pattern := GetPattern(el, 10010, "{a8efa66a-0fda-421a-9194-38021f3578ea}"))
        return false
    ComCall(6, pattern, "int*", &selected := 0)   ; CurrentIsSelected
    return selected != 0
}

; ---- Small helpers --------------------------------------------------------------

WaitFor(check, timeoutMs) {
    deadline := A_TickCount + timeoutMs
    loop {
        try {
            if (result := check())
                return result
        }
        if (A_TickCount > deadline)
            return ""
        Sleep 250
    }
}

StartsWith(text, prefix) => SubStr(text, 1, StrLen(prefix)) == prefix

JoinNames(list) {
    text := ""
    for item in list
        text .= (text = "" ? "" : " | ") (IsObject(item) ? item.name : item)
    return text = "" ? "(none)" : text
}

Log(msg) => LogLines.Push(FormatTime(, "HH:mm:ss") "  " msg)

WriteLog() {
    text := ""
    for line in LogLines
        text .= line "`n"
    try FileOpen(LOG_FILE, "w", "UTF-8").Write(text)
}
