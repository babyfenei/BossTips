-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["5.0"] = addon.GuideData.raids["5.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.raids["5.0"]["决战奥格瑞玛"] = {
    ["马尔考洛克"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}马尔考洛克{rt8}||[球]点名需拉一起分担；[落地]全团；[狂暴]计时||{rt1}必断/速杀：无；[球]被点名拉一起分担{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["堕落的守护者"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}堕落的守护者{rt8}||[三守护]共享血量分边；[心控]；[暗影]||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["纳兹戈林将军"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}纳兹戈林将军{rt8}||[战旗]需拔；[小怪]召唤；[狂暴]计时||{rt1}必断/速杀：拔战旗、清小怪；集火{rt1}||坦：拉；输出：拔旗]],
        }
    },
    ["嗜血的索克"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}嗜血的索克{rt8}||[牢]需救被抓者；[毒]阶段；[狂暴]计时||{rt1}必断/速杀：无；救被抓者{rt1}||坦：拉；输出：救人]],
        }
    },
    ["伊墨苏斯"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}伊墨苏斯{rt8}||[水滴]需打掉防回血；[腐蚀]dot；[阶段]||{rt1}必断/速杀：无；打掉水滴防回血{rt1}||坦：拉；输出：转火水滴]],
        }
    },
    ["螳螂妖英杰"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}螳螂妖英杰{rt8}||[英杰]轮流激活，需对应应对；[毒]||{rt1}必断/速杀：按英杰机制；集火{rt1}||坦：拉；输出：集火]],
        }
    },
    ["库卡隆黑暗萨满"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}库卡隆黑暗萨满{rt8}||[火/电]两萨满分边，需对应站位；[图腾]||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["钢铁战神"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}钢铁战神{rt8}||[炮]需打炮击；[地雷]；[狂暴]计时||{rt1}必断/速杀：无；操炮击、躲雷{rt1}||坦：拉；输出：操炮]],
        }
    },
    ["攻城师黑弗斯"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}攻城师黑弗斯{rt8}||[传送带]需打断对应；[地雷]；[拆解]||{rt1}必断/速杀：按传送带打断；集火{rt1}||坦：拉；输出：转火]],
        }
    },
    ["诺鲁什"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}诺鲁什{rt8}||[测试]进内场清[疑]球；[腐蚀]dot||{rt1}必断/速杀：无；进内场清疑球{rt1}||坦：拉；输出：进内场]],
        }
    },
    ["傲之煞"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}傲之煞{rt8}||[骄傲]满需散开；[光]点名；[狂暴]计时||{rt1}必断/速杀：无；[骄傲]满散开{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["迦拉卡斯"] = {
        order = 12,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}迦拉卡斯{rt8}||[塔]需打塔触发；[龙]阶段；[小怪]||{rt1}必断/速杀：无；打塔触发、清小怪{rt1}||坦：分坦；输出：打塔]],
        }
    },
    ["加尔鲁什·地狱咆哮"] = {
        order = 13,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}加尔鲁什·地狱咆哮{rt8}||[铁穹]需躲；[心控]；P2[部落]；P3[虚空]全团||{rt1}必断/速杀：无；躲铁穹、P2应对{rt1}||坦：拉；输出：转火]],
        }
    },
    ["潘达利亚的战利品"] = {
        order = 14,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}潘达利亚的战利品{rt8}||[宝箱]两边开箱清怪，限时击杀||{rt1}必断/速杀：无；限时开箱清怪{rt1}||坦：分坦；输出：清怪]],
        }
    },
}
addon.GuideData.meta["决战奥格瑞玛"] = {
    encounterIds = {
        ["潘达利亚的战利品"] = 870,
        ["加尔鲁什·地狱咆哮"] = 869,
        ["马尔考洛克"] = 846,
        ["诺鲁什"] = 866,
        ["螳螂妖英杰"] = 853,
        ["库卡隆黑暗萨满"] = 856,
        ["嗜血的索克"] = 851,
        ["堕落的守护者"] = 849,
        ["伊墨苏斯"] = 852,
        ["纳兹戈林将军"] = 850,
        ["攻城师黑弗斯"] = 865,
        ["钢铁战神"] = 864,
        ["迦拉卡斯"] = 868,
        ["傲之煞"] = 867,
    },
    instanceId = 1136,
    isRaid = true,
}

