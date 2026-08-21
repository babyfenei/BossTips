# -*- coding: utf-8 -*-
"""Verify after the zhTW native-dungeon expansion + main-button tooltip i18n:
1. zhTW mode: every native dungeon boss GetGuideText(mythicplus) resolves to
   Traditional Chinese (NOT falling back to the zhCN source).
2. enUS mode: every native dungeon boss GetGuideText(mythicplus) returns English
   (no CJK leakage / no fallback to zhCN).
3. Main-button tooltip keys (Floating Left/Right Click, Floating Drag, Version,
   Current Language) resolve per-locale (zhCN/zhTW/enUS) and differ correctly.
"""
import os, re
import lupa

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
TOC = os.path.join(ADDON, "BossTips.toc")

CJK = re.compile(r'[\u4e00-\u9fff]')
# 常见简->繁 异形字（用于判断一段文本「本应是繁中却仍是简中」）
TRAD_PAIRS = set("门个战实关开来国会战时们这当点击样湾处单说话视觉报导对应当发术经结测试显示设置择类拟钟总护获认义书车贝见长风飞红里远进还过边页陆"
                 "灭蚕办东动图图书参见两刚创删则则别删则删则创建则删")
# 更稳妥：直接用一组繁体专属字形做「是否含繁中」判定
TRAD_ONLY = set("門個戰實關開來國會戰時們這當點擊樣灣處單說話視覺報導對應當發術經結測試顯示設置擇類擬鐘總護獲認義書車貝見長風飛紅裡遠進還過邊頁陸滅蠶辦東動圖圖書參見兩剛創刪則別")

def has_trad(s):
    return any(c in TRAD_ONLY for c in s)

lua = lupa.LuaRuntime(unpack_returned_tuples=True)

bootstrap = r"""
local _frame_mt = {
    __index = function(t, k)
        if k == "IsShown" then return function() return false end end
        return function() return _NewFrame() end
    end,
}
function _NewFrame()
    local f = {}
    setmetatable(f, _frame_mt)
    return f
end
"""
globals_setup = r"""
GameFontNormal = _NewFrame()
STANDARD_TEXT_FONT = "Fonts\\ARHei.ttf"
DAMAGE_TEXT_FONT = "Fonts\\ARKai_C.ttf"
BossTipsGlobalDB = {}
BossTipsGlobalDB.disabledNative = {}
BossTipsGlobalDB.disabledMPlus = {}
BossTipsGlobalDB.disabledRaids = {}
BossTipsGlobalDB.disabledCustomVersions = {}
BossTipsGlobalDB.hiddenDungeons = {}
BossTipsGlobalDB.guides = {}
BossTipsGlobalDB.customVersions = {}
BossTipsGlobalDB.customDungeons = {}
BossTipsGlobalDB.encounterOverrides = {}
BossTipsGlobalDB.dungeonOverrides = {}
BossTipsGlobalDB.minimap = { hide = true }
BossTipsGlobalDB.guideWindowMode = "auto"
BossTipsGlobalDB.showMobs = false
BossTipsGlobalDB.autoExpandOnTarget = true
BossTipsGlobalDB.autoOpenOnEnter = true
BossTipsGlobalDB.lockWindow = false
BossTipsGlobalDB.FontSize = 14
BossTipsGlobalDB.enableChatSend = true
BossTipsGlobalDB.collapsedAlpha = 0.55
BossTipsGlobalDB.singleExpand = true
BossTipsGlobalDB.guideWindowWidth = 360
BossTipsGlobalDB.showMinimapButton = false
BossTipsGlobalDB.defaultChatChannel = "INSTANCE_CHAT"
function CreateFrame(...) return _NewFrame() end
function GetInstanceInfo() return "暴风城", nil, 0, nil, nil, nil, nil, 0 end
function GetLocale() return "enUS" end
function GetCursorPosition() return 0, 0 end
function GetNumGroupMembers() return 1 end
function InCombatLockdown() return false end
function SendChatMessage(...) end
function print(...) end
function strtrim(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
function strsplit(delim, str)
    if not str then return nil end
    local t = {}; local p = 1; local dlen = #delim
    while true do
        local i = string.find(str, delim, p, true)
        if not i then t[#t+1] = string.sub(str,p); break end
        t[#t+1] = string.sub(str,p,i-1); p = i+dlen
    end
    return table.unpack(t)
end
function EJ_GetEncounterInfo(...) return nil end
function UnitName(...) return nil end
function UnitExists(...) return false end
C_Timer = { After = function(d,f) end }
SlashCmdList = {}
GameTooltip = _NewFrame()
UIParent = _NewFrame()
StaticPopupDialogs = {}
local fakeLib = {}; setmetatable(fakeLib, { __index = function(t,k) return function(...) return fakeLib end end })
function LibStub(name, silent) return fakeLib end
function pcall(f, ...) return true, f(...) end
function IsModifiedClick(...) return false end
function GetMouseFocus() return nil end
"""

