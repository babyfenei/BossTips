import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)
setup = r"""
function strtrim(s) if s==nil then return "" end; local r=(s:gsub("^%s*(.-)%s*$","%1")); return r end
function strsplit(d, s) local t={}; local n=0; if s==nil then return nil end; for m in (s..d):gmatch("(.-)"..d) do n=n+1; t[n]=m end; return table.unpack(t) end
function tContains(t, v) if t==nil then return false end; for _,x in pairs(t) do if x==v then return true end end; return false end
function GetLocale() return "zhCN" end
function GetNumGroupMembers() return 0 end
_G._chatlog = {}
_G._combatPrinted = false
function SendChatMessage(msg, ch) table.insert(_G._chatlog, ch..":"..(msg or ""):sub(1,12)) end
function C_Timer_After(...) end
C_Timer = { After = C_Timer_After }
local mt = { __index = function(t,k) return k end }
_G._L = setmetatable({}, mt)
function make_addon() return { L = _G._L } end
function loadfile_into(code, addon)
    local f, err = load(code, "mod", "t", _G)
    if not f then error("load error: "..tostring(err)) end
    return f(nil, addon)
end
"""
lua.execute(setup)
addon = lua.globals()['make_addon']()
lua.globals()['addon'] = addon
loadfile_into = lua.globals()['loadfile_into']

for fn in ['Data.lua','Guides/MPlus/Current.lua']:
    code = open(r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/"+fn, encoding="utf-8").read()
    loadfile_into(code, addon)

# expose InCombatLockdown as a controllable global
lua.execute(r"""
_G.InCombatLockdown = function() return _G._inCombat end
_G._inCombat = false
""")

lua.execute(r"""
addon.BuildActiveGuides()
do
  local e = addon.GetBossData()["塞塔里斯神庙"]["阿德里斯和阿斯匹克斯"]
  addon.LOCALE = "zhCN"
  local t = addon.GetGuideText(e, "mythicplus")
  print("DEBUG tips type=", type(t), " val=", tostring(t):sub(1, 30))
end
function run_send(inCombat)
  _G._inCombat = inCombat
  _G._chatlog = {}
  addon.currentInstanceName = "塞塔里斯神庙"
  addon.SendBossTips("阿德里斯和阿斯匹克斯", "INSTANCE_CHAT")
  return { chat = _G._chatlog }
end
""")

res_combat = lua.globals()['run_send'](True)
res_peace = lua.globals()['run_send'](False)
print("战斗中发送 -> 调用SendChatMessage次数:", len(res_combat['chat']), "(应为0，不再触发ADDON_ACTION_BLOCKED)")
print("非战斗中发送 -> 调用SendChatMessage次数:", len(res_peace['chat']), "(应为>=1，首条同步发出)")
if res_peace['chat']:
    print("  首条样例:", res_peace['chat'][0])
