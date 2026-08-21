-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.versions = addon.GuideData.versions or {}
addon.GuideData.versions["3.0"] = addon.GuideData.versions["3.0"] or {}
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.versionInfo["3.0"] = { order = 3, label = [[3.0 巫妖王之怒]] }
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.versions["3.0"]["乌特加德之巅"] = {
    ["席瓦拉·索格蕾"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}席瓦拉·索格蕾{rt8}||把Boss拉到台阶；她飞空放[仪式之剑]绑随机玩家，合力杀导魔师救人||{rt1}速杀：导魔师(女妖){rt1}||20秒内剑落引爆，救人优先]],
        }
    },
    ["戈托克·苍蹄"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}戈托克·苍蹄{rt8}||木桩战；[枯萎咆哮]全团掉血+降血上限可叠，治疗压力大||{rt1}必断：[穿刺]dot{rt1}||可缴械；DPS生存下最大化输出]],
        }
    },
    ["残忍的斯卡迪"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}残忍的斯卡迪{rt8}||用鱼叉绑Boss；[旋风斩]近战远离，[毒矛]可解||{rt1}速杀：小怪捡鱼叉{rt1}||深呼吸时站无冰雾处]],
        }
    },
    ["伊米隆国王"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}伊米隆国王{rt8}||[灾祸]时全团停手；[恶臭腐烂]疾病解掉||66%/33%召国王灵魂获新技能，可驱散||坦背对，躲[黑暗猛击]]=],
        }
    },
    ["维库治疗者"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}维库治疗者{rt8}||给维库人加血，优先击杀/打断治疗||{rt1}必断：治疗{rt1}||]],
    },
    ["始祖龙骑兵"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}始祖龙骑兵{rt8}||龙背投掷+顺劈；斯卡迪战前用鱼叉射龙||远离龙头吐息]],
    },
    ["狂暴维库人"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}狂暴维库人{rt8}||会激怒，控制或优先转火||]],
    },
}
addon.GuideData.meta["乌特加德之巅"] = {
    mapID = 575,
    journalID = 286,
}

addon.GuideData.versions["3.0"]["乌特加德城堡"] = {
    ["凯雷塞斯王子"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}凯雷塞斯王子{rt8}||先杀4个维库议员再开Boss；[冰之坟墓]选中打掉救人；[召唤骷髅]群拉A掉||{rt1}速杀：冰之坟墓/骷髅{rt1}||中冰墓可冰箱/无敌/徽章解；优先清骷髅]],
        }
    },
    ["斯卡瓦尔德和达尔隆"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}斯卡瓦尔德和达尔隆{rt8}||先杀法系达尔隆([暗影箭])再杀近战斯卡瓦尔德([冲锋][石头打击击退])||{rt1}必断：达尔隆[暗影箭]、斯卡瓦尔德[石头打击]{rt1}||任一死后变鬼魂复活且无法稳定拉，近战死后易OT治疗]],
        }
    },
    ["掠夺者因格瓦尔"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}掠夺者因格瓦尔{rt8}||P1坦背对人群躲[顺劈斩]/[强力顺劈]，[惊愕怒吼]法系取消读条||P2亡灵形态[暗影斧]绕柱躲、[悲叹怒喉]走开||斧子移动慢，靠柱子规避]],
        }
    },
    ["符文师"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}符文师{rt8}||给自己/队友上各类符文([爆炸符文]最危险)，优先击杀||{rt1}速杀：符文师{rt1}||拉怪别背朝其他怪以免ADD]],
    },
    ["原始龙"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}原始龙{rt8}||喷火+击退，拉怪时别背朝其他怪||坦克吃正面，远程分散站位]],
    },
    ["投掷人形怪"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}投掷人形怪{rt8}||因格瓦尔前2波：投掷者+狼+骑龙骑兵，控好再打||{rt1}速杀：投掷者{rt1}||]],
    },
}
addon.GuideData.meta["乌特加德城堡"] = {
    mapID = 574,
    journalID = 285,
}

