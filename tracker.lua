QuestHelper_File["tracker.lua"] = "Development Version"

local tracker = CreateFrame("Frame", "QuestHelperQuestWatchFrame", UIParent)
local minbutton = CreateFrame("Button", "QuestHelperQuestWatchFrameMinimizeButton", UIParent)

QuestHelper.tracker = tracker

tracker:Hide()
tracker:SetPoint("TOPRIGHT", QuestWatchFrame)
tracker:SetWidth(200)
tracker:SetHeight(100)
tracker.dw, tracker.dh = 200, 100

local in_tracker = 0

minbutton:SetFrameLevel(tracker:GetFrameLevel()+2)
minbutton:Hide()
minbutton:SetPoint("TOPRIGHT", QuestWatchFrame)
minbutton:SetWidth(10)
minbutton:SetHeight(5)
local minbutton_tex = minbutton:CreateTexture()
minbutton_tex:SetAllPoints()
minbutton_tex:SetTexture(.8, .8, .8)

minbutton:SetScript("OnClick", function ()
  QuestHelper_Pref.track_minimized = not QuestHelper_Pref.track_minimized
  if QuestHelper_Pref.track_minimized then
    tracker:Hide()
  else
    tracker:Show()
  end
end)

minbutton:SetScript("OnEnter", function (self)
  self:SetAlpha(1)
end)

minbutton:SetScript("OnLeave", function (self)
  self:SetAlpha(QuestHelper_Pref.track_minimized and .3 or .5)
end)

local unused_items = {}
local used_items = {}

local function itemupdate(item, delta)
  local done = true
  
  local a = item:GetAlpha()
  a = a + delta
  
  if a < 1 then
    item:SetAlpha(a)
    done = false
  else
    item:SetAlpha(1)
  end
  
  local t = item.t + delta
  
  if t < 1 then
    item.t = t
    local it = 1-t
    local sp = math.sqrt(t-t*t)
    item.x, item.y = item.sx*it+item.dx*t+(item.sy-item.dy)*sp, item.sy*it+item.dy*t+(item.dx-item.sx)*sp
    done = false
  else
    item.t = 1
    item.x, item.y = item.dx, item.dy
  end
  
  item:ClearAllPoints()
  item:SetPoint("TOPLEFT", tracker, "TOPLEFT", item.x, item.y)
  
  if done then
    item:SetScript("OnUpdate", nil)
  end
end

local function itemfadeout(item, delta)
  local a = item:GetAlpha()
  a = a - delta
  
  if a > 0 then
    item:SetAlpha(a)
  else
    item:SetAlpha(1)
    item:Hide()
    item:SetScript("OnUpdate", nil)
    return
  end
  
  local t = item.t + delta
  
  if t < 1 then
    item.t = t
    local it = 1-t
    local sp = math.sqrt(t-t*t)
    item.x, item.y = item.sx*it+item.dx*t+(item.sy-item.dy)*sp, item.sy*it+item.dy*t+(item.dx-item.sx)*sp
  else
    item.t = 1
    item.x, item.y = item.dx, item.dy
  end
  
  item:ClearAllPoints()
  item:SetPoint("TOPLEFT", tracker, "TOPLEFT", item.x, item.y)
end

local function itemclick(item, button)
  if button == "RightButton" then
    local quest = item.quest
    local index = 1
    while true do
      local title = GetQuestLogTitle(index)
      if not title then break end
      
      if title == quest then
        if UberQuest then
          -- UberQuest needs a little extra effort to work properly.
          
          if UberQuest_List:IsShown() and GetQuestLogSelection() == index then
            ToggleQuestLog()
          else
            QuestLog_SetSelection(index)
            
            -- By hiding the list, the replaced ToggleQuestLog function should try to reshow it
            -- and in the process update the frames to reflect the selected quest.
            UberQuest_List:Hide()
            UberQuest_Details:Show()
            ToggleQuestLog()
          end
        else
          -- This code seems to work properly with the builtin questlog, as well as bEQL and DoubleWide.
          
          if QuestLogFrame:IsShown() and GetQuestLogSelection() == index then
            -- If the selected quest is already being shown, hide it.
            ToggleQuestLog()
          else
            -- Otherwise, select it and show it.
            QuestLog_SetSelection(index)
            
            if not QuestLogFrame:IsShown() then
              ToggleQuestLog()
            end
          end
        end
        
        return
      end
      
      index = index + 1
    end
  end
end

