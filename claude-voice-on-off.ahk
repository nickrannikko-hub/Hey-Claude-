; Stream Deck button: Claude voice mode or dictation, on/off
;
; Chat and Cowork page: toggles voice mode in the chat that's showing.
; Code page, or anywhere voice mode isn't available: toggles dictation, which types what you
; say into the message box. Dictation ends by itself once you've been quiet for 2 seconds.
; Pressing the button again ends either one right away.
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.
; If something goes wrong, a message pops up and the details are saved in
; claude-voice-on-off-log.txt next to this file.

#Requires AutoHotkey v2.0 64-bit
#SingleInstance Force   ; a second press replaces a running one, so it can end dictation early
#NoTrayIcon

; ---- Settings ---------------------------------------------------------------
SILENCE_MS     := 2000    ; end dictation after this much quiet (milliseconds)
FIRST_WORDS_MS := 7000    ; end dictation if you haven't started talking within this long
VOICE_LEVEL    := 0.02    ; mic level that counts as talking (0 to 1). Raise it if background noise keeps dictation going
CLAUDE_APP := "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"    ; how Windows starts the Claude app
LOG_FILE   := A_ScriptDir "\claude-voice-on-off-log.txt"
STATE_FILE := A_Temp "\claude-voice-on-off.ini"
; -----------------------------------------------------------------------------

; UI Automation lets the script find Claude's buttons by their names instead of by screen position.
UIA := ComObject("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")
UIA_BUTTON := 50000, UIA_EDIT := 50004, UIA_RADIO := 50013
LogLines := []

if (A_LineFile = A_ScriptFullPath)
    Main()

Main() {
    DllCall("SetThreadDpiAwarenessContext", "ptr", -4, "ptr")   ; work in real screen pixels
    try {
        hwnd := OpenClaude()
        ; Right after launch the page needs a moment to load.
        if !WaitFor(() => FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork"), 20000)
            throw Error("Couldn't read Claude's window. It may still be loading, so try the button again.")

        if !OnChatPage(hwnd) {
            Log("On the Code page, so using dictation")
            ToggleDictation(hwnd)
        } else if FindButton(hwnd, IsDictationStop) {
            ToggleDictation(hwnd)
        } else if VoiceIsOn(hwnd) {
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
        ExitApp
    }
    WriteLog()
}

; ---- Dictation --------------------------------------------------------------

ToggleDictation(hwnd) {
    if (stopBtn := FindButton(hwnd, IsDictationStop)) {
        PressButton(stopBtn.el)
        Log("Dictation stopped")
        return
    }
    if !(dictateBtn := WaitFor(() => FindButton(hwnd, n => n == "Dictate"), 8000)) {
        if FindButton(hwnd, n => n == "Press and hold to record")
            throw Error("Claude's mic is set to 'Hold to record'. Turn that off in Dictation settings "
                . "(the arrow next to the mic) so this button can switch dictation on and off.")
        throw Error("Couldn't find Claude's 'Dictate' button.")
    }
    PressButton(dictateBtn.el)
    if !WaitFor(() => FindButton(hwnd, IsDictationStop), 3000) {
        Log("Dictation didn't start from the button press, trying a real click")
        ClickEl(dictateBtn.el, hwnd)
        if !WaitFor(() => FindButton(hwnd, IsDictationStop), 3000)
            throw Error("Pressed 'Dictate' but dictation didn't start.")
    }
    Log("Dictation started")
    WatchForSilence(hwnd)
}

; Ends dictation once you've been quiet for SILENCE_MS after talking,
; or if you haven't started talking within FIRST_WORDS_MS.
WatchForSilence(hwnd) {
    meter := OpenMicMeter()
    start := A_TickCount, lastVoice := 0, lastCheck := A_TickCount
    quietMax := 0.0, voiceMax := 0.0
    loop {
        Sleep 100
        ComCall(3, meter, "float*", &level := 0)   ; GetPeakValue
        if (level >= VOICE_LEVEL)
            lastVoice := A_TickCount, voiceMax := Max(voiceMax, level)
        else
            quietMax := Max(quietMax, level)

        if (lastVoice && A_TickCount - lastVoice >= SILENCE_MS) {
            Log("Quiet for " SILENCE_MS " ms after talking")
            break
        }
        if (!lastVoice && A_TickCount - start >= FIRST_WORDS_MS) {
            Log("Heard no talking within " FIRST_WORDS_MS " ms")
            break
        }
        ; Stop watching if dictation was ended some other way, like clicking the mic.
        if (A_TickCount - lastCheck >= 500) {
            lastCheck := A_TickCount
            if !FindButton(hwnd, IsDictationStop) {
                Log("Dictation was already stopped")
                LogLevels(quietMax, voiceMax)
                return
            }
        }
    }
    LogLevels(quietMax, voiceMax)
    if (stopBtn := FindButton(hwnd, IsDictationStop)) {
        PressButton(stopBtn.el)
        Log("Dictation stopped")
    }
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
        if (chatBox := PromptBox(hwnd))
            try ComCall(3, chatBox.el)   ; SetFocus
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
    WinWaitActive(hwnd, , 3)
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
    root := ComPtr(p)
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

; Claude's message box. It's picked by what it is rather than where it is on the page, because
; other text boxes can be there too, like a code file open next to the chat.
PromptBox(hwnd) {
    for item in GetElements(hwnd, UIA_EDIT)
        if (item.name == "Prompt" || item.name ~= "i)prompt to Claude|^Reply to Claude" || InStr(ElementClass(item.el), "ProseMirror"))
            return item
    return ""
}

ElementClass(el) {
    ComCall(30, el, "ptr*", &bstr := 0)   ; CurrentClassName
    name := bstr ? StrGet(bstr, "UTF-16") : ""
    DllCall("OleAut32\SysFreeString", "ptr", bstr)
    return name
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
