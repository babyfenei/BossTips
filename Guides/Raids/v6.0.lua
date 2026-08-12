-- ============================================================================
-- BossTips Raid Guide Data —— 版本 6.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["6.0"] = addon.GuideData.raids["6.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 黑石铸造厂 (instanceId 1205) =====================
addon.GuideData.raids["6.0"]["黑石铸造厂"] = {
    ["Blackhand"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Beastlord Darmac"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Flamebender Ka'graz"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Operator Thogar"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Blast Furnace"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hans'gar and Franzok"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Gruul"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kromog"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Oregorger"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Iron Maidens"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["黑石铸造厂"] = { isRaid = true, instanceId = 1205, encounterIds = {
    ["Blackhand"] = 959,
    ["Beastlord Darmac"] = 1122,
    ["Flamebender Ka'graz"] = 1123,
    ["Operator Thogar"] = 1147,
    ["The Blast Furnace"] = 1154,
    ["Hans'gar and Franzok"] = 1155,
    ["Gruul"] = 1161,
    ["Kromog"] = 1162,
    ["Oregorger"] = 1202,
    ["The Iron Maidens"] = 1203,
} }

-- ===================== 地狱火堡垒 (instanceId 1448) =====================
addon.GuideData.raids["6.0"]["地狱火堡垒"] = {
    ["Gorefiend"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Fel Lord Zakuun"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kormrok"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Tyrant Velhari"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Mannoroth"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kilrogg Deadeye"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Iron Reaver"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hellfire Assault"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Socrethar the Eternal"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Hellfire High Council"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Shadow-Lord Iskar"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Archimonde"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Xhul'horac"] = { order = 13, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["地狱火堡垒"] = { isRaid = true, instanceId = 1448, encounterIds = {
    ["Gorefiend"] = 1372,
    ["Fel Lord Zakuun"] = 1391,
    ["Kormrok"] = 1392,
    ["Tyrant Velhari"] = 1394,
    ["Mannoroth"] = 1395,
    ["Kilrogg Deadeye"] = 1396,
    ["Iron Reaver"] = 1425,
    ["Hellfire Assault"] = 1426,
    ["Socrethar the Eternal"] = 1427,
    ["Hellfire High Council"] = 1432,
    ["Shadow-Lord Iskar"] = 1433,
    ["Archimonde"] = 1438,
    ["Xhul'horac"] = 1447,
} }

-- ===================== 悬锤堡 (instanceId 1228) =====================
addon.GuideData.raids["6.0"]["悬锤堡"] = {
    ["The Butcher"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Kargath Bladefist"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Twin Ogron"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Ko'ragh"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Tectus"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Brackenspore"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Imperator Mar'gok"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["悬锤堡"] = { isRaid = true, instanceId = 1228, encounterIds = {
    ["The Butcher"] = 971,
    ["Kargath Bladefist"] = 1128,
    ["Twin Ogron"] = 1148,
    ["Ko'ragh"] = 1153,
    ["Tectus"] = 1195,
    ["Brackenspore"] = 1196,
    ["Imperator Mar'gok"] = 1197,
} }

