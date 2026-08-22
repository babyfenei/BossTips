# -*- coding: utf-8 -*-
"""离线验证：① 改动文件语法 ② 只看当前BOSS过滤逻辑 ③ 战斗守卫分支存在性"""
import lupa, io, sys
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
from lupa import LuaRuntime
lua = LuaRuntime()

FILES = ["Window.lua", "Core.lua", "Settings.lua", "Data.lua", "Editor.lua", "Locales.lua"]
print("=== 1) 语法检查 ===")
allok = True
for f in FILES:
    src = io.open(f, encoding="utf-8").read()
    try:
        lua.compile(src, f)
        print(f"  {f}: OK")
    except Exception as e:
        allok = False
        print(f"  {f}: FAIL -> {e}")
assert allok, "syntax failed"

print("=== 2) 过滤逻辑模拟（提取自 ShowInstanceGuide 的过滤段） ===")
# 用与 Window.lua 相同的逻辑做独立模拟
sim = lua.execute('''
local function filter(sorted, selectedBoss, expandedKeys, instanceName, showCurrentBossOnly)
    if showCurrentBossOnly then
        local anchored = {}
        if selectedBoss then
            for _, t in ipairs(sorted) do
                if t.bossKey == selectedBoss or t.name == selectedBoss then anchored[t] = true end
            end
        else
            for _, t in ipairs(sorted) do
                if t.type ~= "MOB" then
                    local expKey = instanceName .. "\\001" .. tostring(t.bossKey or t.name)
                    if expandedKeys[expKey] then anchored[t] = true end
                end
            end
            if next(anchored) == nil then
                for _, t in ipairs(sorted) do
                    if t.type ~= "MOB" then anchored[t] = true; break end
                end
            end
        end
        if next(anchored) ~= nil then
            local keep = {}
            for _, t in ipairs(sorted) do
                if anchored[t] or t.type == "MOB" then keep[#keep + 1] = t end
            end
            sorted = keep
        end
    end
    local names = {}
    for _, t in ipairs(sorted) do names[#names+1] = t.name end
    return table.concat(names, ",")
end
local sorted = {
    { name = "小怪周", bossKey = "小怪周", type = "MOB" },
    { name = "BossA", bossKey = "BossA", type = "BOSS" },
    { name = "BossB", bossKey = "BossB", type = "BOSS" },
    { name = "BossC", bossKey = "BossC", type = "BOSS" },
}
local inst = "测试副本"
local r = {}
-- ① 过滤开 + selectedBoss=BossB（智能展开当前BOSS）→ 小怪+BossB
r[1] = filter(sorted, "BossB", {}, inst, true)
-- ② 过滤开 + 无selectedBoss + expandedKeys 有 BossC → 小怪+BossC
local ek = {}; ek[inst .. "\\001" .. "BossC"] = true
r[2] = filter(sorted, nil, ek, inst, true)
-- ③ 过滤开 + 无任何锚点 → 小怪+BossA（默认第一条BOSS）
r[3] = filter(sorted, nil, {}, inst, true)
-- ④ 过滤关 → 全部
r[4] = filter(sorted, nil, {}, inst, false)
-- ⑤ 过滤开 + selectedBoss 找不到（本地化不匹配）→ 回退全部
r[5] = filter(sorted, "不存在", {}, inst, true)
return r
''')
exp = {
    1: "小怪周,BossB",
    2: "小怪周,BossC",
    3: "小怪周,BossA",
    4: "小怪周,BossA,BossB,BossC",
    5: "小怪周,BossA,BossB,BossC",
}
ok = True
for i in range(1, 6):
    got, want = sim[i], exp[i]
    mark = "OK " if got == want else "FAIL"
    if got != want: ok = False
    print(f"  用例{i}: [{mark}] got={got!r} want={want!r}")
assert ok, "filter logic failed"

print("=== 3) 战斗守卫存在性静态检查 ===")
wsrc = io.open("Window.lua", encoding="utf-8").read()
checks = [
    ("needPostCombatRefresh 标记", "needPostCombatRefresh" in wsrc),
    ("regen 补刷钩子", 'PLAYER_REGEN_ENABLED' in wsrc and "ShowInstanceGuide(addon.currentInstanceName)" in wsrc),
    ("渲染 SetAttribute 战斗守卫", "local inCombat = InCombatLockdown()" in wsrc),
    ("布局喇叭按钮守卫", "inCombatLayout" in wsrc),
    ("过滤按钮", "filterBtn" in wsrc and "showCurrentBossOnly" in wsrc),
]
csrc = io.open("Core.lua", encoding="utf-8").read()
checks += [
    ("Core 主按钮无左键战斗拦截", "战斗中无法切换攻略窗" not in csrc),
    ("Core 小地图无战斗拦截", "战斗中无法打开面板" not in csrc),
    ("Core OpenMainGUI 无战斗拦截", "战斗中无法打开设置面板" not in csrc),
]
ssrc = io.open("Settings.lua", encoding="utf-8").read()
checks += [
    ("Settings OpenMainGUI 无战斗拦截", "Cannot open settings in combat" not in ssrc),
    ("Settings 新开关已注册", "showCurrentBossOnly" in ssrc),
]
dsrc = io.open("Data.lua", encoding="utf-8").read()
checks += [
    ("Data 默认值", "showCurrentBossOnly = false" in dsrc),
    ("Data 导出键", '{ key = "showCurrentBossOnly", t = "bool" }' in dsrc),
]
lsrc = io.open("Locales.lua", encoding="utf-8").read()
for k in ["Show Current Boss Only", "Filter Current Only", "Filter Show All", "Filter Btn Tooltip"]:
    checks.append((f"Locales 键 {k} x3", lsrc.count('["' + k + '"]') == 3))
ok2 = True
for name, passed in checks:
    print(f"  [{'OK ' if passed else 'FAIL'}] {name}")
    if not passed: ok2 = False
assert ok2, "static checks failed"
print("\n全部通过 ✓")
