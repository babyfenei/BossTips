-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.versions = addon.GuideData.versions or {}
addon.GuideData.versions["8.0"] = addon.GuideData.versions["8.0"] or {}
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.versionInfo["8.0"] = { order = 8, label = [[8.0 争霸艾泽拉斯]] }
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.versions["8.0"]["围攻伯拉勒斯"] = {
    ["'屠夫'血钩"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}'屠夫'血钩{rt8}||[上钩了]被点名风筝跑，把Boss引到[重型军火]炸晕(玩家别踩)||[火炮弹幕]躲轰炸落点；[肉钩]后[血腥冲撞]躲||[沸腾之怒]靠军火清除，坦背对人群躲[沉重挥砍]]=],
        }
    },
    ["恐怖船长洛克伍德"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}恐怖船长洛克伍德{rt8}||[闪避]下用定身/减速留住她(否则脱战)||[狙击炮火]躲标记，[火热弹跳]分散||66%/33%上船，杀小怪掉[不稳定军火]捡起轰船逼回]],
        }
    },
    ["哈达尔·黑渊"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}哈达尔·黑渊{rt8}||[裂水]正面躲，[碎水]脚下白圈躲||满能量[潮汐猛击]两波水墙，站中央雕像后依次躲||坦把Boss拉离雕像与白圈]],
        }
    },
    ["维克戈斯"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}维克戈斯{rt8}||杀[握紧恐惧]触须救工程师修炮(每炮-33%血)||躲[腐臭之潮](可驱散)，[拍击]击退，[碎裂恐惧]别离开近战||转场别被木板卡住]],
        }
    },
    ["拜恩比吉中士"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}拜恩比吉中士{rt8}||[钢铁凝视]点名者把Boss引到[重型军火]上清除[沸腾之怒]并晕Boss(玩家别踩军火)||{rt1}速杀库尔提拉斯军队{rt1}：[沉重挥砍]坦背对人群、[炽热弹头]打全团||躲[火炮弹幕]轰炸区；被[刽子手的套索]拉回后[钢铁风暴]10码远离]],
        }
    },
    ["艾什凡狙击手"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}艾什凡狙击手(重点怪){rt8}||指挥[瞄准炮火]火力线，听台词找掩体||装弹间隙推进，别在开阔线被扫]],
    },
    ["铁潮斩杀者"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}铁潮斩杀者(重点怪){rt8}||[沉重挥砍]正面高伤+眩晕，坦背对人群||优先击杀，被钩前清掉]],
    },
    ["铁潮火枪手"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}铁潮火枪手(重点怪){rt8}||[炽热弹头]对全团造成持续伤害||优先处理，配合[上钩了]点名走位]],
    },
}
addon.GuideData.meta["围攻伯拉勒斯"] = {
    challengeID = 353,
    mapID = 1822,
    journalID = 1023,
}

addon.GuideData.versions["8.0"]["塞塔里斯神庙"] = {
    ["阿德里斯和阿斯匹克斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}阿德里斯和阿斯匹克斯{rt8}||只打带[风暴祝福]减伤的那个，另一个无效||[雷电与风暴]集合分担；[狂风之力]击退前分散||[风暴之风]放圈；[过载]坦减伤；一个死后另一[狂乱]]=],
        }
    },
    ["米利克萨"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}米利克萨{rt8}||[蛇结]缠住队友用定身/控制秒解救人||[毒蛇吐息]放圈，[蛇之风暴]击退躲落点||[钻地]阶段杀蛇救Boss上浮，蛋孵[毒蛇/风暴之蛇]速清]],
        }
    },
    ["加瓦兹特"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}加瓦兹特{rt8}||站Boss与[闪电尖塔]之间挡线，防其充能||别连续挡两层(叠[导电]易伤)；[感应]脚下圈躲||满能量[超载]增伤减伤]],
        }
    },
    ["塞塔里斯的化身"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}塞塔里斯的化身{rt8}||{rt1}腐化守卫{rt1}[腐化生命]优先断/杀防Boss回血||无层数时治疗Boss或用[净化之球]回血||[潜伏诅咒]变蛙驱散，[毒性吐息]断]],
        }
    },
    ["沙誓骑手"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}沙誓骑手(重点怪){rt8}||[沙之冲刷]正面自然DOT，{rt1}打断{rt1}||免疫控制，靠近打减少随机目标伤害]],
    },
    ["潜伏毒蛇"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}潜伏毒蛇(重点怪){rt8}||潜行起手[毒牙]眩晕，先破潜再控||[毒液吐息]随机目标受伤，可驱毒]],
    },
    ["信faithless征服者"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}faithless征服者(重点怪){rt8}||[迷乱心智]随机目标迷失，{rt1}打断{rt1}或驱散||会[释放充能]给队友上buff]],
    },
}
addon.GuideData.meta["塞塔里斯神庙"] = {
    challengeID = 250,
    mapID = 1877,
    journalID = 1030,
    encounterIds = {
        ["阿德里斯和阿斯匹克斯"] = 2124,
        ["米利克萨"] = 2125,
        ["加瓦兹特"] = 2126,
        ["塞塔里斯的化身"] = 2127,
    },
}

