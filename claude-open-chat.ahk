; Stream Deck button: open one of your Claude chats
;
; Opens Claude (or brings it to the front), switches to the Chat and Cowork page, and opens the
; chat named in CHAT_NAME below. Change CHAT_NAME to the exact title of one of your chats as it
; shows in Claude's sidebar. For more chats, make a copy of this file per chat (for example
; claude-open-chat-work.ahk) and give each copy its own CHAT_NAME.
; Voice mode has its own button: claude-voice-on-off.ahk.
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.
; If something goes wrong, a message pops up and the details are saved in a log file named
; after this file (like claude-open-chat-log.txt), next to it.

#Requires AutoHotkey v2.0 64-bit
#SingleInstance Ignore
#NoTrayIcon

; ---- Settings ---------------------------------------------------------------
CHAT_NAME  := "My chat"                                         ; <-- change to your chat's exact title (capitals matter)
CLAUDE_APP := "shell:AppsFolder\Claude_pzs8sxrjxfjjc!Claude"    ; how Windows starts the Claude app
LOG_FILE   := A_ScriptDir "\" RegExReplace(A_ScriptName, "\.ahk$") "-log.txt"
; -----------------------------------------------------------------------------

; UI Automation lets the script find Claude's buttons by their names instead of by screen position.
UIA := ComObject("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")
UIA_BUTTON := 50000, UIA_RADIO := 50013, UIA_GROUP := 50026
LogLines := []

if (A_LineFile = A_ScriptFullPath)
    Main()

Main() {
    try {
        OpenChat()
    } catch as err {
        Log("FAILED: " err.Message)
        try Log("Switches Claude showed: " JoinNames(GetElements(FindClaudeWindow(), UIA_RADIO)))
        try Log("Buttons Claude showed: " JoinNames(GetElements(FindClaudeWindow(), UIA_BUTTON)))
        WriteLog()
        MsgBox(err.Message "`n`nDetails: " LOG_FILE, "Claude chat button", "Icon! T20")
        ExitApp
    }
    WriteLog()
}

OpenChat() {
    hwnd := OpenClaude()

    ; 1. Switch Claude to the Chat side (not Code). Right after launch the page needs a moment to load.
    if !(radio := WaitFor(() => FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork"), 20000))
        throw Error("Couldn't read Claude's window. It may still be loading, so try the button again.")
    if !IsSelected(radio.el) {
        Log("Switching Claude to Chat and Cowork")
        SelectItem(radio.el)
        ; Wait for the switch, so the Code page's sidebar isn't searched by mistake.
        if !WaitFor(() => ChatPageShowing(hwnd), 5000)
            throw Error("Claude didn't switch to the Chat and Cowork page.")
    }

    ; 2. Open the chat.
    chat := WaitFor(() => FindSidebarItem(hwnd), 6000)
    if (!chat && (btn := FindButton(hwnd, n => n ~= "i)^(show|open|expand) sidebar$"))) {
        Log("Sidebar was hidden, showing it")
        Invoke(btn.el)
        chat := WaitFor(() => FindSidebarItem(hwnd), 3000)
    }
    if (!chat && (btn := FindButton(hwnd, n => n == "Pinned"))) {
        Log("Expanding the Pinned section")
        Invoke(btn.el)
        chat := WaitFor(() => FindSidebarItem(hwnd), 3000)
        if !chat
            Invoke(btn.el)   ; put the section back the way it was
    }
    if !chat
        throw Error("Couldn't find a chat named '" CHAT_NAME "' in Claude's sidebar. Check CHAT_NAME at the "
            . "top of " A_ScriptName " matches the chat's title exactly. Pinning the chat keeps it in the sidebar.")
    Log("Opening sidebar item '" chat.name "'")
    Invoke(chat.el)

    ; 3. Check that the chat is showing.
    if WaitFor(() => FindButton(hwnd, IsChatHeader), 8000)
        Log("'" CHAT_NAME "' is open")
    else
        Log("Didn't see '" CHAT_NAME "' at the top of the chat")
}

; ---- What counts as which button --------------------------------------------

; Sidebar rows read "<status> <title>", like "Idle My chat".
IsChatItem(name) {
    if (name == CHAT_NAME)
        return true
    if StartsWith(name, "More options for ")
        return false
    return SubStr(name, -StrLen(CHAT_NAME) - 1) == " " CHAT_NAME
}

; The chat's row in the sidebar. Only the sidebar is searched, since other buttons can end in the
; chat's name too (like a step Claude Code lists as "Open My chat").
FindSidebarItem(hwnd) {
    for group in GetElements(hwnd, UIA_GROUP)
        if (group.name == "Sidebar")
            for item in ElementsUnder(group.el, UIA_BUTTON)
                if IsChatItem(item.name)
                    return item
    return ""
}

ChatPageShowing(hwnd) {
    tab := FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork")
    return tab && IsSelected(tab.el)
}

; The title at the top of an open chat reads like "My chat, rename chat".
IsChatHeader(name) => StartsWith(name, CHAT_NAME ", rename")

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
    WinWaitActive(hwnd, , 3)
    WakeAccessibility(hwnd)
    return hwnd
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
    return ElementsUnder(UiaPtr(p), controlType)
}

; Returns every element of one type inside root, as {el, name}.
ElementsUnder(root, controlType) {
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

GetPattern(el, patternId, iid) {
    guid := Buffer(16)
    DllCall("ole32\CLSIDFromString", "wstr", iid, "ptr", guid)
    ComCall(14, el, "int", patternId, "ptr", guid, "ptr*", &p := 0)   ; GetCurrentPatternAs
    return p ? UiaPtr(p) : ""
}

Invoke(el) {
    if !(pattern := GetPattern(el, 10000, "{fb377fbe-8ea6-46d5-9c73-6499642d3059}"))
        throw Error("One of Claude's buttons couldn't be pressed.")
    ComCall(3, pattern)   ; Invoke
}

SelectItem(el) {
    if !(pattern := GetPattern(el, 10010, "{a8efa66a-0fda-421a-9194-38021f3578ea}"))
        return Invoke(el)
    ComCall(3, pattern)   ; Select
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
