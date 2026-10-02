; Stream Deck button: Claude voice mode or dictation, on/off
;
; Chat and Cowork page: toggles voice mode in the chat that's showing.
; Code page, or anywhere voice mode isn't available: toggles dictation, which types what you
; say into the message box. Dictation ends by itself once you've been quiet for 2 seconds (3.5 once
; you've been talking a while, so a pause to think doesn't cut you off), and what you said is left
; in the message box for you to send. Pressing the button again ends either one right away.
;
; It's the claude-voice-on-off-send.ahk button with the sending (and the back-and-forth that listens
; again after each reply) turned off: it uses that script's code rather than a copy of its own, so
; everything fixed or added there works here too, like staying behind a game instead of dropping you
; out of it, and telling talking from a noisy room (a fan, game audio) so dictation still ends.
;
; Stream Deck setup: drag a System > Open action onto a button and point it at this file.
; If something goes wrong, a message pops up and the details are saved in
; claude-voice-on-off-log.txt next to this file.

#Requires AutoHotkey v2.0 64-bit
; The send button's code. It goes before this script's own settings below, because its settings
; (its log file, and the sending and listening again) are set as it's read in, and these replace them.
#Include %A_LineFile%\..\claude-voice-on-off-send.ahk
#SingleInstance Force   ; a second press replaces a running one, so it can end dictation early
#NoTrayIcon

; ---- Settings ---------------------------------------------------------------
; (The rest, like how long a quiet ends dictation, are the send button's: see the top of
; claude-voice-on-off-send.ahk.)
NO_SEND         := true    ; what you dictate stays in the message box: it's never sent
KEEP_GOING_MS   := 0       ; no listening again after Claude replies (that's the send button's conversation mode)
BEEP_WHEN_READY := false   ; no beep when dictation starts listening (this button never had one)
LOG_FILE        := A_ScriptDir "\claude-voice-on-off-log.txt"
; -----------------------------------------------------------------------------

if (A_LineFile = A_ScriptFullPath)
    RunVoiceButton()
