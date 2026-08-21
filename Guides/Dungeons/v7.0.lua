-- BossTips Guide Data
-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).
-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.versions = addon.GuideData.versions or {}
addon.GuideData.versions["7.0"] = addon.GuideData.versions["7.0"] or {}
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.versionInfo["7.0"] = { order = 7, label = [[7.0 军团再临]] }
addon.GuideData.meta = addon.GuideData.meta or {}

addon.GuideData.versions["7.0"]["噬魂之喉"] = {
    ["堕落君王伊米隆"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}堕落君王伊米隆{rt8}||远离boss躲[亡者嚎叫]恐惧;速杀[亡者复生]小怪;躲[灾祸]精华并驱散恐惧]],
        }
    },
    ["哈布隆"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}哈布隆{rt8}||{rt1}断虚空裂痕{rt1}并击败召唤仆从;[碎片]目标承伤高需治疗,躲[空间之镰]与[虚空撕裂]]=],
        }
    },
    ["海拉"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}海拉{rt8}||躲[毁灭触须]绿圈与[贪食触须];P2触须点名远离,坦克面对[腐蚀喷溅],{rt1}断读条{rt1}]],
        }
    },
    ["重点·被诅咒灵魂"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}被诅咒灵魂{rt8}||船上幽魂与小鬼,{rt1}断虚空裂痕{rt1}并清理灵魂碎片]],
    },
    ["重点·纳格法尔号甲板"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}纳格法尔号甲板{rt8}||移动船战注意站位,避免被[北地冰风]等击退落海]],
    },
}
addon.GuideData.meta["噬魂之喉"] = {
    challengeID = 208,
    mapID = 1492,
    journalID = 727,
}

addon.GuideData.versions["7.0"]["奈萨里奥的巢穴"] = {
    ["洛克莫拉"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}洛克莫拉{rt8}||躲[水晶震荡]落点,碎裂出小水晶远离;坦克踩[不稳定地表],{rt1}打断水晶尖刺{rt1}]],
        }
    },
    ["乌拉罗格·塑山"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}乌拉罗格·塑山{rt8}||[重塑大地]读条时远离红圈,转阶段[崩裂]躲开;{rt1}断地底低语{rt1},可引其撞石柱]],
        }
    },
    ["纳拉萨斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}纳拉萨斯{rt8}||躲[酸液喷射]正面与[腐蚀吐息];[巢中之卵]出的小怪速清,中毒及时驱散]],
        }
    },
    ["地底之王达古尔"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}地底之王达古尔{rt8}||[卡兹格罗斯之锤]砸地躲圈,召唤大怪引其撞[水晶柱]造成眩晕;躲[熔岩波]]=],
        }
    },
    ["重点·岩浆波"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}岩浆波{rt8}||副本内岩浆沿水道周期推进,利用水车跳台或离开水道规避,勿久站水里]],
    },
    ["重点·水晶爪牙"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}水晶爪牙{rt8}||洛克莫拉碎裂的小水晶会自爆,远离爆炸范围并速清]],
    },
}
addon.GuideData.meta["奈萨里奥的巢穴"] = {
    challengeID = 206,
    mapID = 1458,
    journalID = 767,
}

addon.GuideData.versions["7.0"]["守望者地窟"] = {
    ["提拉宋·萨瑟利尔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}提拉宋·萨瑟利尔{rt8}||{rt1}断邪能锁链{rt1},出小怪速清;躲[暗影新星],被[火焰之触]点名跑开]],
        }
    },
    ["审判官托蒙托鲁姆"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}审判官托蒙托鲁姆{rt8}||[心灵震撼]点名远离;躲[虚空裂隙],转阶段清小怪并驱散恐惧]],
        }
    },
    ["阿什高姆"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}阿什高姆{rt8}||[熔岩猛击]坦克减伤,躲[烈焰之地]火圈;出余烬速清防自爆]],
        }
    },
    ["格雷泽"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}格雷泽{rt8}||[凝视]光束反射/打断或侧移躲开;被点名跑离人群,镜像阶段清分身]],
        }
    },
    ["科达娜·邪歌"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}科达娜·邪歌{rt8}||躲[暗影之刃]剑与[邪能爆炸];分身{rt1}断施法{rt1},被点名跑开,P2保护伊利丹之影]],
        }
    },
    ["重点·炽热余烬"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}炽热余烬{rt8}||阿什高姆召唤的余烬靠近自爆,速清并保持距离]],
    },
    ["重点·邪能镜像"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}邪能镜像{rt8}||科达娜分身会施放暗影技能,优先打断并清理]],
    },
}
addon.GuideData.meta["守望者地窟"] = {
    challengeID = 207,
    mapID = 1493,
    journalID = 707,
}

