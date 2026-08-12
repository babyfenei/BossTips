-- ============================================================================
-- BossTips Raid Guide Data —— 版本 11.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["11.0"] = addon.GuideData.raids["11.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 尼鲁巴宫殿 (instanceId 2657) =====================
addon.GuideData.raids["11.0"]["尼鲁巴宫殿"] = {
    ["Sikran"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["UlgraxtheDevourer"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["TheBloodboundHorror"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Rashanan"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["BloodtwisterOvinax"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["NexusPrincessKyveza"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["TheSilkenCourt"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["QueenAnsurek"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["尼鲁巴宫殿"] = { isRaid = true, instanceId = 2657, encounterIds = {
    ["Sikran"] = 2898,
    ["UlgraxtheDevourer"] = 2902,
    ["TheBloodboundHorror"] = 2917,
    ["Rashanan"] = 2918,
    ["BloodtwisterOvinax"] = 2919,
    ["NexusPrincessKyveza"] = 2920,
    ["TheSilkenCourt"] = 2921,
    ["QueenAnsurek"] = 2922,
} }

-- ===================== 玛纳符文熔炉 (instanceId 2810) =====================
addon.GuideData.raids["11.0"]["玛纳符文熔炉"] = {
    ["TheSoulHunters"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["PlexusSentinel"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["SoulbinderNaazindhri"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Loomithar"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["ForgeweaverAraz"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Fractillus"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["NexusKingSalhadaar"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["DimensiustheAllDevouring"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["玛纳符文熔炉"] = { isRaid = true, instanceId = 2810, encounterIds = {
    ["TheSoulHunters"] = 3122,
    ["PlexusSentinel"] = 3129,
    ["SoulbinderNaazindhri"] = 3130,
    ["Loomithar"] = 3131,
    ["ForgeweaverAraz"] = 3132,
    ["Fractillus"] = 3133,
    ["NexusKingSalhadaar"] = 3134,
    ["DimensiustheAllDevouring"] = 3135,
} }

-- ===================== 解放安德麦 (instanceId 2769) =====================
addon.GuideData.raids["11.0"]["解放安德麦"] = {
    ["Vexie"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["CauldronofCarnage"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["RikReverb"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["StixBunkjunker"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["SprocketmongerLockenstock"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["TheOneArmedBandit"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["MugZeeHeadsofSecurity"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["ChromeKingGallywix"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["解放安德麦"] = { isRaid = true, instanceId = 2769, encounterIds = {
    ["Vexie"] = 3009,
    ["CauldronofCarnage"] = 3010,
    ["RikReverb"] = 3011,
    ["StixBunkjunker"] = 3012,
    ["SprocketmongerLockenstock"] = 3013,
    ["TheOneArmedBandit"] = 3014,
    ["MugZeeHeadsofSecurity"] = 3015,
    ["ChromeKingGallywix"] = 3016,
} }

