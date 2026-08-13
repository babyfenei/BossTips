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
    ["高阶督军纳因图斯"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["苏普雷姆斯"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["阿卡玛之影"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["塔隆·血魔"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["古尔图格·血沸"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["灵魂之匣"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["莎赫拉丝主母"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["伊利达雷议会"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["伊利丹·怒风"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["黑暗神殿"] = { isRaid = true, instanceId = 564, encounterIds = {
    ["高阶督军纳因图斯"] = 1582,
    ["苏普雷姆斯"] = 1583,
    ["阿卡玛之影"] = 1584,
    ["塔隆·血魔"] = 1585,
    ["古尔图格·血沸"] = 1586,
    ["灵魂之匣"] = 1587,
    ["莎赫拉丝主母"] = 1588,
    ["伊利达雷议会"] = 1589,
    ["伊利丹·怒风"] = 1590,
} }

-- ===================== 海加尔山之战 (instanceId 534) =====================
addon.GuideData.raids["2.0"]["海加尔山之战"] = {
    ["雷基·冬寒"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["安纳塞隆"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["卡兹洛加"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["阿兹加洛"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["阿克蒙德"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["海加尔山之战"] = { isRaid = true, instanceId = 534, encounterIds = {
    ["雷基·冬寒"] = 1577,
    ["安纳塞隆"] = 1578,
    ["卡兹洛加"] = 1579,
    ["阿兹加洛"] = 1580,
    ["阿克蒙德"] = 1581,
} }

-- ===================== 卡拉赞 (instanceId 532) =====================
addon.GuideData.raids["2.0"]["卡拉赞"] = {
    ["Nightbane Raid"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Romulo & Julianne"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Big Bad Wolf"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Crone"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["仆役宿舍"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["猎手阿图门"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["莫罗斯"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["贞节圣女"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["馆长"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["埃兰之影"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["特雷斯坦·邪蹄"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["虚空幽龙"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["玛克扎尔王子"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["卡拉赞"] = { isRaid = true, instanceId = 532, encounterIds = {
    ["Nightbane Raid"] = -662,
    ["Romulo & Julianne"] = -655,
    ["The Big Bad Wolf"] = -655,
    ["The Crone"] = -655,
    ["仆役宿舍"] = 1552,
    ["猎手阿图门"] = 1553,
    ["莫罗斯"] = 1554,
    ["贞节圣女"] = 1555,
    ["馆长"] = 1557,
    ["埃兰之影"] = 1559,
    ["特雷斯坦·邪蹄"] = 1560,
    ["虚空幽龙"] = 1561,
    ["玛克扎尔王子"] = 1563,
} }

-- ===================== 毒蛇神殿 (instanceId 548) =====================
addon.GuideData.raids["2.0"]["毒蛇神殿"] = {
    ["不稳定的海度斯"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["鱼斯拉"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["盲眼者莱欧瑟拉斯"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["深水领主卡拉瑟雷斯"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["莫洛格里·踏潮者"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["瓦丝琪"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["毒蛇神殿"] = { isRaid = true, instanceId = 548, encounterIds = {
    ["不稳定的海度斯"] = 1567,
    ["鱼斯拉"] = 1568,
    ["盲眼者莱欧瑟拉斯"] = 1569,
    ["深水领主卡拉瑟雷斯"] = 1570,
    ["莫洛格里·踏潮者"] = 1571,
    ["瓦丝琪"] = 1572,
} }

-- ===================== 太阳之井高地 (instanceId 580) =====================
addon.GuideData.raids["2.0"]["太阳之井高地"] = {
    ["卡雷苟斯"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["布鲁塔卢斯"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["菲米丝"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["艾瑞达双子"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["穆鲁"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["基尔加丹"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["太阳之井高地"] = { isRaid = true, instanceId = 580, encounterIds = {
    ["卡雷苟斯"] = 1591,
    ["布鲁塔卢斯"] = 1592,
    ["菲米丝"] = 1593,
    ["艾瑞达双子"] = 1594,
    ["穆鲁"] = 1595,
    ["基尔加丹"] = 1596,
} }

-- ===================== 风暴要塞 (instanceId 550) =====================
addon.GuideData.raids["2.0"]["风暴要塞"] = {
    ["奥"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["空灵机甲"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["大星术师索兰莉安"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["凯尔萨斯·逐日者"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["风暴要塞"] = { isRaid = true, instanceId = 550, encounterIds = {
    ["奥"] = 1573,
    ["空灵机甲"] = 1574,
    ["大星术师索兰莉安"] = 1575,
    ["凯尔萨斯·逐日者"] = 1576,
} }

-- ===================== 祖阿曼 (instanceId 568) =====================
addon.GuideData.raids["2.0"]["祖阿曼"] = {
    ["埃基尔松"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["纳洛拉克"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["加亚莱"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["哈尔拉兹"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["妖术领主玛拉卡斯"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["祖尔金"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["祖阿曼"] = { isRaid = true, instanceId = 568, encounterIds = {
    ["埃基尔松"] = 186,
    ["纳洛拉克"] = 187,
    ["加亚莱"] = 188,
    ["哈尔拉兹"] = 189,
    ["妖术领主玛拉卡斯"] = 190,
    ["祖尔金"] = 191,
} }

