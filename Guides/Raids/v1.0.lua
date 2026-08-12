-- ============================================================================
-- BossTips Raid Guide Data —— 版本 1.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["1.0"] = addon.GuideData.raids["1.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 安其拉废墟 (instanceId 509) =====================
addon.GuideData.raids["1.0"]["安其拉废墟"] = {
    ["Kurinnaxx"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["General Rajaxx"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Moam"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Buru the Gorger"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ayamiss the Hunter"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ossirian the Unscarred"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["安其拉废墟"] = { isRaid = true, instanceId = 509, encounterIds = {
    ["Kurinnaxx"] = 1537,
    ["General Rajaxx"] = 1538,
    ["Moam"] = 1539,
    ["Buru the Gorger"] = 1540,
    ["Ayamiss the Hunter"] = 1541,
    ["Ossirian the Unscarred"] = 1542,
} }

-- ===================== 安其拉神殿 (instanceId 531) =====================
addon.GuideData.raids["1.0"]["安其拉神殿"] = {
    ["The Prophet Skeram"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Battleguard Sartura"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Fankriss the Unyielding"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Princess Huhuran"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Silithid Royalty"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Viscidus"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Twin Emperors"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ouro"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["C'Thun"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["安其拉神殿"] = { isRaid = true, instanceId = 531, encounterIds = {
    ["The Prophet Skeram"] = 1543,
    ["Battleguard Sartura"] = 1544,
    ["Fankriss the Unyielding"] = 1545,
    ["Princess Huhuran"] = 1546,
    ["Silithid Royalty"] = 1547,
    ["Viscidus"] = 1548,
    ["The Twin Emperors"] = 1549,
    ["Ouro"] = 1550,
    ["C'Thun"] = 1551,
} }

-- ===================== 黑翼之巢 (instanceId 469) =====================
addon.GuideData.raids["1.0"]["黑翼之巢"] = {
    ["Razorgore the Untamed"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Vaelastrasz the Corrupt"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Broodlord Lashlayer"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Firemaw"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ebonroc"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Flamegor"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Chromaggus"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Nefarian Classic"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["黑翼之巢"] = { isRaid = true, instanceId = 469, encounterIds = {
    ["Razorgore the Untamed"] = 1529,
    ["Vaelastrasz the Corrupt"] = 1530,
    ["Broodlord Lashlayer"] = 1531,
    ["Firemaw"] = 1532,
    ["Ebonroc"] = 1533,
    ["Flamegor"] = 1534,
    ["Chromaggus"] = 1535,
    ["Nefarian Classic"] = 1536,
} }

-- ===================== 熔火之心 (instanceId 409) =====================
addon.GuideData.raids["1.0"]["熔火之心"] = {
    ["Lucifron"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Magmadar"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gehennas"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Garr"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Shazzrah"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Baron Geddon"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sulfuron Harbinger"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Golemagg the Incinerator"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Majordomo Executus"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ragnaros Classic"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Molten Core"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["熔火之心"] = { isRaid = true, instanceId = 409, encounterIds = {
    ["Lucifron"] = 1519,
    ["Magmadar"] = 1520,
    ["Gehennas"] = 1521,
    ["Garr"] = 1522,
    ["Shazzrah"] = 1523,
    ["Baron Geddon"] = 1524,
    ["Sulfuron Harbinger"] = 1525,
    ["Golemagg the Incinerator"] = 1526,
    ["Majordomo Executus"] = 1527,
    ["Ragnaros Classic"] = 1528,
    ["The Molten Core"] = 3018,
} }

-- ===================== 纳克萨玛斯 (instanceId 533) =====================
addon.GuideData.raids["1.0"]["纳克萨玛斯"] = {
    ["Anub'Rekhan"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Grand Widow Faerlina"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Maexxna"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Noth the Plaguebringer"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Heigan the Unclean"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Loatheb"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Instructor Razuvious"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gothik the Harvester"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Four Horsemen"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Patchwerk"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Grobbulus"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gluth"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Thaddius"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sapphiron"] = { order = 14, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kel'Thuzad"] = { order = 15, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["纳克萨玛斯"] = { isRaid = true, instanceId = 533, encounterIds = {
    ["Anub'Rekhan"] = 1601,
    ["Grand Widow Faerlina"] = 1602,
    ["Maexxna"] = 1603,
    ["Noth the Plaguebringer"] = 1604,
    ["Heigan the Unclean"] = 1605,
    ["Loatheb"] = 1606,
    ["Instructor Razuvious"] = 1607,
    ["Gothik the Harvester"] = 1608,
    ["The Four Horsemen"] = 1609,
    ["Patchwerk"] = 1610,
    ["Grobbulus"] = 1611,
    ["Gluth"] = 1612,
    ["Thaddius"] = 1613,
    ["Sapphiron"] = 1614,
    ["Kel'Thuzad"] = 1615,
} }

-- ===================== 奥妮克希亚的巢穴 (instanceId 249) =====================
addon.GuideData.raids["1.0"]["奥妮克希亚的巢穴"] = {
    ["Onyxia"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["奥妮克希亚的巢穴"] = { isRaid = true, instanceId = 249, encounterIds = {
    ["Onyxia"] = 1651,
} }

-- ===================== 祖尔格拉布 (instanceId 309) =====================
addon.GuideData.raids["1.0"]["祖尔格拉布"] = {
    ["High Priest Venoxis"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["High Priestess Jeklik"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["High Priestess Mar'li"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Bloodlord Mandokir"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Edge of Madness"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["High Priest Thekal"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gahz'ranka"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["High Priestess Arlokk"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Jin'do the Hexxer"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hakkar"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["祖尔格拉布"] = { isRaid = true, instanceId = 309, encounterIds = {
    ["High Priest Venoxis"] = 784,
    ["High Priestess Jeklik"] = 785,
    ["High Priestess Mar'li"] = 786,
    ["Bloodlord Mandokir"] = 787,
    ["Edge of Madness"] = 788,
    ["High Priest Thekal"] = 789,
    ["Gahz'ranka"] = 790,
    ["High Priestess Arlokk"] = 791,
    ["Jin'do the Hexxer"] = 792,
    ["Hakkar"] = 793,
} }

