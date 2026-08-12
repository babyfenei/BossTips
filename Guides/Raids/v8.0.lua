-- ============================================================================
-- BossTips Raid Guide Data —— 版本 8.0 团本骨架（自动生成，攻略正文待补）
-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。
--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["8.0"] = addon.GuideData.raids["8.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 达萨罗之战 (instanceId 2070) =====================
addon.GuideData.raids["8.0"]["达萨罗之战"] = {
    ["Jadefire Masters Alliance"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Grong Horde"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Conclave of the Chosen"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Champion of the Light Horde"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["High Tinker Mekkatorque"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["King Rastakhan"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Stormwall Blockade"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Grong Alliance"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Jadefire Masters Horde"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Opulence"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lady Jaina Proudmoore"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Champion of the Light Alliance"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["达萨罗之战"] = { isRaid = true, instanceId = 2070, encounterIds = {
    ["Jadefire Masters Alliance"] = 2323,
    ["Grong Horde"] = 2325,
    ["Conclave of the Chosen"] = 2330,
    ["Champion of the Light Horde"] = 2333,
    ["High Tinker Mekkatorque"] = 2334,
    ["King Rastakhan"] = 2335,
    ["Stormwall Blockade"] = 2337,
    ["Grong Alliance"] = 2340,
    ["Jadefire Masters Horde"] = 2341,
    ["Opulence"] = 2342,
    ["Lady Jaina Proudmoore"] = 2343,
    ["Champion of the Light Alliance"] = 2344,
} }

-- ===================== 风暴熔炉 (instanceId 2096) =====================
addon.GuideData.raids["8.0"]["风暴熔炉"] = {
    ["The Restless Cabal"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Uu'nat, Harbinger of the Void"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["风暴熔炉"] = { isRaid = true, instanceId = 2096, encounterIds = {
    ["The Restless Cabal"] = 2328,
    ["Uu'nat, Harbinger of the Void"] = 2332,
} }

-- ===================== 永恒王宫 (instanceId 2164) =====================
addon.GuideData.raids["8.0"]["永恒王宫"] = {
    ["Blackwater Behemoth"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Za'qul, Herald of Ny'alotha"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Orgozoa"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Abyssal Commander Sivara"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Radiance of Azshara"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Lady Ashvane"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Queen's Court"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Queen Azshara"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["永恒王宫"] = { isRaid = true, instanceId = 2164, encounterIds = {
    ["Blackwater Behemoth"] = 2347,
    ["Za'qul, Herald of Ny'alotha"] = 2349,
    ["Orgozoa"] = 2351,
    ["Abyssal Commander Sivara"] = 2352,
    ["Radiance of Azshara"] = 2353,
    ["Lady Ashvane"] = 2354,
    ["The Queen's Court"] = 2359,
    ["Queen Azshara"] = 2361,
} }

-- ===================== 尼奥罗萨，觉醒之城 (instanceId 2217) =====================
addon.GuideData.raids["8.0"]["尼奥罗萨，觉醒之城"] = {
    ["Ra-den the Despoiled"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Maut"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Carapace of N'Zoth"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Shad'har the Insatiable"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Wrathion"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Prophet Skitra"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Vexiona"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["The Hivemind"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Drest'agath"] = { order = 9, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Il'gynoth, Corruption Reborn"] = { order = 10, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["N'Zoth, the Corruptor"] = { order = 11, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Dark Inquisitor Xanesh"] = { order = 12, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["尼奥罗萨，觉醒之城"] = { isRaid = true, instanceId = 2217, encounterIds = {
    ["Ra-den the Despoiled"] = 2364,
    ["Maut"] = 2365,
    ["Carapace of N'Zoth"] = 2366,
    ["Shad'har the Insatiable"] = 2367,
    ["Wrathion"] = 2368,
    ["The Prophet Skitra"] = 2369,
    ["Vexiona"] = 2370,
    ["The Hivemind"] = 2372,
    ["Drest'agath"] = 2373,
    ["Il'gynoth, Corruption Reborn"] = 2374,
    ["N'Zoth, the Corruptor"] = 2375,
    ["Dark Inquisitor Xanesh"] = 2377,
} }

-- ===================== 奥迪尔 (instanceId 1861) =====================
addon.GuideData.raids["8.0"]["奥迪尔"] = {
    ["Fetid Devourer"] = { order = 1, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["G'huun"] = { order = 2, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Vectis"] = { order = 3, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["MOTHER"] = { order = 4, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Taloc"] = { order = 5, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Zek'voz, Herald of N'zoth"] = { order = 6, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Mythrax the Unraveler"] = { order = 7, type = "BOSS", tips = "", tipsByDifficulty = {} },
    ["Zul"] = { order = 8, type = "BOSS", tips = "", tipsByDifficulty = {} },
}
addon.GuideData.meta["奥迪尔"] = { isRaid = true, instanceId = 1861, encounterIds = {
    ["Fetid Devourer"] = 2146,
    ["G'huun"] = 2147,
    ["Vectis"] = 2166,
    ["MOTHER"] = 2167,
    ["Taloc"] = 2168,
    ["Zek'voz, Herald of N'zoth"] = 2169,
    ["Mythrax the Unraveler"] = 2194,
    ["Zul"] = 2195,
} }