addon.GuideData.versions["3.0"]["冠军的试炼"] = {
    ["总冠军"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}总冠军{rt8}||载具战：架子上拿长枪上马；[投枪]破盾[冲锋]输出||带战神分担；打落马踩一下]],
        }
    },
    ["纯洁者耶德瑞克"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}纯洁者耶德瑞克{rt8}||随机其一；[忏悔]解、[神圣之盾]破盾；帕尔崔丝召记忆打断加血||观众扔道具躲避]],
        }
    },
    ["黑骑士"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}黑骑士{rt8}||P1[食尸鬼]坦拉；P2[死亡印记]跑开；P3[死灵漩涡]躲||三阶段依次触发]],
        }
    },
    ["银色神官帕尔崔丝"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}银色神官帕尔崔丝{rt8}||50%血召[往日回忆]幻象并给自己加反射护盾(减伤+反弹)；先杀幻象破盾再打Boss||{rt1}必断：[神圣惩击][神圣之火]{rt1}||[恢复]打断；幻象[梦魇乍醒]恐惧、[昔日阴影]减速90%、[旧患]物理DOT]],
        }
    },
    ["持戟士兵"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}持戟士兵{rt8}||载具阶段小怪；三层盾+投枪冲锋A掉||{rt1}速杀：小怪{rt1}||]],
    },
    ["观众"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}观众{rt8}||看台扔陷阱/眩晕苹果，密集掉落尽量躲||]],
    },
}
addon.GuideData.meta["冠军的试炼"] = {
    mapID = 650,
    journalID = 284,
}

addon.GuideData.versions["3.0"]["古达克"] = {
    ["斯拉德兰"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}斯拉德兰{rt8}||[剧毒新星]离15码；召[毒蛇]优先A掉(缠绕需打破茧)||坦绕场外拉]],
        }
    },
    ["达卡莱巨像"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}达卡莱巨像{rt8}||50%分裂[达卡莱元素]无敌本体；躲[紫粘液]；元素50%合体循环||坦绕场拉，全团移动]],
        }
    },
    ["莫拉比"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}莫拉比{rt8}||[变身长毛象]打断施法(30%后仅0.5秒)；变身后地震翻倍||轮流踢/沉默]],
        }
    },
    ["迦尔达拉"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}迦尔达拉{rt8}||犀牛形态[穿刺]救被挂角者；人形态[旋风斩]近战躲||分散站位]],
        }
    },
    ["凶残的伊克"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}凶残的伊克{rt8}||英雄限定；[喷吐]锥形坦背对；90秒[狂暴]坦开盾墙||会扑向任意队员，坦抢仇]],
        }
    },
    ["达卡莱祭司"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}达卡莱祭司{rt8}||给巨魔加血，优先击杀/打断||{rt1}必断：治疗{rt1}||]],
    },
    ["达卡莱火焰编织者"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}达卡莱火焰编织者{rt8}||击退/推下悬崖，背靠墙站；控场优先||{rt1}速杀：地震者{rt1}||]],
    },
}
addon.GuideData.meta["古达克"] = {
    mapID = 604,
    journalID = 274,
}

addon.GuideData.versions["3.0"]["安卡赫特：古代王国"] = {
    ["纳多克斯长老"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}纳多克斯长老{rt8}||[巢穴热疫]疾病解；[安卡哈尔守护者]刷新立刻杀(光环使Boss无敌)||{rt1}速杀：守护者{rt1}||小虫A掉]],
        }
    },
    ["塔达拉姆王子"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}塔达拉姆王子{rt8}||[暗影之拥]吸血，被吸时全团输出救人；[火焰之球]跑开||[嗜血]回血||]],
        }
    },
    ["耶戈达·觅影者"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}耶戈达·觅影者{rt8}||[牺牲]点名玩家，其他人远离被点名者||[闪电链]分散||她从天而降]],
        }
    },
    ["传令官沃拉兹"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}传令官沃拉兹{rt8}||[疯狂]打镜像之魂(自己的幻象)，停手等清醒||{rt1}必断/速杀：镜像{rt1}||全团集中避免误伤]],
        }
    },
    ["埃曼尼塔"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}埃曼尼塔{rt8}||[迷你]全员伤害-75%：站健康蘑菇旁击杀蘑菇解除；[毒蘑菇]踩到受DOT||{rt1}必解：[毒液箭][纠缠根须]{rt1}||英雄难度专属可选；禁用AOE以免找不到健康蘑菇；[击退]坦注意走位]],
        }
    },
    ["安卡哈尔守望者"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}安卡哈尔守望者{rt8}||[黑暗之矛]暗影箭，打断||{rt1}必断：黑暗之矛{rt1}||]],
    },
    ["黑暗信徒"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}黑暗信徒{rt8}||给无面者加血，优先击杀/打断||{rt1}必断：治疗{rt1}||]],
    },
    ["无面者追随者"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}无面者追随者{rt8}||[群体恐惧]，解恐惧/徽章||分散站位]],
    },
}
addon.GuideData.meta["安卡赫特：古代王国"] = {
    mapID = 619,
    journalID = 271,
}

