-- BossTips Guide Data
-- Expansion: The Burning Crusade (2.0-2.4 燃烧的远征)
-- Scope: Native dungeons only (NOT Mythic+). 燃烧的远征全部 5 人副本。
-- NOTE: Edit in-game via Settings -> 攻略编辑. WTF overrides (BossTipsGlobalDB.guides) take PRIORITY.
--       M+ season files take priority over native on name collision.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {} }
addon.GuideData.versions = addon.GuideData.versions or {}
addon.GuideData.versions["2.0"] = addon.GuideData.versions["2.0"] or {}
-- 版本标签与排序（主文件据此动态发现版本，无需修改主文件）
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.versionInfo["2.0"] = { label = "2.0 燃烧的远征", order = 2 }


addon.GuideData.meta = addon.GuideData.meta or {}
-- 副本编号（Blizzard DB2：Map.db2 / JournalInstance.db2 / MapChallengeMode.db2）
addon.GuideData.meta["地狱火堡垒：城墙"] = { mapID = 543, journalID = 248, challengeID = nil }
addon.GuideData.meta["地狱火堡垒：鲜血熔炉"] = { mapID = 542, journalID = 256, challengeID = nil }
addon.GuideData.meta["地狱火堡垒：破碎大厅"] = { mapID = 540, journalID = 259, challengeID = nil }
addon.GuideData.meta["盘牙湖泊：奴隶围栏"] = { mapID = 547, journalID = 260, challengeID = nil }
addon.GuideData.meta["盘牙湖泊：幽暗沼泽"] = { mapID = 546, journalID = 262, challengeID = nil }
addon.GuideData.meta["盘牙湖泊：蒸汽地窟"] = { mapID = 545, journalID = 261, challengeID = nil }
addon.GuideData.meta["奥金顿：法力墓穴"] = { mapID = 557, journalID = 250, challengeID = nil }
addon.GuideData.meta["奥金顿：奥金尼地穴"] = { mapID = 558, journalID = 247, challengeID = nil }
addon.GuideData.meta["奥金顿：塞泰克大厅"] = { mapID = 556, journalID = 252, challengeID = nil }
addon.GuideData.meta["奥金顿：暗影迷宫"] = { mapID = 555, journalID = 253, challengeID = nil }
addon.GuideData.meta["逃离敦霍尔德"] = { mapID = 560, journalID = 251, challengeID = nil }
addon.GuideData.meta["开启黑暗之门"] = { mapID = 269, journalID = 255, challengeID = nil }
addon.GuideData.meta["风暴要塞：禁魔监狱"] = { mapID = 552, journalID = 254, challengeID = nil }
addon.GuideData.meta["风暴要塞：生态船"] = { mapID = 553, journalID = 257, challengeID = nil }
addon.GuideData.meta["风暴要塞：能源舰"] = { mapID = 554, journalID = 258, challengeID = nil }
addon.GuideData.meta["魔导师平台"] = { mapID = 585, journalID = 249, challengeID = nil }


