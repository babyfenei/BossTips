-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["10.0"] = {
    ["化身巨龙牢窟"] = {
        name = "Vault of the Incarnates",
        ["噬雷者拉兹加斯"] = {
            type = "BOSS",
            name = "Raszageth the Storm-Eater",
            tipsByDifficulty = {
                ["lfr"] = "[Lightning] whole-raid high damage; [Chain] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lightning, [Chain] group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Lightning] whole-raid high damage; [Chain] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lightning, [Chain] group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Lightning] whole-raid high damage; [Chain] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lightning, [Chain] group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Lightning] whole-raid high damage; [Chain] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lightning, [Chain] group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Lightning] whole-raid high damage; [Chain] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lightning, [Chain] group up{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["原始议会"] = {
            type = "BOSS",
            name = "The Primal Council",
            tipsByDifficulty = {
                ["lfr"] = "[Four elements] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: split; DPS: focus",
                ["normal"] = "[Four elements] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: split; DPS: focus",
                ["heroic"] = "[Four elements] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: split; DPS: focus",
                ["mythic"] = "[Four elements] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: split; DPS: focus",
                ["mythicplus"] = "[Four elements] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: split; DPS: focus",
            },
        },
        ["泰罗斯"] = {
            type = "BOSS",
            name = "Terros",
            tipsByDifficulty = {
                ["lfr"] = "[Stone] hit when exposed; [Quake]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Stone] hit when exposed; [Quake]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Stone] hit when exposed; [Quake]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Stone] hit when exposed; [Quake]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Stone] hit when exposed; [Quake]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["飞升的达西娅"] = {
            type = "BOSS",
            name = "Broodkeeper Diurna",
            tipsByDifficulty = {
                ["lfr"] = "[Egg] need to protect; [Dragon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; protect egg, burn{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Egg] need to protect; [Dragon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; protect egg, burn{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Egg] need to protect; [Dragon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; protect egg, burn{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Egg] need to protect; [Dragon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; protect egg, burn{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Egg] need to protect; [Dragon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; protect egg, burn{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["埃拉诺格"] = {
            type = "BOSS",
            name = "Eranog",
            tipsByDifficulty = {
                ["lfr"] = "[Link] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Link] marked group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Link] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Link] marked group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Link] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Link] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Link] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Link] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Link] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Link] marked group up{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["库罗格·恐图腾"] = {
            type = "BOSS",
            name = "Kurog Grimtotem",
            tipsByDifficulty = {
                ["lfr"] = "[Totem] need to destroy; [Earth] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy totem, burn{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Totem] need to destroy; [Earth] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy totem, burn{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Totem] need to destroy; [Earth] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy totem, burn{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Totem] need to destroy; [Earth] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy totem, burn{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Totem] need to destroy; [Earth] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy totem, burn{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["孵雏者迪乌娜"] = {
            type = "BOSS",
            name = "Dathea Ascended",
            tipsByDifficulty = {
                ["lfr"] = "[Wind] marked keep away; [Ascend] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Wind] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Wind] marked keep away; [Ascend] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Wind] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Wind] marked keep away; [Ascend] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Wind] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Wind] marked keep away; [Ascend] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Wind] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Wind] marked keep away; [Ascend] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Wind] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["寒息森纳丝"] = {
            type = "BOSS",
            name = "Sennarth the Cold Breath",
            tipsByDifficulty = {
                ["lfr"] = "[Ice] marked keep away; [Web]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Ice] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Ice] marked keep away; [Web]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Ice] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Ice] marked keep away; [Web]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Ice] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Ice] marked keep away; [Web]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Ice] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Ice] marked keep away; [Web]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Ice] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
    },
    ["阿梅达希尔，梦境之愿"] = {
        name = "Amirdrassil, the Dream's Hope",
        ["斯莫德隆"] = {
            type = "BOSS",
            name = "Fyrakk",
            tipsByDifficulty = {
                ["lfr"] = "[Fire] whole-raid high damage; [Flight] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Fire] whole-raid high damage; [Flight] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Fire] whole-raid high damage; [Flight] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Fire] whole-raid high damage; [Flight] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Fire] whole-raid high damage; [Flight] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["残酷的伊吉拉"] = {
            type = "BOSS",
            name = "Igira the Cruel",
            tipsByDifficulty = {
                ["lfr"] = "[Arrow] marked keep away; [Shield]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Arrow] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Arrow] marked keep away; [Shield]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Arrow] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Arrow] marked keep away; [Shield]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Arrow] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Arrow] marked keep away; [Shield]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Arrow] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Arrow] marked keep away; [Shield]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Arrow] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["梦境议会"] = {
            type = "BOSS",
            name = "Dream Council",
            tipsByDifficulty = {
                ["lfr"] = "[Three dreams] share health, split sides; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["normal"] = "[Three dreams] share health, split sides; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["heroic"] = "[Three dreams] share health, split sides; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["mythic"] = "[Three dreams] share health, split sides; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["mythicplus"] = "[Three dreams] share health, split sides; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
            },
        },
        ["沃尔科罗斯"] = {
            type = "BOSS",
            name = "Volcoross",
            tipsByDifficulty = {
                ["lfr"] = "[Chain] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Chain] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Chain] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Chain] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Chain] need to group up; [Fire] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["炽燃菲拉克斯"] = {
            type = "BOSS",
            name = "Smolderon",
            tipsByDifficulty = {
                ["lfr"] = "[Lava] need to dodge; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lava{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Lava] need to dodge; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lava{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Lava] need to dodge; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lava{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Lava] need to dodge; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lava{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Lava] need to dodge; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge lava{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["纠结根须"] = {
            type = "BOSS",
            name = "Gnarlroot",
            tipsByDifficulty = {
                ["lfr"] = "[Root] marked keep away; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; [Root] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Root] marked keep away; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; [Root] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Root] marked keep away; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; [Root] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Root] marked keep away; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; [Root] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Root] marked keep away; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; [Root] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["轮回编织者尼缪"] = {
            type = "BOSS",
            name = "Nymue, Weaver of the Cycle",
            tipsByDifficulty = {
                ["lfr"] = "[Ring] stand at assigned spot; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by ring{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Ring] stand at assigned spot; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by ring{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Ring] stand at assigned spot; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by ring{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Ring] stand at assigned spot; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by ring{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Ring] stand at assigned spot; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by ring{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["火焰守护者拉罗达尔"] = {
            type = "BOSS",
            name = "Larodar, Keeper of the Flame",
            tipsByDifficulty = {
                ["lfr"] = "[Fire] need to control; [Tree] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; control fire, burn{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Fire] need to control; [Tree] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; control fire, burn{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Fire] need to control; [Tree] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; control fire, burn{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Fire] need to control; [Tree] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; control fire, burn{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Fire] need to control; [Tree] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; control fire, burn{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["火焰先知廷德拉尔"] = {
            type = "BOSS",
            name = "Tindral Sageswift",
            tipsByDifficulty = {
                ["lfr"] = "[Star] marked keep away; [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Star] marked keep away; [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Star] marked keep away; [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Star] marked keep away; [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Star] marked keep away; [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
    },
    ["亚贝鲁斯，焰影熔炉"] = {
        name = "Aberrus, the Shadowed Crucible",
        ["地狱熔铸卡扎拉"] = {
            type = "BOSS",
            name = "Kazzara the Hellforged",
            tipsByDifficulty = {
                ["lfr"] = "[Fire] whole-raid high damage; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Fire] whole-raid high damage; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Fire] whole-raid high damage; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Fire] whole-raid high damage; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Fire] whole-raid high damage; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge fire, burn{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["耐萨里奥回响"] = {
            type = "BOSS",
            name = "Echo of Neltharion",
            tipsByDifficulty = {
                ["lfr"] = "[Rupture] marked keep away; [Lava] whole raid; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Rupture] marked keep away{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Rupture] marked keep away; [Lava] whole raid; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Rupture] marked keep away{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Rupture] marked keep away; [Lava] whole raid; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Rupture] marked keep away{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Rupture] marked keep away; [Lava] whole raid; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Rupture] marked keep away{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Rupture] marked keep away; [Lava] whole raid; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Rupture] marked keep away{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["玛格莫拉克"] = {
            type = "BOSS",
            name = "Magmorax",
            tipsByDifficulty = {
                ["lfr"] = "[Chain] need to group up; [Spray]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Chain] need to group up; [Spray]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Chain] need to group up; [Spray]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Chain] need to group up; [Spray]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Chain] need to group up; [Spray]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["扎卡利突袭"] = {
            type = "BOSS",
            name = "Assault of the Zaqali",
            tipsByDifficulty = {
                ["lfr"] = "[Waves] trash + vehicle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: clear trash, push vehicle{rt1}||Tank: hold; DPS: clear trash",
                ["normal"] = "[Waves] trash + vehicle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: clear trash, push vehicle{rt1}||Tank: hold; DPS: clear trash",
                ["heroic"] = "[Waves] trash + vehicle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: clear trash, push vehicle{rt1}||Tank: hold; DPS: clear trash",
                ["mythic"] = "[Waves] trash + vehicle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: clear trash, push vehicle{rt1}||Tank: hold; DPS: clear trash",
                ["mythicplus"] = "[Waves] trash + vehicle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: clear trash, push vehicle{rt1}||Tank: hold; DPS: clear trash",
            },
        },
        ["长者拉肖克"] = {
            type = "BOSS",
            name = "Rashok the Elder",
            tipsByDifficulty = {
                ["lfr"] = "[Energy] full need to interrupt; [Heavy]; [Enrage] timer||{rt1}Interrupt/Burst: interrupt before energy full; focus{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Energy] full need to interrupt; [Heavy]; [Enrage] timer||{rt1}Interrupt/Burst: interrupt before energy full; focus{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Energy] full need to interrupt; [Heavy]; [Enrage] timer||{rt1}Interrupt/Burst: interrupt before energy full; focus{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Energy] full need to interrupt; [Heavy]; [Enrage] timer||{rt1}Interrupt/Burst: interrupt before energy full; focus{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Energy] full need to interrupt; [Heavy]; [Enrage] timer||{rt1}Interrupt/Burst: interrupt before energy full; focus{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["鳞长萨卡雷斯"] = {
            type = "BOSS",
            name = "Scalecommander Sarkareth",
            tipsByDifficulty = {
                ["lfr"] = "[Void] marked keep away; [Summon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Void] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Void] marked keep away; [Summon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Void] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Void] marked keep away; [Summon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Void] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Void] marked keep away; [Summon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Void] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Void] marked keep away; [Summon] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; [Void] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["警戒管家兹斯卡尔恩"] = {
            type = "BOSS",
            name = "The Vigilant Steward Zskarn",
            tipsByDifficulty = {
                ["lfr"] = "[Trap] need to handle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: none; handle traps, burn{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Trap] need to handle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: none; handle traps, burn{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Trap] need to handle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: none; handle traps, burn{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Trap] need to handle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: none; handle traps, burn{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Trap] need to handle; [Fire]; [Enrage] timer||{rt1}Interrupt/Burst: none; handle traps, burn{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["被遗忘的实验"] = {
            type = "BOSS",
            name = "The Forgotten Experiments",
            tipsByDifficulty = {
                ["lfr"] = "[Two forms] switch need to handle; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; handle by form{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Two forms] switch need to handle; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; handle by form{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Two forms] switch need to handle; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; handle by form{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Two forms] switch need to handle; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; handle by form{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Two forms] switch need to handle; [Poison] DoT; [Enrage] timer||{rt1}Interrupt/Burst: none; handle by form{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["融合密室"] = {
            type = "BOSS",
            name = "Fusion Chamber",
            tipsByDifficulty = {
                ["lfr"] = "[Two mobs] need to kill simultaneously; [Poison/Fire] mixed; [Enrage] timer||{rt1}Interrupt/Burst: none; focus both together{rt1}||Tank: split; DPS: focus",
                ["normal"] = "[Two mobs] need to kill simultaneously; [Poison/Fire] mixed; [Enrage] timer||{rt1}Interrupt/Burst: none; focus both together{rt1}||Tank: split; DPS: focus",
                ["heroic"] = "[Two mobs] need to kill simultaneously; [Poison/Fire] mixed; [Enrage] timer||{rt1}Interrupt/Burst: none; focus both together{rt1}||Tank: split; DPS: focus",
                ["mythic"] = "[Two mobs] need to kill simultaneously; [Poison/Fire] mixed; [Enrage] timer||{rt1}Interrupt/Burst: none; focus both together{rt1}||Tank: split; DPS: focus",
                ["mythicplus"] = "[Two mobs] need to kill simultaneously; [Poison/Fire] mixed; [Enrage] timer||{rt1}Interrupt/Burst: none; focus both together{rt1}||Tank: split; DPS: focus",
            },
        },
    },
}