addon.GuideData.versions["8.0"]["托尔达戈"] = {
    ["泥沙女王"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}泥沙女王{rt8}||躲脚下[流沙陷阱](击飞+眩晕)，[剧变]钻地后躲落点||[沙暴]全团自然DOT；蜂群死附近Boss[狂暴]叠层||30%进入[狂暴]高急速高伤]],
        }
    },
    ["杰斯·豪里斯"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}杰斯·豪里斯{rt8}||[闪光飞刀]时躲柱后卡视野(全屏物理高伤)||{rt1}嗥叫恐惧{rt1}打断；50%[烟粉]放囚犯，P2集火Boss||注意带[备受鼓舞]的囚犯高伤]],
        }
    },
    ["骑士队长瓦莱莉"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}骑士队长瓦莱莉{rt8}||搬开[军火桶]留一块安全空地(桶遇火[燃烧军火]爆炸)||躲[点燃]/[余烬]火圈，把桶搬到火外||被[引信]点名者远离人群]],
        }
    },
    ["科古斯狱长"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}科古斯狱长{rt8}||{rt1}艾泽里特弹:燃烧{rt1}别叠层(火伤叠高致命)||[死亡瞄准]别在debuff期间再吃第二发||躲炮[巨型爆破]，[心搏停止毒药]全团晕时吃]],
        }
    },
    ["禁闭室囚犯"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}禁闭室囚犯(重点怪){rt8}||杰斯前走廊，[陷阱]型小怪坦开路||未清的角落囚犯P2会ADD，提前清场]],
    },
    ["受鼓舞囚犯"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}受鼓舞囚犯(重点怪){rt8}||杰斯P2释放，叠[备受鼓舞]后砍人极疼||治疗盯紧，坦快速建立仇恨集火]],
    },
}
addon.GuideData.meta["托尔达戈"] = {
    challengeID = 246,
    mapID = 1771,
    journalID = 1002,
    encounterIds = {
        ["泥沙女王"] = 2101,
        ["杰斯·豪里斯"] = 2102,
        ["骑士队长瓦莱莉"] = 2103,
        ["科古斯狱长"] = 2104,
    },
}

