-- ============================================================================
-- BossTips Raid Guide Data —— 版本 9.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["9.0"] = addon.GuideData.raids["9.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 纳斯利亚堡 (instanceId 2296) =====================
addon.GuideData.raids["9.0"]["纳斯利亚堡"] = {
    ["Shriekwing"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sludgefist"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Artificer Xy'mox"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lady Inerva Darkvein"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sun King's Salvation"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sire Denathrius"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Stone Legion Generals"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Council of Blood"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hungering Destroyer"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Huntsman Altimor"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["纳斯利亚堡"] = { isRaid = true, instanceId = 2296, encounterIds = {
    ["Shriekwing"] = 2393,
    ["Sludgefist"] = 2394,
    ["Artificer Xy'mox"] = 2418,
    ["Lady Inerva Darkvein"] = 2420,
    ["Sun King's Salvation"] = 2422,
    ["Sire Denathrius"] = 2424,
    ["Stone Legion Generals"] = 2425,
    ["The Council of Blood"] = 2426,
    ["Hungering Destroyer"] = 2428,
    ["Huntsman Altimor"] = 2429,
} }

-- ===================== 统御圣所 (instanceId 2450) =====================
addon.GuideData.raids["9.0"]["统御圣所"] = {
    ["The Tarragrue"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Nine"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kel'Thuzad"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sylvanas Windrunner"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Eye of the Jailer"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Painsmith Raznal"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Remnant of Ner'zhul"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Soulrender Dormazain"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Guardian of the First Ones"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Fatescribe Roh-Kalo"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["统御圣所"] = { isRaid = true, instanceId = 2450, encounterIds = {
    ["The Tarragrue"] = 2435,
    ["The Nine"] = 2439,
    ["Kel'Thuzad"] = 2440,
    ["Sylvanas Windrunner"] = 2441,
    ["The Eye of the Jailer"] = 2442,
    ["Painsmith Raznal"] = 2443,
    ["Remnant of Ner'zhul"] = 2444,
    ["Soulrender Dormazain"] = 2445,
    ["Guardian of the First Ones"] = 2446,
    ["Fatescribe Roh-Kalo"] = 2447,
} }

-- ===================== 初诞者圣墓 (instanceId 2481) =====================
addon.GuideData.raids["9.0"]["初诞者圣墓"] = {
    ["Lords of Dread"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Vigilant Guardian"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Dausegne, the Fallen Oracle"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Prototype Pantheon"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lihuvim, Principal Architect"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Halondrus the Reclaimer"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Jailer"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Skolex, the Insatiable Ravener"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Rygelon"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Anduin Wrynn"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Artificer Xy'mox v2"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["初诞者圣墓"] = { isRaid = true, instanceId = 2481, encounterIds = {
    ["Lords of Dread"] = 2457,
    ["Vigilant Guardian"] = 2458,
    ["Dausegne, the Fallen Oracle"] = 2459,
    ["Prototype Pantheon"] = 2460,
    ["Lihuvim, Principal Architect"] = 2461,
    ["Halondrus the Reclaimer"] = 2463,
    ["The Jailer"] = 2464,
    ["Skolex, the Insatiable Ravener"] = 2465,
    ["Rygelon"] = 2467,
    ["Anduin Wrynn"] = 2469,
    ["Artificer Xy'mox v2"] = 2470,
} }

