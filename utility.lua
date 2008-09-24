QuestHelper_File["utility.lua"] = "Development Version"

local default_colour_theme =
  {message_prefix={0.4, 0.78, 1},
   message={1, 0.6, 0.2},
   tooltip={1, 0.8, 0.5},
   message_highlight={0.73, 1, 0.84},
   menu_text={1, 1, 1},
   menu_text_highlight={0, 0, 0},
   menu={0, 0, 0},
   menu_highlight={0.3, 0.5, 0.7}, 
   menu_title_text={1, 1, 1},
   menu_title_text_highlight={1, 1, 1},
   menu_title={0, 0.2, 0.6},
   menu_title_highlight={0.1, 0.4, 0.8}}

local xmas_colour_theme =
  {message_prefix={0.0, 0.7, 0.0},
   message={0.2, 1, 0.2},
   tooltip={0.4, 1, 0.4},
   message_highlight={1, 0.3, 0.1},
   menu_text={1, 1, 1},
   menu_text_highlight={0, 0, 0},
   menu={0.2, 0, 0},
   menu_highlight={1, 0.3, 0.3},
   menu_title_text={0.8, 1, 0.8},
   menu_title_text_highlight={1, 1, 1},
   menu_title={0.2, 0.6, 0.2},
   menu_title_highlight={0.4, 0.7, 0.4}}

function QuestHelper:GetColourTheme()
  if date("%b%d") == "Dec25" then
    return xmas_colour_theme
  end
  
  return default_colour_theme
end

QuestHelper.nop = function () end -- Who wouldn't want a function that does nothing?

function QuestHelper:HashString(text)
  -- Computes an Adler-32 checksum.
  local a, b = 1, 0
  for i=1,string.len(text) do
    a = (a+string.byte(text,i))%65521
    b = (b+a)%65521
  end
  return b*65536+a
end

function QuestHelper:CreateUID(length)
  local result = ""
  local characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  math.randomseed(math.random(0, 2147483647)+GetTime()*100000)
  local base = GetUnitName("player")..":"..GetRealmName()..":"..math.random(0, 2147483647)..":"..GetTime()..":"..time()
  
  for c = 1,(length or 32) do
    local pos = 1+math.floor(self:HashString(result..base..math.random(0, 2147483647))%string.len(characters))
    result = result .. string.sub(characters, pos, pos)
  end
  
  return result
end

function QuestHelper:ZoneSanity()
  local sane = true
  
  for c=1, select("#", GetMapContinents()) do
    for z=0, select("#", GetMapZones(c)) do
      local name
      
      if z == 0 then
        name = select(c, GetMapContinents())
      else
        name = select(z, GetMapZones(c))
      end
      
      assert(name)
      
      if QuestHelper_Zones[c][z] ~= name then
        sane = false
        QuestHelper:TextOut("'"..name.."' has the wrong ID.")
      end
      
      local pair = QuestHelper_ZoneLookup[name]
      
      if not pair or c ~= pair[1] or z ~= pair[2] then
        sane = false
        QuestHelper:TextOut("ZoneLookup['"..name.."'] maps to wrong pair.")
      end
      
      local index = QuestHelper_IndexLookup[name]
      if QuestHelper_ZoneLookup[index] ~= pair then
        sane = false
        QuestHelper:TextOut("ZoneLookup['"..name.."'] isn't equal to ZoneLookup["..index.."]")
      end
      
      if not index or QuestHelper_NameLookup[index] ~= name then
        sane = false
        QuestHelper:TextOut("NameLookup["..(index or "???").."'] doesn't equal '"..name.."'")
      end
    end
  end
  
  return sane
end

function QuestHelper:TextOut(text)
  local theme = self:GetColourTheme()
  DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff%2x%2x%2xQuestHelper: |r%s", theme.message_prefix[1]*255,
                                                                                theme.message_prefix[2]*255,
                                                                                theme.message_prefix[3]*255, text),
                                theme.message[1],
                                theme.message[2],
                                theme.message[3])
end

function QuestHelper:Error(what)
  DEFAULT_CHAT_FRAME:AddMessage("QuestHelper Error: "..(what or "Unknown").."\n"..debugstack(2), 1,.5,0)
  error("Abort!")
end

