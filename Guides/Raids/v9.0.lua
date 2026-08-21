-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["9.0"] = addon.GuideData.raids["9.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.raids["9.0"]["初诞者圣墓"] = {
    ["恐惧领主"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}恐惧领主{rt8}||[双]需集火单只；[幻象]；[狂暴]计时||{rt1}必断/速杀：无；集火单只{rt1}||坦：拉；输出：集火]],
        }
    },
    ["守夜卫士"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}守夜卫士{rt8}||[炮]需打；[电]全团；[狂暴]计时||{rt1}必断/速杀：无；打炮、躲电{rt1}||坦：拉；输出：操炮]],
        }
    },
    ["堕落先知道塞格涅"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}堕落先知道塞格涅{rt8}||[球]点名需远离；[圣]全团；[狂暴]计时||{rt1}必断/速杀：无；[球]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["万神殿原型"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}万神殿原型{rt8}||[四神]需集火单只；[混合]；[狂暴]计时||{rt1}必断/速杀：无；集火单只{rt1}||坦：拉；输出：集火]],
        }
    },
    ["首席建筑师利胡维姆"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}首席建筑师利胡维姆{rt8}||[构造]需打断；[块]点名；[狂暴]计时||{rt1}必断/速杀：按构造打断；集火{rt1}||坦：拉；输出：转火]],
        }
    },
    ["回收者哈拉顿"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}回收者哈拉顿{rt8}||[钻地]需打露头；[激光]；[狂暴]计时||{rt1}必断/速杀：无；打露头、躲激光{rt1}||坦：拉；输出：转火]],
        }
    },
    ["典狱长"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}典狱长{rt8}||[多重]多机制轮换，[链]；[霜]全团；P3[本体]||{rt1}必断/速杀：无；按阶段应对{rt1}||坦：拉；输出：转火]],
        }
    },
    ["贪食吞噬者斯科莱克斯"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}贪食吞噬者斯科莱克斯{rt8}||[钻地]需打露头；[刺]；[狂暴]计时||{rt1}必断/速杀：无；打露头、速杀{rt1}||坦：拉；输出：转火]],
        }
    },
    ["莱盖隆"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}莱盖隆{rt8}||[星]点名需远离；[坍缩]；[狂暴]计时||{rt1}必断/速杀：无；[星]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["安度因·乌瑞恩"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}安度因·乌瑞恩{rt8}||[宝]需打；[心控]点名；P2[光明]；[狂暴]计时||{rt1}必断/速杀：[心控]速断救人；打宝{rt1}||坦：拉；输出：转火]],
        }
    },
    ["工匠佐莫克斯·再临"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}工匠佐莫克斯·再临{rt8}||[传送]需拉一起；[宝]点名；[狂暴]计时||{rt1}必断/速杀：无；[宝]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
}
addon.GuideData.meta["初诞者圣墓"] = {
    encounterIds = {
        ["万神殿原型"] = 2460,
        ["堕落先知道塞格涅"] = 2459,
        ["守夜卫士"] = 2458,
        ["典狱长"] = 2464,
        ["恐惧领主"] = 2457,
        ["贪食吞噬者斯科莱克斯"] = 2465,
        ["工匠佐莫克斯·再临"] = 2470,
        ["安度因·乌瑞恩"] = 2469,
        ["莱盖隆"] = 2467,
        ["回收者哈拉顿"] = 2463,
        ["首席建筑师利胡维姆"] = 2461,
    },
    instanceId = 2481,
    isRaid = true,
}