addon.GuideData.versions["8.0"]["暴富矿区！！"] = {
    ["投币式群体打击者"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}投币式群体打击者{rt8}||把[艾泽里特足球]踢回Boss上[炽燃艾泽里特]增伤||躲正面[震荡爪]，[金币雨]跳起躲落点||坦定住Boss便于踢球]],
        }
    },
    ["艾泽洛克"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}艾泽洛克{rt8}||用[裂地图腾]控制/晕[大地之怒]小怪再杀||被[狂怒凝视]点名风筝+减速；躲[炽燃艾泽里特]池||[共振quake]全团减速，Boss远离左雷]],
        }
    },
    ["瑞克莎·流火"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}瑞克莎·流火{rt8}||身后别留[艾泽里特催化剂]黄水，绕圈走位||{rt1}推进爆破{rt1}别被推入火/黄水；[化学灼烧]驱散||坦把Boss带离火池]],
        }
    },
    ["商业大亨拉兹敦克"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}商业大亨拉兹敦克{rt8}||P1躲正面[加特林枪]、绕背；[归航飞弹]带离人群||P2被[钻头]点名跑到红柱下让Boss砸中[巨型红火箭]落地||拾喷气背包打空中武器逼其下来]],
        }
    },
    ["爬虫地雷"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}爬虫地雷(重点怪){rt8}||埋地随机激活，[寻敌摧毁]冲向玩家接触即死||可被控，发现即集火秒掉]],
    },
    ["风险投资公司战争机器"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}风险投资公司战争机器(重点怪){rt8}||[加特林枪]正面扫射致命，卡视角或晕断||会[部署 crawler 地雷]，优先处理]],
    },
    ["风险投资公司刺客"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}风险投资公司刺客(重点怪){rt8}||潜行从背后[闷棍]眩晕玩家||用AOE/反隐揭示，控制后击杀]],
    },
}
addon.GuideData.meta["暴富矿区！！"] = {
    challengeID = 247,
    mapID = 1594,
    journalID = 1012,
    encounterIds = {
        ["投币式群体打击者"] = 2105,
        ["艾泽洛克"] = 2106,
        ["瑞克莎·流火"] = 2107,
        ["商业大亨拉兹敦克"] = 2108,
        ["爬虫地雷"] = 3463,
    },
}

addon.GuideData.versions["8.0"]["维克雷斯庄园"] = {
    ["毒心三姝"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}毒心三姝(三巫){rt8}||集火带[专注之眼]的(无眼99%减伤)，另两个无效||[荆棘箭]随机/[恐惧光环]出人群/[冷漠光环]治疗减50%||满能量[心能]全团AoE，一个死后另两个[狂乱]]=],
        }
    },
    ["魂缚巨像"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}魂缚巨像{rt8}||[灵魂收割]层数高时把Boss拉到[野火]烤清层并打断||速拆[灵魂荆棘]救被刺玩家；[碾压]坦减伤||[燃烧之魂]出现躲开]],
        }
    },
    ["贪食的拉尔"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}贪食的拉尔{rt8}||躲[嫩化]正面三连，躲[腐臭喷吐]绿池||{rt1}衰败仆从{rt1}速杀防其到达Boss触发[吞噬仆从]叠增伤||坦拉住靠近的仆从]],
        }
    },
    ["维克雷斯勋爵和夫人"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}维克雷斯勋爵和夫人{rt8}||[中毒]出人群，躲[漩涡]||勋爵[毁灭风暴]坦风筝；夫人[诱惑]驱散/控||分散站位减连带]],
        }
    },
    ["图尔，高莱克"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}图尔，高莱克{rt8}||先杀[死亡触碰奴隶主]，用[炼金火焰]烧尸体防[恐惧精华]复活||躲[黑暗闪电]分散；[死亡透镜]驱散||坦拉住奴隶主]],
        }
    },
    ["死亡触碰奴隶主尸体"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}死亡触碰奴隶主尸体(重点怪){rt8}||图尔区，普通手段杀不死，会[恐惧精华]复活||拾取地上[炼金火焰]烧尸永久清除]],
    },
    ["庄园仆从"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}庄园仆从(重点怪){rt8}||德鲁斯特系小怪多[汲取]/控制，优先断施法||[收割者]拉线高伤，集火处理]],
    },
}
addon.GuideData.meta["维克雷斯庄园"] = {
    challengeID = 248,
    mapID = 1862,
    journalID = 1021,
    encounterIds = {
        ["毒心三姝"] = 2113,
        ["魂缚巨像"] = 2114,
        ["贪食的拉尔"] = 2115,
        ["维克雷斯勋爵和夫人"] = 2116,
        ["图尔，高莱克"] = 2117,
    },
}