addon.GuideData.versions["7.0"]["永夜大教堂"] = {
    ["阿格洛诺克斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}阿格洛诺克斯{rt8}||速杀[鞭笞者]小怪避免被淹;躲开[窒息藤蔓],[毒性孢子]dot渐痛及时驱散]],
        }
    },
    ["多玛塔克斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}多玛塔克斯{rt8}||90%/50%开门召唤增援速清;[阿格拉玛之盾]能量保持,站盾内规避军团AoE]],
        }
    },
    ["孟菲斯托斯"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}孟菲斯托斯{rt8}||能量满后遁入阴影,用[阿格拉玛之盾]保护[伊利丹]直到拽出恐惧领主;躲暗影]],
        }
    },
    ["轻蔑的萨什比特"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}轻蔑的萨什比特{rt8}||[粉碎之击]时全员退到boss15码外;[投掷战槌]沿图书馆外缘飞一圈,立刻回到场地内圈||{rt1}速杀:撞碎书架刷出的[活体书籍](沉默/减速/精控){rt1}||被[轻蔑凝视]点名者把书架卡在自己与boss之间,其余人让开[轻蔑冲锋]路径;书架数量有限相当于软狂暴,注意输出节奏]],
        }
    },
    ["蔑齿"] = {
        order = 2,
        type = "MOB",
        tips = [[{rt8}蔑齿{rt8}||[横扫]大范围躲开;引诱其与更大目标贴身使其失衡;踩[魔法典籍]前确认效果]],
    },
    ["重点·魔法典籍"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}魔法典籍{rt8}||图书馆地面魔法书触发随机效果,踩前看清增益/减益]],
    },
    ["重点·阿格拉玛之盾"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}阿格拉玛之盾{rt8}||盾能量耗尽光环消失,全队站盾内规避AoE并保护伊利丹]],
    },
}
addon.GuideData.meta["永夜大教堂"] = {
    challengeID = 233,
    mapID = 1677,
    journalID = 900,
}

addon.GuideData.versions["7.0"]["群星庭院"] = {
    ["巡逻队长加多"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}巡逻队长加多{rt8}||进战前关掉3座[奥秘灯塔]免增援;[共振斩]侧移躲并解晕,[奥术禁锢]跳三下解除]],
        }
    },
    ["塔丽克萨·火冠"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}塔丽克萨·火冠{rt8}||用场景互动引开使徒减员再开打;优先{rt1}断火系读条{rt1},速清小鬼]],
        }
    },
    ["顾问麦兰杜斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}顾问麦兰杜斯{rt8}||[剑刃奔涌]冲向远程位并留下残影,全员5码分散防流血连带;残影会复制[穿刺风暴]直线与[切割漩涡]||{rt1}规避:[穿刺风暴]侧移躲线,[切割漩涡]时离本体与残影7码外{rt1}||固定一人在同一角落骗冲锋把残影叠放;[包围之风]旋风撞到会眩晕,可驱散并提前绕开]],
        }
    },
    ["重点·奥秘灯塔"] = {
        order = 4,
        type = "MOB",
        tips = [[{rt8}奥秘灯塔{rt8}||杰尔多前务必关闭3座灯塔,否则战斗中召唤[ vigilance]增援]],
    },
    ["重点·魔焰使徒"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}魔焰使徒{rt8}||塔莉克萨的使徒互相buff,用职业互动引开一个再击杀降低压力]],
    },
}
addon.GuideData.meta["群星庭院"] = {
    challengeID = 210,
    mapID = 1571,
    journalID = 800,
}

