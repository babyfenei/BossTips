-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.versions = addon.GuideData.versions or {}
addon.GuideData.versions["10.0"] = addon.GuideData.versions["10.0"] or {}
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.versionInfo["10.0"] = { order = 10, label = [[10.0 巨龙时代]] }
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.versions["10.0"]["奈萨鲁斯"] = {
    ["查尔加斯，龙鳞之灾"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}查尔加斯，龙鳞之灾{rt8}||[束地之矛]点名3人，拉锁链撞BOSS破链(破链AOE可叠)||躲[岩浆波]/[迸发之地]；[利刃锁定]满能量时打破其专注]],
        }
    },
    ["熔炉主管戈雷克"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}熔炉主管戈雷克{rt8}||[熔炉之力]回砧锤击全队开治疗；[烈焰之盾]点名X十字火分散||[炽炎之锤]每段后躲圈；T[炽热挥击]击退开减伤；{rt1}断[铸造风暴]{rt1}]],
        }
    },
    ["岩浆之牙"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}岩浆之牙{rt8}||[熔岩喷吐]点名离开人群别乱动；[炽焰冲锋]头靠墙冲锋缩短路径||满能量[剧烈突变]长[岩浆触须]速A掉减伤；T别拉火上]],
        }
    },
    ["督军莎尔佳"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}督军莎尔佳{rt8}||[岩浆护盾]时捡发光道具破盾(破盾后BOSS易伤)；[燃烬余烬]追人控住||躲[巨龙之窑]头前、[火焰喷发]；{rt1}驱散T的[熔火黄金]{rt1}诅咒]],
        }
    },
    ["卡拉希焰铸者"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}卡拉希焰铸者{rt8}||{rt1}断[燃烧彗芒]{rt1}(火圈分散)；[灼热吐息]头前躲；[燃烧余烬]点火DOT]],
    },
    ["卡拉希碎骨者"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}卡拉希碎骨者{rt8}||[龙骨斧]随机流血不可断优先清；[穿刺骨髓]冲坦]],
    },
    ["卡拉希铁匠"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}卡拉希铁匠{rt8}||[锻炉踏]全队火AOE开治疗；[回响猛击]坦伤留减伤]],
    },
    ["铁匠巨像"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}铁匠巨像{rt8}||[锻炉狂怒]每2秒全队脉冲伤，优先控杀]],
    },
    ["卡拉希熔岩使"] = {
        order = 8,
        type = "MOB",
        tips = [[{rt8}卡拉希熔岩使{rt8}||[熔火屏障]免断且破盾爆炸；{rt1}盾破速断[熔火大军]{rt1}清小怪]],
    },
    ["尖啸炽焰龙"] = {
        order = 9,
        type = "MOB",
        tips = [[{rt8}尖啸炽焰龙{rt8}||[炽光风暴]推全队(靠墙)；[灼烧撕咬]坦伤火物理]],
    },
}
addon.GuideData.meta["奈萨鲁斯"] = {
    challengeID = 404,
    mapID = 2519,
    journalID = 1199,
}

