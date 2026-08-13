# -*- coding: utf-8 -*-
"""
仿真加载 BossTips 插件：用 Lua 5.x 桩模拟 WoW API，按 .toc 顺序执行所有 .lua，
捕获首个运行时错误（luaparse 只能查语法，查不出 Lua 5.1 运行时/API 缺失问题）。
"""
import os, re, sys
import lupa

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
TOC = os.path.join(ADDON, "BossTips.toc")

lua = lupa.LuaRuntime(unpack_returned_tuples=True)

# ---- 通用 Frame 桩（Lua 侧元表 __index 返回 no-op 函数；需要返回值的单独覆盖） ----
bootstrap = r"""
local _frame_mt = {
    __index = function(t, k)
        -- 需要返回具体值的属性
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
        -- 创建子对象的方法返回新 frame 桩，其余一律 no-op（返回新 frame 以便链式调用）
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

# ---- 全局桩 ----
globals_setup = r"""
-- 字体对象
GameFontNormal = _NewFrame()
STANDARD_TEXT_FONT = "Fonts\\ARHei.ttf"
DAMAGE_TEXT_FONT = "Fonts\\ARKai_C.ttf"

-- SavedVariables
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

-- 通用全局函数
function CreateFrame(...) return _NewFrame() end
function GetInstanceInfo() return "暴风城", nil, 0, nil, nil, nil, nil, 0 end
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

-- C_Timer
C_Timer = { After = function(d, f) end }

-- 其它全局（WoW 内建）
SlashCmdList = {}
GameTooltip = _NewFrame()
UIParent = _NewFrame()
StaticPopupDialogs = {}


-- LibStub 桩：返回带常用方法的假库
local fakeLib = {}
setmetatable(fakeLib, { __index = function(t, k)
    return function(...) return fakeLib end
end })
function LibStub(name, silent)
    return fakeLib
end

-- 其它 API 兜底
function pcall(f, ...) return true, f(...) end
function IsModifiedClick(...) return false end
function GetMouseFocus() return nil end
"""

lua.execute(bootstrap)
lua.execute(globals_setup)

# 共享 addon 表
lua.execute("__BTAddon = {}")
lua.execute("__BTAddon.L = setmetatable({}, { __index = function(t,k) return k end })")

def fix_first_line(src):
    # 把顶部 `local ... = ...` 的 vararg 声明改引用共享 addon 表（仅替换首个 `= ...`）
    src = re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)
    return src

# 收集 .toc 中的 .lua 文件
order = []
with open(TOC, encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if line.endswith(".lua") and not line.startswith("#"):
            order.append(line)

print("=== 按 .toc 顺序加载（捕获运行时错误） ===")
ok_all = True
for rel in order:
    path = os.path.join(ADDON, rel)
    if not os.path.exists(path):
        print(f"[跳过] 文件不存在: {rel}")
        continue
    try:
        with open(path, encoding="utf-8") as fh:
            src = fix_first_line(fh.read())
        lua.execute(src, name=rel)
        print(f"[OK]   {rel}")
    except Exception as e:
        ok_all = False
        print(f"[ERROR] {rel}")
        print("   ", str(e).replace("\n", "\n    "))
        # 打印 Lua 堆栈（若有）
        break

if ok_all:
    print("\n=== 加载成功，尝试调用关键函数 ===")
    for callname, code in [
        ("BuildActiveGuides", "local ok,err=pcall(function() __BTAddon.BuildActiveGuides() end) if not ok then error(err) end"),
        ("ShowTestWindow",    "local ok,err=pcall(function() __BTAddon.ShowTestWindow() end) if not ok then error(err) end"),
        ("ShowInstanceGuide", "local ok,err=pcall(function() __BTAddon.tipsFrame:ShowInstanceGuide('测试窗口') end) if not ok then error(err) end"),
        ("CheckInstance",     "local ok,err=pcall(function() __BTAddon.CheckInstance() end) if not ok then error(err) end"),
    ]:
        try:
            lua.execute(code)
            print(f"[OK]   {callname}")
        except Exception as e:
            print(f"[ERROR] {callname}: {str(e).replace(chr(10),' ')}")

print("\nDONE")