addon.GuideData.versions["7.0"]["艾萨拉之眼"] = {
    ["督军帕杰什"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}督军帕杰什{rt8}||[长矛投掷]点名者站小怪后借长矛击杀小怪;{rt1}断小怪治疗与低吼{rt1}]],
        }
    },
    ["积怨夫人"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}积怨夫人{rt8}||boss向海放电时站沙丘上;脚下[漩涡]几秒变追踪旋风,尽量引到海里]],
        }
    },
    ["深须国王"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}深须国王{rt8}||有[气泡]护盾时吃地面伤害消耗,气泡结束未消耗会全团AoE;[余震]躲避]],
        }
    },
    ["瑟芬崔斯克"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}瑟芬崔斯克{rt8}||本体绿头,P2出蓝/红小头优先击杀;尽量多{rt1}断其读条{rt1}]],
        }
    },
    ["艾萨拉之怒"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}艾萨拉之怒{rt8}||及时[驱散奥术炸弹];躲[旋风电浪]与[闪电],远离任何场景效果]],
        }
    },
    ["重点·天气恶化"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}天气恶化{rt8}||每杀一个外围boss中央天气更恶劣(雷击/狂风/潮汐),走位注意防雷]],
    },
    ["重点·积怨导魔者"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}积怨导魔者{rt8}||召唤艾萨拉之怒前的引魔者,{rt1}断其施法{rt1}避免战斗被强化]],
    },
}
addon.GuideData.meta["艾萨拉之眼"] = {
    challengeID = 197,
    mapID = 1456,
    journalID = 716,
    encounterIds = {
        ["督军帕杰什"] = 1813,
    },
}

addon.GuideData.versions["7.0"]["英灵殿"] = {
    ["海姆达尔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}海姆达尔{rt8}||躲[血刃横扫]正面与旋转[舞动之刃];{rt1}号角{rt1}召唤风暴幼龙吐电,看平台边缘闪电落点提前避让]],
        }
    },
    ["赫娅"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}赫娅{rt8}||站紫圈(风暴)内减伤;黄圈[驱逐圣光]点名跑离人群,躲[神圣洁净化]宝珠;坦克用正面[圣光之盾]]=],
        }
    },
    ["芬雷尔"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}芬雷尔{rt8}||P1[利爪狂乱]靠近分摊,[饥饿突袭]散开防流血;被[血腥嗅探]点名绕圈跑,{rt1}打断狼嚎{rt1}]],
        }
    },
    ["神王斯科瓦尔德"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}神王斯科瓦尔德{rt8}||坦克拾取[阿格拉玛之盾]挡[诸神黄昏];[邪焰冲锋]点名远离,躲火圈并速杀召唤的勇士]],
        }
    },
    ["奥丁"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}奥丁{rt8}||[光明之矛]点名离开标线,立刻{rt1}杀风暴锻造歼灭者并打断冲击{rt1};[符文印记]跑到对应颜色符文获增益]],
        }
    },
    ["重点·四王"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}四王(哈尔多/兰鲁夫/比约恩/托尔){rt8}||逐个击杀,击杀后增益传给存活者;先杀会强化敌人的,最后双王同场]],
    },
    ["重点·瓦拉加尔勇士"] = {
        order = 7,
        type = "MOB",
        tips = [[{rt8}瓦拉加尔勇士{rt8}||斯科瓦尔德召出的勇士会点名追击,优先击杀并躲地面邪焰火圈]],
    },
}
addon.GuideData.meta["英灵殿"] = {
    challengeID = 200,
    mapID = 1477,
    journalID = 721,
}

