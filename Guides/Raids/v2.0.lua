-- ============================================================================
-- BossTips Raid Guide Data —— 版本 2.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["2.0"] = addon.GuideData.raids["2.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 黑暗神殿 (instanceId 564) =====================
addon.GuideData.raids["2.0"]["黑暗神殿"] = {
    ["High Warlord Naj'entus"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Supremus"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Shade of Akama"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Teron Gorefiend"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gurtogg Bloodboil"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Reliquary of Souls"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Mother Shahraz"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Illidari Council"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Illidan Stormrage"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["黑暗神殿"] = { isRaid = true, instanceId = 564, encounterIds = {
    ["High Warlord Naj'entus"] = 1582,
    ["Supremus"] = 1583,
    ["Shade of Akama"] = 1584,
    ["Teron Gorefiend"] = 1585,
    ["Gurtogg Bloodboil"] = 1586,
    ["Reliquary of Souls"] = 1587,
    ["Mother Shahraz"] = 1588,
    ["The Illidari Council"] = 1589,
    ["Illidan Stormrage"] = 1590,
} }

-- ===================== 海加尔山之战 (instanceId 534) =====================
addon.GuideData.raids["2.0"]["海加尔山之战"] = {
    ["Rage Winterchill"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Anetheron"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kaz'rogal"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Azgalor"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["ArchimondeHyjal"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["海加尔山之战"] = { isRaid = true, instanceId = 534, encounterIds = {
    ["Rage Winterchill"] = 1577,
    ["Anetheron"] = 1578,
    ["Kaz'rogal"] = 1579,
    ["Azgalor"] = 1580,
    ["ArchimondeHyjal"] = 1581,
} }

-- ===================== 卡拉赞 (instanceId 532) =====================
addon.GuideData.raids["2.0"]["卡拉赞"] = {
    ["Nightbane Raid"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Romulo & Julianne"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Big Bad Wolf"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Crone"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hyakiss the Lurker"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Attumen the Huntsman Raid"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Moroes Raid"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Maiden of Virtue Raid"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Curator Raid"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Shade of Aran"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Terestian Illhoof"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Netherspite"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Prince Malchezaar"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["卡拉赞"] = { isRaid = true, instanceId = 532, encounterIds = {
    ["Nightbane Raid"] = -662,
    ["Romulo & Julianne"] = -655,
    ["The Big Bad Wolf"] = -655,
    ["The Crone"] = -655,
    ["Hyakiss the Lurker"] = 1552,
    ["Attumen the Huntsman Raid"] = 1553,
    ["Moroes Raid"] = 1554,
    ["Maiden of Virtue Raid"] = 1555,
    ["The Curator Raid"] = 1557,
    ["Shade of Aran"] = 1559,
    ["Terestian Illhoof"] = 1560,
    ["Netherspite"] = 1561,
    ["Prince Malchezaar"] = 1563,
} }

-- ===================== 毒蛇神殿 (instanceId 548) =====================
addon.GuideData.raids["2.0"]["毒蛇神殿"] = {
    ["Hydross the Unstable"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Lurker Below"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Leotheras the Blind"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Fathom-Lord Karathress"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Morogrim Tidewalker"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lady Vashj"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["毒蛇神殿"] = { isRaid = true, instanceId = 548, encounterIds = {
    ["Hydross the Unstable"] = 1567,
    ["The Lurker Below"] = 1568,
    ["Leotheras the Blind"] = 1569,
    ["Fathom-Lord Karathress"] = 1570,
    ["Morogrim Tidewalker"] = 1571,
    ["Lady Vashj"] = 1572,
} }

-- ===================== 太阳之井高地 (instanceId 580) =====================
addon.GuideData.raids["2.0"]["太阳之井高地"] = {
    ["Kalecgos"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Brutallus"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Felmyst"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Eredar Twins"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["M'uru"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kil'jaeden"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["太阳之井高地"] = { isRaid = true, instanceId = 580, encounterIds = {
    ["Kalecgos"] = 1591,
    ["Brutallus"] = 1592,
    ["Felmyst"] = 1593,
    ["The Eredar Twins"] = 1594,
    ["M'uru"] = 1595,
    ["Kil'jaeden"] = 1596,
} }

-- ===================== 风暴要塞 (instanceId 550) =====================
addon.GuideData.raids["2.0"]["风暴要塞"] = {
    ["Al'ar"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Void Reaver"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["High Astromancer Solarian"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kael'thas Sunstrider"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["风暴要塞"] = { isRaid = true, instanceId = 550, encounterIds = {
    ["Al'ar"] = 1573,
    ["Void Reaver"] = 1574,
    ["High Astromancer Solarian"] = 1575,
    ["Kael'thas Sunstrider"] = 1576,
} }

-- ===================== 祖阿曼 (instanceId 568) =====================
addon.GuideData.raids["2.0"]["祖阿曼"] = {
    ["Akil'zon"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Nalorakk"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Jan'alai"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Halazzi"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hex Lord Malacrass"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Zul'jin"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["祖阿曼"] = { isRaid = true, instanceId = 568, encounterIds = {
    ["Akil'zon"] = 186,
    ["Nalorakk"] = 187,
    ["Jan'alai"] = 188,
    ["Halazzi"] = 189,
    ["Hex Lord Malacrass"] = 190,
    ["Zul'jin"] = 191,
} }

