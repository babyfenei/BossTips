-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["8.0"] = addon.GuideData.raids["8.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.raids["8.0"]["奥迪尔"] = {
    ["腐臭吞噬者"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}腐臭吞噬者{rt8}||[呕吐]点名需远离；[毒]dot；[狂暴]计时||{rt1}必断/速杀：无；[呕吐]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["格胡恩"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}格胡恩{rt8}||[血]点名需分担；[触手]；P3[本体]||{rt1}必断/速杀：无；[血]被点名分担{rt1}||坦：拉；输出：转火]],
        }
    },
    ["维克提斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}维克提斯{rt8}||[连锁]点名传染；[疾病]dot；[狂暴]计时||{rt1}必断/速杀：无；[连锁]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["母体"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}母体{rt8}||[激光]需躲；[净化]；[狂暴]计时||{rt1}必断/速杀：无；躲激光、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["塔洛克"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}塔洛克{rt8}||[血]阶段需打；[喷]；[狂暴]计时||{rt1}必断/速杀：无；打血、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["泽克沃兹·恩佐斯先驱"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}泽克沃兹·恩佐斯先驱{rt8}||[虫]点名需远离；[眼]；[狂暴]计时||{rt1}必断/速杀：无；[虫]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["解构者米斯拉克斯"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}解构者米斯拉克斯{rt8}||[护盾]需破；[雷]全团；[狂暴]计时||{rt1}必断/速杀：无；破盾、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["祖尔"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}祖尔{rt8}||[血]图腾需打；[狂暴]计时||{rt1}必断/速杀：无；打血图腾、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
}
addon.GuideData.meta["奥迪尔"] = {
    encounterIds = {
        ["维克提斯"] = 2166,
        ["格胡恩"] = 2147,
        ["母体"] = 2167,
        ["解构者米斯拉克斯"] = 2194,
        ["塔洛克"] = 2168,
        ["腐臭吞噬者"] = 2146,
        ["泽克沃兹·恩佐斯先驱"] = 2169,
        ["祖尔"] = 2195,
    },
    instanceId = 1861,
    isRaid = true,
}

addon.GuideData.raids["8.0"]["尼奥罗萨，觉醒之城"] = {
    ["被亵渎的雷登"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}被亵渎的雷登{rt8}||[球]需拉一起；[电]全团；[狂暴]计时||{rt1}必断/速杀：无；[球]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["玛乌特"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}玛乌特{rt8}||[能量]需打[宝]消；[狂暴]计时||{rt1}必断/速杀：无；打宝消能量{rt1}||坦：拉；输出：转火]],
        }
    },
    ["恩佐斯之壳"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}恩佐斯之壳{rt8}||[甲壳]需打露头；[触手]；P2[本体]||{rt1}必断/速杀：无；打露头、转火{rt1}||坦：拉；输出：转火]],
        }
    },
    ["永渴的沙德哈"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}永渴的沙德哈{rt8}||[三汁]需吃对应颜色；[狂暴]计时||{rt1}必断/速杀：无；吃对应颜色汁{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["拉希奥"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}拉希奥{rt8}||[火]点名需分担；[狂暴]计时||{rt1}必断/速杀：无；[火]被点名分担{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["先知斯吉特拉"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}先知斯吉特拉{rt8}||[镜像]需集火真身；[幻象]；[狂暴]计时||{rt1}必断/速杀：无；集火真身{rt1}||坦：拉；输出：集火]],
        }
    },
    ["维克西奥娜"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}维克西奥娜{rt8}||[暗]点名需远离；[龙]阶段；[狂暴]计时||{rt1}必断/速杀：无；[暗]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["蜂巢意识"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}蜂巢意识{rt8}||[多脑]需打；[触手]；[狂暴]计时||{rt1}必断/速杀：无；打脑、速杀{rt1}||坦：拉；输出：转火]],
        }
    },
    ["德雷斯塔加斯"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}德雷斯塔加斯{rt8}||[触手]需转火；[眼]；[狂暴]计时||{rt1}必断/速杀：无；转火触手{rt1}||坦：拉；输出：转火]],
        }
    },
    ["伊格诺斯·重生腐蚀"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}伊格诺斯·重生腐蚀{rt8}||[眼球]需打掉防回血；[触手]；[狂暴]计时||{rt1}必断/速杀：无；打眼球防回血{rt1}||坦：拉；输出：转火眼球]],
        }
    },
    ["恩佐斯·腐蚀者"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}恩佐斯·腐蚀者{rt8}||[心智]需保；[触手]全团；P3[本体]||{rt1}必断/速杀：无；保心智、转火{rt1}||坦：拉；输出：转火]],
        }
    },
    ["黑暗审判官萨尼什"] = {
        order = 12,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}黑暗审判官萨尼什{rt8}||[门]需进；[光]点名；[狂暴]计时||{rt1}必断/速杀：无；进门、速杀{rt1}||坦：拉；输出：进门]],
        }
    },
}
addon.GuideData.meta["尼奥罗萨，觉醒之城"] = {
    encounterIds = {
        ["被亵渎的雷登"] = 2364,
        ["伊格诺斯·重生腐蚀"] = 2374,
        ["黑暗审判官萨尼什"] = 2377,
        ["恩佐斯之壳"] = 2366,
        ["先知斯吉特拉"] = 2369,
        ["蜂巢意识"] = 2372,
        ["恩佐斯·腐蚀者"] = 2375,
        ["玛乌特"] = 2365,
        ["德雷斯塔加斯"] = 2373,
        ["拉希奥"] = 2368,
        ["永渴的沙德哈"] = 2367,
        ["维克西奥娜"] = 2370,
    },
    instanceId = 2217,
    isRaid = true,
}