addon.GuideData.raids["9.0"]["纳斯利亚堡"] = {
    ["尖啸翼"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}尖啸翼{rt8}||[音波]需看地面躲；[点名]；[狂暴]计时||{rt1}必断/速杀：无；躲音波圈{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["泥拳"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}泥拳{rt8}||[砸]点名需远离；[破墙]；[狂暴]计时||{rt1}必断/速杀：无；[砸]被点名远离、躲墙{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["工匠佐莫克斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}工匠佐莫克斯{rt8}||[传送]需拉一起；[宝]点名；[狂暴]计时||{rt1}必断/速杀：无；[宝]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["伊涅瓦·暗脉女士"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}伊涅瓦·暗脉女士{rt8}||[球]需打；[吸]dot；[狂暴]计时||{rt1}必断/速杀：无；打球、速杀{rt1}||坦：拉；输出：转火]],
        }
    },
    ["太阳王救赎"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}太阳王救赎{rt8}||[救]需保[凯尔萨斯]血量；[火]阶段；[狂暴]计时||{rt1}必断/速杀：无；保血、打敌{rt1}||坦：拉；输出：转火]],
        }
    },
    ["德纳修斯大帝"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}德纳修斯大帝{rt8}||[镜]需躲；[收割]点名；P3[本体]；[狂暴]计时||{rt1}必断/速杀：无；躲镜、P3应对{rt1}||坦：拉；输出：转火]],
        }
    },
    ["石卫军将领"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}石卫军将领{rt8}||[双将]共享血量分边；[石]；[狂暴]计时||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]],
        }
    },
    ["血誓议会"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}血誓议会{rt8}||[三吸血鬼]需打断对应；[舞]机制；[狂暴]计时||{rt1}必断/速杀：按机制打断；逐个{rt1}||坦：拉；输出：集火]],
        }
    },
    ["饥渴毁灭者"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}饥渴毁灭者{rt8}||[球]点名需拉一起；[爆炸]；[狂暴]计时||{rt1}必断/速杀：无；[球]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["狩猎者阿尔提莫"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}狩猎者阿尔提莫{rt8}||[狗]需分拉；[点名]；[狂暴]计时||{rt1}必断/速杀：无；分拉狗{rt1}||坦：分坦；输出：集火]],
        }
    },
}
addon.GuideData.meta["纳斯利亚堡"] = {
    encounterIds = {
        ["石卫军将领"] = 2425,
        ["狩猎者阿尔提莫"] = 2429,
        ["伊涅瓦·暗脉女士"] = 2420,
        ["尖啸翼"] = 2393,
        ["太阳王救赎"] = 2422,
        ["泥拳"] = 2394,
        ["工匠佐莫克斯"] = 2418,
        ["饥渴毁灭者"] = 2428,
        ["德纳修斯大帝"] = 2424,
        ["血誓议会"] = 2426,
    },
    instanceId = 2296,
    isRaid = true,
}

addon.GuideData.raids["9.0"]["统御圣所"] = {
    ["塔拉格鲁"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}塔拉格鲁{rt8}||[门]需按顺序开；[冲]；[狂暴]计时||{rt1}必断/速杀：无；按门顺序、速杀{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["九人议会"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}九人议会{rt8}||[九]需集火单只；[幻象]；[狂暴]计时||{rt1}必断/速杀：无；集火单只{rt1}||坦：拉；输出：集火]],
        }
    },
    ["克尔苏加德"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}克尔苏加德{rt8}||[冰箱]需进；[魂]点名；[狂暴]计时||{rt1}必断/速杀：无；进冰箱、[魂]救{rt1}||坦：拉；输出：进门]],
        }
    },
    ["希尔瓦娜斯·风行者"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}希尔瓦娜斯·风行者{rt8}||[链]点名需拉；[箭]；P2[风]；[狂暴]计时||{rt1}必断/速杀：无；[链]被点名拉、P2应对{rt1}||坦：拉；输出：转火]],
        }
    },
    ["典狱长之眼"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}典狱长之眼{rt8}||[眼]点名需远离；[链]；[狂暴]计时||{rt1}必断/速杀：无；[眼]被点名远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["痛苦工匠拉兹纳尔"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}痛苦工匠拉兹纳尔{rt8}||[铁]需看地面躲；[钉]点名；[狂暴]计时||{rt1}必断/速杀：无；看地面躲铁、[钉]远离{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["耐奥祖残魂"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}耐奥祖残魂{rt8}||[球]需拉；[霜]全团；[狂暴]计时||{rt1}必断/速杀：无；[球]被点名拉{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["裂魂者多玛赞"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}裂魂者多玛赞{rt8}||[链]需拉一起；[魂]；[狂暴]计时||{rt1}必断/速杀：无；[链]被点名拉一起{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["初诞者卫士"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}初诞者卫士{rt8}||[盾]需破；[激光]；[狂暴]计时||{rt1}必断/速杀：无；破盾、躲激光{rt1}||坦：拉；输出：速杀]],
        }
    },
    ["命运抄写者罗-卡洛"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}命运抄写者罗-卡洛{rt8}||[符]需对应站位；[星]点名；[狂暴]计时||{rt1}必断/速杀：无；按符站位、[星]远离{rt1}||坦：拉；输出：速杀]],
        }
    },
}
addon.GuideData.meta["统御圣所"] = {
    encounterIds = {
        ["初诞者卫士"] = 2446,
        ["九人议会"] = 2439,
        ["裂魂者多玛赞"] = 2445,
        ["耐奥祖残魂"] = 2444,
        ["典狱长之眼"] = 2442,
        ["希尔瓦娜斯·风行者"] = 2441,
        ["塔拉格鲁"] = 2435,
        ["命运抄写者罗-卡洛"] = 2447,
        ["克尔苏加德"] = 2440,
        ["痛苦工匠拉兹纳尔"] = 2443,
    },
    instanceId = 2450,
    isRaid = true,
}

