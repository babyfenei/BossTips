# -*- coding: utf-8 -*-
# 多语言攻略 (M+ Current + 12.1 Raid) 运行时校验脚本
# 仅做验证，不修改、不删除任何文件。
import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)

# 加载期唯一需要的 WoW API：GetLocale。其余 API 均在函数体内且本次不触发。
lua.execute(r'''
_G = _G or {}
_G.GetLocale = function() return "zhCN" end
_G.print = function() end
_G.C_Base64 = nil
_G.C_Timer = { After = function() end }
_G.SendChatMessage = function() end
''')

# 单一全局 addon 表，桥接所有 "local _, addon = ..." 文件
lua.execute('_G.BossTipsAddon = {}')

FILES = ["Locales.lua", "Data.lua",
         "Guides/MPlus/Current.lua", "Guides/Raids/v12.1.lua"]

for f in FILES:
    with open(f, "r", encoding="utf-8") as fh:
        code = fh.read().replace("local _, addon = ...",
                                 "local addon = _G.BossTipsAddon")
    lua.execute(code)

lua.execute('local a=_G.BossTipsAddon a.BuildActiveGuides()')

# ---- Lua 端校验器：返回失败条目报告 + 统计 ----
LUA_VALIDATE = r'''
local a = _G.BossTipsAddon
local fails = {}
local n_mp, n_raid = 0, 0

local function chk(cond, msg)
  if not cond then fails[#fails+1] = msg end
end

local mplusInsts = {"毒牙祭坛","诸王之眠","塞塔里斯神庙","红玉新生法池",
                    "密谋小径","纳洛拉克的洞穴","夺目谷","虚空之痕竞技场"}
local raidInsts = {"烈毒之渊","潮缚石窟"}
local diffs = {"lfr","normal","heroic","mythic"}

-- M+ : 每 boss 检查 tipsByLang.mythicplus.{zhTW,enUS} 与三语 GetGuideText
for _, inst in ipairs(mplusInsts) do
  local t = a.ActiveGuides[inst]
  chk(t, "M+ missing instance: "..inst)
  if t then
    for boss, entry in pairs(t) do
      n_mp = n_mp + 1
      local tl = entry.tipsByLang
      chk(tl and tl.mythicplus, inst.."/"..boss.." 缺 tipsByLang.mythicplus")
      if tl and tl.mythicplus then
        chk(type(tl.mythicplus.zhTW)=="string" and tl.mythicplus.zhTW~="", inst.."/"..boss.." 缺 zhTW")
        chk(type(tl.mythicplus.enUS)=="string" and tl.mythicplus.enUS~="", inst.."/"..boss.." 缺 enUS")
      end
      -- 三语取文
      a.LOCALE = "zhCN";  local zh = a.GetGuideText(entry, "mythicplus")
      a.LOCALE = "enUS";  local en = a.GetGuideText(entry, "mythicplus")
      a.LOCALE = "zhTW";  local tw = a.GetGuideText(entry, "mythicplus")
      chk(zh~="" and en~="" and tw~="", inst.."/"..boss.." 取文为空")
      chk(en~=zh and tw~=zh, inst.."/"..boss.." 译文未区分")
    end
  end
end

-- Raid : 每 boss 检查四难度 tipsByLang.{zhTW,enUS} 与三语 GetGuideText
for _, inst in ipairs(raidInsts) do
  local t = a.ActiveGuides[inst]
  chk(t, "Raid missing instance: "..inst)
  if t then
    for boss, entry in pairs(t) do
      n_raid = n_raid + 1
      for _, d in ipairs(diffs) do
        local tl = entry.tipsByLang
        chk(tl and tl[d], inst.."/"..boss.."/"..d.." 缺 tipsByLang")
        if tl and tl[d] then
          chk(type(tl[d].zhTW)=="string" and tl[d].zhTW~="", inst.."/"..boss.."/"..d.." 缺 zhTW")
          chk(type(tl[d].enUS)=="string" and tl[d].enUS~="", inst.."/"..boss.."/"..d.." 缺 enUS")
        end
        a.LOCALE = "zhCN";  local zh = a.GetGuideText(entry, d)
        a.LOCALE = "enUS";  local en = a.GetGuideText(entry, d)
        a.LOCALE = "zhTW";  local tw = a.GetGuideText(entry, d)
        chk(zh~="" and en~="" and tw~="", inst.."/"..boss.."/"..d.." 取文为空")
        chk(en~=zh and tw~=zh, inst.."/"..boss.."/"..d.." 译文未区分")
      end
    end
  end
end

a.LOCALE = "zhCN"
local report = "STAT mplus_entries="..n_mp.." raid_entries="..n_raid.." fails="..#fails
for i=1,#fails do report = report.."\nFAIL: "..fails[i] end
return report
'''

report = lua.execute(LUA_VALIDATE)
print(report)
if "fails=0" in report:
    print("\nOVERALL: PASS")
else:
    print("\nOVERALL: FAIL")