addon.GuideData.versions["10.0"]["奥达曼：提尔的遗产"] = {
    ["失落的矮人"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}失落的矮人{rt8}||[长船突袭]100能量三矮人上船炮击，集火到10%逐个撤退||{rt1}断奥拉夫[防御壁垒]{rt1}(75%减伤)；巴尔洛戈[沉重之箭]头前；埃瑞克[碎颅者]躲圈]],
        }
    },
    ["布罗马奇"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}布罗马奇{rt8}||出[撼地图腾]每2秒全屏AOE，第一时间转火；图腾灭后小怪昏迷易伤||[雷霆猛击]大圈躲；T把BOSS带图腾圈里；召唤的地占师拉一起断]],
        }
    },
    ["哨兵塔隆达丝"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}哨兵塔隆达丝{rt8}||放[共鸣宝珠]后T吃3球(前2消[严酷]最后昏迷重置能量)避击退||[毁灭践踏]全屏；{rt1}断[碾压践踏]{rt1}；100能量[泰坦赋能]免控+50%伤速控]],
        }
    },
    ["艾博隆"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}艾博隆{rt8}||满能量[神圣屏障]无敌，转火4个[守库者]破阶段(每3秒[火焰波])||[不稳定余烬]全员分散；T[灼热拍击]头前；{rt1}驱散[灼热高温]{rt1}]],
        }
    },
    ["时空领主戴欧斯"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}时空领主戴欧斯{rt8}||转阶站[时光区域]回急速；躲[永恒之球]落点[永恒区域](-急速)||T[流沙吐息]头前；{rt1}驱散[时间沉陷]{rt1}(驱散触发[时间喷发])]],
        }
    },
    ["石窖穴居人地占师"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}石窖穴居人地占师{rt8}||{rt1}断[石之诅咒]{rt1}(触发[石化]->[岩石喷发])；[大地护盾]可驱散]],
    },
    ["石化守卫"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}石化守卫{rt8}||{rt1}断/驱[土灵守护]{rt1}(给敌人减伤)；[裂地猛击]留圈别踩]],
    },
    ["爬行掠食者"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}爬行掠食者{rt8}||[扑击]随机跳脸高伤奶满；毒牙给T上毒可驱]],
    },
    ["洞窟探索者"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}洞窟探索者{rt8}||{rt1}必断[音爆]{rt1}(AOE)；蝙蝠]],
    },
    ["不朽石巨像"] = {
        order = 8,
        type = "MOB",
        tips = [[{rt8}不朽石巨像{rt8}||[雷霆猛击]30码AOE远程可超距；[壁垒猛击]坦伤]],
    },
    ["永恒掠夺者"] = {
        order = 10,
        type = "MOB",
        tips = [[{rt8}永恒掠夺者{rt8}||[窃取时间]光环叠层(可驱散)，少拉；被晕不叠，控住清]],
    },
}
addon.GuideData.meta["奥达曼：提尔的遗产"] = {
    challengeID = 403,
    mapID = 2451,
    journalID = 1197,
}

addon.GuideData.versions["10.0"]["永恒黎明"] = {
    ["克罗妮卡"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}克罗妮卡{rt8}||[流沙践踏]放房间尽头，满能量[永恒碎裂]躲圈后踩[永恒余烬]防[余烬爆炸]||T每次[寿命剪切]开减伤；{rt1}断[永恒溶蚀]{rt1}]],
        }
    },
    ["时间流具象"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}时间流具象{rt8}||站[衰减时间]扇区(每3秒掉血)比[加速时间](每1秒)好；躲[时光碎片]||[时化]速驱散；T近战防[解离]]=],
        }
    },
    ["迦拉克隆之荒"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}迦拉克隆之荒{rt8}||P1躲[瘟疫渗流]/[腐蚀喷吐]；[腐蚀]接触T转移清掉||P3对[洛斯凯勒兹]伤害转[达扎克]；拆[死霜]、躲[焚化瘟疫吐息]]=],
        }
    },
    ["伊律迪孔，石鳞之龙"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}伊律迪孔，石鳞之龙{rt8}||[灭绝冲击]点名走克罗米下[时间守护]；[碎石弹幕]4人吃大圈T吃小圈||[地裂喷发]破盾躲[裂地尖刺]；[灭世湮灭]全员减伤聚克罗米；保克罗米血]],
        }
    },
    ["永恒守护者提尔"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}永恒守护者提尔{rt8}||[分割打击]至少2人吃否则BOSS[泰坦赋能]；躲[奉献之地]/[无限湮灭]||捡[时光精华]清[窃取时间](<=5层)；T[泰坦重击]击退开减伤]],
        }
    },
    ["米罗克"] = {
        order = 12,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}米罗克{rt8}||[沙暴吐息]头前躲；[更多麻烦]找真身避[巨龙吐息]防[沙暴冲击]||避[时间陷阱]；[熟悉面孔]把追兵风筝过陷阱悬停]],
        }
    },
    ["迷时战场"] = {
        order = 13,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}迷时战场{rt8}||全程打BOSS顺劈3盟友；躲[剑刃风暴]/[震荡波]||[为了部落/联盟]重召盟友继续重合；T[斩首]开减伤]],
        }
    },
    ["时空领主戴欧斯"] = {
        order = 15,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}时空领主戴欧斯{rt8}||[无限之球]后1人错开踩[无限新星]二次炸；[召唤无限守护者]转火Keeper||[时光吐息]头前；10%诺兹多姆助战；{rt1}驱散[时燃]{rt1}]],
        }
    },
    ["永恒织时者"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}永恒织时者{rt8}||{rt1}断[时之消融]{rt1}(降50%急速移速)；[永恒碎时者]读[时序切片]用扰控断]],
    },
    ["凝时亡者"] = {
        order = 3,
        type = "MOB",
        tips = [[{rt8}凝时亡者{rt8}||{rt1}断[无限箭雨]{rt1}；[时之迸发]给2人驱散；[污染之沙]速驱]],
    },
    ["永恒渗透者"] = {
        order = 5,
        type = "MOB",
        tips = [=[{rt8}永恒渗透者{rt8}||[永恒诅咒]圈躲、开减伤吃[无限狂怒]；[瘟疫碎块]死给附近加[无尽饥渴]]=],
    },
    ["伊律迪孔的造物"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}伊律迪孔的造物{rt8}||{rt1}断[石弹]{rt1}；伊律迪孔前小怪]],
    },
    ["提尔的先锋"] = {
        order = 9,
        type = "MOB",
        tips = [=[{rt8}提尔的先锋{rt8}||[裂斩]头前流血躲；[永恒暮光法师]断[纪元箭]晕[腐蚀箭雨]]=],
    },
    ["永恒守望者"] = {
        order = 11,
        type = "MOB",
        tips = [=[{rt8}永恒守望者{rt8}||[永恒诅咒]圈躲；[无限狂怒]开减伤吃；[时间流劫掠者]断[置换时序]]=],
    },
    ["永恒杀戮者"] = {
        order = 14,
        type = "MOB",
        tips = [[{rt8}永恒杀戮者{rt8}||[青铜吐息]头前侧移；[永恒诅咒]别站圈]],
    },
}
addon.GuideData.meta["永恒黎明"] = {
    challengeID = 464,
    mapID = 2579,
    journalID = 1209,
}

