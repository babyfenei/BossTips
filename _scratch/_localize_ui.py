#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
半自动本地化脚本：把 Settings.lua / Editor.lua / Window.lua 里的硬编码中文
提取为 L["Key"] 并在 Locales.lua 追加三语条目。
"""
import re, os, json
from opencc import OpenCC

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
FILES = ["Settings.lua", "Editor.lua", "Window.lua"]
LOCALES_PATH = os.path.join(BASE, "Locales.lua")

cc_tw = OpenCC('s2t')

# 需要跳过的字符串（正则模式 / 含格式转义 / 保留中文的着色关键词）
SKIP_EXACT = {
    "^断", "^速断", "打断", "速杀", "集火", "关注", "优先", "重点", "必断",
    "打断([^%s%[%]|，。；：,;!！?？]+)",
    "|cffffff00[地下城]|r", "|cffffff00[团本]|r",
}
SKIP_IF_CONTAINS = ["%", "\\n"]  # 跳过含格式转义或换行的复杂字符串

def has_cjk(s):
    return any('\u4e00' <= c <= '\u9fff' for c in s)

def sanitize_key(s):
    # 生成稳定的英文键：保留字母数字空格，其余变下划线，收尾去下划线
    out = []
    for c in s:
        if c.isalnum() or c == ' ':
            out.append(c)
        else:
            out.append('_')
    k = ''.join(out).strip('_').replace(' ', '_')
    k = re.sub(r'_+', '_', k)
    return k[:48] or "UI_KEY"

# 预定义英文翻译（优先人工Readable键，未列出的用 sanitized key）
EN_MAP = {
    "设置": "Settings",
    "配置文件": "Profiles",
    "攻略配置": "Guide Options",
    "快捷操作": "Quick Actions",
    "打开副本选择": "Open Dungeon Picker",
    "打开攻略编辑器": "Open Guide Editor",
    "行为与交互": "Behavior & Interaction",
    "聊天输出": "Chat Output",
    "外观与测试": "Appearance & Testing",
    "智能展开": "Smart Expand",
    "智能展开 Desc": "Smart Expand Desc",
    "进本自动弹窗": "Auto Open On Enter",
    "锁定窗口": "Lock Window",
    "锁定窗口 Desc": "Lock Window Desc",
    "允许发送攻略": "Enable Chat Send",
    "聊天发送 Desc": "Chat Send Desc",
    "语言": "Language",
    "跟随系统": "Follow System",
    "简体中文": "简体中文",
    "繁體中文": "繁體中文",
    "English": "English",
    "显示方式": "Display Mode",
    "自动展开": "Auto Expand",
    "按钮模式": "Button Mode",
    "显示小怪条目": "Show Mob Entries",
    "难度显示": "Difficulty Display",
    "左键发送频道": "Left Click Channel",
    "右键发送频道": "Right Click Channel",
    "发送攻略后关闭窗口": "Close After Send",
    "主题风格": "Theme Style",
    "官方默认主题": "Default Theme",
    "ACE3 主题": "ACE3 Theme",
    "字体": "Font",
    "系统默认": "System Default",
    "伤害数字": "Damage Font",
    "聊天粗体": "Chat Bold",
    "无攻略时隐藏悬浮按钮": "Hide Button When No Guide",
    "重置悬浮按钮位置": "Reset Button Position",
    "重置当前配置文件": "Reset Current Profile",
    "地下城": "Dungeon",
    "团本": "Raid",
    "一键展开": "Expand All",
    "一键折叠": "Collapse All",
    "导入与导出": "Import & Export",
    "新建分类": "New Category",
    "新建副本": "New Dungeon",
    "新建团本分类": "New Raid Category",
    "新建团本副本": "New Raid Dungeon",
    "保存并添加分类": "Save Category",
    "保存并添加副本": "Save Dungeon",
    "保存并添加目标": "Save Target",
    "删除此分类及其所有内容": "Delete Category",
    "删除此副本及其所有内容": "Delete Dungeon",
    "删除此目标": "Delete Target",
    "目标名称": "Target Name",
    "副本名称": "Dungeon Name",
    "副本ID": "Dungeon ID",
    "副本ID（可选）": "Dungeon ID Optional",
    "副本ID（实例ID）": "Dungeon ID Instance",
    "副本类型": "Dungeon Type",
    "首领战ID": "Encounter ID",
    "自动填充": "Auto Fill",
    "自动填充 BigWigs 首领战ID": "Auto Fill BigWigs IDs",
    "排序权重": "Category Order",
    "移动到分类": "Move To Category",
    "类型": "Type",
    "编辑难度（可为不同难度写不同攻略）": "Edit Difficulty",
    "文本笔记（当前：|cff00ccff": "Text Notes Current",
    "管理分类": "Manage Category",
    "管理副本": "Manage Dungeon",
    "管理团本": "Manage Raid",
    "管理团本版本": "Manage Raid Version",
    "展开攻略": "Show Guide",
    "隐藏攻略": "Hide Guide",
    "显示小怪": "Show Mobs",
    "隐藏小怪": "Hide Mobs",
    "难度": "Difficulty",
    "难度: ": "Difficulty: ",
    "发送攻略": "Send Guide",
    "左键：发送到 ": "Left: send to ",
    "右键：发送到 ": "Right: send to ",
    "随机": "LFR",
    "普通": "Normal",
    "英雄": "Heroic",
    "史诗": "Mythic",
    "史诗+": "Mythic Plus Short",
    "随机（LFR）": "LFR",
    "史诗+（大秘境）": "Mythic Plus",
    "5人本": "Dungeons",
    "副本与分类": "Dungeons & Categories",
    "已隐藏": "Hidden",
    "说": "Say",
    "队伍": "Party",
    "团队": "Raid Channel",
    "副本": "Instance",
    "大喊": "Yell",
    "小怪": "MOB",
    "首领": "BOSS",
    "测试窗口": "Test Window",
    "示例目标": "Sample Target",
    "激活此副本（取消勾选将在屏幕上隐藏）": "Active Dungeon Hint",
    "激活此团本（取消勾选将在屏幕上隐藏）": "Active Raid Hint",
    "启用此分类（取消勾选将隐藏该分类下所有副本）": "Enable Category Hint",
    "启用此团本版本（取消勾选将隐藏其下所有团本）": "Enable Raid Version Hint",
    "取消勾选将隐藏该版本下所有 5 人本/大秘境": "Hide Version Dungeons",
    "取消勾选将隐藏该版本下所有团本": "Hide Version Raids",
    "取消勾选后，该难度不会出现在攻略窗的难度切换列表中，也不会作为进本后的默认显示难度。": "Diff Toggle Desc",
    "勾选要在攻略窗中展示的难度；未勾选的难度不会出现在难度切换列表，也不会作为进本后的默认难度。": "Diff Display Desc",
    "勾选后点击小喇叭发送攻略会自动隐藏攻略窗口。": "Close After Send Desc",
    "关闭时攻略窗口只显示首领（BOSS），不显示小怪/重点怪。": "Show Mobs Desc",
    "自动展开：进本自动弹出攻略窗。按钮模式：仅显示悬浮按钮，点击后弹窗。": "Display Mode Desc",
    "攻略窗体小喇叭「左键」点击时发送的频道。默认副本（INSTANCE_CHAT）。": "Left Channel Desc",
    "攻略窗体小喇叭「右键」点击时发送的频道。默认说（SAY）。": "Right Channel Desc",
    "选择界面整体主题。ACE3 主题与攻略窗一致（半透明暗色+用户颜色+灰色边框）；官方默认使用暴雪对话框风格。": "Theme Style Desc",
    "选择插件显示语言：跟随系统 / 简体中文 / 繁體中文 / English。修改后界面与攻略立即按所选语言显示。": "Language Desc",
    "点击下方按钮打开攻略编辑器，可修改任意副本/首领的攻略文本。": "Open Editor Desc",
    "打开攻略编辑器，增删改任意副本/首领的攻略文本。": "Open Editor Button Desc",
    "导出生成一段分享码，包含自定义分类、副本、目标攻略与开关状态。": "Export Desc",
    "导出码（分享给好友）": "Export Code",
    "生成导出码": "Generate Export Code",
    "粘贴别人分享的导入码后点击导入，兼容旧版纯攻略分享码。": "Import Desc",
    "导入码（粘贴分享码）": "Import Code",
    "校验并导入": "Verify & Import",
    "导入成功！": "Import successful!",
    "导入失败：": "Import failed: ",
    "导出出错：": "Export error: ",
    "格式无效或内容为空": "Invalid format or empty",
    "（当前没有可导出的自定义数据，请在编辑器中修改任意攻略后再试）": "No custom data to export",
    "请从左侧选择一个分类、副本或目标节点。": "Select Node Hint",
    "请截图此提示并反馈。": "Please screenshot and report",
    "编辑器加载失败": "Editor Load Failed",
    "编辑目标": "Edit Target",
    "数据导入/导出": "Import / Export",
    "在聊天框打印当前副本信息（需手动输入）": "Print Instance Info",
    "在聊天框打印当前副本信息（需手动修改）": "Print Instance Info Edit",
    "未找到 '": "Not found '",
    "确定删除 '": "Confirm delete '",
    "确定删除自定义分类 '": "Confirm delete custom category '",
    "确定删除自定义副本 '": "Confirm delete custom dungeon '",
    "确定删除自定义团本分类 '": "Confirm delete custom raid category '",
    "确定删除自定义团本 '": "Confirm delete custom raid '",
    "' 及其所有副本吗？": "' and all its dungeons?",
    "' 及其所有团本吗？": "' and all its raids?",
    "' 吗？": "'?",
    "' 吗？内置副本不会被删除。": "'? Built-in dungeons won't be deleted.",
    "' 吗？内置团本不会被删除。": "'? Built-in raids won't be deleted.",
    "' 的攻略数据。": "' guide data.",
    "+ 在此副本中新增目标": "Add Target In Dungeon",
    "[+ 在此副本中新增目标]": "[Add Target In Dungeon]",
    "[+ 新建分类]": "[New Category]",
    "[+ 新建副本]": "[New Dungeon]",
    "[+ 新建团本分类]": "[New Raid Category]",
    "[+ 新建团本副本]": "[New Raid Dungeon]",
    "[<=> 导入与导出]": "[<=> Import & Export]",
    " |cff00ccff(自定义)|r": "CustomSuffix",
    " |cffaaaaaa(内置)|r": "BuiltinSuffix",
    "[已隐藏]": "[Hidden]",
    " 个首领战ID": " encounter IDs",
    " 字符。点击上方框内文字后 Ctrl+A / Ctrl+C 复制。|r": " chars. Click the text above, then Ctrl+A / Ctrl+C to copy.|r",
    " 字符）：|r": " chars):|r",
    "当前配置文件：": "Current Profile: ",
    "BossTips - 副本与目标编辑器": "Dungeon & Target Editor",
    "\n\nBossTips 使用账号级 SavedVariables，暂不支持多角色独立配置。点击下方按钮可将当前配置恢复为默认。": "Profile Reset Desc",
    "确定将当前配置文件重置为默认吗？所有自定义攻略、分类、副本开关都会丢失！": "Reset Profile Confirm",
    "窗口已锁定": "Window locked",
    "窗口已解锁": "Window unlocked",
    "|cffffcc00› 编辑攻略 ‹|r": "Edit Guide Header",
    "|cffffcc00重点 ": "Focus ",
    "|cff888888]，叶子 [|r": "], leaf [|r",
    "|cff888888调试：未识别路径 [|r": "Debug: unrecognized path [|r",
    "|cff888888导出范围：自定义攻略覆盖、开关状态、自定义分类/副本、首领战ID覆盖。不包含内置攻略与UI设置。|r": "Export scope hint",
    "|cff888888团本首领已按 ID 库预建骨架，点击左侧首领即可编辑攻略与首领战ID（保存到 WTF 覆盖层）。|r": "Raid skeleton hint",
    "|cffffff00提示：尚未修改任何内置攻略或创建自定义数据。|r": "No custom data hint",
    "|cffffff00BossTips 导出码（": "BossTips export code (",
    "|cffff0000导出失败：": "|cffff0000Export failed: ",
    "|cffff0000导出结果无法显示，请查看聊天框。|r": "|cffff0000Export result too large, check chat.|r",
    "|cff00ff00导出成功：": "|cff00ff00Export successful: ",
    "|cFF00FF00BossTips|r 已发送测试攻略到 ": "|cFF00FF00BossTips|r sent test guide to ",
    "|cff00ff00BossTips|r 已填充 ": "|cff00ff00BossTips|r filled ",
    "|cff00ff00BossTips|r 已填充首领战ID：": "|cff00ff00BossTips|r filled encounter IDs: ",
    "|cff00ff00BossTips|r 当前副本：|cffffff00": "|cff00ff00BossTips|r current instance: |cffffff00",
    "|cff00ff00BossTips|r 当前配置文件已重置为默认。": "|cff00ff00BossTips|r profile reset.",
    "|cffff0000BossTips|r 请输入分类名称！": "|cffff0000BossTips|r Please enter category name!",
    "|cffff0000BossTips|r 请输入副本名称！": "|cffff0000BossTips|r Please enter dungeon name!",
    "|cffff0000BossTips|r 请输入目标名称！": "|cffff0000BossTips|r Please enter target name!",
    "|cffff0000BossTips|r 副本名称已存在（或与内置副本重名）！": "|cffff0000BossTips|r Dungeon name already exists!",
    "|cffff0000BossTips|r 战斗中无法打开设置面板。": "|cffff0000BossTips|r Cannot open settings in combat.",
    "|cffff0000BossTips|r 战斗中无法发送消息。": "|cffff0000BossTips|r Cannot send message in combat.",
    "|cffff0000BossTips|r 未找到匹配的首领战ID": "|cffff0000BossTips|r No matching encounter ID",
    "|cffff0000BossTips|r 当前不在副本中": "|cffff0000BossTips|r Not in an instance",
    "|cffff0000BossTips|r 自定义副本数据异常": "|cffff0000BossTips|r Custom dungeon data error",
    "|cffff0000BossTips|r 自定义团本数据异常": "|cffff0000BossTips|r Custom raid data error",
    "|r  难度：|cffffff00": "|r  Difficulty: |cffffff00",
    "|r，输入后自动保存）": "|r, auto-saved)",
    "{rt8}||在此输入攻略": "NewTargetDefaultTips",
    "{rt8}示例目标{rt8}||这是测试窗口的示例攻略文本。||[炉石|spell:6948]：所有角色共有的通用技能，点击/悬停可查看技能说明。||必断示例：[打断] 技能会标红；速杀示例：[集火] 技能会标金。||拖动标题栏可移动窗口，右下角可缩放；点小喇叭把本攻略发到聊天。": "TestWindowSampleTips",
    # 颜色包裹标签需要拆出来：键只保留中文部分
    "|cffffff00[地下城]|r": "DungeonTabActive",
    "|cffffff00[团本]|r": "RaidTabActive",
}

def get_key(zh):
    return EN_MAP.get(zh, sanitize_key(zh))

# 1. 提取
strings = set()
for f in FILES:
    path = os.path.join(BASE, f)
    lines = open(path, encoding="utf-8").read().splitlines()
    for line in lines:
        code = line.split('--', 1)[0]
        for m in re.findall(r'"([^"]*[\u4e00-\u9fa5][^"]*)"', code):
            if m in SKIP_EXACT: continue
            if any(c in m for c in SKIP_IF_CONTAINS): continue
            strings.add(m)
        for m in re.findall(r"'([^']*[\u4e00-\u9fa5][^']*)'", code):
            if m in SKIP_EXACT: continue
            if any(c in m for c in SKIP_IF_CONTAINS): continue
            strings.add(m)

# 2. 生成映射表
mapping = []
for zh in sorted(strings):
    key = get_key(zh)
    # 防止键冲突：若同一 key 对应不同中文，加后缀
    existing = [x for x in mapping if x["key"] == key]
    if existing:
        key = key + "_" + str(len(existing))
    mapping.append({
        "key": key,
        "zhCN": zh,
        "zhTW": cc_tw.convert(zh),
        "enUS": EN_MAP.get(zh, key),
    })

# 3. 替换源文件（仅替换字符串字面量，不替换注释）
for f in FILES:
    path = os.path.join(BASE, f)
    s = open(path, encoding="utf-8").read()
    new_lines = []
    for line in s.splitlines():
        if '--' in line:
            code, comment = line.split('--', 1)
            comment = '--' + comment
        else:
            code, comment = line, ''
        replaced = code
        # 按长度降序替换，避免短串先替换导致长串匹配失败
        for item in sorted(mapping, key=lambda x: -len(x["zhCN"])):
            k = item["key"]
            zh = item["zhCN"]
            # 双引号
            replaced = re.sub(r'(?<!\\)"' + re.escape(zh) + r'(?<!\\)"', 'L["' + k + '"]', replaced)
            # 单引号
            replaced = re.sub(r"(?<!\\)'" + re.escape(zh) + r"(?<!\\)'", 'L["' + k + '"]', replaced)
        new_lines.append(replaced + comment)
    new_s = '\n'.join(new_lines)
    if s.endswith('\n') and not new_s.endswith('\n'):
        new_s += '\n'
    open(path + ".new", "w", encoding="utf-8").write(new_s)

# 4. 生成 Locales.lua 增补
zhCN_lines = ["\n-- === 自动提取的 UI 本地化条目（zhCN） ===\n"]
zhTW_lines = ["\n-- === 自动提取的 UI 本地化条目（zhTW） ===\n"]
enUS_lines = ["\n-- === 自动提取的 UI 本地化条目（enUS） ===\n"]
for item in mapping:
    zhCN_lines.append(f'    ["{item["key"]}"] = "{item["zhCN"]}",')
    zhTW_lines.append(f'    ["{item["key"]}"] = "{item["zhTW"]}",')
    enUS_lines.append(f'    ["{item["key"]}"] = "{item["enUS"]}",')
open(os.path.join(BASE, "_scratch", "_locales_addon_zhCN.txt"), "w", encoding="utf-8").write('\n'.join(zhCN_lines))
open(os.path.join(BASE, "_scratch", "_locales_addon_zhTW.txt"), "w", encoding="utf-8").write('\n'.join(zhTW_lines))
open(os.path.join(BASE, "_scratch", "_locales_addon_enUS.txt"), "w", encoding="utf-8").write('\n'.join(enUS_lines))

# 5. 保存映射 JSON
open(os.path.join(BASE, "_scratch", "_ui_mapping.json"), "w", encoding="utf-8").write(json.dumps(mapping, ensure_ascii=False, indent=2))

print(f"Extracted {len(mapping)} strings.")
for f in FILES:
    print(f"{f}: wrote .new")
print("Wrote _scratch/_ui_mapping.json and _scratch/_locales_addon_*.txt")
