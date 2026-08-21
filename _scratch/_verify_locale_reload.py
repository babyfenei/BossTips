# -*- coding: utf-8 -*-
"""
模拟真实游戏时序：
1) Locales.lua/Data.lua 在 ADDON_LOADED 前加载（SavedVariables 尚未就位，lang=AUTO）
2) SavedVariables 就位后 lang=enUS
3) Settings.lua ADDON_LOADED 处理重建 options
验证 settings_tab.name 等字段是否按真实 locale 变为英文，以及首领名翻译函数工作正常。
"""
import os, re
import lupa

ADDON = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOC = os.path.join(ADDON, "BossTips.toc")

lua = lupa.LuaRuntime(unpack_returned_tuples=True)

bootstrap = r"""
local _frame_mt = {
    __index = function(t, k)
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

globals_setup = r"""
GameFontNormal = _NewFrame()
STANDARD_TEXT_FONT = "Fonts\\ARHei.ttf"
DAMAGE_TEXT_FONT = "Fonts\\ARKai_C.ttf"

-- 初始不设置 lang（模拟 SavedVariables 加载前的状态）
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
function GetLocale() return "zhCN" end
function GetCursorPosition() return 0, 0 end
function GetNumGroupMembers() return 1 end
function InCombatLockdown() return false end
function SendChatMessage(...) end
function print(...) end
function strtrim(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
function strsplit(delim, str)
    if not str then return nil end
    local t = {}
    local p = 1
    local dlen = #delim
    while true do
        local i = string.find(str, delim, p, true)
        if not i then t[#t + 1] = string.sub(str, p); break end
        t[#t + 1] = string.sub(str, p, i - 1)
        p = i + dlen
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

local fakeLib = {}
setmetatable(fakeLib, { __index = function(t, k)
    return function(...) return fakeLib end
end })
function LibStub(name, silent)
    return fakeLib
end
function pcall(f, ...) return true, f(...) end
function IsModifiedClick(...) return false end
function GetMouseFocus() return nil end
"""

lua.execute(bootstrap)
lua.execute(globals_setup)
lua.execute("__BTAddon = {}")

def fix_first_line(src):
    src = re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)
    return src

def load_file(rel):
    path = os.path.join(ADDON, rel)
    with open(path, encoding="utf-8") as fh:
        src = fix_first_line(fh.read())
    lua.execute(src, name=rel)

# 按 .toc 顺序加载（含 Guides），模拟真实加载
order = []
with open(TOC, encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if line.endswith(".lua") and not line.startswith("#"):
            order.append(line)

for rel in order:
    path = os.path.join(ADDON, rel)
    if not os.path.exists(path):
        continue
    try:
        load_file(rel)
    except Exception as e:
        print(f"加载失败 {rel}: {e}")
        raise

print(f"ADDON_LOADED 前: addon.LOCALE={lua.globals()['__BTAddon']['LOCALE']}")

# 模拟 SavedVariables 加载：用户上次退出前设置的是 enUS
lua.execute("BossTipsGlobalDB.lang = 'enUS'")

# 触发 Settings.lua 的 ADDON_LOADED 处理（重建 options 等）
# 同时按真实 locale 重建 ActiveGuides（Core.lua 的 ADDON_LOADED 也会做）
lua.execute("""
if __BTAddon.RefreshLocale then __BTAddon.RefreshLocale() end
__BTAddon.BuildActiveGuides()
options = __BTAddon.BuildMainOptions()
profileOptions = __BTAddon.BuildProfileOptions()
__BTAddon.BuildGuideOptions()
options.args.guide_options_tab = __BTAddon.guideOptions
options.args.profiles_tab = profileOptions
""")

print(f"ADDON_LOADED 后: addon.LOCALE={lua.globals()['__BTAddon']['LOCALE']}")

# 检查 options 关键字段
options = lua.globals()["options"]
keys = [
    ("args", "settings_tab", "name"),
    ("args", "guide_options_tab", "name"),
    ("args", "profiles_tab", "name"),
]
CJK = re.compile(r'[\u4e00-\u9fff]')
all_ok = True
for path in keys:
    v = options
    for p in path:
        v = v[p]
    leak = CJK.search(str(v))
    status = "OK(英文)" if not leak else "FAIL(中文)"
    if leak:
        all_ok = False
    print(f"  options.{'.'.join(path)} = {v!r}  -> {status}")

# 检查 guideOptions 子项本地化
guide_keys = [
    ("args", "dungeon_tree", "name"),
    ("args", "raid_tree", "name"),
    ("args", "editor_divider", "name"),
    ("args", "open_editor", "name"),
]
guideOptions = lua.globals()["__BTAddon"]["guideOptions"]
for path in guide_keys:
    v = guideOptions
    for p in path:
        v = v[p]
    leak = CJK.search(str(v))
    status = "OK(英文)" if not leak else "FAIL(中文)"
    if leak:
        all_ok = False
    print(f"  guideOptions.{'.'.join(path)} = {v!r}  -> {status}")

# 检查难度开关标签（运行时函数）
print("  难度开关标签:")

lua.execute("""
__BTDiffLabels = {}
local diffs = {"lfr", "normal", "heroic", "mythic", "mythicplus"}
for _, d in ipairs(diffs) do
    __BTDiffLabels[d] = options.args.settings_tab.args.difficulty_visibility.args["diff_" .. d].name
end
""")
for diff in ["lfr", "normal", "heroic", "mythic", "mythicplus"]:
    v = lua.globals()["__BTDiffLabels"][diff]
    leak = CJK.search(str(v))
    status = "OK(英文)" if not leak else "FAIL(中文)"
    if leak:
        all_ok = False
    print(f"    diff_{diff}.name = {v!r}  -> {status}")

# 检查版本 label 本地化
lua.execute("""
__BTVersionLabels = {
    ["1.0"] = __BTAddon.GetVersionLabel("1.0"),
    ["Current"] = __BTAddon.GetVersionLabel("Current"),
    ["12.1_raid"] = __BTAddon.GetRaidVersionLabel("12.1"),
}
""")
for k, v in lua.globals()["__BTVersionLabels"].items():
    leak = CJK.search(str(v))
    status = "OK(英文)" if not leak else "FAIL(中文)"
    if leak:
        all_ok = False
    print(f"  GetVersionLabel({k!r}) = {v!r}  -> {status}")

# 检查 Editor 难度标签
lua.execute("""
__BTEditorDiffLabels = {}
local diffs = {"lfr", "normal", "heroic", "mythic", "mythicplus"}
local map = {lfr="LFR",normal="Normal",heroic="Heroic",mythic="Mythic",mythicplus="Mythic Plus Short"}
for _, d in ipairs(diffs) do
    __BTEditorDiffLabels[d] = __BTAddon.L[map[d]] or d
end
""")
for diff in ["lfr", "normal", "heroic", "mythic", "mythicplus"]:
    v = lua.globals()["__BTEditorDiffLabels"][diff]
    leak = CJK.search(str(v))
    status = "OK(英文)" if not leak else "FAIL(中文)"
    if leak:
        all_ok = False
    print(f"  Editor diff {diff} = {v!r}  -> {status}")

# 检查首领名翻译函数
lua.execute("""
__BTBossName = __BTAddon.GetLocalizedBossName("塞塔里斯神庙", "加瓦兹特", false, "Current")
""")
name = lua.globals()["__BTBossName"]
leak = CJK.search(str(name))
status = "OK(英文)" if not leak else "FAIL(中文)"
if leak:
    all_ok = False
print(f"  GetLocalizedBossName(加瓦兹特) = {name!r}  -> {status}")

# 检查 instance 名翻译
lua.execute("""
__BTInstanceName = __BTAddon.GetLocalizedInstanceName("塞塔里斯神庙", "mplus", "Current")
""")
inst_name = lua.globals()["__BTInstanceName"]
leak = CJK.search(str(inst_name))
status = "OK(英文)" if not leak else "FAIL(中文)"
if leak:
    all_ok = False
print(f"  GetLocalizedInstanceName(塞塔里斯神庙) = {inst_name!r}  -> {status}")

# 检查 Editor GetRawGuide 走翻译层
lua.execute("""
local ag = __BTAddon.ActiveGuides
__BTDebugAgKeys = {}
for k in pairs(ag or {}) do table.insert(__BTDebugAgKeys, k) end
local entry = __BTAddon.GetActiveGuideEntry("塞塔里斯神庙", "加瓦兹特")
__BTDebugEntry = entry and (entry._src and "has _src" or "no _src") or "no entry"
__BTDebugTips = __BTAddon.GetGuideText(entry, "lfr")
__BTEditTips = __BTAddon.GetRawGuide("塞塔里斯神庙", "加瓦兹特")
""")
ag_keys = list(lua.globals()['__BTDebugAgKeys'] or [])
print(f"  debug: ActiveGuides keys count={len(ag_keys)}, sample={ag_keys[:5]!r}")
print(f"  debug: entry={lua.globals()['__BTDebugEntry']!r}, GetGuideText(lfr)={str(lua.globals()['__BTDebugTips'])[:40]!r}")
tips = lua.globals()["__BTEditTips"]
leak = CJK.search(str(tips))
status = "OK(英文)" if not leak else "FAIL(中文)"
if leak:
    all_ok = False
print(f"  GetRawGuide(加瓦兹特) 前60字 = {str(tips)[:60]!r}  -> {status}")

print("\nPASS" if all_ok else "\nFAIL")