function QuestHelper:HighlightText(text)
  local theme = self:GetColourTheme()
  return string.format("|cff%2x%2x%2x%s|r", theme.message_highlight[1]*255,
                                            theme.message_highlight[2]*255,
                                            theme.message_highlight[3]*255, text)
end

function QuestHelper:GetUnitID(unit)
  local id = UnitGUID(unit)
  
  if id then
    return (string.sub(id, 5, 5) == "3") and tonumber(string.sub(id, 6, 12), 16) or nil
  end
  
  return nil
end

function QuestHelper:GetQuestID(index)
  return tonumber(select(3, string.find(GetQuestLink(index), "|Hquest:(%d+):")))
end

-- For future reference:
--  Hearthstone = 6948
--  Rune of Teleportation = 17031
--  Rune of Portals = 17032

function QuestHelper:CountItem(item_id)
  local count = 0
  
  for bag = 0,NUM_BAG_SLOTS do
    for slot = 1,GetContainerNumSlots(bag) do
      local link = GetContainerItemLink(bag, slot)
      if link and string.find(link, string.format("|Hitem:%d:", item_id)) then
        count = count + (select(2, GetContainerItemInfo(bag, slot)) or 0)
      end
    end
  end
  
  return count
end

function QuestHelper:ItemCooldown(item_id)
  local now = GetTime()
  local cooldown = nil
  
  for bag = 0,NUM_BAG_SLOTS do
    for slot = 1,GetContainerNumSlots(bag) do
      local link = GetContainerItemLink(bag, slot)
      if link and string.find(link, string.format("|Hitem:%d:", item_id)) then
        local s, d, e = GetContainerItemCooldown(bag, slot)
        if e then
          if cooldown then
            cooldown = math.min(cooldown, math.max(0, d-now+s))
          else
            cooldown = math.max(0, d-now+s)
          end
        else
          return 0
        end
      end
    end
  end
  
  return cooldown
end

function QuestHelper:TimeString(seconds)
  local seconds = math.ceil(seconds)
  local h, m, s = math.floor(seconds/(60*60)), math.floor(seconds/60)%60, seconds%60
  if h > 0 then
    return string.format("|cffffffff%d|r:|cffffffff%02d|r:|cffffffff%02d|r", h, m, s)
  else
    return string.format("|cffffffff%d|r:|cffffffff%02d|r", m, s)
  end
end

function QuestHelper:ProgressString(str, pct)
  if pct > 1 then
    return string.format("|cff00ff00%s|r", str)
  elseif pct < 0 then
    return string.format("|cffff0000%s|r", str)
  elseif pct > 0.5 then
    return string.format("|cff%2xff00%s|r", 510-pct*510, str)
  else
    return string.format("|cffff%2x00%s|r", pct*510, str)
  end
end

function QuestHelper:PercentString(pct)
  if pct > 1 then
    return string.format("|cff00ff00%.1f%%|r", pct*100)
  elseif pct < 0 then
    return string.format("|cffff0000%.1f%%|r", pct*100)
  elseif pct > 0.5 then
    return string.format("|cff%2xff00%.1f%%|r", 510-pct*510, pct*100)
  else
    return string.format("|cffff%2x00%.1f%%|r", pct*510, pct*100)
  end
end

function QuestHelper:PlayerPosition()
  return self.i, self.x, self.y
end

function QuestHelper:UnitPosition(unit)
  local c, z, x, y = self.Astrolabe:GetUnitPosition(unit,true)
  if c then
    if z == 0 then
      SetMapToCurrentZone()
      z = GetCurrentMapZone()
      if z ~= 0 then
        x, y = self.Astrolabe:TranslateWorldMapPosition(c, 0, x, y, c, z)
      end
    end
    return QuestHelper_IndexLookup[c][z], x, y
  else
    return self:PlayerPosition()
  end
end

function QuestHelper:LocationString(i, x, y)
  return ("[|cffffffff%s|r:|cffffffff%d,%.3f,%.3f|r]"):format(QuestHelper_NameLookup[i] or "nil", i, x, y)
end

function QuestHelper:Distance(i1, x1, y1, i2, x2, y2)
  local p1, p2 = QuestHelper_ZoneLookup[i1], QuestHelper_ZoneLookup[i2]
  return self.Astrolabe:ComputeDistance(p1[1], p1[2], x1, y1, p2[1], p2[2], x2, y2) or 10000
end

