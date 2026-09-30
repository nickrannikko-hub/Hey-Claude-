; Stream Deck button: switch Claude between the Chat and Cowork page and the Code page
;
; Each press flips to the other page and brings Claude to the front. But in a game (or anything else
; full screen), Claude flips pages from behind it, so you stay in the game. With the captions on,
; they do the switching, instantly.
; If Claude is closed, it starts it first.
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.

#Requires AutoHotkey v2.0 64-bit
#SingleInstance Ignore
#NoTrayIcon

CLAUDE_APP := "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"   ; how Windows starts the Claude app

; UI Automation lets the script find Claude's page switch by its name instead of by screen position.
UIA := ComObject("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")
UIA_RADIO := 50013

Front := 0, Behind := false   ; the window in front when pressed, and whether it's a game (or anything full screen) Claude stays behind

; With the captions on (claude-captions.ahk), they switch it: they already know where Claude's switch
; is, so it's instant. (This looks for it first, which takes most of a second in a long conversation.)
DetectHiddenWindows true
SetTitleMatchMode 2
for captions in WinGetList(A_ScriptDir "\claude-captions.ahk ahk_class AutoHotkey") {
    PostMessage(DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.SwitchPage", "uint"), 0, 0, , captions)
    ExitApp
}
DetectHiddenWindows false

if !(hwnd := OpenClaude())
    ExitApp
; Right after Claude starts, the page needs a moment to load.
chatTab := WaitFor(() => FindTab(hwnd, "Chat and Cowork"), 30000)
codeTab := chatTab ? FindTab(hwnd, "Code") : ""
if !(chatTab && codeTab) {
    MsgBox("Couldn't find Claude's 'Chat and Cowork' and 'Code' switch.", "Switch Claude page", "Icon! T10")
    ExitApp
}
other := IsSelected(chatTab.el) ? codeTab : chatTab
; From behind a game, the switch is clicked with click messages sent to Claude's window (see
; PostClick): switching through UI Automation lets Claude jump in front of the game.
if !(Behind && PostClick(other.el, hwnd)) {
    if Behind
        DllCall("LockSetForegroundWindow", "uint", 1)   ; LSFW_LOCK: Claude can't take the front meanwhile
    SelectItem(other.el)
    if Behind {
        Sleep 200
        DllCall("LockSetForegroundWindow", "uint", 2)   ; LSFW_UNLOCK
        if !WinActive(Front)
            try WinActivate(Front)
    }
}

OpenClaude() {
    global Front, Behind
    Front := WinExist("A")
    Behind := Front && CoversScreen(Front)
    if !(hwnd := FindClaudeWindow()) {
        Run CLAUDE_APP
        hwnd := WaitFor(FindClaudeWindow, 30000)
    }
    if !hwnd
        return 0
    if (hwnd = Front)
        Behind := false
    if Behind {   ; (restored if it was minimized, so its page can switch, but not in front)
        if (WinGetMinMax(hwnd) = -1)
            DllCall("ShowWindow", "ptr", hwnd, "int", 4)   ; SW_SHOWNOACTIVATE
        if !WinActive(Front)   ; (starting Claude can take the front; the game gets it back)
            try WinActivate(Front)
    } else {
        if (WinGetMinMax(hwnd) = -1)
            WinRestore hwnd
        WinActivate hwnd
    }
    return hwnd
}

