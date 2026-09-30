; Stream Deck button: the captions box, with the pointer on it
;
; Brings the captions box up with the mouse pointer on it, to click and type in. In a game, the box
; takes the mouse and keyboard while you use it (the game dims a little and waits, and gets none of
; it); press the button again, press Esc, or click the game to go back to playing. Talking to Claude
; ("Hey Claude") works as always, without it.
;
; It's the same as the Claude key (Pause, unless you picked another in the captions' settings). If
; the captions aren't on, it turns them on first.
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.

#Requires AutoHotkey v2.0 64-bit
#SingleInstance Force
#NoTrayIcon

CAPTIONS := A_ScriptDir "\claude-captions.ahk"

DetectHiddenWindows true
SetTitleMatchMode 2
if !(captions := CaptionsWindow()) {
    if !FileExist(CAPTIONS) {
        MsgBox("Couldn't find claude-captions.ahk. Keep this file in the same folder as it.", "Claude cursor", "Icon! T10")
        ExitApp
    }
    Run('"' A_AhkPath '" "' CAPTIONS '"')
    deadline := A_TickCount + 10000
    while (!(captions := CaptionsWindow()) && A_TickCount < deadline)
        Sleep 250
    if !captions
        ExitApp
    Sleep 2500   ; (while they get going)
}
PostMessage(DllCall("RegisterWindowMessage", "str", "ClaudeCaptions.ClaudeKey", "uint"), 0, 0, , captions)

; The running captions' own window (the copy that stays on, not its helper).
CaptionsWindow() {
    for hwnd in WinGetList(CAPTIONS " ahk_class AutoHotkey")
        return hwnd
    return 0
}
