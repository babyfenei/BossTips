-- ============================================================================
-- BossTips Raid Guide Data —— 版本 4.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["4.0"] = addon.GuideData.raids["4.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 暮光堡垒 (instanceId 671) =====================
addon.GuideData.raids["4.0"]["暮光堡垒"] = {
    ["Halfus Wyrmbreaker"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Valiona and Theralion"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ascendant Council"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Cho'gall"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sinestra"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["暮光堡垒"] = { isRaid = true, instanceId = 671, encounterIds = {
    ["Halfus Wyrmbreaker"] = 156,
    ["Valiona and Theralion"] = 157,
    ["Ascendant Council"] = 158,
    ["Cho'gall"] = 167,
    ["Sinestra"] = 168,
} }

-- ===================== 黑翼血环 (instanceId 669) =====================
addon.GuideData.raids["4.0"]["黑翼血环"] = {
    ["Omnotron Defense System"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Magmaw"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Atramedes"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Chimaeron"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Maloriak"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Nefarian"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["黑翼血环"] = { isRaid = true, instanceId = 669, encounterIds = {
    ["Omnotron Defense System"] = 169,
    ["Magmaw"] = 170,
    ["Atramedes"] = 171,
    ["Chimaeron"] = 172,
    ["Maloriak"] = 173,
    ["Nefarian"] = 174,
} }

-- ===================== 巨龙之魂 (instanceId 967) =====================
addon.GuideData.raids["4.0"]["巨龙之魂"] = {
    ["Morchok"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hagara the Stormbinder"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Spine of Deathwing"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Warlord Zon'ozz"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Yor'sahj the Unsleeping"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ultraxion"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Warmaster Blackhorn"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Madness of Deathwing"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["巨龙之魂"] = { isRaid = true, instanceId = 967, encounterIds = {
    ["Morchok"] = 311,
    ["Hagara the Stormbinder"] = 317,
    ["Spine of Deathwing"] = 318,
    ["Warlord Zon'ozz"] = 324,
    ["Yor'sahj the Unsleeping"] = 325,
    ["Ultraxion"] = 331,
    ["Warmaster Blackhorn"] = 332,
    ["Madness of Deathwing"] = 333,
} }

-- ===================== 火焰之地 (instanceId 720) =====================
addon.GuideData.raids["4.0"]["火焰之地"] = {
    ["Beth'tilac"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lord Rhyolith"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Alysrazor"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Shannox"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Baleroc"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Majordomo Staghelm"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ragnaros"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["火焰之地"] = { isRaid = true, instanceId = 720, encounterIds = {
    ["Beth'tilac"] = 192,
    ["Lord Rhyolith"] = 193,
    ["Alysrazor"] = 194,
    ["Shannox"] = 195,
    ["Baleroc"] = 196,
    ["Majordomo Staghelm"] = 197,
    ["Ragnaros"] = 198,
} }

-- ===================== 风神王座 (instanceId 754) =====================
addon.GuideData.raids["4.0"]["风神王座"] = {
    ["Conclave of Wind"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Al'Akir"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["风神王座"] = { isRaid = true, instanceId = 754, encounterIds = {
    ["Conclave of Wind"] = 154,
    ["Al'Akir"] = 155,
} }