addon.GuideData.versions["8.0"]["自由镇"] = {
    ["天空上尉库拉格"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}天空上尉库拉格{rt8}||分散站位减[艾泽里特火药射击]正面伤害||{rt1}活化药剂{rt1}打断防Boss回血(打断掉酒瓶可捡)||75%下鲨饵[恶毒轰炸]，躲[俯冲轰炸]击退]],
        }
    },
    ["海盗议会"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}海盗议会{rt8}||先结盟一位船长吃[同心旗帜]增益||{rt1}切割爆破{rt1}(尤多拉)打断；[黑桶]砸桶解除队友迷失||坦躲[酒桶猛砸]正面，吃[投酒]增伤]],
        }
    },
    ["藏宝竞技场"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}藏宝竞技场(特罗萨克){rt8}||别站在特罗萨克与[扑腾鲨鱼]连线(重击)上||[扑腾鲨鱼]会游向最近目标，拉远离人群||BOSS扔鲨鱼时躲开落点]],
        }
    },
    ["哈兰·斯威提"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}哈兰·斯威提{rt8}||站Boss背后躲[迅风军刀](灌铅前)；[火炮齐射]躲标记||{rt1}黑火药炸弹{rt1}拦截铁潮爆破兵防自爆||60%/30%[灌铅骰子]：全速前进多目标、战舰攻速翻倍]],
        }
    },
    ["铁潮火枪手"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}铁潮火枪手(重点怪){rt8}||[炽热弹头]对全团造成持续伤害||优先击杀，被[上钩了]点名时远离人群]],
    },
    ["黑喙海盗"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}黑喙海盗(重点怪){rt8}||库拉格前鲨鱼相关小怪，[鲨鱼撕咬]高伤||可控制，集火处理避免ADD]],
    },
    ["铁潮爆破兵"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}铁潮爆破兵(重点怪){rt8}||向随机目标冲撞并自爆[黑火药炸弹]||坦克拦截或控住，防其炸到人群]],
    },
}
addon.GuideData.meta["自由镇"] = {
    challengeID = 245,
    mapID = 1754,
    journalID = 1001,
    encounterIds = {
        ["天空上尉库拉格"] = 2093,
        ["海盗议会"] = 2094,
        ["藏宝竞技场"] = 2095,
        ["哈兰·斯威提"] = 2096,
    },
}

addon.GuideData.versions["8.0"]["诸王之眠"] = {
    ["黄金风蛇"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}黄金风蛇{rt8}||[吐金]放黄水远离Boss，[财富召唤]动画黄金靠近上盾+增伤速杀||[蛇之疾风]击退远离，[尾鞭]坦减伤||Boss读条时不移动便于走位]],
        }
    },
    ["殓尸者姆沁巴"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}殓尸者姆沁巴{rt8}||[汲取体液]用免疫打断防[干枯]；被[埋葬]看抖动开对应棺材救人||躲[燃烧腐蚀]火，杀[半成品木乃伊]||治疗把[干枯]目标奶过90%解除]],
        }
    },
    ["部族议会"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}部族议会(库拉/阿卡利/扎纳扎尔){rt8}||库拉[旋飞斧]出近战、[裂斧]DOT；阿卡利[蛮力冲撞]分散、[削弱反手]坦减伤||扎纳扎尔[奥术闪电]分散、{rt1}毒新星{rt1}断、[元素召唤]炸图腾||死掉的会回骨灰坛再放技能]],
        }
    },
    ["始皇达萨"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}始皇达萨{rt8}||80%骑[扎拉]跳跃；[利刃连击]坦减伤、[镀金毁灭]长矛标点躲||[钉刺长矛]躲天花板落矛；[死亡怒吼]断||坐骑[狂暴撕咬]坦减伤驱散流血]],
        }
    },
    ["活化守卫"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}活化守卫(重点怪){rt8}||[压制打击]大扇形高伤+眩晕，躲正面||低血[狂怒]近战加速，用消怒技能清掉]],
    },
    ["线之仆从"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}线之仆从(重点怪){rt8}||带护盾血量1，破盾/驱散魔法即秒杀||集火或驱散处理，别浪费输出]],
    },
    ["治疗之潮图腾"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}治疗之潮图腾(重点怪){rt8}||议会走廊，[治疗之潮]给小怪回血||优先集火秒掉，否则拉怪永不清]],
    },
}
addon.GuideData.meta["诸王之眠"] = {
    challengeID = 249,
    mapID = 1762,
    journalID = 1041,
    encounterIds = {
        ["黄金风蛇"] = 2139,
        ["殓尸者姆沁巴"] = 2140,
        ["部族议会"] = 2142,
        ["始皇达萨"] = 2143,
    },
}