; Clicks a switch by sending Claude's window the click messages themselves, at its middle: no mouse
; moves, and nothing lets Claude take the front. Returns false if it isn't somewhere it can be
; clicked. (As in claude-voice-on-off-send.ahk.)
PostClick(el, hwnd) {
    if !(hwnd && WinExist(hwnd))
        return false
    old := DllCall("SetThreadDpiAwarenessContext", "ptr", -4, "ptr")   ; (real screen pixels, like UI Automation's)
    try {
        rect := Buffer(16, 0)
        ComCall(43, el, "ptr", rect)   ; CurrentBoundingRectangle
        left := NumGet(rect, 0, "int"), top := NumGet(rect, 4, "int"), right := NumGet(rect, 8, "int"), bottom := NumGet(rect, 12, "int")
        if (right <= left || bottom <= top)
            return false
        pt := Buffer(8), NumPut("int", (left + right) // 2, "int", (top + bottom) // 2, pt)
        DllCall("ScreenToClient", "ptr", hwnd, "ptr", pt)
        x := NumGet(pt, 0, "int"), y := NumGet(pt, 4, "int")
        client := Buffer(16, 0), DllCall("GetClientRect", "ptr", hwnd, "ptr", client)
        if (x < 0 || y < 0 || x >= NumGet(client, 8, "int") || y >= NumGet(client, 12, "int"))
            return false
        spot := (y & 0xFFFF) << 16 | (x & 0xFFFF)
        DllCall("PostMessage", "ptr", hwnd, "uint", 0x200, "ptr", 0, "ptr", spot)   ; WM_MOUSEMOVE
        DllCall("PostMessage", "ptr", hwnd, "uint", 0x201, "ptr", 1, "ptr", spot)   ; WM_LBUTTONDOWN (MK_LBUTTON)
        Sleep 30
        DllCall("PostMessage", "ptr", hwnd, "uint", 0x202, "ptr", 0, "ptr", spot)   ; WM_LBUTTONUP
        return true
    } catch {
        return false
    } finally {
        DllCall("SetThreadDpiAwarenessContext", "ptr", old, "ptr")
    }
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

; Finds one of the page switches at the top of Claude ("Chat and Cowork" or "Code").
; Its name can gain a status, like "Code, working", so match the start.
FindTab(hwnd, prefix) {
    WakeAccessibility(hwnd)
    for item in GetElements(hwnd, UIA_RADIO)
        if (SubStr(item.name, 1, StrLen(prefix)) == prefix)
            return item
    return ""
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

; ---- UI Automation helpers ----------------------------------------------------

class UiaPtr {
    __New(ptr) => this.Ptr := ptr
    __Delete() => (this.Ptr && ObjRelease(this.Ptr))
}

; Returns every element of one type in the window, as {el, name}.
GetElements(hwnd, controlType) {
    ComCall(6, UIA, "ptr", hwnd, "ptr*", &p := 0)               ; ElementFromHandle
    root := UiaPtr(p)
    v := Buffer(24, 0)                                           ; VARIANT holding the control type
    NumPut("ushort", 3, v, 0), NumPut("int", controlType, v, 8)
    ComCall(23, UIA, "int", 30003, "ptr", v, "ptr*", &p := 0)    ; CreatePropertyCondition(ControlType)
    cond := UiaPtr(p)
    ComCall(6, root, "int", 4, "ptr", cond, "ptr*", &p := 0)     ; FindAll(descendants)
    found := UiaPtr(p)
    ComCall(3, found, "int*", &count := 0)                       ; Length
    items := []
    loop count {
        try {
            ComCall(4, found, "int", A_Index - 1, "ptr*", &p := 0)   ; GetElement
            el := UiaPtr(p)
            ComCall(23, el, "ptr*", &bstr := 0)                     ; CurrentName
            name := bstr ? StrGet(bstr, "UTF-16") : ""
            DllCall("OleAut32\SysFreeString", "ptr", bstr)
            items.Push({el: el, name: Trim(RegExReplace(name, "\s+", " "))})
        }
    }
    return items
}

GetPattern(el, patternId, iid) {
    guid := Buffer(16)
    DllCall("ole32\CLSIDFromString", "wstr", iid, "ptr", guid)
    ComCall(14, el, "int", patternId, "ptr", guid, "ptr*", &p := 0)   ; GetCurrentPatternAs
    return p ? UiaPtr(p) : ""
}

SelectItem(el) {
    if (pattern := GetPattern(el, 10010, "{a8efa66a-0fda-421a-9194-38021f3578ea}"))
        ComCall(3, pattern)   ; Select
    else if (pattern := GetPattern(el, 10000, "{fb377fbe-8ea6-46d5-9c73-6499642d3059}"))
        ComCall(3, pattern)   ; Invoke
}

IsSelected(el) {
    if !(pattern := GetPattern(el, 10010, "{a8efa66a-0fda-421a-9194-38021f3578ea}"))
        return false
    ComCall(6, pattern, "int*", &selected := 0)   ; CurrentIsSelected
    return selected != 0
}

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
