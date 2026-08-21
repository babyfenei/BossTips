-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["7.0"] = {
    ["勇气试炼"] = {
        name = "Trial of Valor",
        ["古尔姆"] = {
            type = "BOSS",
            name = "Guarm",
            tipsByDifficulty = {
                ["lfr"] = "Multi-form cycling: Guarm periodically swaps which two of its Frost/Fire/Shadow heads are active; players receive a matching elemental debuff and should stack with others of the same element to split the incoming damage. Breath: a frontal cone that must be faced away from the group. Enrage is on a timer. Must interrupt/burst: none — react to the active form. Tank: hold; DPS: burn down.",
                ["normal"] = "Multi-form cycling: Guarm periodically swaps which two of its Frost/Fire/Shadow heads are active; players receive a matching elemental debuff and should stack with others of the same element to split the incoming damage. Breath: a frontal cone that must be faced away from the group. Enrage is on a timer. Must interrupt/burst: none — react to the active form. Tank: hold; DPS: burn down.",
                ["heroic"] = "Multi-form cycling: Guarm periodically swaps which two of its Frost/Fire/Shadow heads are active; players receive a matching elemental debuff and should stack with others of the same element to split the incoming damage. Breath: a frontal cone that must be faced away from the group. Enrage is on a timer. Must interrupt/burst: none — react to the active form. Tank: hold; DPS: burn down.",
                ["mythic"] = "Multi-form cycling: Guarm periodically swaps which two of its Frost/Fire/Shadow heads are active; players receive a matching elemental debuff and should stack with others of the same element to split the incoming damage. Breath: a frontal cone that must be faced away from the group. Enrage is on a timer. Must interrupt/burst: none — react to the active form. Tank: hold; DPS: burn down.",
                ["mythicplus"] = "Multi-form cycling: Guarm periodically swaps which two of its Frost/Fire/Shadow heads are active; players receive a matching elemental debuff and should stack with others of the same element to split the incoming damage. Breath: a frontal cone that must be faced away from the group. Enrage is on a timer. Must interrupt/burst: none — react to the active form. Tank: hold; DPS: burn down.",
            },
        },
        ["奥丁"] = {
            type = "BOSS",
            name = "Odyn",
            tipsByDifficulty = {
                ["lfr"] = "[Hammer] mark needs dodge; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge hammer, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Hammer] mark needs dodge; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge hammer, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Hammer] mark needs dodge; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge hammer, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Hammer] mark needs dodge; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge hammer, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Hammer] mark needs dodge; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge hammer, quick kill{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["海拉"] = {
            type = "BOSS",
            name = "Helya",
            tipsByDifficulty = {
                ["lfr"] = "[Water] needs dodge; [Tentacle]; P2[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Water] needs dodge; [Tentacle]; P2[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Water] needs dodge; [Tentacle]; P2[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Water] needs dodge; [Tentacle]; P2[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Water] needs dodge; [Tentacle]; P2[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
    ["萨格拉斯之墓"] = {
        name = "Tomb of Sargeras",
        ["捶击者哈加坦"] = {
            type = "BOSS",
            name = "Harjatan",
            tipsByDifficulty = {
                ["lfr"] = "[Water] mark needs stand water reduce damage; [Hammer]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Water] mark needs stand water reduce damage; [Hammer]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Water] mark needs stand water reduce damage; [Hammer]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Water] mark needs stand water reduce damage; [Hammer]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Water] mark needs stand water reduce damage; [Hammer]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["戈罗斯"] = {
            type = "BOSS",
            name = "Goroth",
            tipsByDifficulty = {
                ["lfr"] = "[Meteor] needs dodge; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge meteor{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Meteor] needs dodge; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge meteor{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Meteor] needs dodge; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge meteor{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Meteor] needs dodge; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge meteor{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Meteor] needs dodge; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge meteor{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["基尔加丹"] = {
            type = "BOSS",
            name = "Kil'jaeden",
            tipsByDifficulty = {
                ["lfr"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["normal"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["heroic"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["mythic"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["mythicplus"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
            },
        },
        ["恶魔审判庭"] = {
            type = "BOSS",
            name = "Demonic Inquisition",
            tipsByDifficulty = {
                ["lfr"] = "[Sin] needs focus; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus sin{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Sin] needs focus; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus sin{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Sin] needs focus; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus sin{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Sin] needs focus; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus sin{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Sin] needs focus; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus sin{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["萨丝丝女士"] = {
            type = "BOSS",
            name = "Lady Sassz'ine",
            tipsByDifficulty = {
                ["lfr"] = "[Water] needs dodge; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Water] needs dodge; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Water] needs dodge; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Water] needs dodge; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Water] needs dodge; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge water, focus{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["守夜圣女"] = {
            type = "BOSS",
            name = "Grand Magistrix Elisande",
            tipsByDifficulty = {
                ["lfr"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["荒寂之主"] = {
            type = "BOSS",
            name = "The Desolate Host",
            tipsByDifficulty = {
                ["lfr"] = "[Spirit] needs enter spirit hit; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter spirit hit{rt1}||Tank: hold; DPS: enter portal",
                ["normal"] = "[Spirit] needs enter spirit hit; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter spirit hit{rt1}||Tank: hold; DPS: enter portal",
                ["heroic"] = "[Spirit] needs enter spirit hit; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter spirit hit{rt1}||Tank: hold; DPS: enter portal",
                ["mythic"] = "[Spirit] needs enter spirit hit; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter spirit hit{rt1}||Tank: hold; DPS: enter portal",
                ["mythicplus"] = "[Spirit] needs enter spirit hit; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter spirit hit{rt1}||Tank: hold; DPS: enter portal",
            },
        },
        ["月之姐妹"] = {
            type = "BOSS",
            name = "Sisters of the Moon",
            tipsByDifficulty = {
                ["lfr"] = "[Three Sisters] shared health split; [Moon] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Sisters] shared health split; [Moon] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Sisters] shared health split; [Moon] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Sisters] shared health split; [Moon] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Sisters] shared health split; [Moon] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["堕落化身"] = {
            type = "BOSS",
            name = "Fallen Avatar",
            tipsByDifficulty = {
                ["lfr"] = "[Light/Dark] needs corresponding positioning; [Tear]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Light/Dark] needs corresponding positioning; [Tear]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Light/Dark] needs corresponding positioning; [Tear]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Light/Dark] needs corresponding positioning; [Tear]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Light/Dark] needs corresponding positioning; [Tear]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
    ["安托鲁斯，燃烧王座"] = {
        name = "Antorus, the Burning Throne",
        ["希瓦尔拉议会"] = {
            type = "BOSS",
            name = "The Coven of Shivarra",
            tipsByDifficulty = {
                ["lfr"] = "[Three Sisters] shared health split; [Fire/Ice/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Sisters] shared health split; [Fire/Ice/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Sisters] shared health split; [Fire/Ice/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Sisters] shared health split; [Fire/Ice/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Sisters] shared health split; [Fire/Ice/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["金加罗斯"] = {
            type = "BOSS",
            name = "Kin'garoth",
            tipsByDifficulty = {
                ["lfr"] = "[Construct] needs interrupt; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt by construct; focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Construct] needs interrupt; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt by construct; focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Construct] needs interrupt; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt by construct; focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Construct] needs interrupt; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt by construct; focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Construct] needs interrupt; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt by construct; focus{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["阿格拉玛"] = {
            type = "BOSS",
            name = "Aggramar",
            tipsByDifficulty = {
                ["lfr"] = "[Sword] mark needs dodge; [Flame] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge sword, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Sword] mark needs dodge; [Flame] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge sword, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Sword] mark needs dodge; [Flame] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge sword, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Sword] mark needs dodge; [Flame] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge sword, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Sword] mark needs dodge; [Flame] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge sword, quick kill{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["生命缚誓者艾欧娜尔"] = {
            type = "BOSS",
            name = "Eonar the Life-Binder",
            tipsByDifficulty = {
                ["lfr"] = "[Shield] needs protect seed restore health; [Seed]; [Frenzy] timer||{rt1}Must interrupt/burst: none; protect seed restore health{rt1}||Tank: hold; DPS: protect seed",
                ["normal"] = "[Shield] needs protect seed restore health; [Seed]; [Frenzy] timer||{rt1}Must interrupt/burst: none; protect seed restore health{rt1}||Tank: hold; DPS: protect seed",
                ["heroic"] = "[Shield] needs protect seed restore health; [Seed]; [Frenzy] timer||{rt1}Must interrupt/burst: none; protect seed restore health{rt1}||Tank: hold; DPS: protect seed",
                ["mythic"] = "[Shield] needs protect seed restore health; [Seed]; [Frenzy] timer||{rt1}Must interrupt/burst: none; protect seed restore health{rt1}||Tank: hold; DPS: protect seed",
                ["mythicplus"] = "[Shield] needs protect seed restore health; [Seed]; [Frenzy] timer||{rt1}Must interrupt/burst: none; protect seed restore health{rt1}||Tank: hold; DPS: protect seed",
            },
        },
        ["寂灭者阿古斯"] = {
            type = "BOSS",
            name = "Argus the Unmaker",
            tipsByDifficulty = {
                ["lfr"] = "[Multiple] multi-mechanic rotate, [Ball]; [Void] raid-wide; P3[Obliteration]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Multiple] multi-mechanic rotate, [Ball]; [Void] raid-wide; P3[Obliteration]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Multiple] multi-mechanic rotate, [Ball]; [Void] raid-wide; P3[Obliteration]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Multiple] multi-mechanic rotate, [Ball]; [Void] raid-wide; P3[Obliteration]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Multiple] multi-mechanic rotate, [Ball]; [Void] raid-wide; P3[Obliteration]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["安托兰高阶指挥官"] = {
            type = "BOSS",
            name = "Antoran High Command",
            tipsByDifficulty = {
                ["lfr"] = "[Three Ships] need focus single; [Cannon]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single ship{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Ships] need focus single; [Cannon]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single ship{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Ships] need focus single; [Cannon]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single ship{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Ships] need focus single; [Cannon]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single ship{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Ships] need focus single; [Cannon]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single ship{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["瓦里玛萨斯"] = {
            type = "BOSS",
            name = "Varimathras",
            tipsByDifficulty = {
                ["lfr"] = "[Mirror] clone needs focus; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Mirror] clone needs focus; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Mirror] clone needs focus; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Mirror] clone needs focus; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Mirror] clone needs focus; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["传送门守护者哈西贝尔"] = {
            type = "BOSS",
            name = "Portal Keeper Hasabel",
            tipsByDifficulty = {
                ["lfr"] = "[Portal] needs enter portal hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus{rt1}||Tank: hold; DPS: enter portal",
                ["normal"] = "[Portal] needs enter portal hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus{rt1}||Tank: hold; DPS: enter portal",
                ["heroic"] = "[Portal] needs enter portal hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus{rt1}||Tank: hold; DPS: enter portal",
                ["mythic"] = "[Portal] needs enter portal hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus{rt1}||Tank: hold; DPS: enter portal",
                ["mythicplus"] = "[Portal] needs enter portal hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus{rt1}||Tank: hold; DPS: enter portal",
            },
        },
        ["猎魂者伊莫纳尔"] = {
            type = "BOSS",
            name = "Imonar the Soulhunter",
            tipsByDifficulty = {
                ["lfr"] = "[Bomb] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Bomb] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Bomb] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Bomb] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Bomb] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["戈罗提碎界者"] = {
            type = "BOSS",
            name = "Garothi Worldbreaker",
            tipsByDifficulty = {
                ["lfr"] = "[Cannon] needs hit cannon; [Landing]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge landing{rt1}||Tank: hold; DPS: operate cannon",
                ["normal"] = "[Cannon] needs hit cannon; [Landing]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge landing{rt1}||Tank: hold; DPS: operate cannon",
                ["heroic"] = "[Cannon] needs hit cannon; [Landing]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge landing{rt1}||Tank: hold; DPS: operate cannon",
                ["mythic"] = "[Cannon] needs hit cannon; [Landing]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge landing{rt1}||Tank: hold; DPS: operate cannon",
                ["mythicplus"] = "[Cannon] needs hit cannon; [Landing]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge landing{rt1}||Tank: hold; DPS: operate cannon",
            },
        },
        ["萨格拉斯的邪犬"] = {
            type = "BOSS",
            name = "The Felhounds of Sargeras",
            tipsByDifficulty = {
                ["lfr"] = "[Two Hounds] needs pull apart; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two hounds{rt1}||Tank: dual tank; DPS: focus",
                ["normal"] = "[Two Hounds] needs pull apart; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two hounds{rt1}||Tank: dual tank; DPS: focus",
                ["heroic"] = "[Two Hounds] needs pull apart; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two hounds{rt1}||Tank: dual tank; DPS: focus",
                ["mythic"] = "[Two Hounds] needs pull apart; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two hounds{rt1}||Tank: dual tank; DPS: focus",
                ["mythicplus"] = "[Two Hounds] needs pull apart; [Fire/Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two hounds{rt1}||Tank: dual tank; DPS: focus",
            },
        },
    },
    ["暗夜要塞"] = {
        name = "The Nighthold",
        ["克洛苏斯"] = {
            type = "BOSS",
            name = "Krosus",
            tipsByDifficulty = {
                ["lfr"] = "[Bridge] needs blow bridge; [Fire] landing; [Frenzy] timer||{rt1}Must interrupt/burst: none; blow bridge, dodge fire{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Bridge] needs blow bridge; [Fire] landing; [Frenzy] timer||{rt1}Must interrupt/burst: none; blow bridge, dodge fire{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Bridge] needs blow bridge; [Fire] landing; [Frenzy] timer||{rt1}Must interrupt/burst: none; blow bridge, dodge fire{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Bridge] needs blow bridge; [Fire] landing; [Frenzy] timer||{rt1}Must interrupt/burst: none; blow bridge, dodge fire{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Bridge] needs blow bridge; [Fire] landing; [Frenzy] timer||{rt1}Must interrupt/burst: none; blow bridge, dodge fire{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["崔里阿克丝"] = {
            type = "BOSS",
            name = "Trilliax",
            tipsByDifficulty = {
                ["lfr"] = "[Purify] needs eat corresponding food; [Three Form]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding food{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Purify] needs eat corresponding food; [Three Form]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding food{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Purify] needs eat corresponding food; [Three Form]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding food{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Purify] needs eat corresponding food; [Three Form]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding food{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Purify] needs eat corresponding food; [Three Form]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding food{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["时空畸体"] = {
            type = "BOSS",
            name = "Temporal Anomaly",
            tipsByDifficulty = {
                ["lfr"] = "[Time] needs eat [Fast/Slow] ball; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball maintain{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Time] needs eat [Fast/Slow] ball; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball maintain{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Time] needs eat [Fast/Slow] ball; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball maintain{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Time] needs eat [Fast/Slow] ball; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball maintain{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Time] needs eat [Fast/Slow] ball; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball maintain{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["咒剑士奥鲁瑞尔"] = {
            type = "BOSS",
            name = "Spellblade Aluriel",
            tipsByDifficulty = {
                ["lfr"] = "[Three Blades] needs corresponding positioning; [Frost] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by blade{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Three Blades] needs corresponding positioning; [Frost] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by blade{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Three Blades] needs corresponding positioning; [Frost] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by blade{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Three Blades] needs corresponding positioning; [Frost] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by blade{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Three Blades] needs corresponding positioning; [Frost] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by blade{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["斯考匹隆"] = {
            type = "BOSS",
            name = "Skorpyron",
            tipsByDifficulty = {
                ["lfr"] = "[Spike] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Spike] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Spike] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Spike] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Spike] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Spike] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Spike] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Spike] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Spike] mark needs away; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Spike] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["星界预言者埃特柔斯"] = {
            type = "BOSS",
            name = "Star Augur Etraeus",
            tipsByDifficulty = {
                ["lfr"] = "[Star] mark needs away; [Planet] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Star] mark needs away; [Planet] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Star] mark needs away; [Planet] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Star] mark needs away; [Planet] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Star] mark needs away; [Planet] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["大魔导师艾莉桑德"] = {
            type = "BOSS",
            name = "Grand Magistrix Elisande",
            tipsByDifficulty = {
                ["lfr"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Time] needs eat ball control speed; [Crystal]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat time ball{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["提克迪奥斯"] = {
            type = "BOSS",
            name = "Tichondrius",
            tipsByDifficulty = {
                ["lfr"] = "[Bat] needs dodge; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; dodge bat{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Bat] needs dodge; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; dodge bat{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Bat] needs dodge; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; dodge bat{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Bat] needs dodge; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; dodge bat{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Bat] needs dodge; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; dodge bat{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["古尔丹"] = {
            type = "BOSS",
            name = "Gul'dan",
            tipsByDifficulty = {
                ["lfr"] = "[Soul] mark needs rescue; [Chaos] dot; P3[Illidan] phase||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Soul] mark needs rescue; [Chaos] dot; P3[Illidan] phase||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Soul] mark needs rescue; [Chaos] dot; P3[Illidan] phase||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Soul] mark needs rescue; [Chaos] dot; P3[Illidan] phase||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Soul] mark needs rescue; [Chaos] dot; P3[Illidan] phase||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["高阶植物学家特尔安"] = {
            type = "BOSS",
            name = "High Botanist Tel'arn",
            tipsByDifficulty = {
                ["lfr"] = "[Three Plants] need focus single; [Poison]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Three Plants] need focus single; [Poison]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Three Plants] need focus single; [Poison]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Three Plants] need focus single; [Poison]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Three Plants] need focus single; [Poison]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: hold; DPS: focus",
            },
        },
    },
    ["翡翠梦魇"] = {
        name = "The Emerald Nightmare",
        ["伊格诺斯"] = {
            type = "BOSS",
            name = "Il'gynoth",
            tipsByDifficulty = {
                ["lfr"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["normal"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["heroic"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["mythic"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["mythicplus"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
            },
        },
        ["乌索克"] = {
            type = "BOSS",
            name = "Ursoc",
            tipsByDifficulty = {
                ["lfr"] = "[Charge] needs dodge; [Slam] tank; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge charge{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Charge] needs dodge; [Slam] tank; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge charge{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Charge] needs dodge; [Slam] tank; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge charge{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Charge] needs dodge; [Slam] tank; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge charge{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Charge] needs dodge; [Slam] tank; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge charge{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["萨维斯"] = {
            type = "BOSS",
            name = "Xavius",
            tipsByDifficulty = {
                ["lfr"] = "[Dream] mark needs rescue; [Corruption] dot; P3[Body]||{rt1}Must interrupt/burst: none; [Dream] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Dream] mark needs rescue; [Corruption] dot; P3[Body]||{rt1}Must interrupt/burst: none; [Dream] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Dream] mark needs rescue; [Corruption] dot; P3[Body]||{rt1}Must interrupt/burst: none; [Dream] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Dream] mark needs rescue; [Corruption] dot; P3[Body]||{rt1}Must interrupt/burst: none; [Dream] marked rescue{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Dream] mark needs rescue; [Corruption] dot; P3[Body]||{rt1}Must interrupt/burst: none; [Dream] marked rescue{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["艾勒瑞瑟·衰亡者"] = {
            type = "BOSS",
            name = "Elerethe Renferal",
            tipsByDifficulty = {
                ["lfr"] = "[Spider/Bird] dual form switch; [Web]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Spider/Bird] dual form switch; [Web]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Spider/Bird] dual form switch; [Web]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Spider/Bird] dual form switch; [Web]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Spider/Bird] dual form switch; [Web]; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["梦魇之龙"] = {
            type = "BOSS",
            name = "Dragons of Nightmare",
            tipsByDifficulty = {
                ["lfr"] = "[Four Dragons] need focus single; [Poison/Fire] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Four Dragons] need focus single; [Poison/Fire] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Four Dragons] need focus single; [Poison/Fire] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Four Dragons] need focus single; [Poison/Fire] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Four Dragons] need focus single; [Poison/Fire] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus single{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["尼珊德拉"] = {
            type = "BOSS",
            name = "Nythendra",
            tipsByDifficulty = {
                ["lfr"] = "[Bug] mark needs away; [Infestation] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Bug] mark needs away; [Infestation] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Bug] mark needs away; [Infestation] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Bug] mark needs away; [Infestation] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Bug] mark needs away; [Infestation] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["塞纳留斯"] = {
            type = "BOSS",
            name = "Cenarius",
            tipsByDifficulty = {
                ["lfr"] = "[Nightmare] needs clear; [Root] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear nightmare, dodge root{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Nightmare] needs clear; [Root] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear nightmare, dodge root{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Nightmare] needs clear; [Root] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear nightmare, dodge root{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Nightmare] needs clear; [Root] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear nightmare, dodge root{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Nightmare] needs clear; [Root] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear nightmare, dodge root{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
}
