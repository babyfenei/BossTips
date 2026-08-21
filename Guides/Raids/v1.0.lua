-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["1.0"] = addon.GuideData.raids["1.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.raids["1.0"]["奥妮克希亚的巢穴"] = {
    ["奥妮克希亚"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}奥妮克希亚{rt8}||[深呼吸]喷火扫射需躲侧翼；[火]阶段高额火伤；周期召唤[小龙]||{rt1}必断/速杀：无；[深呼吸]听预警躲侧{rt1}||坦：拉头朝外；治疗：火抗；输出：清小龙]],
        }
    },
}
addon.GuideData.meta["奥妮克希亚的巢穴"] = {
    encounterIds = {
        ["奥妮克希亚"] = 1651,
    },
    instanceId = 249,
    isRaid = true,
}

addon.GuideData.raids["1.0"]["安其拉废墟"] = {
    ["库林纳克斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}库林纳克斯{rt8}||[沙尘爆裂]正面击飞+全团伤害需坦背对人群；[地刺]地底钻出躲红圈；限时击杀否则狂暴||{rt1}必断/速杀：无硬断；[沙尘爆裂]被点名/近战远离正面{rt1}||坦：拉住正面朝外；治疗：团刷应对爆裂；输出：转火钻地小虫]],
        }
    },
    ["拉贾克斯将军"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}拉贾克斯将军{rt8}||[多波小怪]前几波小怪清完才激活将军；小怪带[加速光环]越打越快||{rt1}必断/速杀：无；优先清理来犯小怪再集火将军{rt1}||坦：分坦拉小怪；输出：按波次清小怪]],
        }
    },
    ["莫阿姆"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}莫阿姆{rt8}||[变身]每90秒变为不可控元素，读条[奥术爆炸]全团高伤；变身期间召唤小怪||{rt1}必断/速杀：变身前控制/风筝小怪，变身后转火元素{rt1}||坦：拉住；治疗：预铺应对爆炸；输出：变身阶段转火元素]],
        }
    },
    ["吞咽者布鲁"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}吞咽者布鲁{rt8}||[吐沙]致盲当前坦克需重置仇恨接怪；周期召唤小虫||{rt1}必断/速杀：无；致盲后副坦立刻接怪{rt1}||坦：双坦轮换防致盲；输出：清小虫]],
        }
    },
    ["狩猎者阿亚米斯"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}狩猎者阿亚米斯{rt8}||[上天]阶段飞到空中投[刺钉]牺牲被点名玩家；落地[幼虫]处理||{rt1}必断/速杀：无；被点名刺钉远离人群{rt1}||坦：拉住；输出：天上阶段打翅膀迫降]],
        }
    },
    ["无疤者奥斯里安"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}无疤者奥斯里安{rt8}||[破甲]攻击叠加破甲后自身虚弱3秒；不触发破甲则狂暴团灭||{rt1}必断/速杀：轮流触发破甲，虚弱窗口全力集火{rt1}||坦：保持破甲层数；输出：虚弱期爆发]],
        }
    },
}
addon.GuideData.meta["安其拉废墟"] = {
    encounterIds = {
        ["吞咽者布鲁"] = 1540,
        ["拉贾克斯将军"] = 1538,
        ["库林纳克斯"] = 1537,
        ["无疤者奥斯里安"] = 1542,
        ["莫阿姆"] = 1539,
        ["狩猎者阿亚米斯"] = 1541,
    },
    instanceId = 509,
    isRaid = true,
}