addon.GuideData.versions["7.0"]["重返卡拉赞"] = {
    ["贞节圣女"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}贞节圣女{rt8}||分散8码防[神圣之怒]链;即时[驱散神圣之火];[忏悔]前走进[圣光之地]解除]],
        }
    },
    ["莫罗斯"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}莫罗斯{rt8}||CC四个仆从(优先治疗/烧蓝),{rt1}断治疗与法力燃烧{rt1};驱散[割喉]毒]],
        }
    },
    ["猎手阿图门"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}猎手阿图门{rt8}||先打[午夜]马,合并后坦背对人群防[暗影顺劈];躲[冲锋]与[碾压]]=],
        }
    },
    ["馆长"] = {
        order = 5,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}馆长{rt8}||速杀[星界火花]小怪;boss[唤起]时在圈内爆发输出;坦克拉中间]],
        }
    },
    ["麦迪文之影"] = {
        order = 6,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}麦迪文之影{rt8}||{rt1}断冰霜箭/火球{rt1},躲[暴雪]与[烈焰之环](站圈内勿动);清元素]],
        }
    },
    ["魔力吞噬者"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [=[{rt8}魔力吞噬者{rt8}||战前被缩小清蜘蛛老鼠,击杀[法力蠕虫]恢复体型;躲[法力吸取]]=],
        }
    },
    ["监视者维兹艾德姆"] = {
        order = 8,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}监视者维兹艾德姆{rt8}||多阶段躲[邪能轰炸]与[虚空]圈;优先{rt1}断施法{rt1},站安全点输出]],
        }
    },
    ["歌剧院：魔法坏女巫"] = {
        order = 11,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}歌剧院:魔法坏女巫{rt8}||艾尔菲拉与嘉琳黛尔共享血量,拉在一起单点;[反抗引力]黑紫圈平时勿踩,[神奇辐光]4码爆炸坦克脚下出现要立刻移开||{rt1}必断/速杀:[忧郁剑]与[召唤助手]出的飞猴助手{rt1}||嘉琳黛尔读[魔法威仪]时全员在读条末尾一起踩圈被击飞规避,切勿提前踩掉圈导致队友无圈]],
        }
    },
    ["歌剧院：西部故事"] = {
        order = 12,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}歌剧院:西部故事{rt8}||P1先清3个[黑帮恶棍]再打托尼,躲[翻卷的烈焰狂风]留下的火旋风,近战远离[燃烧扫堂腿];P2玛吉亚的[冲刷]水浪从两侧横扫全场,提前预判躲开||{rt1}必断/速杀:[海岸潮语者]的[水泡爆炸]{rt1}||被[雷霆仪式]标记后全员分散5码以上;P3两个boss同场且不再出小怪,优先集火托尼]],
        }
    },
    ["歌剧院：美女与野兽"] = {
        order = 13,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}歌剧院:美女与野兽{rt8}||仆从存活时炉子库格斯顿免疫伤害,必须逐个单点击杀;每死一个其余仆从满血且伤害提高25%可叠加,严禁乱AoE||{rt1}必断:鲁米诺尔的[热浪];顺序 扫帚巴布丽特>鲁米诺尔>考德隆夫人>库格斯顿{rt1}||被[扬尘漫天]锁定者风筝扫帚且勿穿火(会获得加速可进攻驱散);中[浸透]减速时踩[燃烧之地]熄火;库格斯顿的[银餐叉]控住速清,坦克备好减伤]],
        }
    },
    ["歌剧院"] = {
        order = 1,
        type = "MOB",
        tips = [[{rt8}歌剧院{rt8}||每周随机剧本(美女与野兽/西泉/绿野仙踪),与Barnes对话确认后按对应机制处理]],
    },
    ["重点·歌剧院剧本"] = {
        order = 9,
        type = "MOB",
        tips = [[{rt8}歌剧院剧本{rt8}||红帽:被点名绕场跑;西泉:按序杀 Dorothy/狮/稻草人/铁人;绿野:分散躲链]],
    },
    ["重点·逆法陷阱"] = {
        order = 10,
        type = "MOB",
        tips = [[{rt8}逆法陷阱{rt8}||路上幽灵陷阱与法力虫前的小怪,可利用盗贼/工程互动跳过或速清]],
    },
}
addon.GuideData.meta["重返卡拉赞"] = {
    challengeID = 234,
    mapID = 1651,
    journalID = 860,
}

