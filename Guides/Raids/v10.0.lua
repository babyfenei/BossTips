-- ============================================================================
-- BossTips Raid Guide Data —— 版本 10.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["10.0"] = addon.GuideData.raids["10.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 亚贝鲁斯，焰影熔炉 (instanceId 2569) =====================
addon.GuideData.raids["10.0"]["亚贝鲁斯，焰影熔炉"] = {
    ["Scalecommander Sarkareth"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kazzara, the Hellforged"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Echo of Neltharion"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Assault of the Zaqali"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Rashok, the Elder"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Magmorax"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Amalgamation Chamber"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Forgotten Experiments"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Vigilant Steward, Zskarn"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["亚贝鲁斯，焰影熔炉"] = { isRaid = true, instanceId = 2569, encounterIds = {
    ["Scalecommander Sarkareth"] = 2520,
    ["Kazzara, the Hellforged"] = 2522,
    ["Echo of Neltharion"] = 2523,
    ["Assault of the Zaqali"] = 2524,
    ["Rashok, the Elder"] = 2525,
    ["Magmorax"] = 2527,
    ["The Amalgamation Chamber"] = 2529,
    ["The Forgotten Experiments"] = 2530,
    ["The Vigilant Steward, Zskarn"] = 2532,
} }

-- ===================== 阿梅达希尔，梦境之愿 (instanceId 2549) =====================
addon.GuideData.raids["10.0"]["阿梅达希尔，梦境之愿"] = {
    ["Fyrakk the Blazing"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Larodar, Keeper of the Flame"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Igira the Cruel"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Council of Dreams"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Nymue, Weaver of the Cycle"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Volcoross"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Smolderon"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gnarlroot"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Tindral Sageswift, Seer of the Flame"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["阿梅达希尔，梦境之愿"] = { isRaid = true, instanceId = 2549, encounterIds = {
    ["Fyrakk the Blazing"] = 2519,
    ["Larodar, Keeper of the Flame"] = 2553,
    ["Igira the Cruel"] = 2554,
    ["Council of Dreams"] = 2555,
    ["Nymue, Weaver of the Cycle"] = 2556,
    ["Volcoross"] = 2557,
    ["Smolderon"] = 2563,
    ["Gnarlroot"] = 2564,
    ["Tindral Sageswift, Seer of the Flame"] = 2565,
} }

-- ===================== 化身巨龙牢窟 (instanceId 2522) =====================
addon.GuideData.raids["10.0"]["化身巨龙牢窟"] = {
    ["Eranog"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sennarth, The Cold Breath"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Primal Council"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kurog Grimtotem"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Broodkeeper Diurna"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Raszageth the Storm-Eater"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Terros"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Dathea, Ascended"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["化身巨龙牢窟"] = { isRaid = true, instanceId = 2522, encounterIds = {
    ["Eranog"] = 2480,
    ["Sennarth, The Cold Breath"] = 2482,
    ["The Primal Council"] = 2486,
    ["Kurog Grimtotem"] = 2491,
    ["Broodkeeper Diurna"] = 2493,
    ["Raszageth the Storm-Eater"] = 2499,
    ["Terros"] = 2500,
    ["Dathea, Ascended"] = 2502,
} }

