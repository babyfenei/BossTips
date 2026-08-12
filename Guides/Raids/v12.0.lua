-- ============================================================================
-- BossTips Raid Guide Data —— 版本 12.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["12.0"] = addon.GuideData.raids["12.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 毒渊 (instanceId 3004) =====================
addon.GuideData.raids["12.0"]["毒渊"] = {
    ["Sszorak"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Entombed Sentinels"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Vashnik the Malignant"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Bargained Crown"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Twin Fangs"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Nek'zali the Soulcoiler"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Lost Explorers"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ula'tek"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["毒渊"] = { isRaid = true, instanceId = 3004, encounterIds = {
    ["Sszorak"] = 2871,
    ["Entombed Sentinels"] = 2874,
    ["Vashnik the Malignant"] = 2882,
    ["The Bargained Crown"] = 2883,
    ["The Twin Fangs"] = 2887,
    ["Nek'zali the Soulcoiler"] = 2888,
    ["The Lost Explorers"] = 2894,
    ["Ula'tek"] = 2895,
} }

-- ===================== 虚空尖塔 (instanceId 2912) =====================
addon.GuideData.raids["12.0"]["虚空尖塔"] = {
    ["Imperator Averzian"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Vorasius"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Vaelgor & Ezzorak"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Fallen-King Salhadaar"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lightblinded Vanguard"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Crown of the Cosmos"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["虚空尖塔"] = { isRaid = true, instanceId = 2912, encounterIds = {
    ["Imperator Averzian"] = 2733,
    ["Vorasius"] = 2734,
    ["Vaelgor & Ezzorak"] = 2735,
    ["Fallen-King Salhadaar"] = 2736,
    ["Lightblinded Vanguard"] = 2737,
    ["Crown of the Cosmos"] = 2738,
} }

-- ===================== 梦裂 (instanceId 2939) =====================
addon.GuideData.raids["12.0"]["梦裂"] = {
    ["Chimaerus the Undreamt God"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["梦裂"] = { isRaid = true, instanceId = 2939, encounterIds = {
    ["Chimaerus the Undreamt God"] = 2795,
} }

-- ===================== 进军奎尔萨拉斯 (instanceId 2913) =====================
addon.GuideData.raids["12.0"]["进军奎尔萨拉斯"] = {
    ["Belo'ren, Child of Al'ar"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Midnight Falls"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["进军奎尔萨拉斯"] = { isRaid = true, instanceId = 2913, encounterIds = {
    ["Belo'ren, Child of Al'ar"] = 2739,
    ["Midnight Falls"] = 2740,
} }