addon.GuideData.raids["1.0"]["安其拉神殿"] = {
    ["预言者斯克拉姆"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}预言者斯克拉姆{rt8}||[分身]同时出现3个分身集火真身；[奥术爆发]全团高伤可断；周期[传送]换位||{rt1}必断/速杀：[奥术爆发]必须打断{rt1}||坦：拉真身；输出：集火真身]],
        }
    },
    ["沙尔图拉"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}沙尔图拉{rt8}||[旋风斩]站桩顺劈需多坦围圈分担；[加速光环]全团加速||{rt1}必断/速杀：无；多坦环形包围分散旋风伤害{rt1}||坦：3坦围圈；输出：站背后]],
        }
    },
    ["顽强的范克瑞斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}顽强的范克瑞斯{rt8}||[虫洞]周期传送小怪需处理；[沙包]坦克被点名拉虫||{rt1}必断/速杀：无；及时清理传送小怪{rt1}||坦：拉住；输出：转火小怪]],
        }
    },
    ["哈霍兰公主"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}哈霍兰公主{rt8}||[毒]高额自然伤害dot；限时击杀否则狂暴||{rt1}必断/速杀：无；[毒]由治疗/猎人驱散{rt1}||坦：拉住；治疗：解毒+团刷]],
        }
    },
    ["安其拉三宝"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}安其拉三宝{rt8}||[三虫同场]维克尼(物理)/维克洛尔(魔法)/维姆同时作战共享节奏||{rt1}必断/速杀：无；三虫轮流转火集火单只{rt1}||坦：分坦；输出：集火一只再换]],
        }
    },
    ["维希度斯"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}维希度斯{rt8}||[冰霜]冰霜法术减速->叠加后[冻结]；冻结状态需高伤砸碎否则解冻||{rt1}必断/速杀：无；冻结瞬间全员全力输出击碎{rt1}||坦：拉住；输出：冰霜叠层后爆发砸碎]],
        }
    },
    ["双子皇帝"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}双子皇帝{rt8}||[维克洛尔]魔法伤害/[维克尼]物理伤害共享血量；周期互换位置需换坦||{rt1}必断/速杀：无；换坦时保持单目标集火{rt1}||坦：双坦分拉换坦；治疗：分边]],
        }
    },
    ["奥罗"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}奥罗{rt8}||[钻地]周期钻入地下后出土[沙尘爆裂]击飞；召唤小虫||{rt1}必断/速杀：无；出土前散开躲爆裂{rt1}||坦：拉住；输出：清小虫]],
        }
    },
    ["克苏恩"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}克苏恩{rt8}||[眼瞳]阶段巨眼激光扫射；[吞噬]点名传送眼球；P2打[身体]弱点眼睛||{rt1}必断/速杀：无；眼瞳阶段躲激光、打巨眼{rt1}||坦：拉住；输出：P2集火身体眼睛]],
        }
    },
}
addon.GuideData.meta["安其拉神殿"] = {
    encounterIds = {
        ["顽强的范克瑞斯"] = 1545,
        ["沙尔图拉"] = 1544,
        ["维希度斯"] = 1548,
        ["安其拉三宝"] = 1547,
        ["双子皇帝"] = 1549,
        ["克苏恩"] = 1551,
        ["奥罗"] = 1550,
        ["哈霍兰公主"] = 1546,
        ["预言者斯克拉姆"] = 1543,
    },
    instanceId = 531,
    isRaid = true,
}

addon.GuideData.raids["1.0"]["熔火之心"] = {
    ["鲁西弗隆"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}鲁西弗隆{rt8}||[暗影诅咒]治疗/输出减益需驱散；[符文盾]法师法术偷取||{rt1}必断/速杀：无；及时驱散诅咒{rt1}||坦：拉住；治疗：驱散]],
        }
    },
    ["玛格曼达"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}玛格曼达{rt8}||[恐慌]周期恐惧全团；限时击杀否则狂暴||{rt1}必断/速杀：无；恐惧时保持输出{rt1}||坦：拉住；输出：持续]],
        }
    },
    ["基赫纳斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}基赫纳斯{rt8}||[暗影灼烧]读条暗伤可断；[招小鬼]刷新小鬼||{rt1}必断/速杀：[暗影灼烧]打断{rt1}||坦：拉住；输出：清小鬼]],
        }
    },
    ["加尔"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}加尔{rt8}||[火元素]8个随从，击杀后[自爆]需分散站位||{rt1}必断/速杀：无；随从死亡后散开躲自爆{rt1}||坦：拉住；输出：先清随从]],
        }
    },
    ["沙斯拉尔"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}沙斯拉尔{rt8}||[闪现]换位；[奥术爆炸]读条可断||{rt1}必断/速杀：[奥术爆炸]打断{rt1}||坦：拉住；输出：远程分散]],
        }
    },
    ["迦顿男爵"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}迦顿男爵{rt8}||[跑暴]自爆需远离人群；[炸弹]点名放圈；[燃烧]dot||{rt1}必断/速杀：无；[跑暴]被点名立刻跑出人群{rt1}||坦：拉住；治疗：团刷]],
        }
    },
    ["萨弗隆先驱者"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}萨弗隆先驱者{rt8}||[火伤]高额火焰；[治疗add]召唤治疗随从需控||{rt1}必断/速杀：控/杀治疗随从{rt1}||坦：拉住；输出：先杀add]],
        }
    },
    ["焚化者古雷曼格"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}焚化者古雷曼格{rt8}||[两只狗]与主人[契约]链接，需分开并打断契约||{rt1}必断/速杀：[契约]把狗拉开并打断{rt1}||坦：拉狗与主分离；输出：转火]],
        }
    },
    ["管理者埃克索图斯"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}管理者埃克索图斯{rt8}||[八顾问]火/冰/暗等分组，需按机制分组击杀后才激活本体||{rt1}必断/速杀：按组清顾问再打本体{rt1}||坦：分坦；输出：分组集火]],
        }
    },
    ["拉格纳罗斯"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}拉格纳罗斯{rt8}||[活体炸弹]点名后爆炸需远离；[击飞]周期击飞坦克；P2[子嗣]需转火||{rt1}必断/速杀：无；[活体炸弹]被点名跑出人群{rt1}||坦：被击飞后归位；输出：P2转火子嗣]],
        }
    },
    ["熔火核心"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}熔火核心{rt8}||[整本]熔火之心为60级40人团本，10首领按鲁西弗隆->拉格纳罗斯顺序推进，以火抗装与驱散为核心||{rt1}必断/速杀：各首领机制见对应条目{rt1}||坦：火抗；治疗：驱散；输出：按机制]],
        }
    },
}
addon.GuideData.meta["熔火之心"] = {
    encounterIds = {
        ["焚化者古雷曼格"] = 1526,
        ["玛格曼达"] = 1520,
        ["基赫纳斯"] = 1521,
        ["管理者埃克索图斯"] = 1527,
        ["沙斯拉尔"] = 1523,
        ["萨弗隆先驱者"] = 1525,
        ["鲁西弗隆"] = 1519,
        ["加尔"] = 1522,
        ["熔火核心"] = 3018,
        ["迦顿男爵"] = 1524,
        ["拉格纳罗斯"] = 1528,
    },
    instanceId = 409,
    isRaid = true,
}