addon.GuideData.versions["10.0"]["注能大厅"] = {
    ["看护者伊里度斯"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}看护者伊里度斯{rt8}||P2[弱化屏障]时转火头顶3个[净化装置]破盾；躲[火花齐射]圈||{rt1}断装置[净化冲击]{rt1}；治疗驱[过载能量]，T拉装置叠BOSS]],
        }
    },
    ["吞喉巨蛙"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}吞喉巨蛙{rt8}||[吞噬]派1人站绿圈被吃防[暴怒]；速清蝌蚪防[毒素]叠层||躲[塌方]/[腹击]圈]],
        }
    },
    ["不屈者卡金"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}不屈者卡金{rt8}||[冰雹风暴]砸冰砖挡伤害(每块挡2次)，受损砖第2次炸[雪崩]||躲[冰川涌动]环、[极地寒风]；{rt1}驱散[冰霜震击]{rt1}]],
        }
    },
    ["原始海啸"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}原始海啸{rt8}||转阶被击退后从侧廊击杀[控流装置]回P1；站水流通路避伤||{rt1}断[流水冲击]{rt1}；躲[奔涌]]=],
        }
    },
    ["拜荒者塑地师"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}拜荒者塑地师{rt8}||{rt1}断[地震猛击]{rt1}(快跳点名大伤)；[大地护盾]可驱散增伤]],
    },
    ["拜荒者掠食者"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}拜荒者掠食者{rt8}||[顺风]给附近加速增伤，{rt1}断[爆破突风]{rt1}(40码AOE)]],
    },
    ["雷夫提防御者"] = {
        order = 3,
        type = "MOB",
        tips = [[{rt8}雷夫提防御者{rt8}||{rt1}断[挫志咆哮]{rt1}(减伤)；[矛刃乱舞]流血坦伤开减伤]],
    },
    ["禁锢装置"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}禁锢装置{rt8}||{rt1}断[驱逐]{rt1}(20码AOE)与[禁锢光束]{rt1}(定身高伤)]],
    },
    ["好奇沼泽蝌蚪"] = {
        order = 6,
        type = "MOB",
        tips = [=[{rt8}好奇沼泽蝌蚪{rt8}||[贪婪毒素]叠10层即死，速清；[吞噬]时派1人故意被吃防[暴怒]]=],
    },
}
addon.GuideData.meta["注能大厅"] = {
    challengeID = 406,
    mapID = 2527,
    journalID = 1204,
}