local function addItem(name, obj, y, quest)
  local x = quest and 4 or 20
  local item = used_items[obj]
  if not item then
    item = next(unused_items)
    if item then
      unused_items[item] = nil
    else
      item = CreateFrame("Frame", nil, tracker)
      item.text = item:CreateFontString()
      item.text:SetShadowColor(0, 0, 0, .8)
      item.text:SetShadowOffset(1, -1)
      item.text:SetPoint("TOPLEFT", item)
    end
    
    if quest then
      item.text:SetFont(QuestHelper.font.serif, 12)
      item.text:SetTextColor(.82, .65, 0)
    else
      item.text:SetFont(QuestHelper.font.sans, 12)
      item.text:SetTextColor(.82, .82, .82)
    end
    
    used_items[obj] = item
    item.sx, item.sy, item.x, item.y, item.dx, item.dy, item.t = x+30, y, x, y, x, y, 0
    item:SetScript("OnUpdate", itemupdate)
    item:SetAlpha(0)
    item:Show()
  end
  
  item.used = true
  
  item.quest = quest
  item.text:SetText(name)
  local w, h = item.text:GetWidth(), item.text:GetHeight()
  item:SetWidth(w)
  item:SetHeight(h)
  
  if quest then
    item:SetScript("OnMouseDown", itemclick)
    item:EnableMouse(true)
  end
  
  if item.dx ~= x or item.dy ~= y then
    item.sx, item.sy, item.dx, item.dy = item.x, item.y, x, y
    item.t = 0
    item:SetScript("OnUpdate", itemupdate)
  end
  
  return w+x+4, h
end

local function ccode(r1, g1, b1, r2, g2, b2, p)
  local ip
  p, ip = p*255, 255-p*255
  return string.format("|cff%02x%02x%02x", r1*ip+r2*p, g1*ip+g2*p, b1*ip+b2*p)
end

local function qname(index)
  local title, level, qtype, players, header, collapsed, status, daily = QuestHelper:FixedGetQuestLogTitle(index)
  
  if QuestHelper_Pref.track_level then
    -- Append levels to quests.
    
    if qtype then
      title = string.format("[%d+] %s", level, title)
    elseif players and players > 1 then
      title = string.format("[%dG%d] %s", level, players, title)
    else
      title = string.format("[%d] %s", level, title)
    end
  end
  
  if QuestHelper_Pref.track_qcolour then
    local player_level = QuestHelper.player_level
    local delta = level - player_level
    
    local colour
    
    if delta >= 5 then
      colour = "|cffff0000"
    elseif delta >= 0 then
      colour = ccode(1, 1, 0, 1, 0, 0, delta/5)
    else
      local grey
      
      if player_level >= 60 then grey = player_level - 9
      elseif player_level >= 40 then grey = player_level - math.floor(player_level/5) - 1
      elseif player_level >= 6 then grey = player_level - math.floor(player_level/10) - 5
      else grey = 0 end
      
      if level > grey then
        colour = ccode(0, 1, 0, 1, 1, 0, (grey-level)/(grey-player_level))
      else
        colour = ccode(.4, .4, .4, .2, .8, .2, (1-level)/(1-grey))
      end
    end
    
    title = string.format("%s%s", colour, title)
  end
  
  return title
end

local function oname(text)
  if QuestHelper_Pref.track_ocolour then
    local mn, mx = text:match("%s*(.-)%s*/%s*(.-)%s*")
    local mnn, mxn = tonumber(mn), tonumber(mx)
    
    if mnn and mxn then
      pct = mnn == mxn or mxn == 0 and 1 or mnn/mxn
    else
      pct = mn == mx and 1 or 0
    end
    
    text = string.format("%s%s", pct < 0.5 and ccode(1, 0, 0, 1, 1, 0, pct*2) or ccode(1, 1, 0, 0, 1, 0, pct*2-1), text)
  end
  
  return text
end

local function removeUnusedItem(obj, item)
  unused_items[item] = true
  used_items[obj] = nil
  item.used = false
  item.t = 0
  item.sx, item.sy = item.x, item.y
  item.dx, item.dy = item.x+30, item.y
  item:SetScript("OnMouseDown", nil)
  item:EnableMouse(false)
  item:SetScript("OnUpdate", itemfadeout)
end

local resizing = false
local check_delay = 4
local seen = {}
local reverse_map = {}
local was_inside = false

function tracker:reset()
  for obj, item in pairs(used_items) do
    removeUnusedItem(obj, item)
    check_delay = 5
  end
end