addon.GuideData.raids["1.0"]["祖尔格拉布"] = {
    ["高阶祭司维诺克西斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}高阶祭司维诺克西斯{rt8}||[毒]自然dot；[变蛇]点名变蛇需队友保护||{rt1}必断/速杀：无；[变蛇]被点名远离人群{rt1}||坦：拉住；治疗：解毒]],
        }
    },
    ["高阶祭司耶克里克"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}高阶祭司耶克里克{rt8}||[蝙蝠]心控点名需打断救；[火球]直伤||{rt1}必断/速杀：[心控]速打断救人{rt1}||坦：拉住；输出：救人]],
        }
    },
    ["高阶祭司玛尔里"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}高阶祭司玛尔里{rt8}||[蜘蛛/老虎]双形态切换，老虎形态冲撞、蜘蛛形态毒||{rt1}必断/速杀：无；按形态换站位{rt1}||坦：拉住；输出：转火]],
        }
    },
    ["血领主曼多基尔"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}血领主曼多基尔{rt8}||[处决]点名秒杀需打断；[复活灵魂]队友死亡后复活并获buff||{rt1}必断/速杀：[处决]必须打断{rt1}||坦：拉住；输出：安排断处决]],
        }
    },
    ["疯狂之缘"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}疯狂之缘{rt8}||[随机首领]每次激活4个可选首领之一，机制随出现首领变化||{rt1}必断/速杀：视刷新首领应对{rt1}||坦：看首领；输出：看首领]],
        }
    },
    ["高阶祭司塞卡尔"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}高阶祭司塞卡尔{rt8}||[复活]老虎后狂暴；[老虎]冲撞||{rt1}必断/速杀：无；击杀后防复活{rt1}||坦：拉住；输出：爆发]],
        }
    },
    ["加兹兰卡"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}加兹兰卡{rt8}||[钓鱼]需先钓鱼召唤；[冰霜]高伤||{rt1}必断/速杀：无；先完成任务召唤再打{rt1}||坦：拉住；输出：集火]],
        }
    },
    ["高阶祭司阿洛克"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}高阶祭司阿洛克{rt8}||[豹女]心控点名；[潜行]突袭||{rt1}必断/速杀：[心控]速打断救人{rt1}||坦：拉住；输出：救人]],
        }
    },
    ["妖术师金度"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}妖术师金度{rt8}||[妖术]变骷髅定身；[影子]需同时击杀影子否则回血||{rt1}必断/速杀：无；影子与本体同血需同时打{rt1}||坦：拉住；输出：同打影子]],
        }
    },
    ["哈卡"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}哈卡{rt8}||[吸血]攻击回血；[堕落之血]dot可传播需分散||{rt1}必断/速杀：无；[堕落之血]被点名分散{rt1}||坦：拉住；治疗：驱散]],
        }
    },
}
addon.GuideData.meta["祖尔格拉布"] = {
    encounterIds = {
        ["血领主曼多基尔"] = 787,
        ["高阶祭司维诺克西斯"] = 784,
        ["高阶祭司耶克里克"] = 785,
        ["高阶祭司塞卡尔"] = 789,
        ["哈卡"] = 793,
        ["妖术师金度"] = 792,
        ["高阶祭司阿洛克"] = 791,
        ["加兹兰卡"] = 790,
        ["高阶祭司玛尔里"] = 786,
        ["疯狂之缘"] = 788,
    },
    instanceId = 309,
    isRaid = true,
}

