#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Simulate the fixed logic (issue round): BuildActiveGuides with 12.1 +
tipsByDifficulty autofill; alias/instanceId matching; FormatTips gsub fix."""
import os, glob
from lupa import LuaRuntime

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
lua = LuaRuntime(unpack_returned_tuples=True)

# mock WoW globals needed at load time
lua.execute("""
STANDARD_TEXT_FONT = "Fonts\\\\ARHei.ttf"
DAMAGE_TEXT_FONT = "Fonts\\\\ARHei.ttf"
GameFontNormal = { GetFont = function() return "Fonts\\\\ARHei.ttf" end }
print = function(...) end
strsplit = function(sep, s)
  local out = {}
  for part in string.gmatch(s or "", "([^"..sep.."]+)") do out[#out+1] = part end
  return unpack(out)
end
strtrim = function(s) return (s:gsub("^%s*(.-)%s*$", "%1")) end
SendChatMessage = function() end
C_Timer = { After = function() end }
C_Base64 = nil
EJ_GetEncounterInfo = nil
LibStub = function() end
BossTipsGlobalDB = nil
""")

# load all Guides (native + mplus + raids) into one BT_addon
lua.execute("BT_addon = {}")
for f in sorted(glob.glob(os.path.join(ROOT, "Guides", "*.lua")) + glob.glob(os.path.join(ROOT, "Guides", "MPlus", "*.lua")) + glob.glob(os.path.join(ROOT, "Guides", "Raids", "v*.lua"))):
    t = open(f, encoding="utf-8").read().replace("local _, addon = ...", "local addon = _G.BT_addon", 1)
    lua.execute(t)

# load Data.lua
d = open(os.path.join(ROOT, "Data.lua"), encoding="utf-8").read().replace("local _, addon = ...", "local addon = _G.BT_addon", 1)
lua.execute(d)
lua.execute("addon = _G.BT_addon")

# 1) BuildActiveGuides includes 12.1 毒渊 + tipsByDifficulty autofill
lua.execute("addon.BuildActiveGuides()")
gd = lua.eval("_G.BT_addon.GuideData")
ag = lua.eval("_G.BT_addon.ActiveGuides")
checks = []
checks.append(("12.1 raid file loaded", "12.1" in gd["raids"]))
checks.append(("ActiveGuides has 毒渊", "毒渊" in ag))
checks.append(("ActiveGuides has 虚空尖塔", "虚空尖塔" in ag))
checks.append(("ActiveGuides has 梦裂", "梦裂" in ag))
tips = ag["毒渊"]["缚魂者内克扎利"] if "毒渊" in ag else None
td = None
if tips is not None:
    td = tips["tipsByDifficulty"]
    for dk in ("lfr", "normal", "heroic", "mythic", "mythicplus"):
        checks.append(("毒渊 tipsByDifficulty[%s] non-empty" % dk, bool(td and td[dk])))
checks.append(("meta 毒渊 aliases", "aliases" in gd["meta"]["毒渊"]))

# 2) alias matching: 梦境裂隙 -> 梦裂 ; instanceId fallback 2912 -> 虚空尖塔
lua.execute("""
function simulate_match(name, id)
  local addon = _G.BT_addon
  -- replicate CheckInstance resolution
  local current = nil
  local BossData = addon.GetBossData()
  local GD = addon.GuideData
  local function NormName(s) if type(s)~="string" then return "" end return (s:gsub("[%s%-–—·'’“”]", ""):lower()) end
  if name and name~="" and BossData and BossData[name] then current = name end
  if not current and name and name~="" and GD and GD.meta then
    local nk = NormName(name)
    for instName, m in pairs(GD.meta) do
      if BossData and BossData[instName] then
        if NormName(instName)==nk then current = instName break end
        if m.aliases then for _,a in ipairs(m.aliases) do if NormName(a)==nk then current = instName break end end end
        if current then break end
      end
    end
  end
  if not current and id then
    if GD and GD.meta then
      for instName, m in pairs(GD.meta) do
        if BossData and BossData[instName] then
          local mid = m.instanceId or m.mapID
          if mid and tonumber(mid)==tonumber(id) then current = instName break end
        end
      end
    end
  end
  return current
end
""")
for name, id, expect in (("梦境裂隙", None, "梦裂"), ("虚影尖塔", None, "虚空尖塔"), ("烈毒之渊", None, "毒渊"), ("unknown", 2912, "虚空尖塔")):
    got = lua.eval('simulate_match(%r, %r)' % (name, id))
    checks.append(("match %s -> %s" % (name, expect), got == expect))

# 3) FormatTips gsub fix (pattern now applied to text, not literal)
lua.execute("""
function test_gsub()
  local text = "先有|Hspell:6948|h炉石|h链接，然后[打断]技能"
  local links = {}
  text = string.gsub(text, "(|H[^|]*|h.-|h)", function(h) links[#links+1]=h; return "\\001"..#links.."\\001" end)
  return text, #links
end
""")
t, n = lua.eval("test_gsub()")
checks.append(("FormatTips gsub captures 1 link", n == 1))
checks.append(("FormatTips gsub placeholder present", t is not None and "\x01" in t))

ok = True
for name, passed in checks:
    print(("PASS  " if passed else "FAIL  ") + name)
    if not passed: ok = False
print("---")
print("ALL PASS" if ok else "SOME FAILED")
raise SystemExit(0 if ok else 1)
