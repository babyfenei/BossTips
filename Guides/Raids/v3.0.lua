-- ============================================================================
-- BossTips Raid Guide Data —— 版本 3.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["3.0"] = addon.GuideData.raids["3.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 冰冠堡垒 (instanceId 631) =====================
addon.GuideData.raids["3.0"]["冰冠堡垒"] = {
    ["Lord Marrowgar"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lady Deathwhisper"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Icecrown Gunship Battle"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Deathbringer Saurfang"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Festergut"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Rotface"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Professor Putricide"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Blood Prince Council"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Blood-Queen Lana'thel"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Valithria Dreamwalker"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Sindragosa"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Lich King"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["冰冠堡垒"] = { isRaid = true, instanceId = 631, encounterIds = {
    ["Lord Marrowgar"] = 1624,
    ["Lady Deathwhisper"] = 1625,
    ["Icecrown Gunship Battle"] = 1626,
    ["Deathbringer Saurfang"] = 1628,
    ["Festergut"] = 1629,
    ["Rotface"] = 1630,
    ["Professor Putricide"] = 1631,
    ["Blood Prince Council"] = 1632,
    ["Blood-Queen Lana'thel"] = 1633,
    ["Valithria Dreamwalker"] = 1634,
    ["Sindragosa"] = 1635,
    ["The Lich King"] = 1636,
} }

-- ===================== 十字军的试炼 (instanceId 649) =====================
addon.GuideData.raids["3.0"]["十字军的试炼"] = {
    ["The Beasts of Northrend"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lord Jaraxxus"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Faction Champions"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Twin Val'kyr"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Anub'arak"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["十字军的试炼"] = { isRaid = true, instanceId = 649, encounterIds = {
    ["The Beasts of Northrend"] = 1618,
    ["Lord Jaraxxus"] = 1619,
    ["Faction Champions"] = 1621,
    ["The Twin Val'kyr"] = 1622,
    ["Anub'arak"] = 1623,
} }

-- ===================== 纳克萨玛斯 (instanceId 533) =====================
addon.GuideData.raids["3.0"]["纳克萨玛斯"] = {
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
    ["Kel'Thuzad Naxxramas"] = { order = 15, type = "BOSS", tips = "", tipsByDifficulty = {} },
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
    ["Kel'Thuzad Naxxramas"] = 1615,
} }

-- ===================== 红玉圣殿 (instanceId 724) =====================
addon.GuideData.raids["3.0"]["红玉圣殿"] = {
    ["Halion"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["红玉圣殿"] = { isRaid = true, instanceId = 724, encounterIds = {
    ["Halion"] = 1652,
} }

-- ===================== 奥杜尔 (instanceId 603) =====================
addon.GuideData.raids["3.0"]["奥杜尔"] = {
    ["Flame Leviathan"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ignis the Furnace Master"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Razorscale"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["XT-002 Deconstructor"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Iron Council"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kologarn"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Auriaya"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hodir"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Thorim"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Freya"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Mimiron"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["General Vezax"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Yogg-Saron"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Algalon the Observer"] = { order = 14, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["奥杜尔"] = { isRaid = true, instanceId = 603, encounterIds = {
    ["Flame Leviathan"] = 1637,
    ["Ignis the Furnace Master"] = 1638,
    ["Razorscale"] = 1639,
    ["XT-002 Deconstructor"] = 1640,
    ["The Iron Council"] = 1641,
    ["Kologarn"] = 1642,
    ["Auriaya"] = 1643,
    ["Hodir"] = 1644,
    ["Thorim"] = 1645,
    ["Freya"] = 1646,
    ["Mimiron"] = 1647,
    ["General Vezax"] = 1648,
    ["Yogg-Saron"] = 1649,
    ["Algalon the Observer"] = 1650,
} }