addon.GuideData.raids["8.0"]["永恒王宫"] = {
    ["黑水巨兽"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}黑水巨兽{rt8}||[触手]需打；[水]需躲；[狂暴]计时||{rt1}必断/速杀：无；打触手、躲水{rt1}||坦：拉；输出：转火]],
        }
    },
    ["扎库尔·尼奥罗萨先驱"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}扎库尔·尼奥罗萨先驱{rt8}||[梦]点名需救；[心控]；[狂暴]计时||{rt1}必断/速杀：[心控]速断救人；[梦]救{rt1}||坦：拉；输出：救人]],
        }
    },
    ["奥戈佐亚"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}奥戈佐亚{rt8}||[孵化]需控；[喷射]；[狂暴]计时||{rt1}必断/速杀：无；控孵化、速杀{rt1}||坦：拉；输出：控]],
        }
    },
    ["深渊指挥官希瓦拉"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}深渊指挥官希瓦拉{rt8}||[双形态]火/冰切换需换站位；[狂暴]计时||{rt1}必断/速杀：无；按形态换站位{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["艾萨拉之辉"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}艾萨拉之辉{rt8}||[星]点名需远离；[雷]全团；[狂暴]计时||{rt1}必断/速杀：无；[星]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["阿什凡女士"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}阿什凡女士{rt8}||[气泡]需打；[毒]dot；[狂暴]计时||{rt1}必断/速杀：无；打气泡、速杀{rt1}||坦：拉；输出：转火]],
        }
    },
    ["女王之庭"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}女王之庭{rt8}||[双王]共享血量分边；[圣]混合；[狂暴]计时||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["艾萨拉女王"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}艾萨拉女王{rt8}||[多重]多机制轮换，[球]；[水]全团；P3[本体]||{rt1}必断/速杀：无；按阶段应对{rt1}||坦：拉；输出：转火]],
        }
    },
}
addon.GuideData.meta["永恒王宫"] = {
    encounterIds = {
        ["奥戈佐亚"] = 2351,
        ["艾萨拉女王"] = 2361,
        ["黑水巨兽"] = 2347,
        ["女王之庭"] = 2359,
        ["阿什凡女士"] = 2354,
        ["艾萨拉之辉"] = 2353,
        ["深渊指挥官希瓦拉"] = 2352,
        ["扎库尔·尼奥罗萨先驱"] = 2349,
    },
    instanceId = 2164,
    isRaid = true,
}

