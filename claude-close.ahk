; Stream Deck button: quit the Claude app completely
;
; Uses Claude's own Menu > File > Exit, the same as quitting by hand. If Claude is still
; running 10 seconds later, it asks whether to force it closed.
; Quitting also stops any Code sessions running in Claude.
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.

#Requires AutoHotkey v2.0 64-bit
#SingleInstance Ignore
#NoTrayIcon

CLAUDE_APP := "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"   ; how Windows starts the Claude app

; UI Automation lets the script find Claude's menu items by their names instead of by screen position.
; If Claude's window stops answering for a moment, each request gives up after 4 seconds instead of
; Windows' usual 20, so the button can't hang that long (as in claude-voice-on-off-send.ahk). Then
; it goes on to the usual question about forcing Claude closed.
UIA := ComObject("{e22ad333-b25f-460c-83d0-0581107395c9}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")   ; CUIAutomation8
try ComCall(63, ComObjQuery(UIA, "{34723aff-0c9d-49d0-9896-7ab52df8cd8a}"), "uint", 4000)   ; IUIAutomation2 TransactionTimeout
UIA_BUTTON := 50000, UIA_MENUITEM := 50011

if (A_LineFile = A_ScriptFullPath)
    Main()

Main() {
    if !ClaudeProcesses().Length
        return   ; Claude isn't running
    try ExitFromMenu()
    if WaitFor(() => !ClaudeProcesses().Length, 10000)
        return
    answer := MsgBox("Claude is still running. Force it closed?`n`n"
        . "If Claude is asking you something, click No and answer it there.", "Close Claude", "YesNo Icon? T30")
    if (answer = "Yes")
        ForceClose()
}

; Menu > File > Exit, the same as quitting by hand.
ExitFromMenu() {
    if !(hwnd := FindClaudeWindow()) {
        ; Claude is running in the background with no window. Bring the window back to use its menu.
        Run CLAUDE_APP
        if !(hwnd := WaitFor(FindClaudeWindow, 10000))
            return
    }
    if (WinGetMinMax(hwnd) = -1)
        WinRestore hwnd
    WinActivate hwnd
    WakeAccessibility(hwnd)

    if !(menuBtn := WaitFor(() => FindNamed(hwnd, UIA_BUTTON, "Menu"), 5000))
        return
    Invoke(menuBtn.el)
    if !(fileItem := WaitFor(() => FindNamed(hwnd, UIA_MENUITEM, "File"), 3000))
        return
    Expand(fileItem.el)
    if (exitItem := WaitFor(() => FindNamed(hwnd, UIA_MENUITEM, "Exit"), 3000))
        Invoke(exitItem.el)
}

; Ends the Claude app's main process and everything it started.
ForceClose() {
    for proc in ClaudeProcesses()
        if !InStr(proc.cmd, "--type=")   ; helper processes have --type=; the main one doesn't
            RunWait("taskkill /F /T /PID " proc.pid, , "Hide")
}

; The Claude app's own processes. Claude Code's command-line tool is also named claude.exe,
; so match on where the app is installed.
ClaudeProcesses() {
    procs := []
    for proc in ComObjGet("winmgmts:").ExecQuery("SELECT ProcessId, ExecutablePath, CommandLine FROM Win32_Process WHERE Name = 'claude.exe'") {
        try {
            if InStr(proc.ExecutablePath, "\WindowsApps\Claude_")
                procs.Push({pid: proc.ProcessId, cmd: proc.CommandLine})
        }
    }
    return procs
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

FindNamed(hwnd, controlType, name) {
    for item in GetElements(hwnd, controlType)
        if (item.name == name)
            return item
    return ""
}

GetPattern(el, patternId, iid) {
    guid := Buffer(16)
    DllCall("ole32\CLSIDFromString", "wstr", iid, "ptr", guid)
    ComCall(14, el, "int", patternId, "ptr", guid, "ptr*", &p := 0)   ; GetCurrentPatternAs
    return p ? UiaPtr(p) : ""
}

Invoke(el) {
    if !(pattern := GetPattern(el, 10000, "{fb377fbe-8ea6-46d5-9c73-6499642d3059}"))
        throw Error("One of Claude's menu items couldn't be pressed.")
    ComCall(3, pattern)   ; Invoke
}

; Opens a submenu, like File.
Expand(el) {
    if (pattern := GetPattern(el, 10005, "{619be086-1f4e-4ee4-bafa-210128738730}")) {
        try {
            ComCall(3, pattern)   ; Expand
            return
        }
    }
    Invoke(el)
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
