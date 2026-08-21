# -*- coding: utf-8 -*-
"""
验证 Settings.lua BuildGuideOptions 在 enUS locale 下，
Guide Options 树里每个副本实例节点（dung_*）的显示名都是英文、无中文残留。
覆盖 dungeon_tree（原生+M+/自定义）与 raid_tree（团本）。
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
function LibStub(name, silent) return fakeLib end
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
    load_file(rel)

# 用户设置 enUS
lua.execute("BossTipsGlobalDB.lang = 'enUS'")
lua.execute("""
if __BTAddon.RefreshLocale then __BTAddon.RefreshLocale() end
__BTAddon.BuildActiveGuides()
__BTAddon.BuildGuideOptions()
""")

CJK = re.compile(r'[\u4e00-\u9fff]')

# 遍历 dungeon_tree 与 raid_tree 下所有 dung_ 节点
lua.execute("""
__BTDungNodes = {}
local function collect(tree, kind)
    local t = __BTAddon.guideOptions.args[tree].args
    for vid, verNode in pairs(t) do
        local vArgs = verNode.args or {}
        for k, node in pairs(vArgs) do
            if type(k) == "string" and k:sub(1,5) == "dung_" then
                __BTDungNodes[kind .. "|" .. vid .. "|" .. k] = node.name
            end
        end
    end
end
collect("dungeon_tree", "DUNGEON")
collect("raid_tree", "RAID")
""")

nodes = lua.globals()["__BTDungNodes"]
leaks = []
total = 0
for key, name in nodes.items():
    total += 1
    s = str(name)
    if CJK.search(s):
        leaks.append((key, s))

print(f"enUS 模式下 Guide Options 实例节点总数: {total}")
if leaks:
    print(f"FAIL：发现 {len(leaks)} 个中文残留：")
    for key, s in leaks[:60]:
        print(f"  {key} -> {s!r}")
else:
    print("PASS：所有实例节点显示名均为英文，无中文残留。")

# 额外抽查几个代表性中文 key 的解析结果
lua.execute("""
__BTSamples = {
    hellfire = __BTAddon.GetLocalizedInstanceName("地狱火堡垒：城墙", "native", "2.0"),
    auch = __BTAddon.GetLocalizedInstanceName("奥金顿：暗影迷宫", "native", "2.0"),
    coil = __BTAddon.GetLocalizedInstanceName("塞塔里斯神庙", "mplus", "Current"),
    black = __BTAddon.GetLocalizedInstanceName("黑石深渊", "native", "1.0"),
    raid12 = __BTAddon.GetLocalizedInstanceName("解放幽魂之地", "raids", "12.1"),
}
""")
samp = lua.globals()["__BTSamples"]
for k, v in samp.items():
    print(f"  sample {k} = {str(v)!r}")
