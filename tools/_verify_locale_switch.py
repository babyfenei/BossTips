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
current_zh_code = open(r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/Guides/MPlus/Current_zhTW.lua", encoding="utf-8").read()

loadfile_into(data_code, addon)
loadfile_into(current_code, addon)
loadfile_into(current_en_code, addon)
loadfile_into(current_zh_code, addon)

test = r"""
local out = {}
out.bosses = {}
-- 初始 zhCN
addon.LOCALE = "zhCN"
addon.BuildActiveGuides()
local BD = addon.GetBossData()
local n=0
for inst, ib in pairs(BD) do
  for boss, entry in pairs(ib) do
    if boss == "_src" then
    elseif (entry.type or "BOSS") == "MOB" then
      -- 小怪
    else
      n = n + 1
      -- 模拟：切到 enUS 看文本，再切回 zhCN 看文本
      addon.LOCALE = "enUS"
      local en = addon.GetGuideText(entry, "mythicplus") or ""
      addon.LOCALE = "zhCN"
      local zh = addon.GetGuideText(entry, "mythicplus") or ""
      local name_en = addon.GetLocalizedBossName(inst, boss, false, entry._src and entry._src.ver)
      addon.LOCALE = "zhCN"
      local name_zh = addon.GetLocalizedBossName(inst, boss, false, entry._src and entry._src.ver)
      -- CJK 检测
      local function hasCJK(s) return (s or ""):find("[\228-\233]") ~= nil end
      out.bosses[#out.bosses+1] = {
        inst=inst, boss=boss,
        en_hasCJK = hasCJK(en),          -- enUS 模式下仍为简中 = 缺翻译(预期)
        zh_hasCJK = hasCJK(zh),          -- zhCN 模式必须为简中(否则#3 bug)
        name_en = name_en, name_zh = name_zh,
      }
    end
  end
end
out.total = n
-- 统计
out.n_zh_not_cjk = 0
out.n_en_not_cjk = 0
out.bad = {}
for _,b in ipairs(out.bosses) do
  if not b.zh_hasCJK then
    out.n_zh_not_cjk = out.n_zh_not_cjk + 1
    out.bad[#out.bad+1] = b.inst.."/"..b.boss.." : zhCN-mode text NOT CJK (stuck English?)"
  end
  if not b.en_hasCJK then
    out.n_en_not_cjk = out.n_en_not_cjk + 1  -- enUS 翻译存在(无CJK)
  end
end
return out
"""
lua.execute("function _test()\n" + test + "\nend")
res = lua.globals()['_test']()
print("== 语言切换回归 (#3) ==")
print("M+ BOSS 总数:", res['total'])
print("zhCN 模式非中文(应为0, #3 残留英文):", res['n_zh_not_cjk'])
print("enUS 模式已翻译(无CJK, 预期>0):", res['n_en_not_cjk'])
print("enUS 模式缺翻译(有CJK, 预期=M+中无英文译文的首领):", res['total'] - res['n_en_not_cjk'])
if res['n_zh_not_cjk'] == 0:
    print("OK: 切回 zhCN 后所有 M+ BOSS 攻略均为简中，无残留英文。")
else:
    print("!! 发现 #3 残留:", res['n_zh_not_cjk'], "个")
