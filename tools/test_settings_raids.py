#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Verify settings-tree readiness for raid options + 12.0 label change.

Imports tools.load_sim (which performs the full .toc load into _G.__BTAddon),
then queries the addon helpers that BuildGuideOptions relies on:
  * GetVersionLabel("12.0") == "至暗之夜"   (label fix)
  * GetRaidVersionIDs / GetRaidDungeons    (raids exist to merge into the tree)
  * GetVersionDungeons native only         (editor stays unpolluted)
  * IsVersionEnabled respects disabledRaids
"""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import load_sim  # noqa: F401  (triggers full addon load at import)

L = load_sim.lua


def q(code):
    return L.execute(code)


print("=== 设置树团本/标签 验证 ===")

# Task 97: 12.0 label
label = q("return __BTAddon.GetVersionLabel('12.0')")
print("GetVersionLabel('12.0') =", repr(label))
assert label == "至暗之夜", label

# raid version ids present
raid_ids = q("local t=__BTAddon.GetRaidVersionIDs() local s={} for _,v in ipairs(t) do s[#s+1]=v end return table.concat(s, ',')")
print("GetRaidVersionIDs =", raid_ids)
assert "12.0" in raid_ids and "12.1" in raid_ids, raid_ids

# raid dungeons for 12.0 (Midnight S1 = 3 raids)
raid_inst = q("local t=__BTAddon.GetRaidDungeons('12.0') local s={} for k in pairs(t) do s[#s+1]=k end return table.concat(s, ',')")
print("GetRaidDungeons('12.0') =", raid_inst)
assert "虚空尖塔" in raid_inst and "梦裂" in raid_inst and "进军奎尔萨拉斯" in raid_inst, raid_inst

# native dungeons for 12.0 (unchanged; editor unaffected)
nat_inst = q("local t=__BTAddon.GetVersionDungeons('12.0') local s={} for k in pairs(t) do s[#s+1]=k end return table.concat(s, ',')")
print("GetVersionDungeons('12.0') [native only] =", nat_inst)

# IsVersionEnabled: enabled by default, disabled when disabledRaids set
en = q("return __BTAddon.IsVersionEnabled('12.0')")
print("IsVersionEnabled('12.0') default =", en)
assert en == True, en
q("BossTipsGlobalDB.disabledRaids['12.0']=true")
en2 = q("return __BTAddon.IsVersionEnabled('12.0')")
print("IsVersionEnabled('12.0') after disabledRaids=true =", en2)
assert en2 == False, en2
q("BossTipsGlobalDB.disabledRaids['12.0']=nil")
en3 = q("return __BTAddon.IsVersionEnabled('12.0')")
assert en3 == True, en3

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

print("SETTINGS RAIDS OK")