addon.GuideData.raids["1.0"]["纳克萨玛斯"] = {
    ["阿努布雷坎"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}阿努布雷坎{rt8}||[虫群]点名追人需持续跑动；[召唤地穴卫士]需坦接||{rt1}必断/速杀：无；被[虫群]盯者绕圈跑{rt1}||坦：接卫士；输出：清虫]],
        }
    },
    ["黑女巫法琳娜"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}黑女巫法琳娜{rt8}||[狂暴]叠层后秒团，靠打断[鞭挞]抑制||{rt1}必断/速杀：[鞭挞]必须持续打断防狂暴{rt1}||坦：拉住；输出：安排断鞭挞]],
        }
    },
    ["迈克斯纳"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}迈克斯纳{rt8}||[网]定身；[毒]dot；[小蜘蛛]刷新||{rt1}必断/速杀：无；被网者等解救{rt1}||坦：拉住；输出：清蜘蛛]],
        }
    },
    ["药剂师诺斯"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}药剂师诺斯{rt8}||[传送]换位；[冰霜]周期全团冰伤||{rt1}必断/速杀：无；传送后迅速找位{rt1}||坦：拉住；治疗：团刷冰]],
        }
    },
    ["肮脏的希尔盖"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}肮脏的希尔盖{rt8}||[跳舞]经典走位机，踩中死圈即死需跟节奏移动||{rt1}必断/速杀：无；严格按安全圈走位{rt1}||坦：拉住；输出：走位中输出]],
        }
    },
    ["洛欧塞布"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}洛欧塞布{rt8}||[孢子]云内回血；[治疗抑制]周期性禁止治疗||{rt1}必断/速杀：无；治疗卡孢子窗口刷血{rt1}||坦：拉住；治疗：孢子期爆发]],
        }
    },
    ["教官拉苏维奥斯"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}教官拉苏维奥斯{rt8}||[需要学徒]控制小怪对其释放命令，否则团灭||{rt1}必断/速杀：无；控制小怪用[命令]打断本体{rt1}||坦：本体由学员控；输出：控小怪]],
        }
    },
    ["收割者戈提克"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}收割者戈提克{rt8}||[两侧门]活侧与死侧，按节奏换边集火||{rt1}必断/速杀：无；按指示换边{rt1}||坦：分坦；输出：换边转火]],
        }
    },
    ["天启四骑士"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}天启四骑士{rt8}||[印记]叠层换坦，4坦分散站位；共享仇恨机制||{rt1}必断/速杀：无；印记叠层换坦防秒{rt1}||坦：4坦分散换坦；治疗：分边]],
        }
    },
    ["帕奇维克"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}帕奇维克{rt8}||[狂暴]肉搏战，高额普攻；限时击杀||{rt1}必断/速杀：无；坦硬吃伤害{rt1}||坦：主坦硬抗；治疗：预读]],
        }
    },
    ["格罗布鲁斯"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}格罗布鲁斯{rt8}||[毒云]放置后扩散，需边移动边放||{rt1}必断/速杀：无；移动放毒避免叠云{rt1}||坦：拉住移动；输出：跟着移动]],
        }
    },
    ["格拉斯"] = {
        order = 12,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}格拉斯{rt8}||[吃尸]吞噬小怪回血，需控制小怪；[狂暴]计时||{rt1}必断/速杀：控/杀小怪防回血{rt1}||坦：拉住；输出：控小怪]],
        }
    },
    ["塔迪乌斯"] = {
        order = 13,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}塔迪乌斯{rt8}||[极性]正负电荷，同极靠近受伤、异极回血需换边||{rt1}必断/速杀：无；按极性换边站{rt1}||坦：按极性；输出：换边]],
        }
    },
    ["萨菲隆"] = {
        order = 14,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}萨菲隆{rt8}||[冰墓]冻结点名需远离；[深呼吸]扫射躲侧翼||{rt1}必断/速杀：无；冰墓被点名跑开、深呼吸躲侧{rt1}||坦：拉住；输出：躲机制]],
        }
    },
    ["克尔苏加德"] = {
        order = 15,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}克尔苏加德{rt8}||P1[小怪]；P2[寒冰]护盾；P3[心控]点名需打断救||{rt1}必断/速杀：P3[心控]速打断救人{rt1}||坦：拉住；输出：P1清小怪P3救人]],
        }
    },
}
addon.GuideData.meta["纳克萨玛斯"] = {
    encounterIds = {
        ["克尔苏加德"] = 1615,
        ["塔迪乌斯"] = 1613,
        ["教官拉苏维奥斯"] = 1607,
        ["药剂师诺斯"] = 1604,
        ["格拉斯"] = 1612,
        ["格罗布鲁斯"] = 1611,
        ["阿努布雷坎"] = 1601,
        ["迈克斯纳"] = 1603,
        ["帕奇维克"] = 1610,
        ["天启四骑士"] = 1609,
        ["收割者戈提克"] = 1608,
        ["肮脏的希尔盖"] = 1605,
        ["黑女巫法琳娜"] = 1602,
        ["洛欧塞布"] = 1606,
        ["萨菲隆"] = 1614,
    },
    instanceId = 533,
    isRaid = true,
}