addon.GuideData.versions["7.0"]["魔法回廊"] = {
    ["伊凡尔"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}伊凡尔{rt8}||躲[不稳定法力]蓝圈与[奥术轨道];[奥术爆破]点名散开,{rt1}断读条{rt1}]],
        }
    },
    ["科蒂拉克斯"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}科蒂拉克斯{rt8}||[禁锢]点名后躲牢笼,[净化之触]驱散;踩[加速地板]获取增益]],
        }
    },
    ["萨卡尔将军"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}萨卡尔将军{rt8}||[暗影之刃]点名躲开,召唤小鬼速清;躲[碾压]正面,{rt1}断暗影箭{rt1}]],
        }
    },
    ["纳尔提拉"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}纳尔提拉{rt8}||躲[蛛网]与[毒液];小蜘蛛速清,被[点名]跑开避免连累队友]],
        }
    },
    ["顾问凡多斯"] = {
        order = 7,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}顾问凡多斯{rt8}||[时空碎片]8秒后10码爆炸,分散并及时离开;[力场炸弹]爆炸生成[力场新星]环形推开,站两弹之间或提前跑远||{rt1}必断:[加速冲击](叠加伤害与急速,需分配打断链){rt1}||50%读[时空放逐]全队被传送,2分钟内跑回boss身边;沿途[永恒怨灵]群体眩晕,保持分散,断掉后速杀]],
        }
    },
    ["重点·不稳定能量球"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}不稳定能量球{rt8}||伊凡尼尔房能量球[不稳定的法力]爆炸前躲开]],
    },
    ["重点·邪能小鬼"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}邪能小鬼{rt8}||纳尔提拉召唤的小鬼会自爆,速清并保持分散]],
    },
}
addon.GuideData.meta["魔法回廊"] = {
    challengeID = 209,
    mapID = 1516,
    journalID = 726,
}

addon.GuideData.versions["7.0"]["黑心林地"] = {
    ["大德鲁伊格兰达里斯"] = {
        order = 1,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}大德鲁伊格兰达里斯{rt8}||分散站位减[夜幕]伤害;中[痛苦撕扯]治疗注意,{rt1}断月火类读条{rt1},出小怪坦克拉]],
        }
    },
    ["橡树之心"] = {
        order = 2,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}橡树之心{rt8}||坦克预开减伤吃[粉碎之握];红圈[根须缠绕]第一时躲,被[控制]速杀小怪]],
        }
    },
    ["德萨隆"] = {
        order = 3,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}德萨隆{rt8}||地上[沙圈]及时躲开,出小龙坦克拉住集火A掉;躲[龙息]正面]],
        }
    },
    ["萨维斯之影"] = {
        order = 4,
        type = "BOSS",
        tipsByDifficulty = {
            lfr = [[{rt8}萨维斯之影{rt8}||全员分散防[诱发性妄想]恐惧;中[梦魇乍醒]站队友旁避免沉默,优先照顾[弱肉强食]目标]],
        }
    },
    ["重点·梦魇生物"] = {
        order = 5,
        type = "MOB",
        tips = [[{rt8}梦魇生物{rt8}||各boss召唤的梦魇小怪由坦克拉住集火A掉,避免叠加]],
    },
    ["重点·腐化绿水"] = {
        order = 6,
        type = "MOB",
        tips = [[{rt8}腐化绿水{rt8}||地面腐化绿水踩到持续掉血并减速,绕行避让]],
    },
}
addon.GuideData.meta["黑心林地"] = {
    challengeID = 198,
    mapID = 1466,
    journalID = 762,
}