addon.GuideData.raids["8.0"]["达萨罗之战"] = {
    ["玉火大师·联盟"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}玉火大师·联盟{rt8}||[武/法]双形态切换需换站位；[火]dot；[狂暴]计时||{rt1}必断/速杀：无；按形态换站位{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["格隆·部落"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}格隆·部落{rt8}||[雷]点名需远离；[冲撞]；[狂暴]计时||{rt1}必断/速杀：无；[雷]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["被选者议会"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}被选者议会{rt8}||[三神]共享血量分边；[毒/雷/火]混合||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["圣光勇士·部落"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}圣光勇士·部落{rt8}||[圣光]点名需打断；[盾]；[狂暴]计时||{rt1}必断/速杀：[圣光]打断；集火{rt1}||坦：拉；输出：转火]],
        }
    },
    ["大工匠梅卡托克"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}大工匠梅卡托克{rt8}||[机甲]需打部件；[炸弹]点名；[狂暴]计时||{rt1}必断/速杀：无；打部件、[炸弹]放圈{rt1}||坦：拉；输出：转火]],
        }
    },
    ["拉斯塔哈大王"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}拉斯塔哈大王{rt8}||[血]图腾需打；[狂暴]计时；P2[神灵]||{rt1}必断/速杀：无；打血图腾、P2应对{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["风暴墙封锁"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}风暴墙封锁{rt8}||[双舰]需分边打；[电]全团；[狂暴]计时||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["格隆·联盟"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}格隆·联盟{rt8}||[雷]点名需远离；[冲撞]；[狂暴]计时||{rt1}必断/速杀：无；[雷]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["玉火大师·部落"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}玉火大师·部落{rt8}||[武/法]双形态切换需换站位；[火]dot；[狂暴]计时||{rt1}必断/速杀：无；按形态换站位{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["奥波伦斯"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}奥波伦斯{rt8}||[宝箱]需打；[金]dot；[狂暴]计时||{rt1}必断/速杀：无；打宝箱、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["吉安娜·普罗德摩尔"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}吉安娜·普罗德摩尔{rt8}||[冰]全团高伤；[水]阶段需躲；P3[冻结]；[狂暴]计时||{rt1}必断/速杀：无；躲冰、P3应对{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["圣光勇士·联盟"] = {
        order = 12,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}圣光勇士·联盟{rt8}||[圣光]点名需打断；[盾]；[狂暴]计时||{rt1}必断/速杀：[圣光]打断；集火{rt1}||坦：拉；输出：转火]],
        }
    },
}
addon.GuideData.meta["达萨罗之战"] = {
    encounterIds = {
        ["玉火大师·部落"] = 2341,
        ["风暴墙封锁"] = 2337,
        ["格隆·部落"] = 2325,
        ["奥波伦斯"] = 2271,
        ["玉火大师·联盟"] = 2323,
        ["圣光勇士·部落"] = 2333,
        ["被选者议会"] = 2330,
        ["圣光勇士·联盟"] = 2344,
        ["大工匠梅卡托克"] = 2334,
        ["拉斯塔哈大王"] = 2335,
        ["格隆·联盟"] = 2340,
        ["吉安娜·普罗德摩尔"] = 2343,
    },
    instanceId = 2070,
    isRaid = true,
}

addon.GuideData.raids["8.0"]["风暴熔炉"] = {
    ["不宁的卡巴尔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}不宁的卡巴尔{rt8}||[双子]需同时击杀；[触]dot；[狂暴]计时||{rt1}必断/速杀：无；同时集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["乌纳特·虚空先驱"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}乌纳特·虚空先驱{rt8}||[虚空]机制多；[球]；[狂暴]计时||{rt1}必断/速杀：无；按机制应对{rt1}||坦：拉；输出：速杀]],
        }
    },
}
addon.GuideData.meta["风暴熔炉"] = {
    encounterIds = {
        ["不宁的卡巴尔"] = 2328,
        ["乌纳特·虚空先驱"] = 2332,
    },
    instanceId = 2096,
    isRaid = true,
}