addon.GuideData.versions["3.0"]["岩石大厅"] = {
    ["悲伤圣女"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}悲伤圣女{rt8}||[悲哀之柱]躲光柱；[悲伤风暴]黑水站外；[悲痛来袭]忏悔定身解||坦拉中央]],
        }
    },
    ["克莱斯塔卢斯"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}克莱斯塔卢斯{rt8}||[巨石投掷]躲；[践踏]后远离；[裂石]石化互相伤害||全团散开别站一堆]],
        }
    },
    ["塑铁者斯约尼尔"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}塑铁者斯约尼尔{rt8}||[闪电护盾]别贴脸打(反伤)；[铁淤泥]减速躲||坦背对，远程输出]],
        }
    },
    ["远古法庭"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}远古法庭{rt8}||护送布莱恩·铜须事件(非Boss战)：3张面具依次放奥术弹/暗影球/火光束；小怪直冲布莱恩需坦拉住||{rt1}必拉：暗符文守护者/法师{rt1}||保护布莱恩(约4万血)别阵亡；移动躲开地面光束与暗影落点]],
        }
    },
    ["冷酷的构造者"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}冷酷的构造者{rt8}||会[昏迷]；残血[自爆]，优先击杀或远离||{rt1}速杀：构造者{rt1}||]],
    },
    ["铁矮人法师"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}铁矮人法师{rt8}||高伤法系，优先击杀/打断||{rt1}必断：暗影箭{rt1}||]],
    },
}
addon.GuideData.meta["岩石大厅"] = {
    mapID = 599,
    journalID = 277,
}

addon.GuideData.versions["3.0"]["映像大厅"] = {
    ["法瑞克"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}法瑞克{rt8}||[绝望]降全团输出/治疗；[群体攻击]无群补压力大||清4波鬼兵再打]],
        }
    },
    ["玛维恩"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}玛维恩{rt8}||[腐蚀之井]快速离开；[腐化血肉]坦血上限-25%||[灭寂]坦开保命]],
        }
    },
    ["逃离阿尔萨斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}逃离阿尔萨斯{rt8}||逃脱战：跟领袖前进，清小兵冰墙消失；别打Boss([霜之哀伤烈怒]灭团)||[冷酷凛冬]10码外掉血]],
        }
    },
    ["鬼魅牧师"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}鬼魅牧师{rt8}||[群体恐惧]+[黑暗治疗]，优先击杀/打断||{rt1}必断：治疗/恐惧{rt1}||]],
    },
    ["魅影法师"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}魅影法师{rt8}||召[幻象]被杀爆炸，远离；[烈焰风暴]躲||{rt1}必断：火球{rt1}||]],
    },
    ["复活的巫医"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}复活的巫医{rt8}||逃脱战[暗影箭雨]+[末日诅咒]，最先处理||{rt1}速杀：巫医{rt1}||]],
    },
}
addon.GuideData.meta["映像大厅"] = {
    mapID = 668,
    journalID = 276,
}

