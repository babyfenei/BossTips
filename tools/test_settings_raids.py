#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Verify settings-tree split: 5-man / raid separate trees + Current M+ pinned + 12.0 label.

Imports tools.load_sim (which performs the full .toc load into _G.__BTAddon),
then queries the addon helpers that BuildGuideOptions relies on:
  * GetVersionLabel("12.0") == "12.0 至暗之夜"
  * GetRaidVersionLabel("12.0") == "12.0 至暗之夜"
  * GetAllVersionIDs pins "Current" (M+) at top
  * GetRaidVersionIDs / GetRaidDungeons exist
  * IsDungeonVersionEnabled / IsRaidVersionEnabled are independent
  * SendBossTips channel override (right-click -> /say)
"""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import load_sim  # noqa: F401  (triggers full addon load at import)

L = load_sim.lua


def q(code):
    return L.execute(code)


print("=== 设置树团本/标签 验证 ===")

# 12.0 label now includes version prefix in both dungeon and raid trees
label = q("return __BTAddon.GetVersionLabel('12.0')")
print("GetVersionLabel('12.0') =", repr(label))
assert label == "12.0 至暗之夜", label

raid_label = q("return __BTAddon.GetRaidVersionLabel('12.0')")
print("GetRaidVersionLabel('12.0') =", repr(raid_label))
assert raid_label == "12.0 至暗之夜", raid_label

# Current M+ season pinned at top of GetAllVersionIDs
all_ids = q("local t=__BTAddon.GetAllVersionIDs() local s={} for _,v in ipairs(t) do s[#s+1]=v end return table.concat(s, ',')")
print("GetAllVersionIDs =", all_ids)
assert all_ids.startswith("Current,"), all_ids

# raid version ids present
raid_ids = q("local t=__BTAddon.GetRaidVersionIDs() local s={} for _,v in ipairs(t) do s[#s+1]=v end return table.concat(s, ',')")
print("GetRaidVersionIDs =", raid_ids)
assert "12.0" in raid_ids and "12.1" in raid_ids, raid_ids

# raid dungeons for 12.0 (Midnight S1 = 3 raids)
raid_inst = q("local t=__BTAddon.GetRaidDungeons('12.0') local s={} for k in pairs(t) do s[#s+1]=k end return table.concat(s, ',')")
print("GetRaidDungeons('12.0') =", raid_inst)
assert "虚空尖塔" in raid_inst and "梦裂" in raid_inst and "进军奎尔萨拉斯" in raid_inst, raid_inst

# native dungeons for 12.0 (unchanged; editor stays unpolluted)
nat_inst = q("local t=__BTAddon.GetVersionDungeons('12.0') local s={} for k in pairs(t) do s[#s+1]=k end return table.concat(s, ',')")
print("GetVersionDungeons('12.0') [native only] =", nat_inst)
# 5 人本树不应包含团本实例
for ri in ("虚空尖塔", "梦裂", "进军奎尔萨拉斯"):
    assert ri not in nat_inst, "GetVersionDungeons 不应包含团本：" + ri

# 5人本/团本开关相互独立
en_d = q("return __BTAddon.IsDungeonVersionEnabled('12.0')")
print("IsDungeonVersionEnabled('12.0') default =", en_d)
assert en_d == True, en_d
en_r = q("return __BTAddon.IsRaidVersionEnabled('12.0')")
print("IsRaidVersionEnabled('12.0') default =", en_r)
assert en_r == True, en_r

q("BossTipsGlobalDB.disabledRaids['12.0']=true")
assert q("return __BTAddon.IsRaidVersionEnabled('12.0')") == False
assert q("return __BTAddon.IsDungeonVersionEnabled('12.0')") == True, "团本开关不应影响 5 人本"
assert q("return __BTAddon.IsVersionEnabled('12.0')") == False
q("BossTipsGlobalDB.disabledRaids['12.0']=nil")
q("BossTipsGlobalDB.disabledNative['12.0']=true")
assert q("return __BTAddon.IsDungeonVersionEnabled('12.0')") == False
assert q("return __BTAddon.IsRaidVersionEnabled('12.0')") == True, "5人本开关不应影响团本"
assert q("return __BTAddon.IsVersionEnabled('12.0')") == False
q("BossTipsGlobalDB.disabledNative['12.0']=nil")
assert q("return __BTAddon.IsVersionEnabled('12.0')") == True

# Task 96: SendBossTips 频道覆盖（右键 -> /say）
L.execute("""
SendChatMessage_captured = nil
SendChatMessage = function(msg, chatType) SendChatMessage_captured = chatType end
""")
L.execute("__BTAddon.currentInstanceName='毒渊'")
boss = L.execute("local g=__BTAddon.GetBossData() local inst=g['毒渊'] if not inst then return '' end for k in pairs(inst) do return k end return ''")
print("SendBossTips test boss =", boss)
assert boss and boss != "", "毒渊 应已并入 ActiveGuides"
L.execute("__BTAddon.SendBossTips(%s, 'SAY')" % repr(boss))
captured = L.execute("return SendChatMessage_captured")
print("SendBossTips(...,'SAY') chatType =", captured)
assert captured == "SAY", captured
# 无覆盖时应回退到 defaultChatChannel
L.execute("SendChatMessage_captured = nil")
L.execute("__BTAddon.SendBossTips(%s)" % repr(boss))
captured2 = L.execute("return SendChatMessage_captured")
print("SendBossTips(...) default chatType =", captured2)
# BossTipsGlobalDB 是全局 SavedVariable，不是 __BTAddon 的字段
default_ch = L.execute("return BossTipsGlobalDB.defaultChatChannel or 'INSTANCE_CHAT'")
assert captured2 == default_ch, captured2

# 一键展开/折叠：直接操作 guide_options_tab 树状态表
# sim 下未真正打开对话框，AceConfigDialog.frame 为 nil；stub 以避免 NotifyChange 崩溃
L.execute("local ACD=LibStub('AceConfigDialog-3.0'); if not ACD.frame then ACD.frame={apps={}} end")
L.execute("__BTAddon.SetGuideTreesExpanded(true)")
expanded = q("local ACD=LibStub('AceConfigDialog-3.0'); local s=ACD:GetStatusTable('BossTips',{'guide_options_tab'}); local t={}; for k,v in pairs(s.groups) do if v then t[#t+1]=k end end; return table.concat(t,'|')")
print("expanded keys =", expanded)
assert "dungeon_tree" in expanded, expanded
assert "raid_tree" in expanded, expanded
assert "dungeon_tree\001ver_Current" in expanded, "应展开当前赛季 M+ 节点: " + expanded

L.execute("__BTAddon.SetGuideTreesExpanded(false)")
collapsed = q("local ACD=LibStub('AceConfigDialog-3.0'); local s=ACD:GetStatusTable('BossTips',{'guide_options_tab'}); local t={}; for k,v in pairs(s.groups) do if v then t[#t+1]=k end end; return table.concat(t,'|')")
print("collapsed keys =", collapsed)
assert "dungeon_tree" not in collapsed, collapsed
assert "raid_tree" not in collapsed, collapsed

print("SETTINGS RAIDS OK")