addon.GuideData.raids["5.0"]["恐惧之心"] = {
    ["加拉隆"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}加拉隆{rt8}||[腿]需打腿削弱本体；[践踏]全团；[狂暴]计时||{rt1}必断/速杀：无；打腿减伤{rt1}||坦：拉；输出：打腿]],
        }
    },
    ["琥珀塑形者昂绍克"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}琥珀塑形者昂绍克{rt8}||[琥珀]吸收需打破；[构造体]阶段；[剧毒]||{rt1}必断/速杀：无；打琥珀构造体{rt1}||坦：拉；输出：转火]],
        }
    },
    ["风领主梅尔加拉克"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}风领主梅尔加拉克{rt8}||[小怪]周期召唤需控；[旋风]；[狂暴]计时||{rt1}必断/速杀：控/杀小怪；集火{rt1}||坦：拉；输出：控小怪]],
        }
    },
    ["女皇谢兹卡尔"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}女皇谢兹卡尔{rt8}||[毒]高伤dot需分散；[心控]点名；[狂暴]计时||{rt1}必断/速杀：[心控]速断救人；分散{rt1}||坦：拉；输出：救人]],
        }
    },
    ["剑圣塔亚克"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}剑圣塔亚克{rt8}||[疾风]推人；[刀]点名；[狂暴]计时||{rt1}必断/速杀：无；躲疾风{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["帝国宰相佐拉洛克"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}帝国宰相佐拉洛克{rt8}||[转换]按房间机制切换需移动；[心控]；[衰减]||{rt1}必断/速杀：无；按房间跑位{rt1}||坦：拉；输出：转火]],
        }
    },
}
addon.GuideData.meta["恐惧之心"] = {
    encounterIds = {
        ["琥珀塑形者昂绍克"] = 737,
        ["风领主梅尔加拉克"] = 741,
        ["加拉隆"] = 713,
        ["剑圣塔亚克"] = 744,
        ["女皇谢兹卡尔"] = 743,
        ["帝国宰相佐拉洛克"] = 745,
    },
    instanceId = 1009,
    isRaid = true,
}

addon.GuideData.raids["5.0"]["永春台"] = {
    ["无尽者守护者"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}无尽者守护者{rt8}||[三守卫]共享血量分边集火；[光/暗]阶段切换||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["惧之煞"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}惧之煞{rt8}||[恐惧]点名需躲[光]；[触手]；[狂暴]计时||{rt1}必断/速杀：无；被[恐惧]点名躲光{rt1}||坦：拉；输出：转火]],
        }
    },
    ["雷施"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}雷施{rt8}||[隐身]周期消失需停手找位；[水流]；[溅射]||{rt1}必断/速杀：无；隐身期停手定位{rt1}||坦：拉；输出：转火]],
        }
    },
    ["烛龙"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}烛龙{rt8}||[昼夜]白天需打断、夜晚需保血；[光线]||{rt1}必断/速杀：白天按机制打断；夜晚抬血{rt1}||坦：拉；治疗：夜晚抬血]],
        }
    },
}
addon.GuideData.meta["永春台"] = {
    encounterIds = {
        ["雷施"] = 729,
        ["无尽者守护者"] = 683,
        ["惧之煞"] = 709,
        ["烛龙"] = 742,
    },
    instanceId = 996,
    isRaid = true,
}

