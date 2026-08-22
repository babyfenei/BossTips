# -*- coding: utf-8 -*-
# Lupa harness: replicate BossTips send-data path for a real M+ boss (enUS),
# to confirm whether BuildChatParts -> BuildMacroText yields a non-empty macro.
import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)

# Minimal stubs for WoW API used by the data files at load time
setup = r"""
math = math or {}
string = string
table = table
_G = _G or {}

-- stub WoW globals referenced at load
function GetLocale() return "enUS" end
function GetNumGroupMembers() return 1 end
function print(...) end
function strtrim(s) return (s:gsub("^%s*(.-)%s*$", "%1")) end
function strsplit(sep, s)
    local t = {}
    local pat = (sep:gsub("([%%%.])", "%%%1"))
    local p = 1
    while true do
        local i = s:find(pat, p, true)
        if not i then t[#t+1] = s:sub(p); break end
        t[#t+1] = s:sub(p, i-1)
        p = i + #sep
    end
    return table.unpack(t)
end
function tContains(t, v) for _,x in ipairs(t) do if x==v then return true end end return false end

_G.GetLocale = GetLocale
_G.GetNumGroupMembers = GetNumGroupMembers
_G.strtrim = strtrim
_G.strsplit = strsplit
_G.tContains = tContains
_G.print = print

-- Ace3-ish stubs so the addon file loads
addon = {}
addon.L = setmetatable({}, { __index = function() return function(k) return k end end })
addon.GuideData = nil
BossTipsGlobalDB = {
    defaultChatChannel = "INSTANCE_CHAT",
    sendChannelRight = "SAY",
    defaultDifficulty = "mythic",
}

-- load the M+ source and enUS translation
local function loadfile_safe(path)
    local f, err = loadfile(path)
    if not f then error("load "..path..": "..tostring(err)) end
    return f("BossTips", addon)
end
loadfile_safe("Guides/MPlus/Current.lua")
loadfile_safe("Guides/MPlus/Current_enUS.lua")
GuideData = addon.GuideData
"""

lua.execute(setup)

# Now extract a boss entry and run the send logic
test = r"""
local inst = "塞塔里斯神庙"
local boss = "阿德里斯和阿斯匹克斯"
local BossData = GuideData.mplus["Current"]
local entry = BossData[inst][boss]
local src = entry._src
local locale = "enUS"
local trans = GuideData.translations and GuideData.translations[locale]

function GetGuideText(entry, diff)
    local trans = GuideData.translations and GuideData.translations["enUS"]
    local src = entry._src
    if trans and src then
        local lookupDiff = diff
        local cat = trans[src.type]
        local ver = cat and cat[src.ver]
        local inst = ver and ver[src.instance]
        local b = inst and inst[src.boss]
        if b then
            local txt
            if entry.type == "MOB" then
                txt = b.tips or b[lookupDiff] or b.mythicplus or (b.tipsByDifficulty and b.tipsByDifficulty[lookupDiff])
            else
                local tbd = b.tipsByDifficulty
                txt = (tbd and tbd[lookupDiff]) or (tbd and tbd["mythicplus"]) or b[lookupDiff] or b.tips
            end
            if txt and txt ~= "" then return txt end
        end
    end
    return nil
end

function ColorChatTips(text)
    if not text or text == "" then return "" end
    text = string.gsub(text, "{rt8}(.-){rt8}", "【%1】")
    text = string.gsub(text, "{rt1}(.-){rt1}", "【重点】%1")
    text = string.gsub(text, "{rt%d}", "")
    text = string.gsub(text, "%[rt%d%]", "")
    return text
end

function SplitUtf8Bytes(text, maxBytes)
    local chunks, current, currentLen = {}, "", 0
    for char in string.gmatch(text, "([%z%1-%127%194-%244][%128-%191]*)") do
        local cl = #char
        if currentLen + cl > maxBytes then
            if current ~= "" then chunks[#chunks+1] = current end
            current = char; currentLen = cl
        else
            current = current .. char; currentLen = currentLen + cl
        end
    end
    if current ~= "" then chunks[#chunks+1] = current end
    return chunks
end

function BuildChatParts(bossName, entry, diff)
    local tips = GetGuideText(entry, diff)
    tips = ColorChatTips(tips)
    if not tips or tips == "" then return nil end
    local MAX = 240
    local parts = { strsplit("||", tips) }
    local sp = {}
    for _,p in ipairs(parts) do local t=strtrim(p); if t~="" then sp[#sp+1]=t end end
    if #sp == 0 then sp = SplitUtf8Bytes(strtrim(tips), MAX) end
    if #sp == 0 then return nil end
    local header = "【"..(entry.name or bossName).."】"
    if sp[1] then sp[1] = header .. " " .. sp[1] end
    local final = {}
    for _,p in ipairs(sp) do
        local t = strtrim(p)
        if t ~= "" then
            if #t <= MAX then final[#final+1]=t else
                for _,c in ipairs(SplitUtf8Bytes(t, MAX)) do final[#final+1]=c end
            end
        end
    end
    if #final==0 then return nil end
    return { parts = final }
end

local CHAT_SLASH = { INSTANCE_CHAT="/instance", SAY="/say", PARTY="/party", RAID="/raid", YELL="/yell", GUILD="/guild", CHANNEL="/say" }
function BuildMacroText(parts, chatType, maxLen)
    maxLen = maxLen or 1000
    local slash = CHAT_SLASH[chatType] or "/say"
    local lines, used, remainder = {}, 0, {}
    for _,p in ipairs(parts) do
        local safe = p:gsub("%[", "("):gsub("%]", ")")
        local line = slash .. " " .. safe
        if used + #line + 1 <= maxLen then lines[#lines+1]=line; used = used + #line + 1
        else remainder[#remainder+1]=safe end
    end
    return table.concat(lines, "\n"), remainder
end

-- check: any macro LINE whose text (after slash) starts with '[' would be dropped by WoW as invalid condition
function HasDroppedLine(macro)
    for line in string.gmatch(macro, "[^\n]+") do
        local _, _, rest = line:find("^/%a+%s*(.*)$")
        if rest and rest:sub(1,1) == "[" then return true end
    end
    return false
end

local out = {}
out.bossName = boss
-- mimic BuildActiveGuides _src injection
entry._src = { type = "mplus", ver = "Current", instance = inst, boss = boss }
for _, diff in ipairs({"lfr","normal","heroic","mythic","mythicplus"}) do
    local bp = BuildChatParts(boss, entry, diff)
    if bp then
        local m1 = BuildMacroText(bp.parts, "INSTANCE_CHAT")
        out[diff] = { len = #m1, nparts = #bp.parts, dropped = HasDroppedLine(m1), preview = m1:sub(1, 100) }
    else
        out[diff] = "NIL (BuildChatParts failed)"
    end
end
return out
"""

res = lua.execute(test)
for k, v in res.items():
    try:
        d = dict(v)
        print(f"  {k}: parts={d.get('nparts')} len={d.get('len')} dropped_line={d.get('dropped')} preview={d.get('preview')!r}")
    except Exception:
        print(f"  {k}: {v}")