addon.GuideData.versions["8.0"]["阿塔达萨"] = {
    ["女祭司阿伦扎"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}女祭司阿伦扎{rt8}||站[污血]池边，[输血]读条瞬间踩入污血反伤Boss(否则Boss回血)||{rt1}熔火黄金{rt1}可驱散，坦开减伤吃[鎏金之爪]||优先清[黄金之灵]防其吞掉污血池]],
        }
    },
    ["沃卡尔"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}沃卡尔{rt8}||3个{rt1}复生图腾{rt1}必须同时击杀，否则[复活]满血||躲[剧毒跳跃]与脚下[毒池]，[急速衰败]阶段绕场走位||{rt1}恶性恶臭{rt1}打断(全团自然DOT)]],
        }
    },
    ["莱赞"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}莱赞{rt8}||[恐惧之相]时绕柱卡视野躲恐惧||被[追猎]点名风筝远离[远古枯骨]，[吞噬]集火救人||坦开减伤吃[利齿]，保护被召唤的迅猛龙]],
        }
    },
    ["亚兹玛"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}亚兹玛{rt8}||[暗影之回声]躲开，带[灵魂裂劈]debuff时远离亚兹玛||{rt1}灵魂之卵{rt1}生成前往Boss前必须击杀||坦减伤吃[穿骨]，分身阶段优先处理分身]],
        }
    },
    ["黄金之灵"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}黄金之灵(重点怪){rt8}||阿伦扎区小怪，会吞吸[污血]池使Boss回血||易被控制，优先击杀或用晕/定身阻止其吃池]],
    },
    ["复活的迅猛龙"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}复活的迅猛龙(重点怪){rt8}||莱赞区迅捷龙，坦克拉住||远离[古代枯骨]堆，被[追猎]时点名者风筝引开]],
    },
}
addon.GuideData.meta["阿塔达萨"] = {
    challengeID = 244,
    mapID = 1763,
    journalID = 968,
    encounterIds = {
        ["女祭司阿伦扎"] = 2084,
        ["沃卡尔"] = 2085,
        ["莱赞"] = 2086,
        ["亚兹玛"] = 2087,
    },
}

addon.GuideData.versions["8.0"]["风暴神殿"] = {
    ["阿库希尔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}阿库希尔{rt8}||[窒息浪花]点名出人群，[暗流]击退躲||[汹涌冲锋]躲冲锋线；[窒息之溴]驱散||50%分身成小触手，速杀小怪使Boss重组]],
        }
    },
    ["海贤议会"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}海贤议会(铁壳/风女){rt8}||{rt1}切割爆破{rt1}(风女)打断；[风暴祝福]下打断会[反冲]出龙卷||坦躲[钢铁祝福]正面[阻碍重斩]；站[强化结界]绿圈减伤||[迅捷结界]灰圈加速免疫减速]],
        }
    },
    ["斯托颂勋爵"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}斯托颂勋爵{rt8}||被[古神心智]点名者撞[觉醒虚空]球打到50%解控||{rt1}虚空箭{rt1}断；[心智撕裂]驱散||躲[唤醒虚空]，球追人时远离]],
        }
    },
    ["低语者沃尔兹斯"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}低语者沃尔兹斯{rt8}||把Boss拉离[深渊之门]沉默圈(永久)||躲[触须猛击]落点；[深海呼唤]召唤触手优先杀防充能||[沉没之城之握]水下杀[被遗忘住民]返回]],
        }
    },
    ["水母"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}水母(重点怪){rt8}||游泳段别撞带电水母，触之高伤+眩晕8秒||沿安全路线通过，留意电击范围]],
    },
    ["深渊鳗鱼"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}深渊鳗鱼(重点怪){rt8}||[深渊打击]暗影DOT不可断不可驱||坦拉住，治疗刷血，速杀防叠层]],
    },
    ["被遗忘的住民"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}被遗忘的住民(重点怪){rt8}||[吞噬精华]全团暗伤并自疗，{rt1}逐个打断{rt1}||一次集火一个防其读条回血]],
    },
}
addon.GuideData.meta["风暴神殿"] = {
    challengeID = 252,
    mapID = 1864,
    journalID = 1036,
    encounterIds = {
        ["阿库希尔"] = 2130,
        ["海贤议会"] = 2131,
        ["斯托颂勋爵"] = 2132,
        ["低语者沃尔兹斯"] = 2133,
    },
}