addon.GuideData.versions["10.0"]["碧蓝魔馆"] = {
    ["莱魔"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}莱魔{rt8}||T带好头前[喷涌裂隙]，全员被点大圈时分散把[魔网嫩芽]炸完||速清嫩芽降[吞噬践踏]伤害；躲[注能打击]坦伤]],
        }
    },
    ["青刃"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}青刃{rt8}||P1及时转火[龙裔影像]，BOSS头前有顺劈T带好||P2[压迫能量]时迅速转火4只影像再回P1；{rt1}断[幻影箭]{rt1}]],
        }
    },
    ["泰拉什·灰翼"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}泰拉什·灰翼{rt8}||[冰霜炸弹]点名出人群排水，[零度之下]时进蓝色[魔馆符文]规避||{rt1}断[寒冰灭绝者]{rt1}吐息]],
        }
    },
    ["安布雷斯库"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}安布雷斯库{rt8}||75%/50%/25%掉落[爆裂水晶]，集火硬化水晶体再转小火晶||{rt1}驱散T的[残暴之涌]{rt1}；躲[巨龙践踏]与[爆裂旋涡]]=],
        }
    },
    ["奥术幼龙"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}奥术幼龙{rt8}||被[凝视]看到会唤醒全场，用晕/吹/台风等控住再击杀，别硬吃]],
    },
    ["龙裔破坏者"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}龙裔破坏者{rt8}||{rt1}断[野蛮咆哮]{rt1}(30码AOE)；[肩撞]冲人击退别被推下台]],
    },
    ["虚空魔蟾"] = {
        order = 3,
        type = "MOB",
        tips = [[{rt8}虚空魔蟾{rt8}||[虚空践踏]跳向玩家落地AOE+驱散增益，可群控聚怪]],
    },
    ["鳞破副官"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}鳞破副官{rt8}||[猎魔狂热]给附近敌人+25%伤害，单独拉或读条即断]],
    },
}
addon.GuideData.meta["碧蓝魔馆"] = {
    challengeID = 401,
    mapID = 2515,
    journalID = 1203,
}

addon.GuideData.versions["10.0"]["红玉新生法池"] = {
    ["梅莉杜莎·寒妆"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}梅莉杜莎·寒妆{rt8}||躲[严寒霜风]被拉时向外跑、[冰爆术]头前不吃||75%/45%招[注能龙崽]且自带[寒冰壁垒]，速破盾并A掉小龙、治疗驱[原始酷寒]||{rt1}必断[冰霜过载]{rt1}]],
        }
    },
    ["柯姬雅·焰蹄"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}柯姬雅·焰蹄{rt8}||持续带位别挡路，[熔火巨石]点名圈分散踩完再走||[炎缚火焰风暴]读[燃尽]时优先转火击杀||{rt1}必断[咆哮烈焰]{rt1}(全队伤害)]],
        }
    },
    ["基拉卡与厄克哈特·风脉"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}基拉卡与厄克哈特·风脉{rt8}||脚底火圈点名出去排火，全程集火龙；[变迁之风]会把火堆吹向某人||{rt1}驱散T的[地狱火之核]{rt1}、躲[风暴猛击]]=],
        }
    },
    ["闪霜织寒者"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}闪霜织寒者{rt8}||{rt1}必断[寒冰飞弹]/[冰霜护盾]{rt1}；护盾可驱散，优先打断防奶不上]],
    },
    ["闪霜塑地者"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}闪霜塑地者{rt8}||{rt1}必断/晕[大地碎裂]{rt1}(40码AOE高伤)，否则极易减员]],
    },
    ["注能魔像"] = {
        order = 3,
        type = "MOB",
        tips = [[{rt8}注能魔像{rt8}||躲[挖掘冲击]圈；T开减伤吃[碎裂猛击]坦伤，可风筝出近战]],
    },
    ["龙蛋巢"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}龙蛋巢{rt8}||别踩地上龙蛋，踩到孵化[注能龙崽]叠加[原始酷寒]，绕开走]],
    },
    ["悖逆者德拉加尔"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}悖逆者德拉加尔{rt8}||{rt1}必断[钢铁弹幕]{rt1}；躲正面[炽焰冲锋]，T对[烈焰弹幕]开减伤]],
    },
}
addon.GuideData.meta["红玉新生法池"] = {
    challengeID = 399,
    mapID = 2521,
    journalID = 1202,
    encounterIds = {
        ["闪霜织寒者"] = 2606,
        ["闪霜塑地者"] = 2609,
        ["注能魔像"] = 2623,
    },
}

