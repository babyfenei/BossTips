# -*- coding: utf-8 -*-
"""导出/导入 BT2 往返测试：用 WoW API 桩加载全部 .lua，验证 EncodeGuides/DecodeGuides/MergeImportedGuides 往返一致。"""
import os, re
import lupa

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
TOC = os.path.join(ADDON, "BossTips.toc")
lua = lupa.LuaRuntime(unpack_returned_tuples=True)

bootstrap = r"""
local _frame_mt = { __index = function(t, k)
    if k == "IsShown" then return function() return false end end
    if k == "GetWidth" then return function() return 360 end end
    if k == "GetHeight" then return function() return 400 end end
    if k == "GetLeft" then return function() return 100 end end
    if k == "GetTop" then return function() return 600 end end
    if k == "GetStringHeight" then return function() return 20 end end
    if k == "GetFont" then return function() return "Fonts\\ARHei.ttf", 14, "" end end
    if k == "GetPoint" then return function() return "TOPLEFT", nil, "TOPLEFT", 20, -50 end end
    if k == "GetText" then return function() return "" end end
    if k == "GetNormalFontObject" then return function() return nil end end
    if k == "GetFontString" then return function() return t end end
    if k == "CreateFontString" or k == "CreateTexture" or k == "CreateLine"
       or k == "CreateAnimationGroup" or k == "CreateMaskTexture" then
        return function() return _NewFrame() end end
    return function() return _NewFrame() end
end }
function _NewFrame() local f = {}; setmetatable(f, _frame_mt); return f end
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
function CreateFrame(...) return _NewFrame() end
function GetInstanceInfo() return "暴风城", nil, 0, nil, nil, nil, nil, 0 end
function GetLocale() return "zhCN" end
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
        if not i then t[#t + 1] = string.sub(str, p); break end
        t[#t + 1] = string.sub(str, p, i - 1); p = i + dlen
    end
    return table.unpack(t)
end
function EJ_GetEncounterInfo(...) return nil end
function UnitName(...) return nil end
function UnitExists(...) return false end
C_Timer = { After = function(d, f) end }
SlashCmdList = {}
GameTooltip = _NewFrame()
UIParent = _NewFrame()
StaticPopupDialogs = {}
local fakeLib = {}; setmetatable(fakeLib, { __index = function(t, k) return function(...) return fakeLib end end })
function LibStub(name, silent) return fakeLib end
function pcall(f, ...) return true, f(...) end
function IsModifiedClick(...) return false end
function GetMouseFocus() return nil end
"""

lua.execute(bootstrap)
lua.execute(globals_setup)
lua.execute("__BTAddon = {}")
lua.execute("__BTAddon.L = setmetatable({}, { __index = function(t,k) return k end })")

def fix_first_line(src):
    return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)

