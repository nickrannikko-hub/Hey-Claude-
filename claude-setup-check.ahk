; Setup check: tests everything these scripts need and says what's missing
;
; Double-click it once after downloading, with Claude open. It checks AutoHotkey, the Claude app
; and how the scripts start it, that Claude is in English, "Hold to record", Windows' speech
; recognizer (for "Hey Claude") and your microphone, then shows the results. It only looks; it
; doesn't change anything. The results are also saved in claude-setup-check-log.txt.

#Requires AutoHotkey v2.0 64-bit
; Borrows the voice button's code for finding Claude's window and buttons.
#Include %A_LineFile%\..\claude-voice-on-off-send.ahk

if (A_LineFile = A_ScriptFullPath)
    SetupCheck()

SetupCheck() {
    results := []
    ; level: "ok", "fix" (something to sort out) or "note"
    Report(level, text) => results.Push((level = "ok" ? "OK     " : level = "fix" ? "FIX    " : "NOTE   ") text)

    Report("ok", "AutoHotkey " A_AhkVersion " (64-bit)")

    ; The Claude app, and whether the scripts' CLAUDE_APP setting can start it.
    appIds := []
    try {
        for item in ComObject("Shell.Application").NameSpace("shell:AppsFolder").Items()
            if (item.Name = "Claude")
                appIds.Push(item.Path)
    }
    expected := RegExReplace(CLAUDE_APP, "^shell:AppsFolder\\")
    if !appIds.Length {
        Report("fix", "Couldn't find the Claude app in the Start menu. Install it from claude.ai/download.")
    } else {
        found := false
        for id in appIds
            if (id = expected)
                found := true
        if found
            Report("ok", "Claude app is installed, and the scripts know how to start it")
        else
            Report("fix", "Claude is installed differently than the scripts expect, so they can't start it (they still "
                . "work once it's open). In each script, set CLAUDE_APP to:  shell:AppsFolder\" appIds[1])
    }

    ; Claude's window: English labels, and Hold to record.
    if !(hwnd := FindClaudeWindow()) {
        Report("note", "Claude isn't open, so its buttons weren't checked. Open Claude and run this again.")
    } else {
        WakeAccessibility(hwnd)
        if !WaitFor(() => FindByPrefix(hwnd, UIA_RADIO, "Chat and Cowork"), 8000) {
            Report("fix", "Couldn't find Claude's 'Chat and Cowork' switch. Claude's app needs to be in English and finished loading.")
        } else {
            Report("ok", "Claude is open, in English, and the scripts can read its buttons")
            if OnChatPage(hwnd)
                Report("note", "'Hold to record' wasn't checked: switch Claude to the Code page and run this again.")
            else if FindButton(hwnd, n => n == "Press and hold to record")
                Report("fix", "'Hold to record' is on. On Claude's Code page, click the small arrow next to the mic "
                    . "(Dictation settings) and untick Hold to record.")
            else if FindButton(hwnd, n => n == "Dictate" || IsDictationStop(n))
                Report("ok", "'Hold to record' is off")
            else
                Report("note", "Couldn't find the Code page's mic button, so 'Hold to record' wasn't checked.")
        }
    }

    ; Windows' speech recognizer and the microphone, for "Hey Claude" and the voice buttons.
    micName := ""
    try {
        reco := ComObject("SAPI.SpInProcRecognizer")
        recognizer := reco.Recognizer.GetDescription()
        try micName := reco.GetAudioInputs().Item(0).GetDescription()
        if InStr(recognizer, "English")
            Report("ok", "Speech recognizer for 'Hey Claude': " recognizer)
        else
            Report("fix", "Windows' speech recognizer (" recognizer ") isn't English, and 'Hey Claude' needs English (US). "
                . "The buttons still work.")
    } catch {
        Report("fix", "Windows' speech recognizer isn't available, so 'Hey Claude' won't work. The buttons still do.")
    }
    try {
        OpenMicMeter()
        Report("ok", "Microphone: " (micName != "" ? micName : "found (Windows' default)"))
    } catch {
        Report("fix", "No microphone found. Plug one in, or set a default one in Windows' sound settings.")
    }

    if FileExist(A_ProgramFiles "\Elgato\StreamDeck\StreamDeck.exe")
        Report("ok", "Stream Deck software is installed")
    else
        Report("note", "No Stream Deck software found. That's fine: use claude-hotkeys.ahk for keyboard shortcuts instead.")

    problems := 0
    for line in results
        if (SubStr(line, 1, 3) = "FIX")
            problems++
    summary := problems ? problems " thing" (problems = 1 ? "" : "s") " to sort out (marked FIX)." : "Everything's ready."
    text := summary "`n`n"
    for line in results
        text .= line "`n"
    try FileOpen(A_ScriptDir "\claude-setup-check-log.txt", "w", "UTF-8").Write(FormatTime(, "yyyy-MM-dd HH:mm") "`n" text)
    if !(A_Args.Length && A_Args[1] = "--no-popup")
        MsgBox(text, "Claude scripts: setup check", problems ? "Icon!" : "Iconi")
}
