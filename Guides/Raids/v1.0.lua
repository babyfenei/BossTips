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
    ["库林纳克斯"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["拉贾克斯将军"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["莫阿姆"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["吞咽者布鲁"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["狩猎者阿亚米斯"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["无疤者奥斯里安"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["安其拉废墟"] = { isRaid = true, instanceId = 509, encounterIds = {
    ["库林纳克斯"] = 1537,
    ["拉贾克斯将军"] = 1538,
    ["莫阿姆"] = 1539,
    ["吞咽者布鲁"] = 1540,
    ["狩猎者阿亚米斯"] = 1541,
    ["无疤者奥斯里安"] = 1542,
} }

-- ===================== 安其拉神殿 (instanceId 531) =====================
addon.GuideData.raids["1.0"]["安其拉神殿"] = {
    ["预言者斯克拉姆"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["沙尔图拉"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["顽强的范克瑞斯"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["哈霍兰公主"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["安其拉三宝"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["维希度斯"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["双子皇帝"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["奥罗"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["克苏恩"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["安其拉神殿"] = { isRaid = true, instanceId = 531, encounterIds = {
    ["预言者斯克拉姆"] = 1543,
    ["沙尔图拉"] = 1544,
    ["顽强的范克瑞斯"] = 1545,
    ["哈霍兰公主"] = 1546,
    ["安其拉三宝"] = 1547,
    ["维希度斯"] = 1548,
    ["双子皇帝"] = 1549,
    ["奥罗"] = 1550,
    ["克苏恩"] = 1551,
} }

-- ===================== 黑翼之巢 (instanceId 469) =====================
addon.GuideData.raids["1.0"]["黑翼之巢"] = {
    ["狂野的拉佐格尔"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["堕落的瓦拉斯塔兹"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["勒什雷尔"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["费尔默"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["埃博诺克"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["弗莱格尔"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["克洛玛古斯"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["奈法利安"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["黑翼之巢"] = { isRaid = true, instanceId = 469, encounterIds = {
    ["狂野的拉佐格尔"] = 1529,
    ["堕落的瓦拉斯塔兹"] = 1530,
    ["勒什雷尔"] = 1531,
    ["费尔默"] = 1532,
    ["埃博诺克"] = 1533,
    ["弗莱格尔"] = 1534,
    ["克洛玛古斯"] = 1535,
    ["奈法利安"] = 1536,
} }

-- ===================== 熔火之心 (instanceId 409) =====================
addon.GuideData.raids["1.0"]["熔火之心"] = {
    ["鲁西弗隆"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["玛格曼达"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["基赫纳斯"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["加尔"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["沙斯拉尔"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["迦顿男爵"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["萨弗隆先驱者"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["焚化者古雷曼格"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["管理者埃克索图斯"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["拉格纳罗斯"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Molten Core"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["熔火之心"] = { isRaid = true, instanceId = 409, encounterIds = {
    ["鲁西弗隆"] = 1519,
    ["玛格曼达"] = 1520,
    ["基赫纳斯"] = 1521,
    ["加尔"] = 1522,
    ["沙斯拉尔"] = 1523,
    ["迦顿男爵"] = 1524,
    ["萨弗隆先驱者"] = 1525,
    ["焚化者古雷曼格"] = 1526,
    ["管理者埃克索图斯"] = 1527,
    ["拉格纳罗斯"] = 1528,
    ["The Molten Core"] = 3018,
} }

-- ===================== 纳克萨玛斯 (instanceId 533) =====================
addon.GuideData.raids["1.0"]["纳克萨玛斯"] = {
    ["阿努布雷坎"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["黑女巫法琳娜"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["迈克斯纳"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["药剂师诺斯"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["肮脏的希尔盖"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["洛欧塞布"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["教官拉苏维奥斯"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["收割者戈提克"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["天启四骑士"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["帕奇维克"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["格罗布鲁斯"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["格拉斯"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["塔迪乌斯"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["萨菲隆"] = { order = 14, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["克尔苏加德"] = { order = 15, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["纳克萨玛斯"] = { isRaid = true, instanceId = 533, encounterIds = {
    ["阿努布雷坎"] = 1601,
    ["黑女巫法琳娜"] = 1602,
    ["迈克斯纳"] = 1603,
    ["药剂师诺斯"] = 1604,
    ["肮脏的希尔盖"] = 1605,
    ["洛欧塞布"] = 1606,
    ["教官拉苏维奥斯"] = 1607,
    ["收割者戈提克"] = 1608,
    ["天启四骑士"] = 1609,
    ["帕奇维克"] = 1610,
    ["格罗布鲁斯"] = 1611,
    ["格拉斯"] = 1612,
    ["塔迪乌斯"] = 1613,
    ["萨菲隆"] = 1614,
    ["克尔苏加德"] = 1615,
} }

-- ===================== 奥妮克希亚的巢穴 (instanceId 249) =====================
addon.GuideData.raids["1.0"]["奥妮克希亚的巢穴"] = {
    ["奥妮克希亚"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["奥妮克希亚的巢穴"] = { isRaid = true, instanceId = 249, encounterIds = {
    ["奥妮克希亚"] = 1651,
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

