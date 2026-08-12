-- ============================================================================
-- BossTips BigWigsIdDB.lua —— 从本地 BigWigs 插件提取的副本ID/首领战ID对照表
-- 生成时间：2026-08-13
-- 格式：addon.BigWigsIdDB[instanceId] = { [英文首领名] = encounterId, ... }
-- 负数 instanceId 表示世界首领（对应 mapId 取反）
-- ============================================================================
local _, addon = ...
addon.BigWigsIdDB = {
    [1592] = {
        ["Rotmire"] = 2711,
    },
    [1712] = {
        ["Argus the Unmaker"] = 2031,
    },
    [2912] = {
        ["Crown of the Cosmos"] = 2738,
        ["Fallen-King Salhadaar"] = 2736,
        ["Imperator Averzian"] = 2733,
        ["Lightblinded Vanguard"] = 2737,
        ["Vaelgor & Ezzorak"] = 2735,
        ["Vorasius"] = 2734,
    },
    [2913] = {
        ["Belo'ren, Child of Al'ar"] = 2739,
        ["Midnight Falls"] = 2740,
    },
    [2939] = {
        ["Chimaerus the Undreamt God"] = 2795,
    },
    [3004] = {
        ["Entombed Sentinels"] = 2874,
        ["Nek'zali the Soulcoiler"] = 2888,
        ["Sszorak"] = 2871,
        ["The Bargained Crown"] = 2883,
        ["The Lost Explorers"] = 2894,
        ["The Twin Fangs"] = 2887,
        ["Ula'tek"] = 2895,
        ["Vashnik the Malignant"] = 2882,
    },
    [-2395] = {
        ["Lu'ashal"] = 2827,
    },
    [-2413] = {
        ["Thorm'belan"] = 2829,
    },
    [-2437] = {
        ["Cragpine"] = 2782,
    },
}
