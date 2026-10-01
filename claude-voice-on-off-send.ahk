; Stream Deck button: Claude voice mode or dictation, on/off, with dictation sent automatically
;
; Same as claude-voice-on-off.ahk, except that when dictation ends, your words are sent.
;
; Chat and Cowork page: toggles voice mode in the chat that's showing.
; Code page, or anywhere voice mode isn't available: toggles dictation, which types what you
; say into the message box. Dictation ends by itself once you've been quiet for 2 seconds
; (3.5 once you've been talking a while, so a pause to think doesn't cut you off; but always 2 in a
; voice chat, so what you say to your friends after isn't picked up), then the message is sent. Pressing the button again ends dictation right away and sends it too.
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
SILENCE_MS     := 2000    ; end dictation after this much quiet (milliseconds)...
LONG_SILENCE_MS := 3500   ; ...or this much, once you've been talking LONG_TALK_MS: a longer message has pauses to think in
LONG_TALK_MS   := 6000    ; it ("um, what I noticed is...": at 2 s, those cut it off and sent half of it)
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
; And pressing a button doesn't first move the keyboard focus to it, which Windows does by default:
; that means bringing Claude's window forward (out of a game), and waiting on it if it can't come.
try ComCall(59, ComObjQuery(UIA, "{34723aff-0c9d-49d0-9896-7ab52df8cd8a}"), "int", 0)   ; IUIAutomation2 AutoSetFocus
UIA_BUTTON := 50000, UIA_EDIT := 50004, UIA_RADIO := 50013, UIA_TEXT := 50020, UIA_GROUP := 50026
LogLines := []
CameFrom := 0      ; the window that was in front when the button started (see OpenClaude)
Behind := false    ; ...a game (or anything else full screen): Claude works from behind it
ClaudeHwnd := 0    ; Claude's window, for clicking its buttons from behind a game (see PostClick)
FrontUntil := 0    ; ...until when the game is kept in front, if Claude takes it (see HoldGameInFront)

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
        ; Right after launch the page needs a moment to load. (Loading, it's given a moment more to
        ; settle before voice mode's button is clicked, see StartVoice; already there, it isn't.)
        looked := A_TickCount
        if !WaitFor(() => FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork"), 20000)
            throw Error("Couldn't read Claude's window. It may still be loading, so try the button again.")
        loading := A_TickCount - looked > 200

        ; One look at Claude's buttons, for all the checks below (each look over its window takes a
        ; moment, and it was taking eight, one after another, before voice mode came on).
        buttons := GetElements(hwnd, UIA_BUTTON)
        dictating := FirstNamed(buttons, IsDictationStop)
        if (startOnly && dictating) {
            ; "Hey Claude" wants a new message, but dictation is still on: left on, or stuck finishing
            ; one that went wrong (which used to leave "Hey Claude" doing nothing until it cleared).
            ; It's stopped, and once Claude is ready again, started afresh below.
            Log("Dictation was already on, so it's being stopped to start afresh")
            PressButton(dictating.el)
            if !WaitFor(() => FindButton(hwnd, n => n == "Dictate"), 6000)
                throw Error("Claude's dictation seems stuck (it didn't stop). Click the mic in Claude's message box, then try again.")
            dictating := "", buttons := GetElements(hwnd, UIA_BUTTON)
        }
        if (!startOnly && !dictating && IniRead(STATE_FILE, "conversation", "active", 0) = 1) {
            ; A "Hey Claude" conversation is pausing between messages; this press ends it.
            IniWrite(0, STATE_FILE, "conversation", "active")
            Log("Ended the conversation")
        } else if !OnChatPage(hwnd) {
            Log("On the Code page, so using dictation")
            ToggleDictation(hwnd)
        } else if dictating {
            ToggleDictation(hwnd)
        } else if VoiceIsOn(hwnd, buttons) {
            if startOnly
                Log("Voice mode is already on")
            else
                StopVoice(hwnd)
        } else {
            ; Wait for the message box's mic buttons, so a page that's still loading
            ; isn't mistaken for one without voice mode.
            if !FirstNamed(buttons, IsMicButton) {
                WaitFor(() => FindButton(hwnd, IsMicButton), 8000)
                buttons := GetElements(hwnd, UIA_BUTTON), loading := true
            }
            if (voiceBtn := FirstNamed(buttons, n => n == "Use voice mode")) {
                StartVoice(hwnd, voiceBtn, buttons, loading)
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
                    SendPrompt(hwnd)
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
        if Behind {
            Log("Dictation didn't start from the click message, trying UI Automation")
            UiaPress(dictateBtn.el)
        } else {
            Log("Dictation didn't start from the button press, trying a real click")
            ClickEl(dictateBtn.el, hwnd)
        }
        if !WaitFor(() => FindButton(hwnd, IsDictationStop), 3000)
            throw Error("Pressed 'Dictate' but dictation didn't start.")
    }
    Log("Dictation started")
    if BEEP_WHEN_READY
        SoundBeep(1200, 80)
}

; Ends dictation once you've been quiet for SILENCE_MS after talking (LONG_SILENCE_MS once you've
; been talking LONG_TALK_MS), or if you haven't started talking within firstWordsMs, or after
; MAX_TALK_MS whatever happens. Talking is what's louder than
; VOICE_LEVEL and well above the room's own noise: the quietest moment of the last two seconds
; (there are gaps between words even while you talk), so a noisy room (a fan, a video playing)
; doesn't sound like talking that never ends. Returns how it ended ("quiet", "no talking", "too
; long", or "stopped" when something else ended it) and whether any talking was heard.
WatchForSilence(hwnd, firstWordsMs) {
    meter := OpenMicMeter()
    start := A_TickCount, lastVoice := 0, firstVoice := 0, lastCheck := A_TickCount
    if (chatting := VoiceChat()) != ""   ; (in a voice chat: what comes after a pause is likely for your friends)
        Log("In a voice chat (" chatting "), so a " SILENCE_MS " ms quiet ends dictation")
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
            lastVoice := A_TickCount, firstVoice := firstVoice || A_TickCount, voiceMax := Max(voiceMax, level)
        else
            quietMax := Max(quietMax, level)
        if (A_TickCount - start >= MAX_TALK_MS) {
            Log("Still hearing talking after " MAX_TALK_MS // 1000 " s, so dictation was stopped")
            ended := "too long"
            break
        }

        quietFor := QuietNeeded(lastVoice - firstVoice, chatting != "")
        if (lastVoice && A_TickCount - lastVoice >= quietFor) {
            Log("Quiet for " quietFor " ms after " (quietFor > SILENCE_MS ? Round((lastVoice - firstVoice) / 1000) " s of " : "") "talking")
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

; How long a quiet ends dictation, after talking for talkedMs (from the first word to the last). In a
; voice chat (chatting), always the short one: the longer wait for a pause to think picked up what
; you said to your friends after it ("Best catcher in the league", sent to Claude).
QuietNeeded(talkedMs, chatting := false) => !chatting && talkedMs >= LONG_TALK_MS ? LONG_SILENCE_MS : SILENCE_MS

; Another program that's using the microphone right now (like Discord, in a voice chat), by the name
; of its program, or "" if none is: Windows notes which programs are using it. Claude, these scripts
; and the "Hey Claude" ear (which uses it the whole time it listens) don't count.
VoiceChat() {
    static base := "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone"
    for where in [base "\NonPackaged", base] {
        loop reg, where, "K" {
            if !IsOtherMicUser(A_LoopRegName)
                continue
            key := RegExReplace(A_LoopRegKey, "i)^(HKEY_CURRENT_USER|HKCU)\\") "\" A_LoopRegName
            if (MicTime(key, "LastUsedTimeStart") && MicTime(key, "LastUsedTimeStop") = 0)   ; started, and not stopped yet
                return RegExReplace(RegExReplace(A_LoopRegName, "^.*#"), "i)\.exe$")
        }
    }
    return ""
}

; Whether a program Windows notes as using the mic (by its name there, like "C:#Users#...#Discord.exe"
; or a Store app's name) is another one, not Claude, these scripts or the "Hey Claude" ear. (The ear
; runs on Python, and Windows notes it as the Python install itself, not by the ear's folder: any
; Python counts as the ear. Counted as a voice chat, it made every dictation one.)
IsOtherMicUser(regName) {
    name := RegExReplace(regName, "^.*#")   ; (just Discord.exe)
    return !(name = "NonPackaged" || name ~= "i)^(autohotkey.*|claude|pythonw?)(\.exe)?$|^Claude_")
}

; One of the times Windows notes when a program starts or stops using the microphone (a 64-bit
; number, which RegRead can't read), or "" if there isn't one.
MicTime(key, name) {
    if DllCall("advapi32\RegGetValueW", "ptr", 0x80000001, "wstr", key, "wstr", name, "uint", 0x48, "ptr", 0, "int64*", &when := 0, "uint*", &size := 8) = 0   ; HKEY_CURRENT_USER, RRF_RT_QWORD
        return when
    return ""
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

; Sends what's in the message box. From behind a game, it presses Claude's send button, which works
; without bringing Claude up. Otherwise (or if there's no send button it knows, or pressing it
; didn't send), it presses Enter in the message box.
SendPrompt(hwnd) {
    if Behind {
        if (btn := FindButton(hwnd, IsSendButton)) {
            PressButton(btn.el)
            if WaitFor(() => PromptText(hwnd) = "", 2000) {
                Log("Sent with '" btn.name "', from behind")
                return
            }
            Log("Pressing '" btn.name "' didn't send it, so pressing Enter instead")
        } else {
            Log("No send button found, so pressing Enter. Buttons: " JoinNames(GetElements(hwnd, UIA_BUTTON)))
        }
    }
    PressInMessageBox(hwnd, "{Enter}")
}

IsSendButton(name) => name ~= "i)^(send|send message|submit|send prompt)$"

; Brings Claude to the front, puts the cursor in the message box, and presses keys there (and, from
; behind a game, gives the game the front back straight after, see GiveBack).
PressInMessageBox(hwnd, keys) {
    if !(box := PromptBox(hwnd))
        throw Error("Couldn't find Claude's message box, so no keys were pressed.")
    try {
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
    } finally {
        GiveBack()
    }
}

; Claude's message box. It's picked by what it is rather than where it is on the page, because
; other text boxes can be there too, like a code file open next to the chat.
PromptBox(hwnd) {
    for item in GetElements(hwnd, UIA_EDIT)
        if (item.name == "Prompt" || item.name ~= "i)prompt to Claude|^Reply to Claude" || InStr(item.cls, "ProseMirror"))
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
    ComCall(3, mic, "ptr", Guid("{C02216F6-8C67-4B5B-9D00-D008E73E0064}"), "uint", 23, "ptr", 0, "ptr*", &p := 0)   ; Activate(IAudioMeterInformation)
    return ComPtr(p)
}

IsMicButton(name) => name == "Use voice mode" || name == "Dictate" || IsDictationStop(name)

; The button that ends dictation while it's on: "Stop dictation" on the Code page,
; "Finish dictation" on the Chat and Cowork page.
IsDictationStop(name) => name == "Stop dictation" || name == "Finish dictation"

; ---- Voice mode -------------------------------------------------------------

; (seen: Claude's buttons, as just looked at; loading: the page was still loading a moment ago.)
StartVoice(hwnd, voiceBtn, seen := "", loading := true) {
    before := Map()
    for item in (seen || GetElements(hwnd, UIA_BUTTON))
        before[item.name] := true
    if loading
        Sleep 400   ; let the chat finish settling before clicking
    ; From behind a game, pressing it without the mouse is tried first (a real click needs Claude in front).
    if !(Behind && (PressButton(voiceBtn.el), WaitFor(() => FindButton(hwnd, IsVoiceModeControl) || !FindButton(hwnd, n => n == "Use voice mode"), 2500)))
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
        GiveBack()
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
        GiveBack()
    }
    SaveState(false)
}

; Voice mode counts as on if its controls are showing, and off if "Use voice mode" is showing.
; Only when neither shows (like while the page loads) does it go by what the last press did.
; (buttons: Claude's buttons, if they've just been looked at.)
VoiceIsOn(hwnd, buttons := "") {
    buttons := buttons || GetElements(hwnd, UIA_BUTTON)
    if (endBtn := FirstNamed(buttons, IsEndVoiceButton)) {
        Log("Voice mode is on ('" endBtn.name "' is showing)")
        return true
    }
    if FirstNamed(buttons, IsVoiceModeControl) {
        Log("Voice mode is on (its microphone button is showing)")
        return true
    }
    if FirstNamed(buttons, n => n == "Use voice mode") {
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
ClaudeSoundMeters() => ClaudeAudio("{C02216F6-8C67-4B5B-9D00-D008E73E0064}")   ; IAudioMeterInformation

; Something about each sound stream Claude's app has open (the interface iid of its audio session),
; like its level meter or its volume, on every speaker; [] if Windows can't say.
ClaudeAudio(iid) {
    out := []
    try {
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
                            out.Push(ComObjQuery(session, iid))
                    }
                }
            }
        }
    }
    return out
}

; A GUID (like "{...}") as Windows takes it, made once and kept.
Guid(text) {
    static made := Map()
    if !made.Has(text) {
        made[text] := Buffer(16)
        DllCall("ole32\CLSIDFromString", "wstr", text, "ptr", made[text])
    }
    return made[text]
}

; ---- Claude's window ----------------------------------------------------------

FindClaudeWindow() {
    best := 0, bestArea := 0
    for hwnd in WinGetList("ahk_exe claude.exe ahk_class Chrome_WidgetWin_1") {
        ; (not untitled ones, nor see-through ones that can't be clicked, like the layer Claude puts over
        ; all the screens when it uses the computer: that one's the biggest, but it has no buttons)
        if (WinGetTitle(hwnd) = "" || WinGetExStyle(hwnd) & 0x08000020)   ; WS_EX_NOACTIVATE | WS_EX_TRANSPARENT
            continue
        WinGetPos(, , &w, &h, hwnd)
        if (w * h > bestArea)
            best := hwnd, bestArea := w * h
    }
    return best
}

; Gets Claude ready, and brings it to the front. But in a game (or anything else full screen, like a
; video), Claude stays behind it: coming to the front would drop you out of the game, back to the
; Windows cursor. Dictation works from behind; sending does too, with Claude's send button, or else
; Claude comes up just long enough to press Enter (see SendPrompt, GiveBack).
OpenClaude() {
    global CameFrom, Behind, ClaudeHwnd
    CameFrom := WinExist("A")
    Behind := CameFrom && CoversScreen(CameFrom)
    if !(hwnd := FindClaudeWindow()) {
        Log("Claude isn't open, starting it")
        Run CLAUDE_APP
        if !(hwnd := WaitFor(FindClaudeWindow, 30000))
            throw Error("Claude didn't open within 30 seconds.")
    }
    if (hwnd = CameFrom)
        Behind := false
    ClaudeHwnd := hwnd
    if Behind {
        if (WinGetMinMax(hwnd) = -1)
            DllCall("ShowWindow", "ptr", hwnd, "int", 4)   ; SW_SHOWNOACTIVATE: restored, but not in front
        Log("A full-screen window is in front (" WinGetProcessName(CameFrom) "), so Claude stays behind it")
    } else {
        if (WinGetMinMax(hwnd) = -1)
            WinRestore hwnd
        WinActivate hwnd
        if !WinWaitActive(hwnd, , 3)
            Log("Claude didn't come to the front within 3 seconds")
    }
    WakeAccessibility(hwnd)
    return hwnd
}

; Whether a window fills its whole monitor with no title bar, like a game or a full-screen video
; (not just maximized, like an app on a monitor without the taskbar).
CoversScreen(hwnd) {
    try {
        if (WinGetClass(hwnd) ~= "^(Progman|WorkerW|Shell_TrayWnd)$" || (WinGetStyle(hwnd) & 0xC00000) = 0xC00000   ; the desktop, the taskbar, or a window with a title bar
            || WinGetMinMax(hwnd) != 0)
            return false
        WinGetPos(&x, &y, &w, &h, hwnd)
        info := Buffer(40, 0), NumPut("uint", 40, info)
        DllCall("GetMonitorInfo", "ptr", DllCall("MonitorFromWindow", "ptr", hwnd, "uint", 2, "ptr"), "ptr", info)   ; MONITOR_DEFAULTTONEAREST
        return x <= NumGet(info, 4, "int") && y <= NumGet(info, 8, "int") && x + w >= NumGet(info, 12, "int") && y + h >= NumGet(info, 16, "int")
    }
    return false
}

; After something that needed Claude in front (a key press or a real click), the game goes straight
; back in front, if Claude was working from behind it.
GiveBack() {
    if (Behind && CameFrom && WinExist(CameFrom) && !WinActive(CameFrom))
        try WinActivate(CameFrom)
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
    if (DllCall("oleacc\AccessibleObjectFromWindow", "ptr", target, "uint", 0xFFFFFFFC, "ptr", Guid("{618736e0-3c3d-11cf-810c-00aa00389b71}"), "ptr*", &acc := 0) = 0 && acc)   ; IAccessible
        ObjRelease(acc)
}

; Clicks an element with the real mouse, like a person would, then puts the mouse back.
ClickEl(el, hwnd) {
    if (Behind && PostClick(el, hwnd))
        return
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
    GiveBack()
}

; ---- UI Automation helpers ----------------------------------------------------

; Holds a COM pointer and releases it when no longer needed.
class ComPtr {
    __New(ptr) => this.Ptr := ptr
    __Delete() => (this.Ptr && ObjRelease(this.Ptr))
}

; Returns every element of one type in the window, as {el, name, cls}.
GetElements(hwnd, controlType) {
    ComCall(6, UIA, "ptr", hwnd, "ptr*", &p := 0)               ; ElementFromHandle
    return ElementsUnder(ComPtr(p), controlType)
}

; Returns every element of one type inside root, as {el, name, cls}. Their names and classes come
; along with the list, in one go: asking Claude's window about each element separately takes a
; round trip each, and there can be a hundred of them.
ElementsUnder(root, controlType, scope := 4) {   ; (scope: 4 for everything under root, 7 for root too)
    static cache := 0
    if !cache {
        ComCall(20, UIA, "ptr*", &cache)   ; CreateCacheRequest, kept for good
        ComCall(3, cache, "int", 30005)    ; AddProperty: name
        ComCall(3, cache, "int", 30012)    ; AddProperty: class
    }
    v := Buffer(24, 0)                                           ; VARIANT holding the control type
    NumPut("ushort", 3, v, 0), NumPut("int", controlType, v, 8)
    ComCall(23, UIA, "int", 30003, "ptr", v, "ptr*", &p := 0)    ; CreatePropertyCondition(ControlType)
    cond := ComPtr(p)
    ComCall(8, root, "int", scope, "ptr", cond, "ptr", cache, "ptr*", &p := 0)   ; FindAllBuildCache
    found := ComPtr(p)
    ComCall(3, found, "int*", &count := 0)                       ; Length
    items := []
    loop count {
        try {
            ComCall(4, found, "int", A_Index - 1, "ptr*", &p := 0)   ; GetElement
            el := ComPtr(p)
            items.Push({el: el, name: Trim(RegExReplace(CachedString(el, 55), "\s+", " ")), cls: CachedString(el, 62)})   ; CachedName, CachedClassName
        }
    }
    return items
}

; One of an element's text properties as it came along with it (see ElementsUnder).
CachedString(el, method) {
    ComCall(method, el, "ptr*", &bstr := 0)
    text := bstr ? StrGet(bstr, "UTF-16") : ""
    DllCall("OleAut32\SysFreeString", "ptr", bstr)
    return text
}

FindButton(hwnd, test) => FirstNamed(GetElements(hwnd, UIA_BUTTON), test)

; The first of some elements (as GetElements gives them) whose name passes test, or "".
FirstNamed(items, test) {
    for item in items
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
    ComCall(14, el, "int", patternId, "ptr", Guid(iid), "ptr*", &p := 0)   ; GetCurrentPatternAs
    return p ? ComPtr(p) : ""
}

Invoke(el) {
    if !(pattern := GetPattern(el, 10000, "{fb377fbe-8ea6-46d5-9c73-6499642d3059}"))
        throw Error("One of Claude's buttons couldn't be pressed.")
    ComCall(3, pattern)   ; Invoke
}

; Presses a button that's either an on/off switch (like Dictate on the Code page) or a plain button.
PressButton(el) {
    ; From behind a game, it's clicked with click messages sent to Claude's window (see PostClick).
    if (Behind && PostClick(el, ClaudeHwnd))
        return
    UiaPress(el)
}

; Clicks a button by sending Claude's window the click messages themselves, at the middle of the
; button: no mouse moves, and nothing lets Claude take the front. (Pressing a button through UI
; Automation does let it: Claude's window then jumps in front of the game, which drops the keys
; you're holding and lets go of the mouse.) Returns false if the button isn't somewhere it can be
; clicked (like while Claude is minimized).
PostClick(el, hwnd) {
    if !(hwnd && WinExist(hwnd))
        return false
    old := DllCall("SetThreadDpiAwarenessContext", "ptr", -4, "ptr")   ; (real screen pixels, like UI Automation's)
    at := SpotIn(hwnd, el)
    DllCall("SetThreadDpiAwarenessContext", "ptr", old, "ptr")
    if !at
        return false
    PostClickAt(hwnd, at, 30)
    return true
}

; The middle of one of Claude's buttons or switches (el), in its window's inside (hwnd's client area,
; as {x, y}), or "" if it isn't showing there.
SpotIn(hwnd, el) {
    try {
        rect := Buffer(16, 0)
        ComCall(43, el, "ptr", rect)   ; CurrentBoundingRectangle
        left := NumGet(rect, 0, "int"), top := NumGet(rect, 4, "int"), right := NumGet(rect, 8, "int"), bottom := NumGet(rect, 12, "int")
        if (right <= left || bottom <= top)
            return ""
        pt := Buffer(8), NumPut("int", (left + right) // 2, "int", (top + bottom) // 2, pt)
        DllCall("ScreenToClient", "ptr", hwnd, "ptr", pt)
        x := NumGet(pt, 0, "int"), y := NumGet(pt, 4, "int")
        client := Buffer(16, 0), DllCall("GetClientRect", "ptr", hwnd, "ptr", client)
        if (x < 0 || y < 0 || x >= NumGet(client, 8, "int") || y >= NumGet(client, 12, "int"))
            return ""
        return {x: x, y: y}
    }
    return ""
}

; A click at a spot in a window's inside (at, {x, y}), as click messages: the mouse moving there,
; the button going down and, pauseMs later, up again.
PostClickAt(hwnd, at, pauseMs := 0) {
    xy := (at.y & 0xFFFF) << 16 | (at.x & 0xFFFF)
    DllCall("PostMessage", "ptr", hwnd, "uint", 0x200, "ptr", 0, "ptr", xy)   ; WM_MOUSEMOVE
    DllCall("PostMessage", "ptr", hwnd, "uint", 0x201, "ptr", 1, "ptr", xy)   ; WM_LBUTTONDOWN (MK_LBUTTON)
    if pauseMs
        Sleep pauseMs
    DllCall("PostMessage", "ptr", hwnd, "uint", 0x202, "ptr", 0, "ptr", xy)   ; WM_LBUTTONUP
}

; Presses a button through UI Automation: an on/off switch or a plain button. From behind a game,
; Windows' foreground lock goes on first and Claude is kept from staying in front (see
; HoldGameInFront), though it can still come forward for a moment this way.
UiaPress(el) {
    if Behind
        DllCall("LockSetForegroundWindow", "uint", 1)   ; LSFW_LOCK
    if (pattern := GetPattern(el, 10015, "{94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70}"))
        ComCall(3, pattern)   ; Toggle
    else
        Invoke(el)
    HoldGameInFront()
}

; Claude brings its own window to the front when its dictation starts or stops. From behind a game,
; the game gets the front straight back: for a couple of seconds after pressing one of Claude's
; buttons, whenever Claude takes it, it's given back.
HoldGameInFront(ms := 2000) {
    global FrontUntil
    if !(Behind && CameFrom)
        return
    FrontUntil := A_TickCount + ms
    SetTimer(HoldFront, 25)
}

HoldFront() {
    if (A_TickCount > FrontUntil)
        return SetTimer(HoldFront, 0)
    if (WinExist(CameFrom) && !WinActive(CameFrom) && WinActive("ahk_exe claude.exe"))
        try WinActivate(CameFrom)
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

; The newest message shows when it was sent ("just now", "5 seconds ago", "1 minute ago"). That isn't
; part of what was said, so it's left out (otherwise "See ya." would read as "See ya. 5 seconds ago").
IsWhenLabel(text) => Trim(text) = ""
    || text ~= "i)^\s*(just now|now|yesterday|a moment ago|an? (second|minute|hour|day|week|month|year) ago|\d+ (seconds?|minutes?|hours?|days?|weeks?|months?|years?) ago|\d{1,2}:\d{2}\s*([ap]m)?)\s*$"

JoinNames(list) {
    text := ""
    for item in list
        text .= (text = "" ? "" : " | ") (IsObject(item) ? item.name : item)
    return text = "" ? "(none)" : text
}

Log(msg) => LogLines.Push(FormatTime(, "HH:mm:ss") "." Format("{:03}", A_MSec) "  " msg)   ; (to the thousandth: where a slow start's time goes)

WriteLog() {
    text := ""
    for line in LogLines
        text .= line "`n"
    try FileOpen(LOG_FILE, "w", "UTF-8").Write(text)
}
