-- ============================================================================
-- BossTips Raid Guide Data —— 版本 7.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["7.0"] = addon.GuideData.raids["7.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 安托鲁斯，燃烧王座 (instanceId 1712) =====================
addon.GuideData.raids["7.0"]["安托鲁斯，燃烧王座"] = {
    ["Varimathras"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Aggramar"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Portal Keeper Hasabel"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Coven of Shivarra"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Felhounds of Sargeras"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gorothi Worldbreaker"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Antoran High Command"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kin'garoth"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Imonar the Soulhunter"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Eonar the Life-Binder"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Argus the Unmaker"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["安托鲁斯，燃烧王座"] = { isRaid = true, instanceId = 1712, encounterIds = {
    ["Varimathras"] = 1983,
    ["Aggramar"] = 1984,
    ["Portal Keeper Hasabel"] = 1985,
    ["The Coven of Shivarra"] = 1986,
    ["Felhounds of Sargeras"] = 1987,
    ["Gorothi Worldbreaker"] = 1992,
    ["Antoran High Command"] = 1997,
    ["Kin'garoth"] = 2004,
    ["Imonar the Soulhunter"] = 2009,
    ["Eonar the Life-Binder"] = 2025,
    ["Argus the Unmaker"] = 2031,
} }

-- ===================== 暗夜要塞 (instanceId 1530) =====================
addon.GuideData.raids["7.0"]["暗夜要塞"] = {
    ["Skorpyron"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Krosus"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Chronomatic Anomaly"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Trilliax"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Star Augur Etraeus"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gul'dan"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Grand Magistrix Elisande"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Spellblade Aluriel"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["High Botanist Tel'arn"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Tichondrius"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["暗夜要塞"] = { isRaid = true, instanceId = 1530, encounterIds = {
    ["Skorpyron"] = 1706,
    ["Krosus"] = 1713,
    ["Chronomatic Anomaly"] = 1725,
    ["Trilliax"] = 1731,
    ["Star Augur Etraeus"] = 1732,
    ["Gul'dan"] = 1737,
    ["Grand Magistrix Elisande"] = 1743,
    ["Spellblade Aluriel"] = 1751,
    ["High Botanist Tel'arn"] = 1761,
    ["Tichondrius"] = 1762,
} }

-- ===================== 翡翠梦魇 (instanceId 1520) =====================
addon.GuideData.raids["7.0"]["翡翠梦魇"] = {
    ["Ursoc"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Nythendra"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Dragons of Nightmare"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Xavius"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Il'gynoth"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Elerethe Renferal"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Cenarius"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["翡翠梦魇"] = { isRaid = true, instanceId = 1520, encounterIds = {
    ["Ursoc"] = 1667,
    ["Nythendra"] = 1703,
    ["Dragons of Nightmare"] = 1704,
    ["Xavius"] = 1726,
    ["Il'gynoth"] = 1738,
    ["Elerethe Renferal"] = 1744,
    ["Cenarius"] = 1750,
} }

-- ===================== 萨格拉斯之墓 (instanceId 1676) =====================
addon.GuideData.raids["7.0"]["萨格拉斯之墓"] = {
    ["Harjatan the Bludger"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Mistress Sassz'ine"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Goroth"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Demonic Inquisition"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Fallen Avatar"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Desolate Host"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Maiden of Vigilance"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kil'jaeden"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sisters of the Moon"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["萨格拉斯之墓"] = { isRaid = true, instanceId = 1676, encounterIds = {
    ["Harjatan the Bludger"] = 1856,
    ["Mistress Sassz'ine"] = 1861,
    ["Goroth"] = 1862,
    ["Demonic Inquisition"] = 1867,
    ["Fallen Avatar"] = 1873,
    ["The Desolate Host"] = 1896,
    ["Maiden of Vigilance"] = 1897,
    ["Kil'jaeden"] = 1898,
    ["Sisters of the Moon"] = 1903,
} }

-- ===================== 勇气试炼 (instanceId 1648) =====================
addon.GuideData.raids["7.0"]["勇气试炼"] = {
    ["Odyn-TrialOfValor"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Helya-TrialOfValor"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Guarm-TrialOfValor"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["勇气试炼"] = { isRaid = true, instanceId = 1648, encounterIds = {
    ["Odyn-TrialOfValor"] = 1819,
    ["Helya-TrialOfValor"] = 1829,
    ["Guarm-TrialOfValor"] = 1830,
} }

