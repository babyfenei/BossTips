-- ============================================================================
-- BossTips Raid Guide Data —— 版本 5.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["5.0"] = addon.GuideData.raids["5.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 永春台 (instanceId 996) =====================
addon.GuideData.raids["5.0"]["永春台"] = {
    ["Protectors of the Endless"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sha of Fear"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lei Shi"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Tsulong"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["永春台"] = { isRaid = true, instanceId = 996, encounterIds = {
    ["Protectors of the Endless"] = 683,
    ["Sha of Fear"] = 709,
    ["Lei Shi"] = 729,
    ["Tsulong"] = 742,
} }

-- ===================== 恐惧之心 (instanceId 1009) =====================
addon.GuideData.raids["5.0"]["恐惧之心"] = {
    ["Garalon"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Amber-Shaper Un'sok"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Wind Lord Mel'jarak"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Grand Empress Shek'zeer"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Blade Lord Ta'yak"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Imperial Vizier Zor'lok"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["恐惧之心"] = { isRaid = true, instanceId = 1009, encounterIds = {
    ["Garalon"] = 713,
    ["Amber-Shaper Un'sok"] = 737,
    ["Wind Lord Mel'jarak"] = 741,
    ["Grand Empress Shek'zeer"] = 743,
    ["Blade Lord Ta'yak"] = 744,
    ["Imperial Vizier Zor'lok"] = 745,
} }

-- ===================== 魔古山宝库 (instanceId 1008) =====================
addon.GuideData.raids["5.0"]["魔古山宝库"] = {
    ["Will of the Emperor"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Stone Guard"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gara'jal the Spiritbinder"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Spirit Kings"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Feng the Accursed"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Elegon"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["魔古山宝库"] = { isRaid = true, instanceId = 1008, encounterIds = {
    ["Will of the Emperor"] = 677,
    ["The Stone Guard"] = 679,
    ["Gara'jal the Spiritbinder"] = 682,
    ["The Spirit Kings"] = 687,
    ["Feng the Accursed"] = 689,
    ["Elegon"] = 726,
} }

-- ===================== 决战奥格瑞玛 (instanceId 1136) =====================
addon.GuideData.raids["5.0"]["决战奥格瑞玛"] = {
    ["Malkorok"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Fallen Protectors"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["General Nazgrim"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Thok the Bloodthirsty"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Immerseus"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Paragons of the Klaxxi"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kor'kron Dark Shaman"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Iron Juggernaut"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Siegecrafter Blackfuse"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Norushen"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sha of Pride"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Galakras"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Garrosh Hellscream"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Spoils of Pandaria"] = { order = 14, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["决战奥格瑞玛"] = { isRaid = true, instanceId = 1136, encounterIds = {
    ["Malkorok"] = 846,
    ["The Fallen Protectors"] = 849,
    ["General Nazgrim"] = 850,
    ["Thok the Bloodthirsty"] = 851,
    ["Immerseus"] = 852,
    ["Paragons of the Klaxxi"] = 853,
    ["Kor'kron Dark Shaman"] = 856,
    ["Iron Juggernaut"] = 864,
    ["Siegecrafter Blackfuse"] = 865,
    ["Norushen"] = 866,
    ["Sha of Pride"] = 867,
    ["Galakras"] = 868,
    ["Garrosh Hellscream"] = 869,
    ["Spoils of Pandaria"] = 870,
} }

-- ===================== 雷霆王座 (instanceId 1098) =====================
addon.GuideData.raids["5.0"]["雷霆王座"] = {
    ["Council of Elders"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Iron Qon"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Durumu the Forgotten"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Horridon"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Primordius"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Megaera"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Dark Animus"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Tortos"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Jin'rokh the Breaker"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ji-Kun"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Twin Consorts"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ra-den"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lei Shen"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["雷霆王座"] = { isRaid = true, instanceId = 1098, encounterIds = {
    ["Council of Elders"] = 816,
    ["Iron Qon"] = 817,
    ["Durumu the Forgotten"] = 818,
    ["Horridon"] = 819,
    ["Primordius"] = 820,
    ["Megaera"] = 821,
    ["Dark Animus"] = 824,
    ["Tortos"] = 825,
    ["Jin'rokh the Breaker"] = 827,
    ["Ji-Kun"] = 828,
    ["Twin Consorts"] = 829,
    ["Ra-den"] = 831,
    ["Lei Shen"] = 832,
} }