addon.GuideData.versions["3.0"]["灵魂洪炉"] = {
    ["布隆亚姆"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}布隆亚姆{rt8}||坦拉中央背对；[灵魂碎片]球DPS打掉否则Boss回血||{rt1}速杀：灵魂碎片{rt1}||40%[灵魂风暴]全团贴近集合]],
        }
    },
    ["噬魂者"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}噬魂者{rt8}||[镜像之魂]链接时停手；[魅影冲击]打断||{rt1}必断：[魅影冲击]{rt1}||随机传人进领域，打掉小灵魂出来]],
        }
    },
    ["饥饿鬼魂"] = {
        order = 3,
        type = "MOB",
        tips = [[{rt8}饥饿鬼魂{rt8}||[群体恐惧]，坦拉后优先秒掉别乱跑ADD||{rt1}速杀：鬼魂{rt1}||]],
    },
    ["灵魂收割者"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}灵魂收割者{rt8}||给坦叠可驱散掉血DOT，治疗及时驱散||]],
    },
    ["灵魂碎片"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}灵魂碎片{rt8}||布隆亚姆战刷新，DPS打掉防Boss吸血||{rt1}速杀：碎片{rt1}||]],
    },
}
addon.GuideData.meta["灵魂洪炉"] = {
    mapID = 632,
    journalID = 280,
}

addon.GuideData.versions["3.0"]["紫罗兰监狱"] = {
    ["埃雷克姆"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}埃雷克姆{rt8}||带2护卫；先杀护卫再杀Boss，[嗜血]驱散||{rt1}必断：护卫治疗链{rt1}||英雄留一护卫最后杀]],
        }
    },
    ["摩拉格"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}摩拉格{rt8}||[心灵鞭笞]；给坦[百分比掉血DOT]刷好||坦住输出即可]],
        }
    },
    ["艾库隆"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}艾库隆{rt8}||打掉[保护泡泡]护盾(破后击退+出水元素)；清小水否则给Boss加血||分散]],
        }
    },
    ["谢沃兹"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}谢沃兹{rt8}||[秘法弹幕]；召[伊斯利之球]奥暴，不管球绕台阶打Boss||]],
        }
    },
    ["拉文索尔"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}拉文索尔{rt8}||龙Boss；[寒冰炸弹]上天时跑到中间高台；8码分散躲[刺骨寒风]||不去龙头龙尾]],
        }
    },
    ["湮灭者祖拉玛特"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}湮灭者祖拉玛特{rt8}||[虚空斥候]小恶魔大量AOE；多菜刀，驱散Boss减疗BUFF||成就：不杀虚空斥候]],
        }
    },
    ["塞安妮苟萨"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}塞安妮苟萨{rt8}||尾王；[奥术吐息]坦背对；[暴风雪]/[顺劈]躲||英雄用防御水晶保持封印100%]],
        }
    },
    ["监狱守卫"] = {
        order = 8,
        type = "MOB",
        tips = [[{rt8}监狱守卫{rt8}||每波Boss带2-3守卫，优先清掉；[防御水晶]保持封印别掉||{rt1}速杀：随从{rt1}||看守NPC别杀]],
    },
}
addon.GuideData.meta["紫罗兰监狱"] = {
    mapID = 608,
    journalID = 283,
}

addon.GuideData.versions["3.0"]["艾卓-尼鲁布"] = {
    ["看门者克里克希尔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}看门者克里克希尔{rt8}||[精神鞭笞]打断；[疲劳诅咒]减速解；[召唤小虫]A掉||10%激怒||成就：三看守者存活时击杀]],
        }
    },
    ["哈多诺克斯"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}哈多诺克斯{rt8}||[毒云]躲；[蛛网之握]定身需队友打破||[吸血]小蜘蛛别进毒云回血||坦拉远离洞口]],
        }
    },
    ["阿努巴拉克"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}阿努巴拉克{rt8}||每25%钻地召小怪+[穿刺]；地上阶段集火||[虫群风暴]躲||保持集体行动]],
        }
    },
    ["看守者"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}看守者{rt8}||群体喷毒/致盲/激怒，注意走位规避||{rt1}必断：[群体致盲]{rt1}||]],
    },
    ["尼鲁布潜地者"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}尼鲁布潜地者{rt8}||钻地后[钻地突袭]从脚下冒出，保持移动||]],
    },
    ["蛛网施法者"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}蛛网施法者{rt8}||[蛛网]定身队友，及时打破救出||{rt1}必断：蛛网{rt1}||]],
    },
}
addon.GuideData.meta["艾卓-尼鲁布"] = {
    mapID = 601,
    journalID = 272,
}