function tracker:update(delta)
  if not delta then
    -- This is called without a value when the questlog is updated.
    -- We'll make sure we update the display on the next update.
    check_delay = 5
    return
  end
  
  if resizing then
    local t = self.t+delta
    
    if t > 1 then
      self:SetWidth(self.dw)
      self:SetHeight(self.dh)
      resizing = false
    else
      self.t = t
      local it = 1-t
      self:SetWidth(self.sw*it+self.dw*t)
      self:SetHeight(self.sh*it+self.dh*t)
    end
  end
  
  -- Manually checking if the mouse is in the frame, because if I used on OnEnter, i'd have to enable mouse input,
  -- and if I did that, it would prevent the player from using the mouse to change the view if they clicked inside
  -- the tracker.
  local x, y = GetCursorPosition()
  local s = 1/self:GetEffectiveScale()
  x, y = x*s, y*s

  local inside = x >= self:GetLeft() and y >= self:GetBottom() and x < self:GetRight() and y < self:GetTop()
  if inside ~= was_inside then
    was_inside = inside
    if inside then
      minbutton:Show()
    elseif not QuestHelper_Pref.track_minimized then
      minbutton:Hide()
    end
  end
  
  check_delay = check_delay + delta
  if check_delay > 5 then
    check_delay = 0
    
    local quests = QuestHelper.quest_log
    local added = 0
    local x, y = 4, 4
    local gap = 0
    local track_size = QuestHelper_Pref.track_size
    
    for obj, item in pairs(used_items) do
      item.used = false
    end
    
    for i, foo in ipairs(QuestHelper.route) do
      for obj in pairs(foo.before) do
        local info = quests[obj]
        
        if info and not seen[info] then
          seen[info] = true
          added = added + 1
          
          local w, h = addItem(qname(info.index), obj, -(y+gap), GetQuestLogTitle(info.index))
          x = math.max(x, w)
          y = y + h + gap
          
          gap = 2
          
          if info.goal then
            for i, subinfo in pairs(info.goal) do
              local obj = subinfo.objective
              if obj then
                reverse_map[obj] = GetQuestLogLeaderBoard(i, info.index)
              end
            end
          
            for i, subobj in ipairs(QuestHelper.route) do
              local name = reverse_map[subobj]
              if name then
                added = added + 1
                w, h = addItem(oname(name), subobj, -y)
                x = math.max(x, w)
                y = y + h
              end
            end
            
            for key in pairs(reverse_map) do
              reverse_map[key] = nil
            end
          end
        end
        
        if added > track_size then
          break
        end
      end
      
      if added > track_size then
        break
      end
      
      local info = quests[foo]
      if info and not seen[info] then
        -- Since we should have ran into the quest's objective first, we'll assume this quest doesn't have any.
        seen[info] = true
        added = added + 1
        
        local w, h = addItem(qname(info.index), foo, -(y+gap), GetQuestLogTitle(info.index))
        x = math.max(x, w)
        y = y + h + gap
        gap = 2
      end
      
      if added > track_size then
        break
      end
    end
    
    for obj, item in pairs(used_items) do
      if not item.used then
        removeUnusedItem(obj, item)
      end
    end
    
    for key in pairs(seen) do
      seen[key] = false
    end
    
    y = y+4
    
    if x ~= tracker.dw or y ~= tracker.dy then
      tracker.t = 0
      tracker.sw, tracker.sh = tracker:GetWidth(), tracker:GetHeight()
      tracker.dw, tracker.dh = x, y
      resizing = true
    end
    
    added = 0
  end
end

tracker:SetScript("OnUpdate", tracker.update)

-------------------------------------------------------------------------------------------------
-- This batch of stuff is to make sure the original tracker (and any modifications) stay hidden

local orig_TrackerOnShow = QuestWatchFrame:GetScript("OnShow")
local orig_TrackerBackdropOnShow   -- bEQL (and perhaps other mods) add a backdrop to the tracker
local TrackerBackdropFound = false

local function TrackerBackdropOnShow(self, ...)
  if QuestHelper_Pref.track and not QuestHelper_Pref.hide then
    TrackerBackdropFound:Hide()
  end

  if orig_TrackerBackdropOnShow then
    return orig_TrackerBackdropOnShow(self, ...)
  end
end

function tracker:HideDefaultTracker()
  -- The easy part: hide the original tracker
  QuestWatchFrame:Hide()

  -- The harder part: check if a known backdrop is present (but we don't already know about it).
  -- If it is, make sure it's hidden, and hook its OnShow to make sure it stays that way.
  -- Unfortunately, I can't figure out a good time to check for this once, so we'll just have
  -- to keep checking.  Hopefully, this won't happen too often.
  if not TrackerBackdropFound then
    if QuestWatchFrameBackdrop then
      -- Found bEQL's QuestWatchFrameBackdrop...
      TrackerBackdropFound = QuestWatchFrameBackdrop
    end

    if TrackerBackdropFound then
      -- OK, we found something - so hide it, and make sure it doesn't rear its ugly head again
      TrackerBackdropFound:Hide()

      orig_TrackerBackdropOnShow = TrackerBackdropFound:GetScript("OnShow")
      TrackerBackdropFound:SetScript("OnShow", TrackerBackdropOnShow)
    end
  end
end

function tracker:ShowDefaultTracker()
  QuestWatchFrame:Show()

  if TrackerBackdropFound then
    TrackerBackdropFound:Show()
  end
end

local function QuestWatchFrameOnShow(self, ...)
  if QuestHelper_Pref.track and not QuestHelper_Pref.hide then
    tracker:HideDefaultTracker()
  end

  if orig_TrackerOnShow then
    return orig_TrackerOnShow(self, ...)
  end
end

QuestWatchFrame:SetScript("OnShow", QuestWatchFrameOnShow)

function QuestHelper:ShowTracker()
  tracker:HideDefaultTracker()
  
  if QuestHelper_Pref.track_minimized then
    minbutton:Show()
    minbutton:SetAlpha(.3)
  else
    minbutton:SetAlpha(.5)
    tracker:Show()
  end
end

function QuestHelper:HideTracker()
  tracker:ShowDefaultTracker()
  tracker:Hide()
  minbutton:Hide()
end