function QuestHelper:AppendPosition(list, index, x, y, w, min_dist)
  if (x == 0 and y == 0) or x <= -0.1 or y <= -0.1 or x >= 1.1 or y >= 1.1 then
    return list -- This isn't a real position.
  end
  
  local closest, distance = nil, 0
  w = w or 1
  min_dist = min_dist or 200
  
  for i, p in ipairs(list) do
    if index == p[1] then
      local d = self:Distance(index, x, y, p[1], p[2], p[3])
      if not closest or d < distance then
        closest, distance = i, d
      end
    end
  end
  
  if closest and distance < min_dist then
    local p = list[closest]
    p[2] = (p[2]*p[4]+x*w)/(p[4]+w)
    p[3] = (p[3]*p[4]+y*w)/(p[4]+w)
    p[4] = p[4]+w
  else
    table.insert(list, {index, x, y, w})
  end
  
  return list
end

function QuestHelper:PositionListDistance(list, index, x, y)
  local closest, distance = nil, 0
  for i, p in ipairs(list) do
    local d = self:Distance(index, x, y, p[1], p[2], p[3])
    if not closest or d < distance then
      closest, distance = p, d
    end
  end
  if closest then
    return distance, closest[1], closest[2], closest[3]
  end
end

function QuestHelper:PositionListDistance2(list, i1, x1, y1, i2, x2, y2)
  local closest, bd1, bd2, bdt = nil, 0, 0, 0
  for i, p in ipairs(list) do
    local d1 = self:Distance(i1, x1, y1, p[1], p[2], p[3])
    local d2 = self:Distance(i2, x2, y2, p[1], p[2], p[3])
    local t = d1+d2
    if not closest or t < bdt then
      closest, bd1, bd2, bdt = p, d1, d2, t
    end
  end
  if closest then
    return d1, d2, closest[1], closest[2], closest[3]
  end
end

function QuestHelper:MergePositions(list1, list2)
  for i, p in ipairs(list2) do
    self:AppendPosition(list1, unpack(p))
  end
end

function QuestHelper:MergeDrops(list1, list2)
  for element, count in pairs(list2) do
    list1[element] = (list1[element] or 0) + count
  end
end

function QuestHelper: Assert(a, b)  -- the space exists so the anti-assert script doesn't find it :D
  if not a then
    QuestHelper:Error(b or "Assertion Failed")
  end
end

function QuestHelper:StringizeTable(a)
  if not a then return "nil" end
  acu = tostring(self.recycle_tabletyping[a])..": "
  for i,v in pairs(a) do acu = acu.."["..tostring(i)..","..tostring(v).."] " end
  return acu
end

function QuestHelper:StringizeTableDouble(a)
  if not a then return "nil" end
  acu = tostring(self.recycle_tabletyping[a])..": "
  for i,v in pairs(a) do acu = acu.."["..self:StringizeTable(i)..","..self:StringizeTable(v).."] " end
  return acu
end

function QuestHelper:StringizeRecursive(a, d)
  if not a then return "nil" end
  if d <= 0 or type(a) ~= "table" then return tostring(a) end
  acu = tostring(self.recycle_tabletyping[a])..": "
  for i,v in pairs(a) do acu = acu.."["..self:StringizeRecursive(i, d - 1)..","..self:StringizeRecursive(v, d - 1).."] " end
  return acu
end

function QuestHelper:TableSize(tbl)
  local count = 0
  for k, v in pairs(tbl) do
    count = count + 1
  end
  return count
end

function QuestHelper:IsWrath()
  return GetBuildInfo():sub(1,1) == '3'
end

-- These are used to convert coordinates back and forth from "Wrath" to "Native". "Force" is used to convert back and forth from "Wrath" to "BC".
-- Both changes the data in-place and returns the data.
function QuestHelper:ConvertCoordsToWrath(data, force)
  if (not QuestHelper:IsWrath() or force) and data[1] == 36 then -- Stormwind
    data[2] = data[2] * 0.77324 + 0.197
    data[3] = data[3] * 0.77324 + 0.245
  end
  return data
end

function QuestHelper:ConvertCoordsFromWrath(data, force)
  if (not QuestHelper:IsWrath() or force) and data[1] == 36 then -- Stormwind
    data[2] = (data[2] - 0.197) / 0.77324
    data[3] = (data[3] - 0.245) / 0.77324
  end
  return data
end
