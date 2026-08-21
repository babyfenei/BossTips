# -*- coding: utf-8 -*-
"""四场景端到端：UI 取词 + 攻略取文，验证 enUS/zhTW/zhCN(AUTO)/跟随系统 均正确。"""
import os, re
from lupa import LuaRuntime

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
TOC = os.path.join(ADDON, "BossTips.toc")

BOOTSTRAP = r"""
local _frame_mt = {
    __index = function(t, k)
        if k == "IsShown" then return function() return false end end
        if k == "CreateFontString" or k == "CreateTexture" or k == "CreateLine"
           or k == "CreateAnimationGroup" or k == "CreateMaskTexture" then
            return function() return _NewFrame() end
        end
        return function() return _NewFrame() end
    end,
}
function _NewFrame()
    local f = {}
    setmetatable(f, _frame_mt)
    return f
end
"""

def load(lang_opt, client_locale):
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute(BOOTSTRAP)
    gsetup = f"""
    GameFontNormal = _NewFrame(); STANDARD_TEXT_FONT = "Fonts\\\\ARHei.ttf"
    BossTipsGlobalDB = {{ lang = "{lang_opt}", disabledNative={{}}, disabledMPlus={{}}, disabledRaids={{}}, hiddenDungeons={{}}, guides={{}}, customDungeons={{}}, encounterOverrides={{}}, dungeonOverrides={{}} }}
    function CreateFrame(...) return _NewFrame() end
    function GetInstanceInfo() return "暴风城", nil, 0, nil, nil, nil, nil, 0 end
    function GetLocale() return "{client_locale}" end
    function GetCursorPosition() return 0, 0 end
    function GetNumGroupMembers() return 1 end
    function InCombatLockdown() return false end
    function SendChatMessage(...) end
    function print(...) end
    function EJ_GetEncounterInfo(...) return nil end
    function UnitName(...) return nil end
    function UnitExists(...) return false end
    C_Timer = {{ After = function(d, f) end }}
    SlashCmdList = {{}}; GameTooltip = _NewFrame(); UIParent = _NewFrame(); StaticPopupDialogs = {{}}
    local fakeLib = setmetatable({{}}, {{ __index = function(t,k) return function(...) return fakeLib end end }})
    function LibStub(name, silent) return fakeLib end
    function pcall(f, ...) return true, f(...) end
    function IsModifiedClick(...) return false end
    function GetMouseFocus() return nil end
    """
    lua.execute(gsetup)
    lua.execute("__BTAddon = {}")
    lua.execute("__BTAddon.L = setmetatable({}, { __index = function(t,k) return k end })")
    def fix(src): return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)
    for rel in [l.strip() for l in open(TOC, encoding="utf-8") if l.strip().endswith(".lua") and not l.strip().startswith("#")]:
        p = os.path.join(ADDON, rel)
        if os.path.exists(p):
            lua.execute(fix(open(p, encoding="utf-8").read()), name=rel)
    return lua, lua.eval("_G.__BTAddon")

CJK = re.compile(r'[\u4e00-\u9fff\u3400-\u4dbf]')
SIMP = set("国关东车电时间题体来热几刘杨灭华网图图书画")

scenarios = [
    ("设置=enUS, 客户端=zhCN", "enUS", "zhCN"),
    ("设置=zhTW, 客户端=zhCN", "zhTW", "zhCN"),
    ("设置=AUTO, 客户端=enUS", "AUTO", "enUS"),
    ("设置=AUTO, 客户端=zhCN", "AUTO", "zhCN"),
]
print("场景 | addon.LOCALE | UI | 攻略(mythicplus)")
for name, lang, client in scenarios:
    lua, a = load(lang, client)
    L = a["L"]
    # UI：抽英文键，enUS 期望无中文；中文场景期望有中文
    ui_ok = True; ui_bad = ""
    for k in ["Settings","Hide Guide","Behavior & Interaction","Send Guide","Display Mode","Dungeon"]:
        v = L[k]; has = bool(CJK.search(str(v)))
        if a["LOCALE"] == "enUS" and has: ui_ok = False; ui_bad = f"{k}->{v!r}"
        if a["LOCALE"] != "enUS" and not has: ui_ok = False; ui_bad = f"{k}->{v!r}(非中文)"
    loc = a["LOCALE"]
    # 攻略样本
    a["BuildActiveGuides"]()
    sample = lua.execute("""
    local a=_G.__BTAddon; local out={}
    for inst,bosses in pairs(a.ActiveGuides) do
      for bname,e in pairs(bosses) do
        if e._src and e._src.type=="mplus" then table.insert(out,e); if #out>=1 then break end end
      end; if #out>=1 then break end end; return out""")
    e = sample[1]
    txt = a["GetGuideText"](e, "mythicplus")
    has_cjk = bool(CJK.search(txt or ""))
    is_simp = any(c in SIMP for c in (txt or ""))
    if loc == "enUS":
        guide = "OK(英文)" if not has_cjk else "FAIL(简中)"
    elif loc == "zhTW":
        guide = "OK(繁中)" if (has_cjk and not is_simp) else ("WARN" if not has_cjk else "FAIL(简中)")
    else:
        guide = "OK(简中)" if has_cjk else "WARN"
    ui = "OK" if ui_ok else f"FAIL:{ui_bad}"
    print(f"  {name:22s} | {loc:5s} | {ui:4s} | {guide}  [{str(txt)[:32]!r}]")
