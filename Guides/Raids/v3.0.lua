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
    ["玛洛加尔领主"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["亡语者女士"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["冰冠冰川炮舰战"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["死亡使者萨鲁法尔"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["烂肠"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["腐面"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["普崔塞德教授"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["鲜血王子议会"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["鲜血女王兰娜瑟尔"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["踏梦者瓦莉瑟瑞娅"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["辛达苟萨"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["巫妖王"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["冰冠堡垒"] = { isRaid = true, instanceId = 631, encounterIds = {
    ["玛洛加尔领主"] = 1624,
    ["亡语者女士"] = 1625,
    ["冰冠冰川炮舰战"] = 1626,
    ["死亡使者萨鲁法尔"] = 1628,
    ["烂肠"] = 1629,
    ["腐面"] = 1630,
    ["普崔塞德教授"] = 1631,
    ["鲜血王子议会"] = 1632,
    ["鲜血女王兰娜瑟尔"] = 1633,
    ["踏梦者瓦莉瑟瑞娅"] = 1634,
    ["辛达苟萨"] = 1635,
    ["巫妖王"] = 1636,
} }

-- ===================== 十字军的试炼 (instanceId 649) =====================
addon.GuideData.raids["3.0"]["十字军的试炼"] = {
    ["诺森德猛兽"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["加拉克苏斯大王"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["部落的冠军"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["瓦格里双子"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["阿努巴拉克"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["十字军的试炼"] = { isRaid = true, instanceId = 649, encounterIds = {
    ["诺森德猛兽"] = 1618,
    ["加拉克苏斯大王"] = 1619,
    ["部落的冠军"] = 1621,
    ["瓦格里双子"] = 1622,
    ["阿努巴拉克"] = 1623,
} }

-- ===================== 纳克萨玛斯 (instanceId 533) =====================
addon.GuideData.raids["3.0"]["纳克萨玛斯"] = {
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

-- ===================== 红玉圣殿 (instanceId 724) =====================
addon.GuideData.raids["3.0"]["红玉圣殿"] = {
    ["海里昂"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["红玉圣殿"] = { isRaid = true, instanceId = 724, encounterIds = {
    ["海里昂"] = 1652,
} }

-- ===================== 奥杜尔 (instanceId 603) =====================
addon.GuideData.raids["3.0"]["奥杜尔"] = {
    ["烈焰巨兽"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["掌炉者伊格尼斯"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["锋鳞"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["XT-002拆解者"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["钢铁议会"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["科隆加恩"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["欧尔莉亚"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["霍迪尔"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["托里姆"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["弗蕾亚"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["米米尔隆"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["维扎克斯将军"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["尤格-萨隆"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["观察者奥尔加隆"] = { order = 14, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["奥杜尔"] = { isRaid = true, instanceId = 603, encounterIds = {
    ["烈焰巨兽"] = 1637,
    ["掌炉者伊格尼斯"] = 1638,
    ["锋鳞"] = 1639,
    ["XT-002拆解者"] = 1640,
    ["钢铁议会"] = 1641,
    ["科隆加恩"] = 1642,
    ["欧尔莉亚"] = 1643,
    ["霍迪尔"] = 1644,
    ["托里姆"] = 1645,
    ["弗蕾亚"] = 1646,
    ["米米尔隆"] = 1647,
    ["维扎克斯将军"] = 1648,
    ["尤格-萨隆"] = 1649,
    ["观察者奥尔加隆"] = 1650,
} }

