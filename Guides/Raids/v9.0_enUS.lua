-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["9.0"] = {
    ["统御圣所"] = {
        name = "Sanctum of Domination",
        ["希尔瓦娜斯·风行者"] = {
            type = "BOSS",
            name = "Sylvanas Windrunner",
            tipsByDifficulty = {
                ["lfr"] = "[Chain] marked need to pull; [Arrow]; P2 [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked pull, handle P2{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Chain] marked need to pull; [Arrow]; P2 [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked pull, handle P2{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Chain] marked need to pull; [Arrow]; P2 [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked pull, handle P2{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Chain] marked need to pull; [Arrow]; P2 [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked pull, handle P2{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Chain] marked need to pull; [Arrow]; P2 [Wind]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked pull, handle P2{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["典狱长之眼"] = {
            type = "BOSS",
            name = "Eye of the Jailer",
            tipsByDifficulty = {
                ["lfr"] = "[Eye] marked keep away; [Chain]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Eye] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Eye] marked keep away; [Chain]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Eye] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Eye] marked keep away; [Chain]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Eye] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Eye] marked keep away; [Chain]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Eye] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Eye] marked keep away; [Chain]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Eye] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["耐奥祖残魂"] = {
            type = "BOSS",
            name = "Remnant of Ner'zhul",
            tipsByDifficulty = {
                ["lfr"] = "[Orb] need to tank; [Frost] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked tank it{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Orb] need to tank; [Frost] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked tank it{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Orb] need to tank; [Frost] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked tank it{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Orb] need to tank; [Frost] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked tank it{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Orb] need to tank; [Frost] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked tank it{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["裂魂者多玛赞"] = {
            type = "BOSS",
            name = "Soulrender Dormazain",
            tipsByDifficulty = {
                ["lfr"] = "[Chain] need to group up; [Soul]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Chain] need to group up; [Soul]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Chain] need to group up; [Soul]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Chain] need to group up; [Soul]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Chain] need to group up; [Soul]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Chain] marked group up{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["痛苦工匠拉兹纳尔"] = {
            type = "BOSS",
            name = "Painsmith Raznal",
            tipsByDifficulty = {
                ["lfr"] = "[Iron] watch ground to dodge; [Spike] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; watch ground for iron, [Spike] keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Iron] watch ground to dodge; [Spike] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; watch ground for iron, [Spike] keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Iron] watch ground to dodge; [Spike] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; watch ground for iron, [Spike] keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Iron] watch ground to dodge; [Spike] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; watch ground for iron, [Spike] keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Iron] watch ground to dodge; [Spike] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; watch ground for iron, [Spike] keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["命运抄写者罗-卡洛"] = {
            type = "BOSS",
            name = "Fatescribe Roh-Kalo",
            tipsByDifficulty = {
                ["lfr"] = "[Rune] stand at assigned spot; [Star] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by rune, [Star] keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Rune] stand at assigned spot; [Star] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by rune, [Star] keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Rune] stand at assigned spot; [Star] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by rune, [Star] keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Rune] stand at assigned spot; [Star] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by rune, [Star] keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Rune] stand at assigned spot; [Star] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; stand by rune, [Star] keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["初诞者卫士"] = {
            type = "BOSS",
            name = "Vigilant Warden",
            tipsByDifficulty = {
                ["lfr"] = "[Cannon] need to destroy; [Lightning] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy cannon, dodge lightning{rt1}||Tank: hold; DPS: operate cannon",
                ["normal"] = "[Cannon] need to destroy; [Lightning] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy cannon, dodge lightning{rt1}||Tank: hold; DPS: operate cannon",
                ["heroic"] = "[Cannon] need to destroy; [Lightning] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy cannon, dodge lightning{rt1}||Tank: hold; DPS: operate cannon",
                ["mythic"] = "[Cannon] need to destroy; [Lightning] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy cannon, dodge lightning{rt1}||Tank: hold; DPS: operate cannon",
                ["mythicplus"] = "[Cannon] need to destroy; [Lightning] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; destroy cannon, dodge lightning{rt1}||Tank: hold; DPS: operate cannon",
            },
        },
        ["塔拉格鲁"] = {
            type = "BOSS",
            name = "The Tarragrue",
            tipsByDifficulty = {
                ["lfr"] = "[Door] open in order; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; door order, burn{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Door] open in order; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; door order, burn{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Door] open in order; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; door order, burn{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Door] open in order; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; door order, burn{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Door] open in order; [Charge]; [Enrage] timer||{rt1}Interrupt/Burst: none; door order, burn{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["九人议会"] = {
            type = "BOSS",
            name = "The Nine",
            tipsByDifficulty = {
                ["lfr"] = "[Nine] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Nine] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Nine] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Nine] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Nine] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["克尔苏加德"] = {
            type = "BOSS",
            name = "Kel'Thuzad",
            tipsByDifficulty = {
                ["lfr"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["normal"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["heroic"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["mythic"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["mythicplus"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
            },
        },
    },
    ["初诞者圣墓"] = {
        name = "Sepulcher of the First Ones",
        ["堕落先知道塞格涅"] = {
            type = "BOSS",
            name = "Dausegne the Fallen Oracle",
            tipsByDifficulty = {
                ["lfr"] = "[Orb] marked keep away; [Holy] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Orb] marked keep away; [Holy] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Orb] marked keep away; [Holy] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Orb] marked keep away; [Holy] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Orb] marked keep away; [Holy] whole raid; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["回收者哈拉顿"] = {
            type = "BOSS",
            name = "Halondrus the Reclaimer",
            tipsByDifficulty = {
                ["lfr"] = "[Burrow] hit when exposed; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, dodge laser{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Burrow] hit when exposed; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, dodge laser{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Burrow] hit when exposed; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, dodge laser{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Burrow] hit when exposed; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, dodge laser{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Burrow] hit when exposed; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, dodge laser{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["万神殿原型"] = {
            type = "BOSS",
            name = "Pantheon Prototype",
            tipsByDifficulty = {
                ["lfr"] = "[Four titans] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Four titans] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Four titans] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Four titans] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Four titans] focus one; [Mixed]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["典狱长"] = {
            type = "BOSS",
            name = "The Jailer",
            tipsByDifficulty = {
                ["lfr"] = "[Multiple] rotating mechanics, [Chain]; [Frost] whole raid; P3 [Main body]||{rt1}Interrupt/Burst: none; handle by phase{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Multiple] rotating mechanics, [Chain]; [Frost] whole raid; P3 [Main body]||{rt1}Interrupt/Burst: none; handle by phase{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Multiple] rotating mechanics, [Chain]; [Frost] whole raid; P3 [Main body]||{rt1}Interrupt/Burst: none; handle by phase{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Multiple] rotating mechanics, [Chain]; [Frost] whole raid; P3 [Main body]||{rt1}Interrupt/Burst: none; handle by phase{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Multiple] rotating mechanics, [Chain]; [Frost] whole raid; P3 [Main body]||{rt1}Interrupt/Burst: none; handle by phase{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["首席建筑师利胡维姆"] = {
            type = "BOSS",
            name = "Chief Architect Li'huveim",
            tipsByDifficulty = {
                ["lfr"] = "[Construct] need to interrupt; [Block] marked; [Enrage] timer||{rt1}Interrupt/Burst: interrupt constructs; focus{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Construct] need to interrupt; [Block] marked; [Enrage] timer||{rt1}Interrupt/Burst: interrupt constructs; focus{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Construct] need to interrupt; [Block] marked; [Enrage] timer||{rt1}Interrupt/Burst: interrupt constructs; focus{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Construct] need to interrupt; [Block] marked; [Enrage] timer||{rt1}Interrupt/Burst: interrupt constructs; focus{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Construct] need to interrupt; [Block] marked; [Enrage] timer||{rt1}Interrupt/Burst: interrupt constructs; focus{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["贪食吞噬者斯科莱克斯"] = {
            type = "BOSS",
            name = "Skolex the Insatiable Devourer",
            tipsByDifficulty = {
                ["lfr"] = "[Burrow] hit when exposed; [Spike]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Burrow] hit when exposed; [Spike]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Burrow] hit when exposed; [Spike]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Burrow] hit when exposed; [Spike]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Burrow] hit when exposed; [Spike]; [Enrage] timer||{rt1}Interrupt/Burst: none; hit when exposed, burn{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["守夜卫士"] = {
            type = "BOSS",
            name = "Vigilant Guardian",
            tipsByDifficulty = {
                ["lfr"] = "[Shield] need to break; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; break shield, dodge laser{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Shield] need to break; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; break shield, dodge laser{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Shield] need to break; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; break shield, dodge laser{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Shield] need to break; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; break shield, dodge laser{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Shield] need to break; [Laser]; [Enrage] timer||{rt1}Interrupt/Burst: none; break shield, dodge laser{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["恐惧领主"] = {
            type = "BOSS",
            name = "Lords of Dread",
            tipsByDifficulty = {
                ["lfr"] = "[Dual] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Dual] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Dual] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Dual] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Dual] focus one; [Illusion]; [Enrage] timer||{rt1}Interrupt/Burst: none; focus one{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["安度因·乌瑞恩"] = {
            type = "BOSS",
            name = "Anduin Wrynn",
            tipsByDifficulty = {
                ["lfr"] = "[Orb] need to destroy; [Mind control] marked; P2 [Light]; [Enrage] timer||{rt1}Interrupt/Burst: [Mind control] quick interrupt to rescue; destroy orb{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Orb] need to destroy; [Mind control] marked; P2 [Light]; [Enrage] timer||{rt1}Interrupt/Burst: [Mind control] quick interrupt to rescue; destroy orb{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Orb] need to destroy; [Mind control] marked; P2 [Light]; [Enrage] timer||{rt1}Interrupt/Burst: [Mind control] quick interrupt to rescue; destroy orb{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Orb] need to destroy; [Mind control] marked; P2 [Light]; [Enrage] timer||{rt1}Interrupt/Burst: [Mind control] quick interrupt to rescue; destroy orb{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Orb] need to destroy; [Mind control] marked; P2 [Light]; [Enrage] timer||{rt1}Interrupt/Burst: [Mind control] quick interrupt to rescue; destroy orb{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["莱盖隆"] = {
            type = "BOSS",
            name = "Rygelon",
            tipsByDifficulty = {
                ["lfr"] = "[Star] marked keep away; [Collapse]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Star] marked keep away; [Collapse]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Star] marked keep away; [Collapse]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Star] marked keep away; [Collapse]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Star] marked keep away; [Collapse]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Star] marked keep away{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["工匠佐莫克斯·再临"] = {
            type = "BOSS",
            name = "Artificer Xy'mox (return)",
            tipsByDifficulty = {
                ["lfr"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
            },
        },
    },
    ["纳斯利亚堡"] = {
        name = "Castle Nathria",
        ["伊涅瓦·暗脉女士"] = {
            type = "BOSS",
            name = "Inerva Darkvein",
            tipsByDifficulty = {
                ["lfr"] = "[Ball] needs hit; [Drain] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit ball, quick kill{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Ball] needs hit; [Drain] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit ball, quick kill{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Ball] needs hit; [Drain] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit ball, quick kill{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Ball] needs hit; [Drain] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit ball, quick kill{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Ball] needs hit; [Drain] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit ball, quick kill{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["石卫军将领"] = {
            type = "BOSS",
            name = "Stone Legion Generals",
            tipsByDifficulty = {
                ["lfr"] = "[Dual generals] share health, split sides; [Stone]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["normal"] = "[Dual generals] share health, split sides; [Stone]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["heroic"] = "[Dual generals] share health, split sides; [Stone]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["mythic"] = "[Dual generals] share health, split sides; [Stone]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
                ["mythicplus"] = "[Dual generals] share health, split sides; [Stone]; [Enrage] timer||{rt1}Interrupt/Burst: none; split and focus{rt1}||Tank: split; DPS: focus",
            },
        },
        ["德纳修斯大帝"] = {
            type = "BOSS",
            name = "Sire Denathrius",
            tipsByDifficulty = {
                ["lfr"] = "[Mirror] need to dodge; [Harvest] marked; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge mirror, handle P3{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Mirror] need to dodge; [Harvest] marked; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge mirror, handle P3{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Mirror] need to dodge; [Harvest] marked; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge mirror, handle P3{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Mirror] need to dodge; [Harvest] marked; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge mirror, handle P3{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Mirror] need to dodge; [Harvest] marked; P3 [Main body]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge mirror, handle P3{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["血誓议会"] = {
            type = "BOSS",
            name = "The Council of Blood",
            tipsByDifficulty = {
                ["lfr"] = "[Three vampires] interrupt assigned; [Dance] mechanic; [Enrage] timer||{rt1}Interrupt/Burst: interrupt by mechanic; one by one{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Three vampires] interrupt assigned; [Dance] mechanic; [Enrage] timer||{rt1}Interrupt/Burst: interrupt by mechanic; one by one{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Three vampires] interrupt assigned; [Dance] mechanic; [Enrage] timer||{rt1}Interrupt/Burst: interrupt by mechanic; one by one{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Three vampires] interrupt assigned; [Dance] mechanic; [Enrage] timer||{rt1}Interrupt/Burst: interrupt by mechanic; one by one{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Three vampires] interrupt assigned; [Dance] mechanic; [Enrage] timer||{rt1}Interrupt/Burst: interrupt by mechanic; one by one{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["工匠佐莫克斯"] = {
            type = "BOSS",
            name = "Artificer Xy'mox",
            tipsByDifficulty = {
                ["lfr"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Teleport] need to group up; [Orb] marked; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["尖啸翼"] = {
            type = "BOSS",
            name = "Shriekwing",
            tipsByDifficulty = {
                ["lfr"] = "[Sonic] watch ground to dodge; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge sonic rings{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Sonic] watch ground to dodge; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge sonic rings{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Sonic] watch ground to dodge; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge sonic rings{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Sonic] watch ground to dodge; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge sonic rings{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Sonic] watch ground to dodge; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; dodge sonic rings{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["太阳王救赎"] = {
            type = "BOSS",
            name = "Sun King's Salvation",
            tipsByDifficulty = {
                ["lfr"] = "[Save] keep [Kael'thas] health; [Fire] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; keep health, attack adds{rt1}||Tank: hold; DPS: swap-target",
                ["normal"] = "[Save] keep [Kael'thas] health; [Fire] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; keep health, attack adds{rt1}||Tank: hold; DPS: swap-target",
                ["heroic"] = "[Save] keep [Kael'thas] health; [Fire] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; keep health, attack adds{rt1}||Tank: hold; DPS: swap-target",
                ["mythic"] = "[Save] keep [Kael'thas] health; [Fire] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; keep health, attack adds{rt1}||Tank: hold; DPS: swap-target",
                ["mythicplus"] = "[Save] keep [Kael'thas] health; [Fire] phase; [Enrage] timer||{rt1}Interrupt/Burst: none; keep health, attack adds{rt1}||Tank: hold; DPS: swap-target",
            },
        },
        ["饥渴毁灭者"] = {
            type = "BOSS",
            name = "Hungering Destroyer",
            tipsByDifficulty = {
                ["lfr"] = "[Orb] marked need to group up; [Explosion]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Orb] marked need to group up; [Explosion]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Orb] marked need to group up; [Explosion]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Orb] marked need to group up; [Explosion]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Orb] marked need to group up; [Explosion]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Orb] marked group up{rt1}||Tank: hold; DPS: burn",
            },
        },
        ["狩猎者阿尔提莫"] = {
            type = "BOSS",
            name = "Huntsman Altimor",
            tipsByDifficulty = {
                ["lfr"] = "[Hound] needs separate tanking; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; split-tank the hounds{rt1}||Tank: split; DPS: focus",
                ["normal"] = "[Hound] needs separate tanking; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; split-tank the hounds{rt1}||Tank: split; DPS: focus",
                ["heroic"] = "[Hound] needs separate tanking; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; split-tank the hounds{rt1}||Tank: split; DPS: focus",
                ["mythic"] = "[Hound] needs separate tanking; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; split-tank the hounds{rt1}||Tank: split; DPS: focus",
                ["mythicplus"] = "[Hound] needs separate tanking; [Marked]; [Enrage] timer||{rt1}Interrupt/Burst: none; split-tank the hounds{rt1}||Tank: split; DPS: focus",
            },
        },
        ["泥拳"] = {
            type = "BOSS",
            name = "Sludgefist",
            tipsByDifficulty = {
                ["lfr"] = "[Slam] marked needs to move away; [Wallbreak]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Slam] marked move away, dodge wall{rt1}||Tank: hold; DPS: burn",
                ["normal"] = "[Slam] marked needs to move away; [Wallbreak]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Slam] marked move away, dodge wall{rt1}||Tank: hold; DPS: burn",
                ["heroic"] = "[Slam] marked needs to move away; [Wallbreak]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Slam] marked move away, dodge wall{rt1}||Tank: hold; DPS: burn",
                ["mythic"] = "[Slam] marked needs to move away; [Wallbreak]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Slam] marked move away, dodge wall{rt1}||Tank: hold; DPS: burn",
                ["mythicplus"] = "[Slam] marked needs to move away; [Wallbreak]; [Enrage] timer||{rt1}Interrupt/Burst: none; [Slam] marked move away, dodge wall{rt1}||Tank: hold; DPS: burn",
            },
        },
    },
}
