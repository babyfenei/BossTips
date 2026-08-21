-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["10.0"] = addon.GuideData.raids["10.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.raids["10.0"]["亚贝鲁斯，焰影熔炉"] = {
    ["鳞长萨卡雷斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}鳞长萨卡雷斯{rt8}||[虚空]点名需远离；[召唤]阶段；[狂暴]计时||{rt1}必断/速杀：无；[虚空]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["地狱熔铸卡扎拉"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}地狱熔铸卡扎拉{rt8}||[火]全团高伤；[冲]；[狂暴]计时||{rt1}必断/速杀：无；躲火、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["耐萨里奥回响"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}耐萨里奥回响{rt8}||[崩裂]点名需远离；[熔岩]全团；P3[本体]；[狂暴]计时||{rt1}必断/速杀：无；[崩裂]被点名远离{rt1}||坦：拉；输出：转火]],
        }
    },
    ["扎卡利突袭"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}扎卡利突袭{rt8}||[多波]小怪+载具；[火]；[狂暴]计时||{rt1}必断/速杀：清小怪、载具推进{rt1}||坦：拉；输出：清小怪]],
        }
    },
    ["长者拉肖克"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}长者拉肖克{rt8}||[能量]满需打断；[重击]坦；[狂暴]计时||{rt1}必断/速杀：能量满前打断；集火{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["玛格莫拉克"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}玛格莫拉克{rt8}||[链]需拉一起；[喷]；[狂暴]计时||{rt1}必断/速杀：无；[链]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["融合密室"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}融合密室{rt8}||[双怪]需同时击杀；[毒/火]混合；[狂暴]计时||{rt1}必断/速杀：无；同时集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["被遗忘的实验"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}被遗忘的实验{rt8}||[双形态]切换需应对；[毒]dot；[狂暴]计时||{rt1}必断/速杀：无；按形态应对{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["警戒管家兹斯卡尔恩"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}警戒管家兹斯卡尔恩{rt8}||[陷阱]需处理；[火]；[狂暴]计时||{rt1}必断/速杀：无；处理陷阱、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
}
addon.GuideData.meta["亚贝鲁斯，焰影熔炉"] = {
    encounterIds = {
        ["被遗忘的实验"] = 2530,
        ["融合密室"] = 2529,
        ["耐萨里奥回响"] = 2523,
        ["长者拉肖克"] = 2525,
        ["玛格莫拉克"] = 2527,
        ["警戒管家兹斯卡尔恩"] = 2532,
        ["地狱熔铸卡扎拉"] = 2522,
        ["扎卡利突袭"] = 2524,
        ["鳞长萨卡雷斯"] = 2520,
    },
    instanceId = 2569,
    isRaid = true,
}

addon.GuideData.raids["10.0"]["化身巨龙牢窟"] = {
    ["埃拉诺格"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}埃拉诺格{rt8}||[环节]需拉一起；[火]全团；[狂暴]计时||{rt1}必断/速杀：无；[环节]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["寒息森纳丝"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}寒息森纳丝{rt8}||[冰]点名需远离；[网]；[狂暴]计时||{rt1}必断/速杀：无；[冰]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["原始议会"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}原始议会{rt8}||[四元素]需集火单只；[混合]；[狂暴]计时||{rt1}必断/速杀：无；集火单只{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["库罗格·恐图腾"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}库罗格·恐图腾{rt8}||[图腾]需打；[土]阶段；[狂暴]计时||{rt1}必断/速杀：无；打图腾、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["孵雏者迪乌娜"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}孵雏者迪乌娜{rt8}||[蛋]需保；[龙]阶段；[狂暴]计时||{rt1}必断/速杀：无；保蛋、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["噬雷者拉兹加斯"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}噬雷者拉兹加斯{rt8}||[雷]全团高伤；[链]点名；[狂暴]计时||{rt1}必断/速杀：无；躲雷、[链]拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["泰罗斯"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}泰罗斯{rt8}||[石]需打露头；[震]；[狂暴]计时||{rt1}必断/速杀：无；打露头、速杀{rt1}||坦：拉；输出：转火]],
        }
    },
    ["飞升的达西娅"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}飞升的达西娅{rt8}||[风]点名需远离；[升]阶段；[狂暴]计时||{rt1}必断/速杀：无；[风]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
}
addon.GuideData.meta["化身巨龙牢窟"] = {
    encounterIds = {
        ["飞升的达西娅"] = 2502,
        ["孵雏者迪乌娜"] = 2493,
        ["埃拉诺格"] = 2480,
        ["寒息森纳丝"] = 2482,
        ["噬雷者拉兹加斯"] = 2499,
        ["库罗格·恐图腾"] = 2491,
        ["泰罗斯"] = 2500,
        ["原始议会"] = 2486,
    },
    instanceId = 2522,
    isRaid = true,
}

addon.GuideData.raids["10.0"]["阿梅达希尔，梦境之愿"] = {
    ["炽燃菲拉克斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}炽燃菲拉克斯{rt8}||[火]全团高伤；[飞行]阶段；[狂暴]计时||{rt1}必断/速杀：无；躲火、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["火焰守护者拉罗达尔"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}火焰守护者拉罗达尔{rt8}||[火]需控；[树]阶段；[狂暴]计时||{rt1}必断/速杀：无；控火、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["残酷的伊吉拉"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}残酷的伊吉拉{rt8}||[箭]点名需远离；[盾]；[狂暴]计时||{rt1}必断/速杀：无；[箭]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["梦境议会"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}梦境议会{rt8}||[三梦]共享血量分边；[混合]；[狂暴]计时||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["轮回编织者尼缪"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}轮回编织者尼缪{rt8}||[环]需对应站位；[点名]；[狂暴]计时||{rt1}必断/速杀：无；按环站位{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["沃尔科罗斯"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}沃尔科罗斯{rt8}||[链]需拉一起；[火]全团；[狂暴]计时||{rt1}必断/速杀：无；[链]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["斯莫德隆"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}斯莫德隆{rt8}||[熔岩]需躲；[冲]；[狂暴]计时||{rt1}必断/速杀：无；躲熔岩{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["纠结根须"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}纠结根须{rt8}||[根]点名需远离；[毒]dot；[狂暴]计时||{rt1}必断/速杀：无；[根]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["火焰先知廷德拉尔"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}火焰先知廷德拉尔{rt8}||[星]点名需远离；[风]；[狂暴]计时||{rt1}必断/速杀：无；[星]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
}
addon.GuideData.meta["阿梅达希尔，梦境之愿"] = {
    encounterIds = {
        ["残酷的伊吉拉"] = 2554,
        ["火焰守护者拉罗达尔"] = 2553,
        ["斯莫德隆"] = 2563,
        ["沃尔科罗斯"] = 2557,
        ["纠结根须"] = 2564,
        ["炽燃菲拉克斯"] = 2519,
        ["火焰先知廷德拉尔"] = 2565,
        ["梦境议会"] = 2555,
        ["轮回编织者尼缪"] = 2556,
    },
    instanceId = 2549,
    isRaid = true,
}

