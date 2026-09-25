; Keyboard shortcuts for all the buttons, for use without a Stream Deck
;
; Double-click this file once and the shortcuts below work anywhere in Windows. Each one runs the
; matching script, exactly like a Stream Deck button would, so pressing a voice shortcut again
; turns it off. While it runs, its icon sits in the corner of the taskbar: right-click it to see
; the list or exit. To have it start with Windows, put a shortcut to this file in your Startup
; folder (press Win+R and type shell:startup).
;
; Default shortcuts (left Ctrl + left Alt + a letter):
;   O  Open Claude              P  Switch Chat/Code page     C  Open your chat
;   V  Voice/dictation on-off   S  Same, sending by itself   H  "Hey Claude" on-off
;   Shift+Q  Quit Claude (Shift added so it's hard to hit by accident)

#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

; ---- Settings ---------------------------------------------------------------
; Each line: the keys, the script they run, and what it does. In the keys, ^ is Ctrl, ! is Alt,
; + is Shift and # is the Windows key; < means the left-hand one, so the AltGr key on some
; keyboards doesn't set them off. For example "<^<!v" is left Ctrl + left Alt + V.
SHORTCUTS := [
    ["<^<!o", "claude-open.ahk", "Open Claude"],
    ["<^<!+q", "claude-close.ahk", "Quit Claude"],
    ["<^<!p", "claude-switch-page.ahk", "Switch between the Chat and Code pages"],
    ["<^<!c", "claude-open-chat.ahk", "Open your chat"],
    ["<^<!v", "claude-voice-on-off.ahk", "Voice mode or dictation, on/off"],
    ["<^<!s", "claude-voice-on-off-send.ahk", "Voice mode or dictation, on/off, sending by itself"],
    ["<^<!h", "claude-hey-claude.ahk", "'Hey Claude' listening, on/off"]
]
; -----------------------------------------------------------------------------

for s in SHORTCUTS
    Hotkey(s[1], RunScript.Bind(A_ScriptDir "\" s[2]))

A_IconTip := "Claude keyboard shortcuts"
A_TrayMenu.Delete()
A_TrayMenu.Add("Show shortcuts", (*) => ShowShortcuts())
A_TrayMenu.Add("Exit", (*) => ExitApp())
ToolTip("Claude keyboard shortcuts are on. Right-click the icon near the clock for the list.")
SetTimer(() => ToolTip(), -4000)

RunScript(path, *) {
    if !FileExist(path) {
        MsgBox("Couldn't find " path "`n`nKeep claude-hotkeys.ahk in the same folder as the other scripts.", "Claude shortcuts", "Icon!")
        return
    }
    Run('"' A_AhkPath '" "' path '"')
}

ShowShortcuts() {
    text := ""
    for s in SHORTCUTS
        text .= Format("{:-22}{}`n", KeyText(s[1]), s[3])
    MsgBox(text, "Claude keyboard shortcuts")
}

; "<^<!+q" -> "Ctrl+Alt+Shift+Q"
KeyText(keys) {
    text := ""
    for pair in [["^", "Ctrl+"], ["!", "Alt+"], ["+", "Shift+"], ["#", "Win+"]]
        if InStr(RegExReplace(keys, "[a-zA-Z0-9]+$"), pair[1])
            text .= pair[2]
    return text StrUpper(RegExReplace(keys, "^[<>^!+#*~$]+"))
}
