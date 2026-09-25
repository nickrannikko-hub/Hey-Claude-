-- Claude voice controls for Mac: EXPERIMENTAL and UNTESTED
--
-- A Hammerspoon (https://www.hammerspoon.org) port of the Windows AutoHotkey scripts in the folder
-- above. It hasn't been run on a Mac yet, so expect rough edges. If something doesn't work, use
-- "Save Claude's button names" in the menu bar icon and share that file plus claude-log.txt.
--
-- Install: copy this file into ~/.hammerspoon/, add the line   require("claude")   to
-- ~/.hammerspoon/init.lua, and reload Hammerspoon. See README.md in this folder for the rest.
--
-- It works like the Windows version: it finds Claude's buttons by their names (so Claude must be
-- in English) and presses them. Differences on Mac:
--   * Dictation ends when your words in the message box stop changing for a couple of seconds
--     (Windows listens to the mic level; Hammerspoon can't).
--   * After a goodbye in voice mode, it waits for Claude's reply to appear, plus about as long as
--     reading it out loud takes (Windows listens to Claude's sound).
--   * "Hey Claude" comes from macOS Voice Control (see README.md), which runs the ⌃⌥⌘H shortcut.

local M = {}

-- ---- Settings ---------------------------------------------------------------
M.settings = {
  chats = { "My chat" },          -- exact titles of chats to open (capitals matter): ⌃⌥⌘1, ⌃⌥⌘2, ...
  hotkeyMods = { "ctrl", "alt", "cmd" },
  silenceSeconds = 2,             -- dictation ends once your words have stopped changing this long
  firstWordsSeconds = 7,          -- ...or if no words show up within this long
  nextWordsSeconds = 7,           -- back-and-forth: how long to wait for your next message
  keepGoing = true,               -- send button: after Claude replies, listen for your next message
  voiceIdleSeconds = 5,           -- end voice mode after just "Listening" this long (0 turns it off)
  goodbyeMaxSeconds = 5,          -- after a goodbye in voice mode, end it within this long
  bundleID = "com.anthropic.claudefordesktop",   -- the Claude app; the setup check tells you if it's wrong
  -- A message ending with one of these ends a back-and-forth (and, said in voice mode, voice mode).
  -- Longer phrases go before shorter ones they contain.
  signOffs = { "talk to you later", "see you later", "talk later", "see you", "see ya", "good night",
    "bye bye", "goodbye", "good bye", "bye", "i'm done", "i am done", "we're done", "all done",
    "that's all", "that is all", "stop listening", "end conversation" },
}
local S = M.settings
local LOG = os.getenv("HOME") .. "/.hammerspoon/claude-log.txt"
-- -----------------------------------------------------------------------------

-- ---- Small helpers ------------------------------------------------------------

local function log(msg)
  local f = io.open(LOG, "a")
  if f then
    f:write(os.date("%Y-%m-%d %H:%M:%S") .. "  " .. msg .. "\n")
    f:close()
  end
  print("[claude] " .. msg)
end

local function now() return hs.timer.secondsSinceEpoch() end

-- Waits without freezing Hammerspoon (inside run(), everything is a coroutine).
local function sleep(seconds)
  if coroutine.isyieldable() and coroutine.applicationYield then
    coroutine.applicationYield(seconds)
  else
    hs.timer.usleep(math.floor(seconds * 1000000))
  end
end

local function waitFor(check, seconds)
  local deadline = now() + seconds
  repeat
    local result = check()
    if result then return result end
    sleep(0.25)
  until now() > deadline
  return nil
end

local function startsWith(s, prefix) return s:sub(1, #prefix) == prefix end
local function endsWith(s, suffix) return #s >= #suffix and s:sub(-#suffix) == suffix end
local function tidy(s) return (s:gsub("%s+", " "):gsub("^ ", ""):gsub(" $", "")) end
local function exact(text) return function(name) return name == text end end
local function wordCount(s) local n = 0; for _ in s:gmatch("%S+") do n = n + 1 end; return n end

local function beep()
  local sound = hs.sound.getByName("Tink")
  if sound then sound:play() end
end

-- Runs an action as a coroutine, so it can wait without freezing anything. Only one action with
-- the same label runs at a time. Errors show as a short alert and go in the log.
local busy = {}
local function run(label, fn)
  if busy[label] then log("Ignored " .. label .. ": the last one is still running"); return end
  busy[label] = true
  coroutine.wrap(function()
    local ok, err = xpcall(fn, debug.traceback)
    busy[label] = nil
    if not ok then
      log("FAILED (" .. label .. "): " .. tostring(err))
      hs.alert.show("Claude: " .. tostring(err):match("^[^\n]*"), 6)
    end
  end)()
end

-- ---- Reading Claude's window ---------------------------------------------------

local BUTTONISH = { AXButton = true, AXCheckBox = true, AXPopUpButton = true, AXMenuButton = true,
  AXRadioButton = true, AXLink = true }

-- A control's name: its title, else its description (web labels), else a text's value.
local function nameOf(el)
  local t = el.AXTitle
  if type(t) == "string" and t ~= "" then return t end
  t = el.AXDescription
  if type(t) == "string" and t ~= "" then return t end
  if el.AXRole == "AXStaticText" then
    t = el.AXValue
    if type(t) == "string" then return t end
  end
  return ""
end

-- Walks everything inside root, in page order. visit(el, role, name) returns true to stop.
local function walk(root, visit, maxNodes)
  local count, stop = 0, false
  local function go(el, depth)
    if stop or depth > 80 then return end
    count = count + 1
    if count > (maxNodes or 20000) then stop = true; return end
    local role = el.AXRole or ""
    if visit(el, role, nameOf(el)) then stop = true; return end
    local kids = el.AXChildren
    if type(kids) == "table" then
      for _, kid in ipairs(kids) do
        go(kid, depth + 1)
        if stop then return end
      end
    end
  end
  go(root, 0)
end

local function findFirst(root, test)
  local found
  walk(root, function(el, role, name) if test(role, name, el) then found = el; return true end end)
  return found
end

local function findAll(root, test)
  local list = {}
  walk(root, function(el, role, name) if test(role, name, el) then list[#list + 1] = { el = el, name = name } end end)
  return list
end

local function button(root, test)
  return findFirst(root, function(role, name) return BUTTONISH[role] and test(name) end)
end

local function press(el) el:performAction("AXPress") end

local function claudeApp()
  return hs.application.get(S.bundleID) or hs.application.get("Claude")
end

-- Opens Claude (or brings it to the front) and returns the app and its main window.
local function openClaude()
  local app = claudeApp()
  if not app then
    log("Claude isn't open, starting it")
    if not hs.application.launchOrFocusByBundleID(S.bundleID) then hs.application.launchOrFocus("Claude") end
    app = waitFor(function() local a = claudeApp(); return a and a:mainWindow() and a end, 30)
    if not app then error("Claude didn't open within 30 seconds.", 0) end
  end
  app:activate()
  local ax = hs.axuielement.applicationElement(app)
  -- Apps built on Electron, like Claude, only show their buttons to other apps once asked to.
  pcall(function() ax:setAttributeValue("AXManualAccessibility", true) end)
  local win = waitFor(function() return ax.AXMainWindow or ax.AXFocusedWindow end, 5)
  if not win then error("Couldn't read Claude's window.", 0) end
  return app, win
end

-- The page switches at the top ("Chat and Cowork", "Code"). Names can gain a status ("Code, working").
local function tab(win, prefix)
  return findFirst(win, function(role, name) return role == "AXRadioButton" and startsWith(name, prefix) end)
end

local function isSelected(radio)
  local v = radio and radio.AXValue
  return v == 1 or v == true
end

local function onChatPage(win) return isSelected(tab(win, "Chat and Cowork")) end

local function selectChatPage(win)
  local chat = waitFor(function() return tab(win, "Chat and Cowork") end, 20)
  if not chat then error("Couldn't find Claude's 'Chat and Cowork' switch. Is Claude in English and finished loading?", 0) end
  if not isSelected(chat) then
    log("Switching Claude to Chat and Cowork")
    press(chat)
    if not waitFor(function() return onChatPage(win) end, 5) then error("Claude didn't switch to the Chat and Cowork page.", 0) end
  end
end

-- Claude's message box, found by what it is, not where it is (a code file can be open beside it).
local function isPromptBox(role, name)
  return role == "AXTextArea" and (name == "Prompt" or name:find("prompt to Claude", 1, true) ~= nil
    or startsWith(name, "Reply to Claude"))
end

local function promptBox(win) return findFirst(win, isPromptBox) end

local function promptText(win)
  local box = promptBox(win)
  local v = box and box.AXValue
  return type(v) == "string" and tidy(v) or ""
end

-- Puts the cursor in the message box and presses keys there, only if the cursor really is there.
local function pressInPrompt(app, win, mods, key)
  local box = promptBox(win)
  if not box then error("Couldn't find Claude's message box, so no keys were pressed.", 0) end
  app:activate()
  box:setAttributeValue("AXFocused", true)
  sleep(0.15)
  if not box.AXFocused then error("Couldn't put the cursor in Claude's message box, so no keys were pressed.", 0) end
  hs.eventtap.keyStroke(mods, key, 20000, app)
end

-- The chat or session title, from the "<title>, rename ..." button at the top of the chat.
local function chatTitle(win)
  local header = button(win, function(name) return name:find(", rename ", 1, true) ~= nil end)
  return header and nameOf(header):gsub(", rename .*$", "") or ""
end

local function hasMessages(win)
  return findFirst(win, function(_, name) return name:match("^Message %d+ of %d+") ~= nil end) ~= nil
end

-- ---- Goodbyes ----------------------------------------------------------------------

local TAILS = { "claude", "for now", "then", "thanks", "thank you" }
local FILLERS = { "okay", "ok", "alright", "all right", "thanks", "thank you", "so", "well", "yeah", "yes",
  "claude", "hey", "and", "for now", "now", "then" }

local function plainWords(text)
  local s = text:lower():gsub("\226\128\153", "'")   -- curly apostrophe
  s = s:gsub("[^a-z' ]+", " "):gsub(" +", " ")
  return (s:gsub("^ ", ""):gsub(" $", ""))
end

local function replaceAll(s, find, replacement)
  local out, i = {}, 1
  while true do
    local a, b = s:find(find, i, true)
    if not a then out[#out + 1] = s:sub(i); break end
    out[#out + 1] = s:sub(i, a - 1) .. replacement
    i = b + 1
  end
  return table.concat(out)
end

-- "...thanks, bye." Words tacked on after the goodbye, like "Claude" or "for now", don't count.
local function endsWithSignOff(text)
  local words = plainWords(text)
  for _ = 1, 3 do
    for _, tail in ipairs(TAILS) do
      if endsWith(words, " " .. tail) then words = words:sub(1, #words - #tail - 1) end
    end
  end
  for _, phrase in ipairs(S.signOffs) do
    if words == phrase or endsWith(words, " " .. phrase) then return true end
  end
  return false
end

-- Nothing but a goodbye, like "Okay, I'm done."
local function isOnlySignOff(text)
  if not endsWithSignOff(text) then return false end
  local rest = " " .. plainWords(text) .. " "
  for _ = 1, 3 do
    for _, phrase in ipairs(S.signOffs) do rest = replaceAll(rest, " " .. phrase .. " ", " ") end
    for _, filler in ipairs(FILLERS) do rest = replaceAll(rest, " " .. filler .. " ", " ") end
  end
  return rest:match("^%s*$") ~= nil
end

-- In voice mode, also short phrases with "bye" in them.
local function isVoiceSignOff(text)
  if endsWithSignOff(text) then return true end
  local words = plainWords(text)
  if wordCount(words) > 4 then return false end
  local padded = " " .. words .. " "
  return padded:find(" goodbye ", 1, true) or padded:find(" good bye ", 1, true)
    or padded:find(" bye ", 1, true) or padded:find(" bibi ", 1, true)
end

-- ---- Dictation ------------------------------------------------------------------------

local function isDictationStop(name) return name == "Stop dictation" or name == "Finish dictation" end
local function dictationStop(win) return button(win, isDictationStop) end
local function claudeBusy(win)
  return button(win, function(n) return n == "Stop" or n == "Stop response" or n == "Stop generating" end)
end

local conversation = nil   -- set while a dictation is running; conversation.cancel asks it to stop

-- Watches your words arrive in the message box. Ends dictation once they stop changing for
-- silenceSeconds, or if none arrive within firstWords seconds.
local function watchDictation(win, before, firstWords, conv)
  local start, last, lastChange = now(), promptText(win), nil
  while true do
    sleep(0.3)
    local stopBtn = dictationStop(win)
    if not stopBtn then return "stopped" end
    if conv.cancel then press(stopBtn); log("Dictation stopped (button pressed again)"); return "cancelled" end
    local text = promptText(win)
    if text ~= last then last, lastChange = text, now() end
    if lastChange and text ~= before and now() - lastChange >= S.silenceSeconds then
      press(stopBtn); log("Dictation stopped: your words stopped changing"); return "quiet"
    end
    if not lastChange and now() - start >= firstWords then
      press(stopBtn); log("Dictation stopped: no words within " .. firstWords .. " seconds"); return "no talking"
    end
  end
end

-- New words in the message box once they've settled, or "" if none came.
local function waitForNewText(win, before, seconds)
  local deadline, last, settledSince = now() + seconds, promptText(win), now()
  while now() < deadline do
    sleep(0.25)
    local text = promptText(win)
    if text ~= last then
      last, settledSince = text, now()
    elseif text ~= "" and text ~= before and now() - settledSince >= 1 then
      return text
    end
  end
  return ""
end

-- Still in the same page and chat the conversation started in? (A new chat renaming itself after
-- your first message doesn't count as a switch.)
local function stillHere(win, conv)
  if conv.cancel then log("The conversation was ended with the button"); return false end
  if onChatPage(win) ~= conv.chatPage then log("Switched page, so the conversation is over"); return false end
  local title = chatTitle(win)
  if title ~= conv.title then
    if not conv.renameOk then log("Switched chat, so the conversation is over"); return false end
    conv.title, conv.renameOk = title, false
  end
  return true
end

-- Claude's Stop button shows while it replies and goes away when it's done.
local function waitForReply(win, conv)
  waitFor(function() return claudeBusy(win) end, 5)
  log("Waiting for Claude to finish replying")
  while true do
    if not stillHere(win, conv) then return false end
    if not claudeBusy(win) then return true end
    sleep(0.5)
  end
end

-- Dictates into the message box; with send, sends it; with keepGoing, listens again after each reply.
local function dictate(app, win, send, keepGoing)
  local dictateBtn = waitFor(function() return button(win, exact("Dictate")) end, 8)
  if not dictateBtn then
    if button(win, exact("Press and hold to record")) then
      error("Claude's mic is set to 'Hold to record'. Turn that off in Dictation settings (the arrow next to the mic).", 0)
    end
    error("Couldn't find Claude's 'Dictate' button.", 0)
  end
  local conv = { cancel = false, chatPage = onChatPage(win), title = chatTitle(win), renameOk = not hasMessages(win) }
  conversation = conv
  local ok, err = pcall(function()
    local firstWords = S.firstWordsSeconds
    while true do
      local before = promptText(win)
      press(dictateBtn)
      if not waitFor(function() return dictationStop(win) end, 3) then error("Pressed 'Dictate' but dictation didn't start.", 0) end
      log("Dictation started")
      beep()
      local ended = watchDictation(win, before, firstWords, conv)
      -- If Claude only fills in the words once dictation stops, they show up now.
      local text = waitForNewText(win, before, ended == "no talking" and 4 or 8)
      if text ~= "" and ended == "no talking" then ended = "quiet" end
      if text == "" then
        log("Nothing was said, so nothing was sent")
      elseif send then
        if keepGoing and before == "" and isOnlySignOff(text) then
          pressInPrompt(app, win, { "cmd" }, "a")
          pressInPrompt(app, win, {}, "delete")
          log("Heard '" .. text .. "', so the conversation is over (not sent)")
          return
        end
        pressInPrompt(app, win, {}, "return")
        log("Sent: " .. text)
        if keepGoing and endsWithSignOff(text) then log("You signed off, so the conversation is over"); return end
      end
      if not (send and keepGoing) or ended ~= "quiet" or conv.cancel then return end
      if not waitForReply(win, conv) then return end
      sleep(1)
      if not stillHere(win, conv) then return end
      dictateBtn = waitFor(function() return button(win, exact("Dictate")) end, 3)
      if not dictateBtn then log("Couldn't find 'Dictate' to listen again"); return end
      log("Listening again for your next message")
      firstWords = S.nextWordsSeconds
    end
  end)
  conversation = nil
  if not ok then error(err, 0) end
end

-- ---- Voice mode -------------------------------------------------------------------------

local function isVoiceModeControl(name) return name == "Turn off microphone" or name == "Turn on microphone" end
local function voiceOn(win) return button(win, isVoiceModeControl) ~= nil end

-- Ends voice mode with its Stop button, or Esc if that doesn't do it.
local function stopVoice(app, win)
  local stopBtn = button(win, exact("Stop"))
  if stopBtn and voiceOn(win) then
    press(stopBtn)
    if waitFor(function() return not voiceOn(win) end, 2) then log("Ended voice mode"); return end
  end
  app:activate()
  local box = promptBox(win)
  if box then box:setAttributeValue("AXFocused", true) end
  hs.eventtap.keyStroke({}, "escape", 20000, app)
  log("Pressed Esc to end voice mode")
end

-- While voice mode is on (once this script started it): end it on a goodbye, once Claude's reply
-- has appeared and had time to be read out, or after just "Listening" for voiceIdleSeconds.
local voiceWatch = nil

local function isTimeLabel(text)
  local t = tidy(text):lower()
  return t == "" or t == "just now" or t == "now" or t == "yesterday" or t == "a moment ago"
    or t:match("^an? %a+ ago$") ~= nil or t:match("^%d+ %a+ ago$") ~= nil or t:match("^%d%d?:%d%d ?[ap]?m?$") ~= nil
end

-- The newest thing you said and Claude's newest reply, each as "Message 38|<full text>". Each
-- message holds a short "You said: ..." / "Claude responded: ..." label, then the full text.
local function newestMessages(groups)
  local said, reply
  for i = #groups, 1, -1 do
    if said and reply then break end
    local g = groups[i]
    local texts = {}
    walk(g.el, function(_, role, name) if role == "AXStaticText" and name ~= "" then texts[#texts + 1] = name end end, 400)
    local label = texts[1] or ""
    local mine, theirs = startsWith(label, "You said: "), startsWith(label, "Claude responded: ")
    if (mine and not said) or (theirs and not reply) then
      local parts = {}
      for j = 2, #texts do if not isTimeLabel(texts[j]) then parts[#parts + 1] = texts[j] end end
      local full = #parts > 0 and table.concat(parts, " ") or label:gsub("^[^:]*: ", "")
      local key = (g.name:match("^(Message %d+)") or g.name) .. "|" .. full
      if mine then said = key else reply = key end
    end
  end
  return said or "", reply or ""
end

local function stopVoiceWatch(reason)
  if voiceWatch then
    voiceWatch.timer:stop()
    voiceWatch = nil
    if reason then log(reason) end
  end
end

local function voiceTick()
  local st = voiceWatch
  if not st or st.ticking then return end
  st.ticking = true
  local ok, err = pcall(function()
    local app = claudeApp()
    if not app then return stopVoiceWatch("Claude closed") end
    local ax = hs.axuielement.applicationElement(app)
    local win = ax.AXMainWindow
    if not win then return end
    -- One walk through the window for everything needed this second.
    local on, groups, prompt = false, {}, ""
    walk(win, function(el, role, name)
      if BUTTONISH[role] and isVoiceModeControl(name) then on = true
      elseif isPromptBox(role, name) then local v = el.AXValue; prompt = type(v) == "string" and tidy(v) or ""
      elseif name:match("^Message %d+ of %d+") then groups[#groups + 1] = { el = el, name = name } end
    end)
    if not on then return stopVoiceWatch("Voice mode is off") end
    local t = now()
    local said, reply = newestMessages(groups)
    if st.lastSaid == nil then st.lastSaid, st.candidate, st.lastReply = said, said, reply; return end
    if reply ~= st.lastReply then
      st.lastReply, st.lastActivity, st.awaiting = reply, t, false
      st.busyUntil = t + wordCount(reply:gsub("^[^|]*|", "")) * 0.4   -- about 2.5 words a second read out
      if st.pending then st.pending.replySeen = true end
    end
    if prompt ~= "" then st.lastActivity = t end   -- your words show in the message box as you talk
    if said ~= st.lastSaid then
      st.lastActivity = t
      if said == st.candidate then   -- settled for a second
        st.lastSaid, st.awaiting, st.awaitingSince = said, true, t
        local message, text = said:match("^([^|]*)|(.*)$")
        text = text or ""
        if st.pending and message == st.pending.message then
          -- the goodbye message itself got updated; keep going
        elseif isVoiceSignOff(text) then
          if not st.pending then
            st.pending = { message = message, since = t }
            log("You said '" .. text .. "' in voice mode; ending it once Claude replies")
          end
        else
          if st.pending then st.pending = nil; log("You kept talking after the goodbye, so voice mode stays on") end
          log("You said something in voice mode (" .. wordCount(text) .. " words)")
        end
      else
        st.candidate = said
      end
    else
      st.candidate = said
    end
    if st.pending then
      local finished = st.pending.replySeen and t >= st.busyUntil + 1
      if finished or t - st.pending.since >= S.goodbyeMaxSeconds then
        stopVoiceWatch(finished and "Claude finished replying" or "Ending voice mode now")
        stopVoice(app, win)
      end
      return
    end
    local waiting = (st.awaiting and t - st.awaitingSince < 15) or t < st.busyUntil
    if S.voiceIdleSeconds > 0 and not waiting and t - st.lastActivity >= S.voiceIdleSeconds then
      stopVoiceWatch("Voice mode was just listening for " .. S.voiceIdleSeconds .. " seconds with nobody talking")
      stopVoice(app, win)
    end
  end)
  if voiceWatch == st then st.ticking = false end
  if not ok then log("Voice watch problem: " .. tostring(err)) end
end

local function startVoiceWatch()
  stopVoiceWatch()
  voiceWatch = { lastActivity = now(), busyUntil = 0, awaiting = false, awaitingSince = 0 }
  voiceWatch.timer = hs.timer.doEvery(1, function() coroutine.wrap(voiceTick)() end)
  log("Watching voice mode for a goodbye or silence")
end

-- ---- The actions ------------------------------------------------------------------------

function M.open()
  run("open", function()
    local _, win = openClaude()
    selectChatPage(win)
  end)
end

function M.quit()
  run("quit", function()
    local app = claudeApp()
    if not app then return end
    app:kill()   -- asks Claude to quit, like Cmd+Q
    if waitFor(function() return not app:isRunning() end, 10) then log("Quit Claude"); return end
    local choice = hs.dialog.blockAlert("Claude is still running. Force it closed?",
      "If Claude is asking you something, click No and answer it there.", "No", "Force close")
    if choice == "Force close" then app:kill9() end
  end)
end

function M.switchPage()
  run("page", function()
    local _, win = openClaude()
    local chat = waitFor(function() return tab(win, "Chat and Cowork") end, 30)
    local code = tab(win, "Code")
    if not (chat and code) then error("Couldn't find Claude's 'Chat and Cowork' and 'Code' switch.", 0) end
    press(isSelected(chat) and code or chat)
  end)
end

-- A chat's row in the sidebar reads "<status> <title>", like "Idle My chat". Only the sidebar is
-- searched, since other buttons can end in the chat's name too.
local function sidebarItem(win, name)
  for _, sidebar in ipairs(findAll(win, function(role, n) return n == "Sidebar" and not BUTTONISH[role] end)) do
    local item = button(sidebar.el, function(n)
      return n == name or (not startsWith(n, "More options for ") and endsWith(n, " " .. name))
    end)
    if item then return item end
  end
  return nil
end

function M.openChat(name)
  run("chat", function()
    local _, win = openClaude()
    selectChatPage(win)
    local item = waitFor(function() return sidebarItem(win, name) end, 6)
    if not item then
      error("Couldn't find a chat named '" .. name .. "' in Claude's sidebar. Check the name in the settings; pinning the chat keeps it in the sidebar.", 0)
    end
    log("Opening '" .. name .. "'")
    press(item)
    if waitFor(function() return button(win, function(n) return startsWith(n, name .. ", rename") end) end, 8) then
      log("'" .. name .. "' is open")
    end
  end)
end

-- The voice button. send: dictation sends itself. startOnly ("Hey Claude"): only turns things on,
-- and on the Code page takes one message (no back-and-forth).
function M.voice(send, startOnly)
  if conversation then
    if not startOnly then conversation.cancel = true end
    return
  end
  run("voice", function()
    local app, win = openClaude()
    if not waitFor(function() return tab(win, "Chat and Cowork") end, 20) then
      error("Couldn't read Claude's window. Is Claude in English and finished loading?", 0)
    end
    local stopBtn = dictationStop(win)
    if stopBtn then
      if startOnly then log("Dictation is already on"); return end
      press(stopBtn); log("Dictation stopped"); return
    end
    local keepGoing = send and S.keepGoing and not startOnly
    if not onChatPage(win) then return dictate(app, win, send, keepGoing) end
    if voiceOn(win) then
      if startOnly then
        log("Voice mode is already on")
        if not voiceWatch then startVoiceWatch() end
      else
        stopVoiceWatch(); stopVoice(app, win)
      end
      return
    end
    waitFor(function() return button(win, function(n) return n == "Use voice mode" or n == "Dictate" end) end, 8)
    local voiceBtn = button(win, exact("Use voice mode"))
    if voiceBtn then
      press(voiceBtn)
      log("Started voice mode")
      if waitFor(function() return voiceOn(win) end, 5) then startVoiceWatch() end
      return
    end
    log("Voice mode isn't available here, so using dictation")
    dictate(app, win, send, keepGoing)
  end)
end

-- Checks what these scripts need and says what's missing. Doesn't change anything.
function M.setupCheck()
  run("check", function()
    local lines = {}
    local function report(level, text)
      lines[#lines + 1] = (level == "ok" and "OK    " or level == "fix" and "FIX   " or "NOTE  ") .. text
    end
    if hs.accessibilityState(true) then
      report("ok", "Hammerspoon has Accessibility permission")
    else
      report("fix", "Give Hammerspoon Accessibility permission: System Settings > Privacy & Security > Accessibility, then reload Hammerspoon.")
    end
    local path = hs.application.pathForBundleID(S.bundleID)
    if path then report("ok", "Claude app found: " .. path)
    else report("fix", "Couldn't find the Claude app under bundle ID " .. S.bundleID .. ". Install it from claude.ai/download, or fix bundleID in the settings.") end
    if not claudeApp() then
      report("note", "Claude isn't open, so its buttons weren't checked. Open Claude and run this again.")
    else
      local ok, win = pcall(function() local _, w = openClaude(); return w end)
      if not ok then
        report("fix", "Couldn't read Claude's window: " .. tostring(win))
      elseif not waitFor(function() return tab(win, "Chat and Cowork") end, 8) then
        report("fix", "Couldn't find Claude's 'Chat and Cowork' switch. Claude needs to be in English and finished loading. If it is, use 'Save Claude's button names' and share the file.")
      else
        report("ok", "Claude is open, in English, and its buttons can be read")
        if onChatPage(win) then
          report("note", "'Hold to record' wasn't checked: switch Claude to the Code page and run this again.")
        elseif button(win, exact("Press and hold to record")) then
          report("fix", "'Hold to record' is on. On Claude's Code page, click the arrow next to the mic and untick Hold to record.")
        elseif button(win, function(n) return n == "Dictate" or isDictationStop(n) end) then
          report("ok", "'Hold to record' is off")
        else
          report("note", "Couldn't find the Code page's mic button, so 'Hold to record' wasn't checked.")
        end
      end
    end
    report("note", "For \"Hey Claude\", set up a Voice Control command (see README.md).")
    local text = table.concat(lines, "\n")
    log("Setup check:\n" .. text)
    hs.dialog.blockAlert("Claude scripts: setup check", text)
  end)
end

-- Saves the names of Claude's buttons, switches and boxes (not chat text) for bug reports.
function M.saveButtonNames()
  run("dump", function()
    local _, win = openClaude()
    local out = {}
    walk(win, function(_, role, name)
      if role ~= "AXStaticText" and name ~= "" then out[#out + 1] = role .. "  " .. name end
    end)
    local file = os.getenv("HOME") .. "/.hammerspoon/claude-button-names.txt"
    local f = io.open(file, "w")
    if f then f:write(table.concat(out, "\n")); f:close() end
    hs.alert.show("Saved Claude's button names to ~/.hammerspoon/claude-button-names.txt", 5)
  end)
end

-- ---- Shortcuts, menu bar icon, and Stream Deck links ----------------------------------------

local mods = S.hotkeyMods
local quitMods = {}
for _, m in ipairs(mods) do quitMods[#quitMods + 1] = m end
quitMods[#quitMods + 1] = "shift"

hs.hotkey.bind(mods, "o", M.open)
hs.hotkey.bind(mods, "p", M.switchPage)
hs.hotkey.bind(mods, "v", function() M.voice(false) end)
hs.hotkey.bind(mods, "s", function() M.voice(true) end)
hs.hotkey.bind(mods, "h", function() M.voice(true, true) end)
hs.hotkey.bind(quitMods, "q", M.quit)
for i, name in ipairs(S.chats) do
  if i <= 9 then hs.hotkey.bind(mods, tostring(i), function() M.openChat(name) end) end
end

-- Stream Deck (or anything that opens links): hammerspoon://claude?do=voice, and so on.
hs.urlevent.bind("claude", function(_, params)
  local action = params["do"]
  if action == "open" then M.open()
  elseif action == "quit" then M.quit()
  elseif action == "page" then M.switchPage()
  elseif action == "chat" then M.openChat(params.name or S.chats[1])
  elseif action == "voice" then M.voice(false)
  elseif action == "send" then M.voice(true)
  elseif action == "hey" then M.voice(true, true)
  elseif action == "check" then M.setupCheck()
  else hs.alert.show("Claude: unknown action '" .. tostring(action) .. "'") end
end)

M.menu = hs.menubar.new()
if M.menu then
  M.menu:setTitle("✳")
  M.menu:setTooltip("Claude voice controls")
  M.menu:setMenu(function()
    local items = {
      { title = "Open Claude  (⌃⌥⌘O)", fn = M.open },
      { title = "Switch Chat / Code page  (⌃⌥⌘P)", fn = M.switchPage },
    }
    for i, name in ipairs(S.chats) do
      items[#items + 1] = { title = "Open chat: " .. name .. (i <= 9 and ("  (⌃⌥⌘" .. i .. ")") or ""), fn = function() M.openChat(name) end }
    end
    for _, item in ipairs({
      { title = "-" },
      { title = "Voice / dictation on-off  (⌃⌥⌘V)", fn = function() M.voice(false) end },
      { title = "Voice / dictation, sending by itself  (⌃⌥⌘S)", fn = function() M.voice(true) end },
      { title = "Hey Claude: start voice mode or one message  (⌃⌥⌘H)", fn = function() M.voice(true, true) end },
      { title = "-" },
      { title = "Quit Claude  (⌃⌥⇧⌘Q)", fn = M.quit },
      { title = "-" },
      { title = "Setup check", fn = M.setupCheck },
      { title = "Save Claude's button names (for bug reports)", fn = M.saveButtonNames },
      { title = "Open log", fn = function() hs.execute("open -e " .. string.format("%q", LOG)) end },
    }) do items[#items + 1] = item end
    return items
  end)
end

-- For testing the text checks on their own.
M._checks = { endsWithSignOff = endsWithSignOff, isOnlySignOff = isOnlySignOff, isVoiceSignOff = isVoiceSignOff,
  isTimeLabel = isTimeLabel }

log("Loaded Claude voice controls")
return M