addon.GuideData.versions["10.0"]["蕨皮山谷"] = {
    ["劈爪的战团"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}劈爪的战团{rt8}||100能量三人连招[妖诡图腾]+[腐朽感官]+[野蛮冲撞]，躲冲锋站T身后||{rt1}转火[妖诡图腾]{rt1}；[血怒]低于15%开爆发；[标记屠戮]集火治疗]],
        }
    },
    ["树口"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}树口{rt8}||轮流站绿圈被[吞噬]防灭团(谁都不站就放全屏)；躲[横扫]头前||土狼引到陷阱处击杀]],
        }
    },
    ["腐朽主母怒眼"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}腐朽主母怒眼{rt8}||[衰朽强度]按玩家[腐朽腐烂]层数加伤，优先转火[腐爆图腾]||躲[窒息腐云]头前、[腐裂打击]坦伤开减伤；全队控病]],
        }
    },
    ["肠击"] = {
        order = 10,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}肠击{rt8}||起手集火2只[烂牙土狼]；[投掷肉类]点名者把土狼引到[诱捕陷阱]上晕住||{rt1}必断[主人的召唤]{rt1}(帮土狼脱困)；躲[一枪毙命]击退与[腾跃]落点||[猎手的战术]给附近敌人+15%伤，别站BOSS身边]],
        }
    },
    ["蕨皮战痕者"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}蕨皮战痕者{rt8}||{rt1}必断[狞笑]{rt1}(群体恐惧)；[群体战术]给附近+15%伤+25%急速优先杀]],
    },
    ["腐朽诵者"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}腐朽诵者{rt8}||[腐朽爆发]给全队叠疾病[腐朽]，速驱散防叠层]],
    },
    ["腐语图腾"] = {
        order = 3,
        type = "MOB",
        tips = [[{rt8}腐语图腾{rt8}||[腐化颂唱]强化附近敌人，速集火点掉]],
    },
    ["利爪战士"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}利爪战士{rt8}||[凶狠碎爪]追人重伤，晕/风筝；[血腥撕咬]流血治到90%解]],
    },
    ["残酷碎骨者"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}残酷碎骨者{rt8}||[碎裂猛击]坦伤+减速30%，T开减伤]],
    },
    ["诡爪秘术师"] = {
        order = 8,
        type = "MOB",
        tips = [[{rt8}诡爪秘术师{rt8}||{rt1}断[大地箭]{rt1}；被[腐朽箭]强化时先点掉图腾]],
    },
}
addon.GuideData.meta["蕨皮山谷"] = {
    challengeID = 405,
    mapID = 2520,
    journalID = 1196,
}

addon.GuideData.versions["10.0"]["诺库德阻击战"] = {
    ["格拉尼斯"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}格拉尼斯{rt8}||满能量读[喷发]前用[巨龙杀手弩]打断并晕他(3个弩位随机激活)||躲[大地碎裂]、{rt1}断[岩石碎片]{rt1}；M+优先控杀[诺库德破坏者]防拆弩]],
        }
    },
    ["狂怒风暴"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}狂怒风暴{rt8}||吃[闪电宝珠]维持增益层数(站近Boss当守门员)再进中心，转阶贴近治疗||躲[闪电打击]点名、{rt1}断[能量涌动]{rt1}(可驱散)]],
        }
    },
    ["提拉和马鲁克"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}提拉和马鲁克{rt8}||[暴风之箭]全员集合排风；跳跃后T速把两Boss拉一起||{rt1}断[守护之风]{rt1}，躲[劈地者]、[恐怖怒吼]恐惧]],
        }
    },
    ["巴拉卡可汗"] = {
        order = 9,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}巴拉卡可汗{rt8}||P1躲[钢铁之矛]落点+[钢铁践踏]路径；P2转掉4只[风暴法师]进P3||{rt1}驱散T的[传导打击]{rt1}，[静电之矛]会把全员拉向落点]],
        }
    },
    ["诺库德枪炮手"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}诺库德枪炮手{rt8}||{rt1}必断[扰乱咆哮]{rt1}(沉默AOE)；躲[战争践踏]、[断筋打击]顺劈]],
    },
    ["诺库德号角手"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}诺库德号角手{rt8}||{rt1}必断[集结呐喊]{rt1}(给附近+50%伤害)，优先控杀]],
    },
    ["诺库德矛战士"] = {
        order = 3,
        type = "MOB",
        tips = [[{rt8}诺库德矛战士{rt8}||[穿刺]流血不可断，优先击杀；别让其叠坦伤]],
    },
    ["巴塔克"] = {
        order = 7,
        type = "MOB",
        tips = [=[{rt8}巴塔克{rt8}||{rt1}必断[惊骇怒吼]{rt1}(群体恐惧6秒)否则易ADD；躲[宽阔践踏]]=],
    },
}
addon.GuideData.meta["诺库德阻击战"] = {
    challengeID = 400,
    mapID = 2516,
    journalID = 1198,
}