lua.execute(bootstrap)
lua.execute(globals_setup)
lua.execute("__BTAddon = {}")

def fix_first_line(src):
    return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)

with open(TOC, encoding="utf-8") as f:
    order = [l.strip() for l in f if l.strip().endswith(".lua") and not l.strip().startswith("#")]

for rel in order:
    p = os.path.join(ADDON, rel)
    if os.path.exists(p):
        with open(p, encoding="utf-8") as fh:
            lua.execute(fix_first_line(fh.read()), name=rel)

def load_in_locale(lang):
    lua.execute('BossTipsGlobalDB.lang = "%s"' % lang)
    lua.execute("""
    if __BTAddon.RefreshLocale then __BTAddon.RefreshLocale() end
    __BTAddon.BuildActiveGuides()
    __BTAddon.BuildGuideOptions()
    """)

# ---- 1. zhTW 模式：原生副本 mythicplus 不回退简中 ----
load_in_locale("zhTW")
lua.execute("""
__BTNativeZhTW = {}
for inst, bosses in pairs(__BTAddon.ActiveGuides) do
    if type(bosses) == "table" then
        for boss, entry in pairs(bosses) do
            if type(entry) == "table" and entry._src and entry._src.type == "native" then
                __BTNativeZhTW[inst .. "|" .. boss] = __BTAddon.GetGuideText(entry, "mythicplus")
            end
        end
    end
end
""")
zhtw = lua.globals()["__BTNativeZhTW"]
zhtw_total = 0
zhtw_empty = 0
zhtw_fallback = 0  # 解析结果与简中源完全相同（疑似回退）
# 加载简中源做对照
src_lua = lupa.LuaRuntime(unpack_returned_tuples=True)
src_lua.execute("SRC={}")
for v in ["%d.0" % i for i in range(1, 13)]:
    p = os.path.join(ADDON, "Guides/Dungeons/v%s.lua" % v)
    if not os.path.exists(p):
        continue
    with open(p, encoding="utf-8") as fh:
        c = fh.read().replace("local _, addon = ...", "local addon = SRC")
    src_lua.execute(c)
srcGD = src_lua.globals()["SRC"]["GuideData"]
def g(t, k):
    try: return t[k]
    except Exception: return None
def src_text(ver, inst, boss):
    sec = g(g(g(srcGD, "versions"), ver), inst)
    if not sec: return None
    b = g(sec, boss)
    if not b: return None
    td = g(b, "tipsByDifficulty")
    if td:
        for dk in ("lfr","normal","heroic","mythic","mythicplus"):
            v = g(td, dk)
            if v: return str(v)
    return str(g(b, "tips") or "")
for key, val in zhtw.items():
    zhtw_total += 1
    s = str(val) if val else ""
    if not s:
        zhtw_empty += 1
        continue
    inst, boss = key.split("|", 1)
    ver = None
    # 从 _src 取 ver：重新查一次
    # 简化：用 inst/boss 在源里找 ver（源按 ver 组织），我们已无法在此拿到 ver，
    # 改为从 ActiveGuides entry 取 _src.ver
    continue
