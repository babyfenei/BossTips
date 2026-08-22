# -*- coding: utf-8 -*-
# Smoke test: load real guide data + Data.lua, run BuildActiveGuides, then invoke
# SendBossTips (the OLD direct-send path restored in Window.lua OnClick) with a
# mocked SendChatMessage to prove the click->send path emits chat lines immediately.
import lupa, os, glob

LUA = lupa.LuaRuntime(unpack_returned_tuples=True)
base = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"

setup = r"""
addon = {}
addon.GuideData = { versions={}, mplus={}, raids={}, meta={}, versionInfo={}, mplusInfo={} }
addon.LOCALE = "zhCN"
addon.L = setmetatable({}, { __index = function(t,k) return k end })
function addon.RefreshLocale() end
function addon.ChannelLabel(c) return tostring(c) end
function GetLocale() return "zhCN" end
_G.GetLocale = GetLocale
_G.print = function(...) end
_G.strtrim = function(s) return (s or ""):gsub("^%s*(.-)%s*$", "%1") end
_G.tContains = function(t,v) for _,x in ipairs(t) do if x==v then return true end end return false end
_G.table = table; _G.string = string
_G.InCombatLockdown = function() return false end
_G.SendChatMessage = function(msg, ch) addon.__sent = addon.__sent or {}; addon.__sent[#addon.__sent+1] = (ch or "?").." :: "..tostring(msg) end
_G.EJ_GetEncounterInfo = function() return nil end
_G.EJ_SelectEncounter = function() return true end
_G.C_Timer = { After = function() end }
_G.strsplit = function(sep, s)
    if not s then return end
    local r = {}; s = s .. sep; local p = 1
    while true do
        local a, b = string.find(s, sep, p, true)
        if not a then break end
        r[#r + 1] = string.sub(s, p, a - 1); p = b + 1
    end
    return table.unpack(r)
end
addon.__sent = {}
"""
LUA.execute(setup)

# load guide files
for f in (glob.glob(os.path.join(base,"Guides/Dungeons/*.lua"))
          + glob.glob(os.path.join(base,"Guides/Raids/*.lua"))
          + [os.path.join(base,"Guides/MPlus/Current.lua")]
          + [os.path.join(base,"BigWigsIdDB.lua"), os.path.join(base,"FallbackIdDB.lua")]):
    LUA.execute('local ok,err=loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % f.replace("\\","/"))

# load Data.lua (defines + ensureDBExists + exports SendBossTips/BuildActiveGuides)
LUA.execute('local ok,err=loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % (base+"/Data.lua").replace("\\","/"))

# pick a known M+ boss source key (简中) from Current.lua
probe = r"""
addon.BuildActiveGuides()
local sentBefore = #(addon.__sent or {})
-- 找一个真实存在的 boss key
local found
for inst, bosses in pairs(addon.ActiveGuides or {}) do
    for bk in pairs(bosses) do
        if not found then found = { inst=inst, bk=bk, name=bosses[bk].name } end
    end
end
local out = { found = found, totalBosses = 0 }
for inst, bosses in pairs(addon.ActiveGuides or {}) do
    for _ in pairs(bosses) do out.totalBosses = out.totalBosses + 1 end
end
if found then
    addon.currentInstanceName = found.inst   -- in-game Core.lua sets this on entering the instance
    addon.SendBossTips(found.bk, "INSTANCE_CHAT")
end
out.sent = addon.__sent
out.sentCount = #(addon.__sent or {})
out.sentDelta = (#(addon.__sent or {}) - sentBefore)
return out
"""
import json
res = LUA.execute(probe)
print("ActiveGuides total bosses:", res['totalBosses'])
if res['found']:
    print("Sample boss: inst=%s bk=%s name=%s" % (res['found']['inst'], res['found']['bk'], res['found']['name']))
print("SendChatMessage calls emitted by SendBossTips:", res['sentDelta'])
for line in (res['sent'] or [])[:6]:
    print("  SENT:", line)
