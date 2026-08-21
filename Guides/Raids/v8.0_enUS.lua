-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["8.0"] = {
    ["风暴熔炉"] = {
        name = "Crucible of Storms",
        ["不宁的卡巴尔"] = {
            type = "BOSS",
            name = "The Restless Cabal",
            tipsByDifficulty = {
                ["lfr"] = "[Twins] need kill simultaneously; [Touch] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Twins] need kill simultaneously; [Touch] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Twins] need kill simultaneously; [Touch] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Twins] need kill simultaneously; [Touch] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Twins] need kill simultaneously; [Touch] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["乌纳特·虚空先驱"] = {
            type = "BOSS",
            name = "Un'at the Void Herald",
            tipsByDifficulty = {
                ["lfr"] = "[Void] multi-mechanic; [Ball]; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by mechanic{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Void] multi-mechanic; [Ball]; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by mechanic{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Void] multi-mechanic; [Ball]; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by mechanic{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Void] multi-mechanic; [Ball]; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by mechanic{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Void] multi-mechanic; [Ball]; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by mechanic{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
    ["尼奥罗萨，觉醒之城"] = {
        name = "Ny'alotha, the Waking City",
        ["蜂巢意识"] = {
            type = "BOSS",
            name = "The Hivemind",
            tipsByDifficulty = {
                ["lfr"] = "[Multi Brain] needs hit; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit brain, quick kill{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Multi Brain] needs hit; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit brain, quick kill{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Multi Brain] needs hit; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit brain, quick kill{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Multi Brain] needs hit; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit brain, quick kill{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Multi Brain] needs hit; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit brain, quick kill{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["恩佐斯之壳"] = {
            type = "BOSS",
            name = "The Carapace of N'Zoth",
            tipsByDifficulty = {
                ["lfr"] = "[Shell] needs hit exposed; [Tentacle]; P2[Body]||{rt1}Must interrupt/burst: none; hit exposed, focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Shell] needs hit exposed; [Tentacle]; P2[Body]||{rt1}Must interrupt/burst: none; hit exposed, focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Shell] needs hit exposed; [Tentacle]; P2[Body]||{rt1}Must interrupt/burst: none; hit exposed, focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Shell] needs hit exposed; [Tentacle]; P2[Body]||{rt1}Must interrupt/burst: none; hit exposed, focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Shell] needs hit exposed; [Tentacle]; P2[Body]||{rt1}Must interrupt/burst: none; hit exposed, focus{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["被亵渎的雷登"] = {
            type = "BOSS",
            name = "Ra-den the Despoiled",
            tipsByDifficulty = {
                ["lfr"] = "[Ball] needs pull together; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Ball] needs pull together; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Ball] needs pull together; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Ball] needs pull together; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Ball] needs pull together; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["维克西奥娜"] = {
            type = "BOSS",
            name = "Vexiona",
            tipsByDifficulty = {
                ["lfr"] = "[Shadow] mark needs away; [Dragon] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shadow] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Shadow] mark needs away; [Dragon] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shadow] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Shadow] mark needs away; [Dragon] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shadow] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Shadow] mark needs away; [Dragon] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shadow] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Shadow] mark needs away; [Dragon] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shadow] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["黑暗审判官萨尼什"] = {
            type = "BOSS",
            name = "Dark Inquisitor Sanish",
            tipsByDifficulty = {
                ["lfr"] = "[Door] needs enter; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter door, quick kill{rt1}||Tank: hold; DPS: enter door",
                ["normal"] = "[Door] needs enter; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter door, quick kill{rt1}||Tank: hold; DPS: enter door",
                ["heroic"] = "[Door] needs enter; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter door, quick kill{rt1}||Tank: hold; DPS: enter door",
                ["mythic"] = "[Door] needs enter; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter door, quick kill{rt1}||Tank: hold; DPS: enter door",
                ["mythicplus"] = "[Door] needs enter; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter door, quick kill{rt1}||Tank: hold; DPS: enter door",
            },
        },
        ["德雷斯塔加斯"] = {
            type = "BOSS",
            name = "Drest'agath",
            tipsByDifficulty = {
                ["lfr"] = "[Tentacle] needs focus; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus tentacle{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Tentacle] needs focus; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus tentacle{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Tentacle] needs focus; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus tentacle{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Tentacle] needs focus; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus tentacle{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Tentacle] needs focus; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus tentacle{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["恩佐斯·腐蚀者"] = {
            type = "BOSS",
            name = "N'Zoth the Corruptor",
            tipsByDifficulty = {
                ["lfr"] = "[Sanity] needs keep; [Tentacle] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; keep sanity, focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Sanity] needs keep; [Tentacle] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; keep sanity, focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Sanity] needs keep; [Tentacle] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; keep sanity, focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Sanity] needs keep; [Tentacle] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; keep sanity, focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Sanity] needs keep; [Tentacle] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; keep sanity, focus{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["永渴的沙德哈"] = {
            type = "BOSS",
            name = "Shad'har the Insatiable",
            tipsByDifficulty = {
                ["lfr"] = "[Three Juice] needs eat corresponding color; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding color juice{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Three Juice] needs eat corresponding color; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding color juice{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Three Juice] needs eat corresponding color; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding color juice{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Three Juice] needs eat corresponding color; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding color juice{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Three Juice] needs eat corresponding color; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat corresponding color juice{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["玛乌特"] = {
            type = "BOSS",
            name = "Maut",
            tipsByDifficulty = {
                ["lfr"] = "[Energy] needs hit [Treasure] remove; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure remove energy{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Energy] needs hit [Treasure] remove; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure remove energy{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Energy] needs hit [Treasure] remove; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure remove energy{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Energy] needs hit [Treasure] remove; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure remove energy{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Energy] needs hit [Treasure] remove; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure remove energy{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["拉希奥"] = {
            type = "BOSS",
            name = "Rashio",
            tipsByDifficulty = {
                ["lfr"] = "[Fire] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fire] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Fire] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fire] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Fire] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fire] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Fire] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fire] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Fire] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fire] marked share{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["伊格诺斯·重生腐蚀"] = {
            type = "BOSS",
            name = "Il'gynoth, Corruption Reborn",
            tipsByDifficulty = {
                ["lfr"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["normal"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["heroic"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["mythic"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
                ["mythicplus"] = "[Eyeball] needs hit to prevent heal; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit eyeball prevent heal{rt1}||Tank: hold; DPS: focus eyeball",
            },
        },
        ["先知斯吉特拉"] = {
            type = "BOSS",
            name = "Prophet Skitra",
            tipsByDifficulty = {
                ["lfr"] = "[Mirror] needs focus real; [Phantom]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Mirror] needs focus real; [Phantom]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Mirror] needs focus real; [Phantom]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Mirror] needs focus real; [Phantom]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Mirror] needs focus real; [Phantom]; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold; DPS: focus",
            },
        },
    },
    ["永恒王宫"] = {
        name = "Eternal Palace",
        ["艾萨拉女王"] = {
            type = "BOSS",
            name = "Queen Azshara",
            tipsByDifficulty = {
                ["lfr"] = "[Multiple] multi-mechanic rotate, [Ball]; [Water] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Multiple] multi-mechanic rotate, [Ball]; [Water] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Multiple] multi-mechanic rotate, [Ball]; [Water] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Multiple] multi-mechanic rotate, [Ball]; [Water] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Multiple] multi-mechanic rotate, [Ball]; [Water] raid-wide; P3[Body]||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["扎库尔·尼奥罗萨先驱"] = {
            type = "BOSS",
            name = "Za'qul",
            tipsByDifficulty = {
                ["lfr"] = "[Dream] mark needs rescue; [Mind Control]; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; [Dream] rescue{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Dream] mark needs rescue; [Mind Control]; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; [Dream] rescue{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Dream] mark needs rescue; [Mind Control]; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; [Dream] rescue{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Dream] mark needs rescue; [Mind Control]; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; [Dream] rescue{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Dream] mark needs rescue; [Mind Control]; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; [Dream] rescue{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["深渊指挥官希瓦拉"] = {
            type = "BOSS",
            name = "Abyssal Commander Sivara",
            tipsByDifficulty = {
                ["lfr"] = "[Two Form] fire/ice switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Two Form] fire/ice switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Two Form] fire/ice switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Two Form] fire/ice switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Two Form] fire/ice switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["黑水巨兽"] = {
            type = "BOSS",
            name = "Blackwater Behemoth",
            tipsByDifficulty = {
                ["lfr"] = "[Tentacle] needs hit; [Water] needs dodge; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit tentacle, dodge water{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Tentacle] needs hit; [Water] needs dodge; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit tentacle, dodge water{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Tentacle] needs hit; [Water] needs dodge; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit tentacle, dodge water{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Tentacle] needs hit; [Water] needs dodge; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit tentacle, dodge water{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Tentacle] needs hit; [Water] needs dodge; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit tentacle, dodge water{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["奥戈佐亚"] = {
            type = "BOSS",
            name = "Ogozoa",
            tipsByDifficulty = {
                ["lfr"] = "[Hatch] needs control; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; control hatch, quick kill{rt1}||Tank: hold; DPS: control",
                ["normal"] = "[Hatch] needs control; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; control hatch, quick kill{rt1}||Tank: hold; DPS: control",
                ["heroic"] = "[Hatch] needs control; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; control hatch, quick kill{rt1}||Tank: hold; DPS: control",
                ["mythic"] = "[Hatch] needs control; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; control hatch, quick kill{rt1}||Tank: hold; DPS: control",
                ["mythicplus"] = "[Hatch] needs control; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; control hatch, quick kill{rt1}||Tank: hold; DPS: control",
            },
        },
        ["艾萨拉之辉"] = {
            type = "BOSS",
            name = "Radiance of Azshara",
            tipsByDifficulty = {
                ["lfr"] = "[Star] mark needs away; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Star] mark needs away; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Star] mark needs away; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Star] mark needs away; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Star] mark needs away; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["阿什凡女士"] = {
            type = "BOSS",
            name = "Lady Ashvane",
            tipsByDifficulty = {
                ["lfr"] = "[Bubble] needs hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit bubble, quick kill{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Bubble] needs hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit bubble, quick kill{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Bubble] needs hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit bubble, quick kill{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Bubble] needs hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit bubble, quick kill{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Bubble] needs hit; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit bubble, quick kill{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["女王之庭"] = {
            type = "BOSS",
            name = "The Queen's Court",
            tipsByDifficulty = {
                ["lfr"] = "[Two Kings] shared health split; [Holy] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Two Kings] shared health split; [Holy] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Two Kings] shared health split; [Holy] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Two Kings] shared health split; [Holy] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Two Kings] shared health split; [Holy] mixed; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
    },
    ["达萨罗之战"] = {
        name = "Battle of Dazar'alor",
        ["被选者议会"] = {
            type = "BOSS",
            name = "Council of the Chosen",
            tipsByDifficulty = {
                ["lfr"] = "[Three Gods] shared health split; [Poison/Thunder/Fire] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Gods] shared health split; [Poison/Thunder/Fire] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Gods] shared health split; [Poison/Thunder/Fire] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Gods] shared health split; [Poison/Thunder/Fire] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Gods] shared health split; [Poison/Thunder/Fire] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["格隆·联盟"] = {
            type = "BOSS",
            name = "Grong (Alliance)",
            tipsByDifficulty = {
                ["lfr"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["格隆·部落"] = {
            type = "BOSS",
            name = "Grong (Horde)",
            tipsByDifficulty = {
                ["lfr"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Thunder] mark needs away; [Charge]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Thunder] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["大工匠梅卡托克"] = {
            type = "BOSS",
            name = "High Tinker Mekkatorque",
            tipsByDifficulty = {
                ["lfr"] = "[Mech] needs hit parts; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit parts, [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Mech] needs hit parts; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit parts, [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Mech] needs hit parts; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit parts, [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Mech] needs hit parts; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit parts, [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Mech] needs hit parts; [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit parts, [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["圣光勇士·联盟"] = {
            type = "BOSS",
            name = "Lightforged Crusader (Alliance)",
            tipsByDifficulty = {
                ["lfr"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["圣光勇士·部落"] = {
            type = "BOSS",
            name = "Lightforged Crusader (Horde)",
            tipsByDifficulty = {
                ["lfr"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Light] mark needs interrupt; [Shield]; [Frenzy] timer||{rt1}Must interrupt/burst: [Light] interrupt; focus{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["奥波伦斯"] = {
            type = "BOSS",
            name = "Opulence",
            tipsByDifficulty = {
                ["lfr"] = "[Treasure] needs hit; [Gold] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Treasure] needs hit; [Gold] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Treasure] needs hit; [Gold] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Treasure] needs hit; [Gold] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Treasure] needs hit; [Gold] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit treasure, quick kill{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["玉火大师·联盟"] = {
            type = "BOSS",
            name = "Jade Fire Master (Alliance)",
            tipsByDifficulty = {
                ["lfr"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["玉火大师·部落"] = {
            type = "BOSS",
            name = "Jade Fire Master (Horde)",
            tipsByDifficulty = {
                ["lfr"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Wu/Magic] dual form switch needs change positioning; [Fire] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["风暴墙封锁"] = {
            type = "BOSS",
            name = "Stormwall Blockade",
            tipsByDifficulty = {
                ["lfr"] = "[Two Ships] needs split sides hit; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Two Ships] needs split sides hit; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Two Ships] needs split sides hit; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Two Ships] needs split sides hit; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Two Ships] needs split sides hit; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["拉斯塔哈大王"] = {
            type = "BOSS",
            name = "King Rastakhan",
            tipsByDifficulty = {
                ["lfr"] = "[Blood] totem needs hit; [Frenzy] timer; P2[God]||{rt1}Must interrupt/burst: none; hit blood totem, P2 respond{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Blood] totem needs hit; [Frenzy] timer; P2[God]||{rt1}Must interrupt/burst: none; hit blood totem, P2 respond{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Blood] totem needs hit; [Frenzy] timer; P2[God]||{rt1}Must interrupt/burst: none; hit blood totem, P2 respond{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Blood] totem needs hit; [Frenzy] timer; P2[God]||{rt1}Must interrupt/burst: none; hit blood totem, P2 respond{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Blood] totem needs hit; [Frenzy] timer; P2[God]||{rt1}Must interrupt/burst: none; hit blood totem, P2 respond{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["吉安娜·普罗德摩尔"] = {
            type = "BOSS",
            name = "Jaina Proudmoore",
            tipsByDifficulty = {
                ["lfr"] = "[Ice] raid-wide high damage; [Water] phase needs dodge; P3[Freeze]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge ice, P3 respond{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Ice] raid-wide high damage; [Water] phase needs dodge; P3[Freeze]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge ice, P3 respond{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Ice] raid-wide high damage; [Water] phase needs dodge; P3[Freeze]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge ice, P3 respond{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Ice] raid-wide high damage; [Water] phase needs dodge; P3[Freeze]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge ice, P3 respond{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Ice] raid-wide high damage; [Water] phase needs dodge; P3[Freeze]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge ice, P3 respond{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
    ["奥迪尔"] = {
        name = "Uldir",
        ["母体"] = {
            type = "BOSS",
            name = "The Mother",
            tipsByDifficulty = {
                ["lfr"] = "[Laser] needs dodge; [Purify]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge laser, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Laser] needs dodge; [Purify]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge laser, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Laser] needs dodge; [Purify]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge laser, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Laser] needs dodge; [Purify]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge laser, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Laser] needs dodge; [Purify]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge laser, quick kill{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["泽克沃兹·恩佐斯先驱"] = {
            type = "BOSS",
            name = "Zek'voz, Herald of N'Zoth",
            tipsByDifficulty = {
                ["lfr"] = "[Bug] mark needs away; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Bug] mark needs away; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Bug] mark needs away; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Bug] mark needs away; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Bug] mark needs away; [Eye]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bug] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["解构者米斯拉克斯"] = {
            type = "BOSS",
            name = "Mislax the Deconstructor",
            tipsByDifficulty = {
                ["lfr"] = "[Shield] needs break; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; break shield, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Shield] needs break; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; break shield, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Shield] needs break; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; break shield, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Shield] needs break; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; break shield, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Shield] needs break; [Thunder] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; break shield, quick kill{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["腐臭吞噬者"] = {
            type = "BOSS",
            name = "Fetid Devourer",
            tipsByDifficulty = {
                ["lfr"] = "[Vomit] mark needs away; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Vomit] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Vomit] mark needs away; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Vomit] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Vomit] mark needs away; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Vomit] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Vomit] mark needs away; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Vomit] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Vomit] mark needs away; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Vomit] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["格胡恩"] = {
            type = "BOSS",
            name = "G'huun",
            tipsByDifficulty = {
                ["lfr"] = "[Blood] mark needs share; [Tentacle]; P3[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Blood] mark needs share; [Tentacle]; P3[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Blood] mark needs share; [Tentacle]; P3[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Blood] mark needs share; [Tentacle]; P3[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Blood] mark needs share; [Tentacle]; P3[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["祖尔"] = {
            type = "BOSS",
            name = "Zul",
            tipsByDifficulty = {
                ["lfr"] = "[Blood] totem needs hit; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood totem, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Blood] totem needs hit; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood totem, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Blood] totem needs hit; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood totem, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Blood] totem needs hit; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood totem, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Blood] totem needs hit; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood totem, quick kill{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["塔洛克"] = {
            type = "BOSS",
            name = "Taloc",
            tipsByDifficulty = {
                ["lfr"] = "[Blood] phase needs hit; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Blood] phase needs hit; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Blood] phase needs hit; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Blood] phase needs hit; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood, quick kill{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Blood] phase needs hit; [Spray]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit blood, quick kill{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["维克提斯"] = {
            type = "BOSS",
            name = "Vectis",
            tipsByDifficulty = {
                ["lfr"] = "[Chain] mark contagion; [Disease] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Chain] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Chain] mark contagion; [Disease] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Chain] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Chain] mark contagion; [Disease] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Chain] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Chain] mark contagion; [Disease] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Chain] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Chain] mark contagion; [Disease] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Chain] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
}
