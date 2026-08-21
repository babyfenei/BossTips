import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)

setup = r"""
function strtrim(s) if s==nil then return "" end; local r=(s:gsub("^%s*(.-)%s*$","%1")); return r end
function strsplit(d, s) local t={}; local n=0; if s==nil then return t end; for m in (s..d):gmatch("(.-)"..d) do n=n+1; t[n]=m end; return t end
function tContains(t, v) if t==nil then return false end; for _,x in pairs(t) do if x==v then return true end end; return false end
function GetLocale() return "zhCN" end
function GetNumGroupMembers() return 0 end
C_Timer = { After = function() end }
_G.BossTipsGlobalDB = { lang = "AUTO", enabledDifficulties = nil, defaultChatChannel = "INSTANCE_CHAT", sendChannelRight = "SAY" }
local mt = { __index = function(t,k) return k end }
_G._L = setmetatable({}, mt)
function loadfile_into(code, addon)
    local f, err = load(code, "mod", "t", _G)
    if not f then error("load error: "..tostring(err)) end
    return f(nil, addon)
end
function make_addon() return { L = _G._L } end
"""
lua.execute(setup)

addon = lua.globals()['make_addon']()
lua.globals()['addon'] = addon
loadfile_into = lua.globals()['loadfile_into']

data_code = open(r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/Data.lua", encoding="utf-8").read()
current_code = open(r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/Guides/MPlus/Current.lua", encoding="utf-8").read()
current_en_code = open(r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/Guides/MPlus/Current_enUS.lua", encoding="utf-8").read()

loadfile_into(data_code, addon)
loadfile_into(current_code, addon)
loadfile_into(current_en_code, addon)

test = r"""
local out = {}
addon.BuildActiveGuides()
local inst = "塞塔里斯神庙"
local boss = "阿德里斯和阿斯匹克斯"
local entry = addon.GetBossData()[inst][boss]
out.hasEntry = (entry ~= nil)
out.tdKeys = {}
if entry and entry.tipsByDifficulty then
  for k,_ in pairs(entry.tipsByDifficulty) do out.tdKeys[#out.tdKeys+1]=k end
end
-- 可用难度 = tipsByDifficulty 中非空键（enabledDifficulties=nil 即全启用）
local order = {"lfr","normal","heroic","mythic","mythicplus"}
out.avail = {}
for _,k in ipairs(order) do
  local v = entry and entry.tipsByDifficulty and entry.tipsByDifficulty[k]
  if type(v)=="string" and v~="" then out.avail[#out.avail+1]=k end
end
addon.LOCALE = "zhCN"
local zh = addon.GetGuideText(entry, "mythicplus")
out.zhCN_is_cjk = (zh or ""):find("[\228-\233]") ~= nil
addon.LOCALE = "enUS"
local en = addon.GetGuideText(entry, "mythicplus")
out.enUS_is_cjk = (en or ""):find("[\228-\233]") ~= nil
local trans = addon.GuideData.translations.enUS.mplus["Current"]["塞塔里斯神庙"]
out.seta_en_present = (trans ~= nil)
return out
"""
lua.execute("function _test()\n" + test + "\nend")
res = lua.globals()['_test']()
print("== M+ 难度可用列表 (塞塔里斯神庙/阿德里斯和阿斯匹克斯) ==")
print("available diffs:", list(res['avail']))
print("hasEntry:", res['hasEntry'])
print("tipsByDifficulty keys:", list(res['tdKeys']))
print("塞塔里斯神庙 enUS翻译存在:", res['seta_en_present'])
print("zhCN 攻略含中文:", res['zhCN_is_cjk'])
print("enUS 攻略含中文(应为false):", res['enUS_is_cjk'])