addon.GuideData.versions["3.0"]["萨隆矿坑"] = {
    ["熔炉之主加弗斯特"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}熔炉之主加弗斯特{rt8}||[永久冻土]用萨钢岩石卡视角躲光环；[雷霆践踏]躲；[冰封]减速解||33%升武器冰伤翻倍，注意层数]],
        }
    },
    ["伊克和科瑞克"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}伊克和科瑞克{rt8}||[毒池]躲；[追逐]被点名风筝；[爆炸箭雨]移动躲球||克里克在背上指挥]],
        }
    },
    ["天灾领主泰兰努斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}天灾领主泰兰努斯{rt8}||[霸主烙纹]别打带DEBUFF(反弹坦)；[霜牙印记]跑开避免连晕||[冰霜吐息]里姆芬空中分散；风筝穿过冰面]],
        }
    },
    ["死亡低语暗影施法者"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}死亡低语暗影施法者{rt8}||[种子/暗影箭]，打断；与折磨者组队||{rt1}必断：暗影箭{rt1}||]],
    },
    ["天空召唤者+冰霜始祖龙"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}天空召唤者+冰霜始祖龙{rt8}||龙背[冰霜吐息]远程难拉；优先打下龙/龙||{rt1}速杀：始祖龙{rt1}||]],
    },
    ["折磨者"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}折磨者{rt8}||[黑烙印]中者受暗影伤+50%，驱散||{rt1}必断：诅咒{rt1}||]],
    },
}
addon.GuideData.meta["萨隆矿坑"] = {
    challengeID = 556,
    mapID = 658,
    journalID = 278,
    encounterIds = {
        ["熔炉之主加弗斯特"] = 1999,
        ["伊克和科瑞克"] = 2000,
        ["天灾领主泰兰努斯"] = 2001,
    },
}

addon.GuideData.versions["3.0"]["达克萨隆要塞"] = {
    ["托尔戈"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}托尔戈{rt8}||[吞噬]叠伤害(可卡视角)；[尸体爆炸]躲5码；[感染之伤]疾病解||小怪涌出，坦群拉A掉||]],
        }
    },
    ["召唤者诺沃斯"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}召唤者诺沃斯{rt8}||[奥术力场]保护；杀4个[水晶处理者]断其召唤||[暴风雪]躲||楼梯两端小怪清完再打Boss]],
        }
    },
    ["暴龙之王爵德"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}暴龙之王爵德{rt8}||[低沉咆哮]恐惧；把Boss拉出笼子避免恐惧ADD||[撕裂猛击]坦开保命||]],
        }
    },
    ["先知萨隆亚"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}先知萨隆亚{rt8}||[毒云]躲；[血肉凋零]变骷髅(仅坦嘲，其他人骨盾/输出)||DOT和宠物继续生效||]],
        }
    },
    ["灵魂法师"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}灵魂法师{rt8}||地上放[黑水/虚空区域]高伤，踩到速清；优先杀||{rt1}速杀：灵魂法师{rt1}||]],
    },
    ["达卡莱萨满"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}达卡莱萨满{rt8}||给战士加血，先杀萨满再打指挥||{rt1}必断：治疗{rt1}||]],
    },
    ["蜘蛛"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}蜘蛛{rt8}||残血会逃跑召小蜘蛛，控住秒掉别让其脱战||]],
    },
}
addon.GuideData.meta["达克萨隆要塞"] = {
    mapID = 600,
    journalID = 273,
}

addon.GuideData.versions["3.0"]["闪电大厅"] = {
    ["比亚格里将军"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}比亚格里将军{rt8}||三姿态：[狂暴]旋风斩躲、[武器]致死刷血、[防御]盾反别读条||带电时别打，转火小怪]],
        }
    },
    ["沃尔坎"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}沃尔坎{rt8}||[碎裂践踏]时远离[石像]；快速杀[熔岩傀儡]||BOSS<30%放碎裂践踏]],
        }
    },
    ["艾欧纳尔"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}艾欧纳尔{rt8}||[静电过载]中者离开人群；[消散]变电球全躲，往入口跑||[球形闪电]落地躲]],
        }
    },
    ["洛肯"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}洛肯{rt8}||[闪电新星]读条时后跑约20码；[闪电光环]越近伤越低站20码||[弧形闪电]跳，分散]],
        }
    },
    ["符文矮人施法者"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}符文矮人施法者{rt8}||[闪电链]高伤，优先击杀/打断||{rt1}必断：闪电链{rt1}||]],
    },
    ["熔岩傀儡"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}熔岩傀儡{rt8}||死亡爆炸；别站尸体旁，拉到斜坡A掉||[融化护甲]可叠十层]],
    },
}
addon.GuideData.meta["闪电大厅"] = {
    mapID = 602,
    journalID = 275,
}

