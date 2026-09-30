; Stream Deck button: open the Claude app on the Chat and Cowork page
;
; Starts Claude if it's closed, or brings it to the front if it's already open,
; then switches it to the Chat and Cowork page.
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.

#Requires AutoHotkey v2.0 64-bit
#SingleInstance Ignore
#NoTrayIcon

CLAUDE_APP := "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"   ; how Windows starts the Claude app

; UI Automation lets the script find Claude's page switch by its name instead of by screen position.
UIA := ComObject("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")
UIA_RADIO := 50013

if !(hwnd := OpenClaude())
    ExitApp
; Right after Claude starts, the page needs a moment to load.
if !(chatTab := WaitFor(() => FindTab(hwnd, "Chat and Cowork"), 30000)) {
    MsgBox("Claude opened, but its 'Chat and Cowork' switch couldn't be found.", "Open Claude", "Icon! T10")
    ExitApp
}
if !IsSelected(chatTab.el)
    SelectItem(chatTab.el)

OpenClaude() {
    if !(hwnd := FindClaudeWindow()) {
        Run CLAUDE_APP
        hwnd := WaitFor(FindClaudeWindow, 30000)
    }
    if hwnd {
        if (WinGetMinMax(hwnd) = -1)
            WinRestore hwnd
        WinActivate hwnd
    }
    return hwnd
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