addon.GuideData.raids["5.0"]["雷霆王座"] = {
    ["长者议会"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}长者议会{rt8}||[四长者]需集火单只防回血；[元素]混合||{rt1}必断/速杀：无；集火单只{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["铁库昂"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}铁库昂{rt8}||[四阶段]风/火/冰/电轮流，需对应站位；[狂暴]计时||{rt1}必断/速杀：无；按阶段换站位{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["遗忘者杜鲁姆"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}遗忘者杜鲁姆{rt8}||[射线]需看[眼]走位；[红/蓝]点名；[狂暴]计时||{rt1}必断/速杀：无；按射线走位{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["霍利顿"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}霍利顿{rt8}||[小怪]多门召唤需控；[狂暴]计时||{rt1}必断/速杀：控/清门小怪；集火{rt1}||坦：拉；输出：控小怪]],
        }
    },
    ["普利莫求斯"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}普利莫求斯{rt8}||[球]需吃[软泥]变强；[突变]；[狂暴]计时||{rt1}必断/速杀：无；吃软泥变强{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["美拉盖拉"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}美拉盖拉{rt8}||[多头]需打断头防复活；[酸液]；[狂暴]计时||{rt1}必断/速杀：打断头防复活；集火{rt1}||坦：拉；输出：断头]],
        }
    },
    ["黑暗活化体"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}黑暗活化体{rt8}||[球]需拉[活化]进圈消除；[能量]；[狂暴]计时||{rt1}必断/速杀：无；拉活化进圈{rt1}||坦：拉；输出：转火]],
        }
    },
    ["托托斯"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}托托斯{rt8}||[壳]需打露头；[地震]；[小龟]需控||{rt1}必断/速杀：无；打露头、控小龟{rt1}||坦：拉；输出：转火]],
        }
    },
    ["破坏者金罗克"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}破坏者金罗克{rt8}||[水]点名需站水减伤；[电]全团；[狂暴]计时||{rt1}必断/速杀：无；[水]被点名站水{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["吉库恩"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}吉库恩{rt8}||[蛋]需打蛋；[毒]落点；[俯冲]||{rt1}必断/速杀：无；打蛋、躲毒{rt1}||坦：拉；输出：打蛋]],
        }
    },
    ["双后"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}双后{rt8}||[双子]需同时击杀；[冰/火]混合；[心控]||{rt1}必断/速杀：无；同时集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["雷登"] = {
        order = 12,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}雷登{rt8}||[球]机制复杂，需按提示跑位；[狂暴]计时(隐藏)||{rt1}必断/速杀：无；按提示跑位{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["雷神"] = {
        order = 13,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}雷神{rt8}||[平台]多机制轮流，[链]；[电]全团；P3[无敌]||{rt1}必断/速杀：无；按平台机制应对{rt1}||坦：拉；输出：转火]],
        }
    },
}
addon.GuideData.meta["雷霆王座"] = {
    encounterIds = {
        ["黑暗活化体"] = 824,
        ["美拉盖拉"] = 821,
        ["霍利顿"] = 819,
        ["普利莫求斯"] = 820,
        ["铁库昂"] = 817,
        ["遗忘者杜鲁姆"] = 818,
        ["长者议会"] = 816,
        ["雷登"] = 831,
        ["托托斯"] = 825,
        ["吉库恩"] = 828,
        ["破坏者金罗克"] = 827,
        ["双后"] = 829,
        ["雷神"] = 832,
    },
    instanceId = 1098,
    isRaid = true,
}

addon.GuideData.raids["5.0"]["魔古山宝库"] = {
    ["皇帝的意志"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}皇帝的意志{rt8}||[傀儡]双坦拉，[能量]满需打断；[狂暴]计时||{rt1}必断/速杀：能量满前打断；集火{rt1}||坦：双坦；输出：速杀]],
        }
    },
    ["石头守卫"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}石头守卫{rt8}||[宝石]需按颜色激活对应；[宠物]坦接||{rt1}必断/速杀：无；按宝石颜色激活{rt1}||坦：分坦；输出：转火]],
        }
    },
    ["缚灵者戈拉亚"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}缚灵者戈拉亚{rt8}||[灵界]需进灵界救被抓者；[暗影]dot||{rt1}必断/速杀：无；进灵界救队友{rt1}||坦：拉；输出：进灵界]],
        }
    },
    ["灵魂王"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}灵魂王{rt8}||[四王]轮流激活，需打断对应；[共享]||{rt1}必断/速杀：按王打断；逐个{rt1}||坦：拉；输出：集火]],
        }
    },
    ["受诅者冯"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}受诅者冯{rt8}||[元素]火/电/冰轮流，需打断对应；[阶段]||{rt1}必断/速杀：按元素打断；集火{rt1}||坦：拉；输出：转火]],
        }
    },
    ["伊拉贡"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}伊拉贡{rt8}||[能量]需打[星]回能；[光束]；[勇者]阶段||{rt1}必断/速杀：无；打星回能、躲光束{rt1}||坦：拉；输出：打星]],
        }
    },
}
addon.GuideData.meta["魔古山宝库"] = {
    encounterIds = {
        ["受诅者冯"] = 689,
        ["石头守卫"] = 679,
        ["灵魂王"] = 687,
        ["皇帝的意志"] = 677,
        ["伊拉贡"] = 726,
        ["缚灵者戈拉亚"] = 682,
    },
    instanceId = 1008,
    isRaid = true,
}