-- ===================== 地狱火堡垒：城墙 =====================
addon.GuideData.versions["2.0"]["地狱火堡垒：城墙"] = {
    ["巡视者加戈玛"] = { order = 1, type = "BOSS", tips = "{rt8}巡视者加戈玛{rt8}||带2个[地狱火看守者]随从，先控/杀随从防治疗||{rt1}必断：随从[治疗]{rt1}||坦克拉稳" },
    ["无疤者奥摩尔"] = { order = 2, type = "BOSS", tips = "{rt8}无疤者奥摩尔{rt8}||[背叛光环]15码暗影DOT可驱散；[法术反射]开盾||{rt1}驱散诅咒{rt1}||开盾时法系停手防反弹" },
    ["传令官瓦兹德"] = { order = 3, type = "BOSS", tips = "{rt8}传令官瓦兹德{rt8}||先杀2哨兵引出瓦兹鲁登；纳赞[火球术]留火/[火之锥]正面||{rt1}无{rt1}||坦背对人群躲火" },
    ["地狱火新兵"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：地狱火新兵/哨兵{rt8}||[治疗]/[暗言术：痛]优先控杀治疗怪||{rt1}必断：治疗{rt1}||入口狼骑兵先杀狼" },
}

-- ===================== 地狱火堡垒：鲜血熔炉 =====================
addon.GuideData.versions["2.0"]["地狱火堡垒：鲜血熔炉"] = {
    ["制造者"] = { order = 1, type = "BOSS", tips = "{rt8}制造者{rt8}||[支配]精神控制(不可驱散)/[爆炸之环]击飞||{rt1}无{rt1}||变羊/恐惧被控玩家，全体躲圈" },
    ["布洛戈克"] = { order = 2, type = "BOSS", tips = "{rt8}布洛戈克{rt8}||[毒云]/[毒液箭]自然DOT/[软泥喷射]正面||{rt1}驱散毒{rt1}||先清4波兽人再打" },
    ["击碎者克里丹"] = { order = 3, type = "BOSS", tips = "{rt8}击碎者克里丹{rt8}||[暗影箭雨]/[腐蚀术]/锥状[暗影箭]正面||{rt1}必断：暗影箭{rt1}||先杀5[影月导魔者]驱散[暗影印记]" },
    ["新生邪兽人"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：新生邪兽人{rt8}||开战后狂乱，控制职业优先控场||{rt1}无{rt1}||" },
}

-- ===================== 地狱火堡垒：破碎大厅 =====================
addon.GuideData.versions["2.0"]["地狱火堡垒：破碎大厅"] = {
    ["高阶术士奈瑟库斯"] = { order = 1, type = "BOSS", tips = "{rt8}高阶术士奈瑟库斯{rt8}||[暗影裂劈]正面锥形必躲；[死亡之缠]脚下暗影云持续掉血||{rt1}必断：[暗影箭雨]；25%[黑暗旋涡]旋转群伤全员散开{rt1}||坦背对人群，近战躲正面" },
    ["血卫士伯鲁恩"] = { order = 2, type = "BOSS", tips = "{rt8}血卫士伯鲁恩{rt8}||[旋风斩]/[顺劈]带2名随从速杀减少压力||{rt1}无{rt1}||坦克拉稳" },
    ["战争使者沃姆罗格"] = { order = 3, type = "BOSS", tips = "{rt8}战争使者沃姆罗格{rt8}||[火球术]/[治疗之雨]/[恐惧]双头争吵互打断||{rt1}必断：[治疗之雨]{rt1}||分散躲火" },
    ["酋长卡加斯·刃拳"] = { order = 4, type = "BOSS", tips = "{rt8}酋长卡加斯·刃拳{rt8}||[刃舞]随机冲锋群伤/[横扫]/[冲锋]昏迷||{rt1}无{rt1}||靠墙拉，刃舞全团分散，召唤卫兵秒杀" },
    ["破碎者萨满"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：破碎者萨满{rt8}||[治疗之雨]控制/优先击杀||{rt1}必断：治疗{rt1}||通道巡逻控场逐波拉" },
}

-- ===================== 盘牙湖泊：奴隶围栏 =====================
addon.GuideData.versions["2.0"]["盘牙湖泊：奴隶围栏"] = {
    ["背叛者门努"] = { order = 1, type = "BOSS", tips = "{rt8}背叛者门努{rt8}||[治疗图腾]/[火舌图腾]/[毒箭]优先打掉图腾||{rt1}驱散毒{rt1}||" },
    ["巨钳鲁克玛尔"] = { order = 2, type = "BOSS", tips = "{rt8}巨钳鲁克玛尔{rt8}||[撕裂]流血/[加剧痛苦]增伤/[召唤]坦背对清怪||{rt1}无{rt1}||" },
    ["夸格米拉"] = { order = 3, type = "BOSS", tips = "{rt8}夸格米拉{rt8}||[酸液喷射]正面/[毒药]DOT/[缩水]降属性||{rt1}驱散毒{rt1}||治疗刷好团血" },
    ["盘牙先知"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：盘牙先知（纳迦）{rt8}||[治疗波]务必打断||{rt1}必断：[治疗波]{rt1}||" },
}

-- ===================== 盘牙湖泊：幽暗沼泽 =====================
addon.GuideData.versions["2.0"]["盘牙湖泊：幽暗沼泽"] = {
    ["霍加尔芬"] = { order = 1, type = "BOSS", tips = "{rt8}霍加尔芬{rt8}||[孢子云]范围自然伤/[召唤孢子跃迁者]分散||{rt1}无{rt1}||速清小怪减伤" },
    ["加兹安"] = { order = 2, type = "BOSS", tips = "{rt8}加兹安{rt8}||[酸液喷射]正面/[尾扫]击退/[水下视野]减命中||{rt1}无{rt1}||近战躲尾巴" },
    ["沼地领主穆塞雷克"] = { order = 3, type = "BOSS", tips = "{rt8}沼地领主穆塞雷克{rt8}||[多重射击]/[蝰蛇钉刺]抽蓝/[召唤]驱散钉刺||{rt1}驱散钉刺{rt1}||清召唤怪" },
    ["黑色阔步者"] = { order = 4, type = "BOSS", tips = "{rt8}黑色阔步者{rt8}||[闪电链]/[毒性新星]/[狂暴]打断分散||{rt1}必断：施法{rt1}||" },
    ["孢子潜伏者"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：孢子潜伏者/跃迁者{rt8}||自然群伤，速清||{rt1}无{rt1}||" },
}

-- ===================== 盘牙湖泊：蒸汽地窟 =====================
addon.GuideData.versions["2.0"]["盘牙湖泊：蒸汽地窟"] = {
    ["水术师瑟丝比娅"] = { order = 1, type = "BOSS", tips = "{rt8}水术师瑟丝比娅{rt8}||[闪电链]/[治疗波]/[法力护盾]断治疗破盾||{rt1}必断：[治疗波]{rt1}||" },
    ["机械师斯蒂里格"] = { order = 2, type = "BOSS", tips = "{rt8}机械师斯蒂里格{rt8}||[召唤机械鲨鱼]/[陷阱]速清鲨鱼躲陷阱||{rt1}无{rt1}||" },
    ["督军卡利瑟里斯"] = { order = 3, type = "BOSS", tips = "{rt8}督军卡利瑟里斯{rt8}||[激怒]随能量涨伤/[法力抽取]/[治疗]||{rt1}必断：治疗{rt1}||控能量别叠满" },
    ["盘牙水占师"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：盘牙水占师{rt8}||[治疗波]/[净化]优先打断||{rt1}必断：[治疗波]{rt1}||" },
}

-- ===================== 奥金顿：法力墓穴 =====================
addon.GuideData.versions["2.0"]["奥金顿：法力墓穴"] = {
    ["潘德莫努斯"] = { order = 1, type = "BOSS", tips = "{rt8}潘德莫努斯{rt8}||[暗影护盾]反射魔法(停手)/[虚空冲击波]击退||{rt1}无{rt1}||盾开时全队停手，拉角落背对" },
    ["尤尔"] = { order = 2, type = "BOSS", tips = "{rt8}尤尔{rt8}||[双重吐息]正面火焰必躲；[践踏]10码物理+击退||{rt1}无{rt1}||英雄难度专属(伊利丹赠虚空猎犬)；坦背对人群，近战保持10码外" },
    ["塔瓦洛克"] = { order = 3, type = "BOSS", tips = "{rt8}塔瓦洛克{rt8}||[地震]40码击晕/[水晶牢笼]禁锢/[裂劈]断地震||{rt1}必断：[地震]{rt1}||中牢笼跑开" },
    ["节点亲王沙法尔"] = { order = 4, type = "BOSS", tips = "{rt8}节点亲王沙法尔{rt8}||[火球]/[冰霜箭]/[冰霜新星]/[闪现]召[虚灵信标]||{rt1}必断：冰霜{rt1}||速杀信标防融合" },
    ["虚灵缚法者"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：虚灵缚法者{rt8}||[群体暗影箭]且给怪加血，优先秒||{rt1}必断：暗影箭{rt1}||" },
}

-- ===================== 奥金顿：奥金尼地穴 =====================
addon.GuideData.versions["2.0"]["奥金顿：奥金尼地穴"] = {
    ["死亡观察者希尔拉克"] = { order = 1, type = "BOSS", tips = "{rt8}死亡观察者希尔拉克{rt8}||[专注打击]随机高伤/[腐蚀]DOT/[灵魂集中]增伤||{rt1}必断：[专注打击]{rt1}||驱散腐蚀" },
    ["大主教玛拉达尔"] = { order = 2, type = "BOSS", tips = "{rt8}大主教玛拉达尔{rt8}||[灵魂尖啸]群体恐惧/[被偷灵魂]降疗/[召唤化身]||{rt1}必断：恐惧{rt1}||速杀被偷灵魂，25%前RUSH" },
    ["奥金尼侍僧"] = { order = 3, type = "MOB", tips = "{rt8}重点怪：奥金尼侍僧{rt8}||[暗影箭]可控制||{rt1}必断：暗影箭{rt1}||无息之桥远离" },
}

-- ===================== 奥金顿：塞泰克大厅 =====================
addon.GuideData.versions["2.0"]["奥金顿：塞泰克大厅"] = {
    ["黑暗编织者塞斯"] = { order = 1, type = "BOSS", tips = "{rt8}黑暗编织者塞斯{rt8}||[魔爆术]闪现后范围奥伤/召火冰奥暗4元素||{rt1}无{rt1}||见闪现钻柱后优先杀火元素" },
    ["利爪之王艾吉斯"] = { order = 2, type = "BOSS", tips = "{rt8}利爪之王艾吉斯{rt8}||[魔爆术]/[奥术箭雨]/[变形术]闪现躲柱后驱散||{rt1}必断：变形{rt1}||" },
    ["安苏"] = { order = 3, type = "BOSS", tips = "{rt8}安苏{rt8}||[惊魂尖叫]全团6秒昏迷(无法打断，提前套盾)；[法术炸弹]诅咒+抽蓝，中者停手||{rt1}必断：[羽毛飓风]可断；速杀[安苏的子嗣]{rt1}||75%/35%[放逐]召雏鸟AoE；[俯冲]击退；[撕裂血肉]DOT" },
    ["塞泰克卫兵"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：塞泰克卫兵{rt8}||[雷霆一击]高伤优先；新兵带[反射盾]物理打||{rt1}无{rt1}||" },
}

-- ===================== 奥金顿：暗影迷宫 =====================
addon.GuideData.versions["2.0"]["奥金顿：暗影迷宫"] = {
    ["赫尔默大使"] = { order = 1, type = "BOSS", tips = "{rt8}赫尔默大使{rt8}||[腐蚀酸液]正面锥形减甲/[恐惧]坦背对||{rt1}必断：恐惧{rt1}||全团吃恐惧保MT" },
    ["煽动者布莱卡特"] = { order = 2, type = "BOSS", tips = "{rt8}煽动者布莱卡特{rt8}||[煽动混乱]精神控制互殴/[战争践踏]/[冲锋]||{rt1}无{rt1}||分散站位RUSH速杀" },
    ["沃匹尔大师"] = { order = 3, type = "BOSS", tips = "{rt8}沃匹尔大师{rt8}||[暗影箭雨]/[传送]+[火雨]/召[虚空行者]回血||{rt1}必断：暗影箭{rt1}||被传送跑开速杀小怪" },
    ["摩摩尔"] = { order = 4, type = "BOSS", tips = "{rt8}摩摩尔{rt8}||[音爆]近距高自然伤/[磁性牵引]+[摩摩尔之触]沉默||{rt1}无{rt1}||被拉后跑开保持6码外" },
    ["邪兽人"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：邪兽人{rt8}||[暗影牧师]会[恐惧]多控制||{rt1}必断：恐惧{rt1}||" },
}

-- ===================== 逃离敦霍尔德 =====================
addon.GuideData.versions["2.0"]["逃离敦霍尔德"] = {
    ["德拉克中尉"] = { order = 1, type = "BOSS", tips = "{rt8}德拉克中尉{rt8}||[旋风斩]/[致死打击]/[破胆怒吼]坦背对||{rt1}必断：恐惧{rt1}||治疗留反恐/徽章" },
    ["斯卡洛克上尉"] = { order = 2, type = "BOSS", tips = "{rt8}斯卡洛克上尉{rt8}||[圣光术]自检/[制裁之锤]晕/带[敦霍尔德看守]治疗||{rt1}必断：圣光术{rt1}||先杀牧师断治疗" },
    ["时空猎手"] = { order = 3, type = "BOSS", tips = "{rt8}时空猎手{rt8}||[沙尘吐息]正面/[死亡迫近]点名/[魔解光环]驱散||{rt1}驱散点名{rt1}||清三波小龙" },
    ["敦霍尔德法师"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：敦霍尔德法师{rt8}||[火球术]/[变形术]必断||{rt1}必断：变形{rt1}||斥候[驱散射击]清仇恨优先杀" },
}

-- ===================== 开启黑暗之门 =====================
addon.GuideData.versions["2.0"]["开启黑暗之门"] = {
    ["时空领主德亚"] = { order = 1, type = "BOSS", tips = "{rt8}时空领主德亚{rt8}||[奥术清偿]范围奥伤/[时间流逝]减速/[吸引]拉人||{rt1}无{rt1}||分散，被拉即跑开" },
    ["坦普卢斯"] = { order = 2, type = "BOSS", tips = "{rt8}坦普卢斯{rt8}||[重伤]叠层降疗/[飞翼打击]击飞清仇免疫嘲讽||{rt1}无{rt1}||坦开减伤防击飞" },
    ["埃欧努斯"] = { order = 3, type = "BOSS", tips = "{rt8}埃欧努斯{rt8}||[时间停止]范围定身4秒/[沙尘吐息]/[激怒]||{rt1}无{rt1}||分散，时间停止前保坦血" },
    ["裂隙守卫者"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：裂隙守卫者/领主{rt8}||速杀关裂隙别打麦迪文护盾||{rt1}无{rt1}||永恒雏龙3只同步攻击优先集火" },
}

-- ===================== 风暴要塞：禁魔监狱 =====================
addon.GuideData.versions["2.0"]["风暴要塞：禁魔监狱"] = {
    ["自由的瑟雷凯斯"] = { order = 1, type = "BOSS", tips = "{rt8}自由的瑟雷凯斯{rt8}||[虚空领域]黑圈/[腐蚀之种]远离/[暗影新星]击退||{rt1}无{rt1}||中种离队友靠墙" },
    ["末日预言者达尔莉安"] = { order = 2, type = "BOSS", tips = "{rt8}末日预言者达尔莉安{rt8}||[末日预言者的礼物]诅咒(奶则奶BOSS)/[旋风]/[暗影波]||{rt1}无{rt1}||中诅咒别治疗，躲旋风" },
    ["天怒预言者苏克拉底"] = { order = 3, type = "BOSS", tips = "{rt8}天怒预言者苏克拉底{rt8}||[邪能献祭]15码火环/[邪火震击]DOT/[冲锋]火墙||{rt1}驱散DOT{rt1}||引导火墙到场外" },
    ["预言者斯克瑞斯"] = { order = 4, type = "BOSS", tips = "{rt8}预言者斯克瑞斯{rt8}||开4牢房出怪(含[夺心魔]恐惧)/[精神控制]||{rt1}必断：恐惧{rt1}||分牢房逐个击杀" },
    ["虚灵"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：虚灵{rt8}||[法力燃烧]优先||{rt1}无{rt1}||开BOSS前清隐身女妖" },
}

-- ===================== 风暴要塞：生态船 =====================
addon.GuideData.versions["2.0"]["风暴要塞：生态船"] = {
    ["指挥官萨拉妮丝"] = { order = 1, type = "BOSS", tips = "{rt8}指挥官萨拉妮丝{rt8}||[奥术回响]增奥伤(驱散)/[援军召唤]修理工||{rt1}驱散回响{rt1}||集火修理工" },
    ["高级植物学家弗雷温"] = { order = 2, type = "BOSS", tips = "{rt8}高级植物学家弗雷温{rt8}||变树放[宁静]回血+召[魔花保护者]速杀魔花||{rt1}无{rt1}||带离BOSS防回血" },
    ["看管者索恩格林"] = { order = 3, type = "BOSS", tips = "{rt8}看管者索恩格林{rt8}||[地狱烈焰]15码火/[牺牲]传送吸血昏迷||{rt1}无{rt1}||躲火圈，被点名跑开" },
    ["拉伊"] = { order = 4, type = "BOSS", tips = "{rt8}拉伊{rt8}||[元素转换]换抗/[荆棘鞭笞]DOT/召[荆棘]专人杀花||{rt1}驱散疾病{rt1}||" },
    ["迁跃扭木"] = { order = 5, type = "BOSS", tips = "{rt8}迁跃扭木{rt8}||[范围昏迷]25码/召[树苗]回血/[空间撕裂]AOE||{rt1}无{rt1}||速杀树苗远程最远" },
    ["萨特"] = { order = 6, type = "MOB", tips = "{rt8}重点怪：萨特/血精灵{rt8}||[地狱烈焰]增益，先杀血精灵再开BOSS||{rt1}无{rt1}||路上魔花速清" },
}

-- ===================== 风暴要塞：能源舰 =====================
addon.GuideData.versions["2.0"]["风暴要塞：能源舰"] = {
    ["看守者盖罗基尔"] = { order = 1, type = "MOB", tips = "{rt8}看守者盖罗基尔{rt8}||[磁能之怒]/[过载]/[震荡电击]打断分散||{rt1}必断：施法{rt1}||" },
    ["看守者埃隆汉"] = { order = 2, type = "MOB", tips = "{rt8}看守者埃隆汉{rt8}||[顺劈]/[破甲]/[投掷]坦背对躲顺劈||{rt1}无{rt1}||" },
    ["机械领主卡帕西图斯"] = { order = 3, type = "BOSS", tips = "{rt8}机械领主卡帕西图斯{rt8}||[磁能之怒]奥火换伤/[法力干扰]/[暴击护盾]||{rt1}无{rt1}||分散躲元素，破盾集火" },
    ["灵术师塞比瑟蕾"] = { order = 4, type = "BOSS", tips = "{rt8}灵术师塞比瑟蕾{rt8}||召火暗[元素]/[火焰冲击]/[暗影箭]先杀元素||{rt1}必断：暗影箭{rt1}||" },
    ["计算者帕萨雷恩"] = { order = 5, type = "BOSS", tips = "{rt8}计算者帕萨雷恩{rt8}||[支配]精神控制/[奥术洪流]沉默/召[虚空怨灵]/[魔爆术]||{rt1}驱控/变羊{rt1}||杀怨灵" },
    ["血精灵卫兵"] = { order = 6, type = "MOB", tips = "{rt8}重点怪：血精灵卫兵{rt8}||[奥术豁免]控制优先||{rt1}无{rt1}||机械构造体[力场]优先清" },
}

-- ===================== 魔导师平台（12.0 至暗之夜重制版，原 TBC 2.0 首现，沿用当前名册） =====================
addon.GuideData.versions["2.0"]["魔导师平台"] = {
    ["奥能金刚库斯托斯"] = { order = 1, type = "BOSS", tips = "{rt8}奥能金刚库斯托斯{rt8}||[奥术残渣]地上毒圈必躲；[补给协议]召能量宝珠，全团去撞球，球被Boss吸收则A全团+自增伤20%||{rt1}处理：[虚灵枷锁]点名定身(军马/灵车可解)可断{rt1}||坦拉平台边缘绕开毒圈；别吃太多球(每跳5位数debuff)" },
    ["瑟拉奈尔·日鞭"] = { order = 2, type = "BOSS", tips = "{rt8}瑟拉奈尔·日鞭{rt8}||[符文印记]点名远离人群；[镇压立场]出罩子，被点名进罩消DOT||{rt1}必躲：[静默浪潮]读条前进站罩规避(站外被沉默8秒){rt1}||[加速结界]坦预警攻速+100%奥伤开减伤" },
    ["吉美尔鲁斯"] = { order = 3, type = "BOSS", tips = "{rt8}吉美尔鲁斯{rt8}||[神经链接]治疗吸收盾+玩家增伤，触碰自己水母解；[寰宇刺击]点名+DOT结束脚下出水||{rt1}必躲：[星界束缚]拉人每秒DOT，反向跑注意地板{rt1}||找红箭头点亮的水母解链接" },
    ["迪詹崔乌斯"] = { order = 4, type = "BOSS", tips = "{rt8}迪詹崔乌斯{rt8}||[贪噬之熵]点名DOT(紫色弹道)结束放一圈宝珠；[不稳定的虚空精华]地板出圈过去接球，不接全团AOE||{rt1}处理：[庞大碎片]坦8码内AOE+击退+脚下出水{rt1}||提前绿坝可免疫弹道点名" },
    ["辛多雷魔导师"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：辛多雷魔导师/奥术哨兵/符文破法者/炽热炎术士/法力浮龙{rt8}||[奥术光束]正条绿坝可免；[燃烧]读条提前绿坝；[符文破法者战刃]点名绿坝免疫||{rt1}浮龙buff为铁鬃机制优先控杀法系{rt1}||房前辛多雷随从清完再开" },
}