addon.GuideData.versions["3.0"]["魔枢"] = {
    ["大魔导师泰蕾丝塔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}大魔导师泰蕾丝塔{rt8}||66%/33%分身(火/冰/奥)；分身时集火逐个，AOE同斩||{rt1}必断：[暴风雪][冰霜新星]{rt1}||[重力之井]躲；分身施法时无法打死]],
        }
    },
    ["阿诺玛鲁斯"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}阿诺玛鲁斯{rt8}||[混乱裂隙]躲开15码；[裂隙充能]时Boss缩小无敌，杀小光球结束||治疗站最后，轮流吃闪电||成就：不破裂隙击杀]],
        }
    },
    ["塑树者奥莫洛克"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}塑树者奥莫洛克{rt8}||[法术反射]别读条/别打；[水晶尖刺]躲||[践踏]后远离||坦背对]],
        }
    },
    ["克莉斯塔萨"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}克莉斯塔萨{rt8}||[极度寒冷]叠层减速保持移动；[水晶喷吐]躲正面||坦拉墙角，全团分散]],
        }
    },
    ["指挥官库鲁尔格"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}指挥官库鲁尔格{rt8}||[旋风斩]8码范围躲近战；[冲锋]随机昏迷2秒；[破胆怒吼]群体恐惧4.5秒||{rt1}速杀：2个会治疗的小怪{rt1}||英雄难度才出现(部落视角)；拉到房间入口避免恐惧ADD；[战斗怒吼]使盟友伤害+20%]],
        }
    },
    ["指挥官斯托比德"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}指挥官斯托比德{rt8}||[旋风斩]8码范围躲近战；[冲锋]随机昏迷2秒；[破胆怒吼]群体恐惧4.5秒||{rt1}速杀：2个会治疗的小怪{rt1}||英雄难度才出现(联盟视角)；拉到房间入口避免恐惧ADD；[战斗怒吼]使盟友伤害+20%]],
        }
    },
    ["法力猎手"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}法力猎手{rt8}||抽蓝+[恢复]自疗，优先击杀/打断||{rt1}必断：[恢复][魔法燃烧]{rt1}||]],
    },
    ["魔网奇术师"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}魔网奇术师{rt8}||[暴风雪]等读条，打断||{rt1}必断：暴风雪{rt1}||]],
    },
}
addon.GuideData.meta["魔枢"] = {
    mapID = 576,
    journalID = 281,
}

addon.GuideData.versions["3.0"]["魔环"] = {
    ["审讯者达库斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}审讯者达库斯{rt8}||[炸弹]地雷躲；骑龙作战，坦用龙拉||清掉2随从]],
        }
    },
    ["瓦尔洛斯·云击"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}瓦尔洛斯·云击{rt8}||背后打(正面AOE)；骑龙绕后输出||[闪电链]分散]],
        }
    },
    ["法师领主伊洛姆"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}法师领主伊洛姆{rt8}||先清小怪再打；[时间停滞]晕，[暴风雪]躲||召幻象]],
        }
    },
    ["魔网守护者埃雷苟斯"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}魔网守护者埃雷苟斯{rt8}||龙对龙；[位面转移]躲蓝圈；[奥术弹幕]分散||全团站Boss脚下]],
        }
    },
    ["魔网幼龙"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}魔网幼龙{rt8}||开局必须骑乘的龙，用龙技能作战||{rt1}速杀：敌方龙{rt1}||]],
    },
    ["虚灵法师"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}虚灵法师{rt8}||施法者，打断||{rt1}必断：暗影箭{rt1}||]],
    },
}
addon.GuideData.meta["魔环"] = {
    mapID = 578,
    journalID = 282,
}