addon.GuideData.raids["1.0"]["黑翼之巢"] = {
    ["狂野的拉佐格尔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}狂野的拉佐格尔{rt8}||[控制龙蛋]用控制杖操控红龙灼烧龙蛋；台子小怪持续刷新||{rt1}必断/速杀：无；控龙优先烧最近蛋{rt1}||坦：接管拉怪；输出：控龙烧蛋]],
        }
    },
    ["堕落的瓦拉斯塔兹"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}堕落的瓦拉斯塔兹{rt8}||[自焚]给全团急速增益但自身限血；约3分钟倒计时需速杀||{rt1}必断/速杀：无；利用急速全团爆发输出{rt1}||坦：拉住；输出：全力爆发]],
        }
    },
    ["勒什雷尔"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}勒什雷尔{rt8}||[致死打击]降低治疗75%；标准站桩战||{rt1}必断/速杀：无；治疗注意致死期减疗{rt1}||坦：正面；治疗：预读大加]],
        }
    },
    ["费尔默"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}费尔默{rt8}||[火焰新星]读条全团火伤可断；[顺劈]近战受伤||{rt1}必断/速杀：[火焰新星]必须打断{rt1}||坦：拉住；输出：远程分散]],
        }
    },
    ["埃博诺克"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}埃博诺克{rt8}||[暗影灼烧]读条暗伤可断；[生命偷取]攻击回血||{rt1}必断/速杀：[暗影灼烧]打断{rt1}||坦：拉住；输出：转火]],
        }
    },
    ["弗莱格尔"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}弗莱格尔{rt8}||[火焰新星]读条全团火伤可断；与费尔默机制相似||{rt1}必断/速杀：[火焰新星]打断{rt1}||坦：拉住；输出：远程分散]],
        }
    },
    ["克洛玛古斯"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}克洛玛古斯{rt8}||[五色吐息]随机2种(红火/蓝冰/绿毒/黑暗/青铜)；[元素护盾]需对应法术破除后集火||{rt1}必断/速杀：用对应系法术破[护盾]再集火{rt1}||坦：拉住；输出：破盾后爆发]],
        }
    },
    ["奈法利安"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            normal = [[{rt8}奈法利安{rt8}||[职业debuff]随机给某职业负面；P2[复活血骑士]需在骨堆处理||{rt1}必断/速杀：无；P2优先清复活骨堆{rt1}||坦：拉住；输出：P2转火骨堆]],
        }
    },
}
addon.GuideData.meta["黑翼之巢"] = {
    encounterIds = {
        ["奈法利安"] = 1536,
        ["勒什雷尔"] = 1531,
        ["费尔默"] = 1532,
        ["克洛玛古斯"] = 1535,
        ["埃博诺克"] = 1533,
        ["弗莱格尔"] = 1534,
        ["狂野的拉佐格尔"] = 1529,
        ["堕落的瓦拉斯塔兹"] = 1530,
    },
    instanceId = 469,
    isRaid = true,
}