order = []
with open(TOC, encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if line.endswith(".lua") and not line.startswith("#"):
            order.append(line)

ok_all = True
for rel in order:
    path = os.path.join(ADDON, rel)
    if not os.path.exists(path):
        continue
    try:
        with open(path, encoding="utf-8") as fh:
            src = fix_first_line(fh.read())
        lua.execute(src, name=rel)
    except Exception as e:
        ok_all = False
        print(f"[ERROR loading] {rel}: {str(e).replace(chr(10),' ')}")
        break

assert ok_all, "加载失败，无法继续测试"

# ---- 注入测试数据 ----
setup_data = r"""
local db = BossTipsGlobalDB
-- 配置
db.FontSize = 16
db.guideWindowMode = "button"
db.tipsFont = "chat"
db.collapsedAlpha = 0.7
db.singleExpand = false
db.enableChatSend = false
db.defaultChatChannel = "RAID"
db.lockWindow = true
db.showMobs = true
db.guideWindowWidth = 420
db.showMinimapButton = true
db.minimapAngle = 100
db.autoExpandOnTarget = false
db.autoOpenOnEnter = false
db.closeWindowAfterSend = true
db.hideMainButtonWhenNoGuide = true
db.tipsBgR = 0.1; db.tipsBgG = 0.2; db.tipsBgB = 0.3; db.tipsBgA = 0.5
db.mainButtonPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", xOffset = 20, yOffset = -50 }
db.minimap = { hide = false }
-- 开关/隐藏
db.disabledNative["3.0"] = true
db.hiddenDungeons["测试副本"] = true
-- 攻略（含多难度文本 + 小怪 + 管道符）
db.guides["测试副本"] = {
    ["首领A"] = { tips = "{rt8}首领A{rt8}||[打断]技能|{rt1}必断：X{rt1}", type = "BOSS",
                  tipsByDifficulty = { normal = "普通文本", heroic = "英雄文本", mythic = "史诗文本", lfr = "随机文本", mythicplus = "史诗+文本" } },
    ["小怪B"] = { tips = "小怪攻略|含管道", type = "MOB" },
}
-- 自定义分类/副本/覆盖
db.customVersions["MyCat"] = { label = "我的分类", order = 5 }
db.customDungeons["自定义本"] = { versionId = "MyCat", id = "999", mapID = "888", dungeonType = "dungeon", difficulty = "heroic", isActive = true,
    bosses = { ["BossX"] = { order = 1, type = "BOSS", tips = "自定义boss攻略", encounterId = "12345" } } }
db.encounterOverrides["测试副本"] = { ["首领A"] = "54321" }
db.dungeonOverrides["测试副本"] = { id = "111", dungeonType = "raid", difficulty = "mythic" }
"""
lua.execute(setup_data)

code = lua.eval('__BTAddon.EncodeGuides()')
print("EXPORT LENGTH:", len(code) if code else 0)
print("EXPORT EMPTY?", (code == ""))
print("EXPORT HEAD:", repr(code[:24]) if code else "N/A")

# ---- 重置 DB 并导入 ----
reset_db = r"""
BossTipsGlobalDB = {}
__BTAddon.EnsureDB()
"""
lua.execute(reset_db)

# 在 Lua 侧执行 decode+merge 并返回关键字段供 Python 比对
check = r"""
local code = ...
local decoded = __BTAddon.DecodeGuides(code)
local n = __BTAddon.MergeImportedGuides(decoded)
local db = BossTipsGlobalDB
local out = {}
out.config = {
    FontSize = db.FontSize, guideWindowMode = db.guideWindowMode, tipsFont = db.tipsFont,
    collapsedAlpha = db.collapsedAlpha, singleExpand = db.singleExpand, enableChatSend = db.enableChatSend,
    defaultChatChannel = db.defaultChatChannel, lockWindow = db.lockWindow, showMobs = db.showMobs,
    guideWindowWidth = db.guideWindowWidth, showMinimapButton = db.showMinimapButton, minimapAngle = db.minimapAngle,
    autoExpandOnTarget = db.autoExpandOnTarget, autoOpenOnEnter = db.autoOpenOnEnter, closeWindowAfterSend = db.closeWindowAfterSend,
    hideMainButtonWhenNoGuide = db.hideMainButtonWhenNoGuide,
    tipsBgR = db.tipsBgR, tipsBgG = db.tipsBgG, tipsBgB = db.tipsBgB, tipsBgA = db.tipsBgA,
    mainBtnPoint = db.mainButtonPos and db.mainButtonPos.point,
    mainBtnX = db.mainButtonPos and db.mainButtonPos.xOffset,
    minimapHide = db.minimap and db.minimap.hide,
}
out.switches = { disabledNative3 = db.disabledNative["3.0"], hidden = db.hiddenDungeons["测试副本"] }
out.guides = {}
for inst, bosses in pairs(db.guides) do
    out.guides[inst] = {}
    for b, v in pairs(bosses) do
        if type(v) == "table" then
            out.guides[inst][b] = { tips = v.tips, type = v.type,
                normal = v.tipsByDifficulty and v.tipsByDifficulty.normal,
                heroic = v.tipsByDifficulty and v.tipsByDifficulty.heroic,
                mythic = v.tipsByDifficulty and v.tipsByDifficulty.mythic }
        else
            out.guides[inst][b] = { tips = v, type = "BOSS" }
        end
    end
end
out.customVersions = {}
for k, v in pairs(db.customVersions) do out.customVersions[k] = { label = v.label, order = v.order } end
out.customDungeons = {}
for k, v in pairs(db.customDungeons) do
    out.customDungeons[k] = { versionId = v.versionId, id = v.id, encounterId = v.bosses and v.bosses["BossX"] and v.bosses["BossX"].encounterId }
end
out.encOverride = db.encounterOverrides["测试副本"] and db.encounterOverrides["测试副本"]["首领A"]
out.dungOverride = db.dungeonOverrides["测试副本"] and db.dungeonOverrides["测试副本"].id
out.merged = n
return out
"""
result = lua.execute(check, code)

def show(label, val):
    print(label, "=", val)

print("\n=== IMPORTED RESULT ===")
print("merged count:", result['merged'])
print("config:", result['config'])
print("switches:", result['switches'])
print("guides:", result['guides'])
print("customVersions:", result['customVersions'])
print("customDungeons:", result['customDungeons'])
print("encOverride:", result['encOverride'])
print("dungOverride:", result['dungOverride'])

# ---- 断言 ----
failures = []
def expect(name, got, want):
    if got != want:
        failures.append(f"{name}: got={got!r} want={want!r}")

expect("FontSize", result['config']['FontSize'], 16)
expect("guideWindowMode", result['config']['guideWindowMode'], "button")
expect("tipsFont", result['config']['tipsFont'], "chat")
expect("collapsedAlpha", result['config']['collapsedAlpha'], 0.7)
expect("singleExpand", result['config']['singleExpand'], False)
expect("enableChatSend", result['config']['enableChatSend'], False)
expect("defaultChatChannel", result['config']['defaultChatChannel'], "RAID")
expect("lockWindow", result['config']['lockWindow'], True)
expect("showMobs", result['config']['showMobs'], True)
expect("guideWindowWidth", result['config']['guideWindowWidth'], 420)
expect("showMinimapButton", result['config']['showMinimapButton'], True)
expect("minimapAngle", result['config']['minimapAngle'], 100)
expect("autoExpandOnTarget", result['config']['autoExpandOnTarget'], False)
expect("closeWindowAfterSend", result['config']['closeWindowAfterSend'], True)
expect("hideMainButtonWhenNoGuide", result['config']['hideMainButtonWhenNoGuide'], True)
expect("tipsBgR", result['config']['tipsBgR'], 0.1)
expect("mainBtnPoint", result['config']['mainBtnPoint'], "TOPLEFT")
expect("mainBtnX", result['config']['mainBtnX'], 20)
expect("minimapHide", result['config']['minimapHide'], False)
expect("disabledNative3", result['switches']['disabledNative3'], True)
expect("hidden", result['switches']['hidden'], True)
expect("首领A.tips", result['guides']['测试副本']['首领A']['tips'], "{rt8}首领A{rt8}||[打断]技能|{rt1}必断：X{rt1}")
expect("首领A.type", result['guides']['测试副本']['首领A']['type'], "BOSS")
expect("首领A.normal", result['guides']['测试副本']['首领A']['normal'], "普通文本")
expect("首领A.heroic", result['guides']['测试副本']['首领A']['heroic'], "英雄文本")
expect("首领A.mythic", result['guides']['测试副本']['首领A']['mythic'], "史诗文本")
expect("小怪B.tips", result['guides']['测试副本']['小怪B']['tips'], "小怪攻略|含管道")
expect("小怪B.type", result['guides']['测试副本']['小怪B']['type'], "MOB")
expect("customVer label", result['customVersions']['MyCat']['label'], "我的分类")
expect("customVer order", result['customVersions']['MyCat']['order'], 5)
expect("customDung ver", result['customDungeons']['自定义本']['versionId'], "MyCat")
expect("customDung eid", result['customDungeons']['自定义本']['encounterId'], "12345")
expect("encOverride", result['encOverride'], "54321")
expect("dungOverride", result['dungOverride'], "111")

print("\n=== ASSERTIONS ===")
if failures:
    for f in failures:
        print("FAIL:", f)
    print(f"\n{len(failures)} FAILURE(S)")
else:
    print("ALL PASS - export/import round-trip is consistent")