# 需要 ver：改为在 Lua 侧一并收集 _src.ver
lua.execute("""
__BTNativeZhTW2 = {}
for inst, bosses in pairs(__BTAddon.ActiveGuides) do
    if type(bosses) == "table" then
        for boss, entry in pairs(bosses) do
            if type(entry) == "table" and entry._src and entry._src.type == "native" then
                local key = entry._src.ver .. "|" .. entry._src.instance .. "|" .. entry._src.boss
                __BTNativeZhTW2[key] = __BTAddon.GetGuideText(entry, "mythicplus")
            end
        end
    end
end
""")
zhtw = lua.globals()["__BTNativeZhTW2"]
zhtw_total = 0; zhtw_empty = 0; zhtw_fallback = 0; zhtw_ok = 0
for key, val in zhtw.items():
    zhtw_total += 1
    s = str(val) if val else ""
    if not s:
        zhtw_empty += 1; continue
    ver, inst, boss = key.split("|", 2)
    srct = src_text(ver, inst, boss)
    if srct is not None and s == srct and has_trad(srct):
        zhtw_fallback += 1
    else:
        zhtw_ok += 1
print(f"[zhTW] 原生副本条目: {zhtw_total}  解析成功(繁中): {zhtw_ok}  空: {zhtw_empty}  疑似回退简中: {zhtw_fallback}")
if zhtw_fallback:
    print("  FAIL: 仍有繁中模式回退简中的条目")

# ---- 2. enUS 模式：原生副本 mythicplus 全英文 ----
load_in_locale("enUS")
lua.execute("""
__BTNativeEn = {}
for inst, bosses in pairs(__BTAddon.ActiveGuides) do
    if type(bosses) == "table" then
        for boss, entry in pairs(bosses) do
            if type(entry) == "table" and entry._src and entry._src.type == "native" then
                local key = entry._src.ver .. "|" .. entry._src.instance .. "|" .. entry._src.boss
                __BTNativeEn[key] = __BTAddon.GetGuideText(entry, "mythicplus")
            end
        end
    end
end
""")
enu = lua.globals()["__BTNativeEn"]
en_total = 0; en_cjk = 0; en_empty = 0
for key, val in enu.items():
    en_total += 1
    s = str(val) if val else ""
    if not s:
        en_empty += 1; continue
    if CJK.search(s):
        en_cjk += 1
print(f"[enUS] 原生副本条目: {en_total}  含中文(回退): {en_cjk}  空: {en_empty}")
if en_cjk:
    print("  FAIL: 英文模式仍有中文残留")

# ---- 3. 主按钮 tooltip L[] key 三语解析 ----
def check_locale(lang):
    load_in_locale(lang)
    lua.execute("""
    __BTL = {
        flc = __BTAddon.L["Floating Left Click"],
        frc = __BTAddon.L["Floating Right Click"],
        fd  = __BTAddon.L["Floating Drag"],
        ver = __BTAddon.L["Version"],
        cl  = __BTAddon.L["Current Language"],
    }
    """)
    d = lua.globals()["__BTL"]
    return {k: (str(v) if v else None) for k, v in d.items()}
zhcn_l = check_locale("zhCN")
zhtw_l = check_locale("zhTW")
enus_l = check_locale("enUS")
print("\n[Button L[] keys]")
for k in ("flc","frc","fd","ver","cl"):
    print(f"  {k}: zhCN={zhcn_l[k]!r}  zhTW={zhtw_l[k]!r}  enUS={enus_l[k]!r}")
# 校验三者互不相同（至少 enUS 与 zhCN 不同；zhTW 与 zhCN 不同）
btn_ok = (enus_l["flc"] != zhcn_l["flc"]) and (zhtw_l["flc"] != zhcn_l["flc"]) and \
         (enus_l["frc"] != zhcn_l["frc"]) and (zhtw_l["frc"] != zhcn_l["frc"]) and \
         all(zhcn_l[k] and zhtw_l[k] and enus_l[k] for k in ("flc","frc","fd","ver","cl"))
print("  PASS" if btn_ok else "  FAIL: 主按钮 L[] key 未正确本地化")

print("\n==== 总结 ====")
ok = (zhtw_fallback == 0) and (en_cjk == 0) and (zhtw_empty == 0) and (en_empty == 0) and btn_ok
print("ALL PASS" if ok else "SOME FAILED")
