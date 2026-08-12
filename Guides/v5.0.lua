-- BossTips Guide Data
-- Expansion: Mists of Pandaria (5.0-5.3)
-- Scope: Native dungeons only (NOT Mythic+). MoP revamps of Classic count as MoP's own.
-- NOTE: Edit in-game via Settings -> 攻略编辑. WTF overrides (BossTipsGlobalDB.guides) take PRIORITY.
--       M+ season files take priority over native on name collision.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {} }
addon.GuideData.versions = addon.GuideData.versions or {}
addon.GuideData.versions["5.0"] = addon.GuideData.versions["5.0"] or {}
-- 版本标签与排序（主文件据此动态发现版本，无需修改主文件）
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.versionInfo["5.0"] = { label = "5.0 熊猫人之谜", order = 5 }


addon.GuideData.meta = addon.GuideData.meta or {}
-- 副本编号（Blizzard DB2：Map.db2 / JournalInstance.db2 / MapChallengeMode.db2）
addon.GuideData.meta["青龙寺"] = { mapID = 960, journalID = 313, challengeID = 2 }
addon.GuideData.meta["风暴烈酒酿造厂"] = { mapID = 961, journalID = 302, challengeID = 56 }
addon.GuideData.meta["影踪禅院"] = { mapID = 959, journalID = 312, challengeID = 58 }
addon.GuideData.meta["魔古山宫殿"] = { mapID = 994, journalID = 321, challengeID = 60 }
addon.GuideData.meta["围攻砮皂寺"] = { mapID = 1011, journalID = 324, challengeID = 59 }


-- 青龙寺 (Temple of the Jade Serpent)
addon.GuideData.versions["5.0"]["青龙寺"] = {
    ["贤者马里"] = { order = 1, type = "BOSS", tips = "{rt8}贤者马里{rt8}||远离池中水域，躲[冲刷]旋转水柱别被击退{rt1}必断：[水流长枪]随机点名远程高伤{rt1}||速杀刷新的[腐化活水]；[腐化漩涡]点名后跑边缘放下再远离，落地即爆" },
    ["游学者石步"] = { order = 2, type = "BOSS", tips = "{rt8}游学者石步（争吵与危殆）{rt8}||集火其中一个叠到约7-8层[强烈]后换另一个，对方层数清零{rt1}必断：[炎阳光线]等读条{rt1}||治疗保持[优越感]减伤；单点勿双线，避免叠满10层免疫15秒" },
    ["刘·焰心"] = { order = 3, type = "BOSS", tips = "{rt8}刘·焰心{rt8}||躲[飞焰]火圈与全向[火浪]；70%[玉珑之舞]伤害大增开减伤{rt1}必断：[邪秽之雾]{rt1}||坦克[烈焰打击]由治疗驱散；30%化龙后躲[玉珑吐息]正面与地上绿火" },
    ["疑之煞"] = { order = 4, type = "BOSS", tips = "{rt8}疑之煞{rt8}||[虚无之触]点2人，驱散1人、集火治疗另1人{rt1}必断：[凋零意志]{rt1}||[凡尘之羁]无敌时克隆体点名你，抱团A掉防其治疗BOSS" },
    ["游荡恶煞"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：游荡恶煞/腐化水语者（图书馆区）{rt8}||[惊骇尖啸]恐惧全团必须打断；[水流长枪]随机点名打断{rt1}必断：[惊骇尖啸][水流长枪]{rt1}||击杀后尸体仍掉血，远离尸体" },
}

-- 风暴烈酒酿造厂 (Stormstout Brewery)  -- 注：游戏内实例名为"风暴烈酒酿造厂"
addon.GuideData.versions["5.0"]["风暴烈酒酿造厂"] = {
    ["乌克乌克"] = { order = 1, type = "BOSS", tips = "{rt8}乌克乌克{rt8}||坦克拉背对人群躲[震地]锥形；点酒桶撞BOSS叠易伤{rt1}必断：无{rt1}||90/60/30%[发疯]刷酒桶，DPS踩桶撞BOSS加速击杀" },
    ["跳跳大王"] = { order = 2, type = "BOSS", tips = "{rt8}跳跳大王{rt8}||站背后躲[胡萝卜的吐息]旋转锥；远离[席卷之风]旋风{rt1}必断：无{rt1}||捡Bopper掉的[巨锤]秒清兔妖；优先AOE小怪防碾压" },
    ["破桶而出的炎诛"] = { order = 3, type = "BOSS", tips = "{rt8}破桶而出的炎诛{rt8}||必须始终有人贴近BOSS，否则读[麦酒箭]全团高伤{rt1}必断：阶段切换读条{rt1}||[黑暗麦酒]叠层保持移动消除；[膨胀]点名远离人群自爆" },
    ["携雷兔妖"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：跳跳兔妖群（前往B2通道）{rt8}||[惊声尖啸]召唤兔妖，捡[巨锤]范围秒清{rt1}必断：投弹读条{rt1}||保持移动躲胡萝卜汁与旋风，别让兔妖叠层" },
}

-- 影踪禅院 (Shado-Pan Monastery)
addon.GuideData.versions["5.0"]["影踪禅院"] = {
    ["古·穿云"] = { order = 1, type = "BOSS", tips = "{rt8}古·穿云{rt8}||分散站位躲[召雷]连锁；[静电力场]点名跑开{rt1}必断：[召雷]可对单目标{rt1}||50%转阶段杀[碧空翔龙]：龙头朝外躲[闪电吐息]，[磁力护盾]抱团刷爆治疗吸收" },
    ["雪流大师"] = { order = 2, type = "BOSS", tips = "{rt8}雪流大师{rt8}||P1站背后躲[怒拳]、避开[旋风腿]龙卷{rt1}必断：阶段读条{rt1}||P2躲穿梭[火球]；P3[招架姿态]绕背输出，被[擒拿重摔]点名者跑" },
    ["狂之煞"] = { order = 3, type = "BOSS", tips = "{rt8}狂之煞{rt8}||分散站位躲[煞刺]与[迷乱重击]；[烟刃]旋风别踩{rt1}必断：[迷乱重击]可驱散{rt1}||速杀小怪[暴躁恶能]；30%狂暴开减伤" },
    ["祝踏岚"] = { order = 4, type = "BOSS", tips = "{rt8}祝踏岚{rt8}||[仇恨]满了会失控，用[静心]消除；[恶意之环]成型即踏出圈{rt1}无{rt1}||[紧握的仇恨]火球追人绕圈放风筝；受伤即涨仇恨保持静心" },
    ["被煞附身武僧"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：被煞附身武僧（走廊/庭院）{rt8}||小怪血量清空后须对中央漂浮熊猫引导[静心]才会真正死亡{rt1}必断：[暗影箭]等读条{rt1}||保持移动躲地面黑水与[煞刺]，避免ADD过载" },
}

-- 魔古山宫殿 (Mogu'shan Palace)
addon.GuideData.versions["5.0"]["魔古山宫殿"] = {
    ["君王的试炼"] = { order = 1, type = "BOSS", tips = "{rt8}君王的试炼（库乌艾/冥谷子/哈伊岩）{rt8}||依次击杀三部族首领；先杀[穆夏巴]宠防DoT{rt1}必断：读条{rt1}||[震荡波]躲锥形、[旋风]躲龙卷；[燃尽]保持间距、[流星]集合分摊" },
    ["杰翰"] = { order = 2, type = "BOSS", tips = "{rt8}杰翰{rt8}||优先击杀最危险ADD：[格林托克巫师]必断、[铁肤]高减伤{rt1}必断：[格林托克巫师]控制技{rt1}||清完ADD后爆发杰翰，防其[鲁莽鼓舞]狂暴增益" },
    ["武器大师席恩"] = { order = 3, type = "BOSS", tips = "{rt8}武器大师席恩{rt8}||拉门口角落，[震地猛击]时左右换位；[烈焰之环]立刻走出{rt1}无{rt1}||66%[刀阵]沿墙平行站位别动；33%[天降死雨]为固有伤害硬刷；躲[旋飞之斧]" },
    ["格林托克斥候"] = { order = 4, type = "MOB", tips = "{rt8}重点怪：格林托克斥候（杰翰区）{rt8}||被斥候发现后5分钟内须击杀杰翰（成就）{rt1}必断：控制与读条{rt1}||路线提前清场，避免ADD过载触发[鲁莽鼓舞]" },
}

-- 围攻砮皂寺 (Siege of Niuzao Temple)  -- 注：游戏内实例名为"围攻砮皂寺"
addon.GuideData.versions["5.0"]["围攻砮皂寺"] = {
    ["宰相金巴卡"] = { order = 1, type = "BOSS", tips = "{rt8}宰相金巴卡{rt8}||踩腐蚀毒液缩小水潭并叠[树脂残渣]增伤；速杀[腐蚀血球]防涨水{rt1}无{rt1}||[引爆]伤害随水潭面积，压BOSS爆发击杀或轮流踩水控面积" },
    ["指挥官沃加克"] = { order = 2, type = "BOSS", tips = "{rt8}指挥官沃加克{rt8}||P1用[腐蚀焦油桶]砸螳螂妖上易伤；躲[不稳定爆炸]自爆{rt1}必断：投弹{rt1}||P2[冲撞]别站一线、[千刃]旋风散开；[疾速]叠层速杀" },
    ["将军帕瓦拉克"] = { order = 3, type = "BOSS", tips = "{rt8}将军帕瓦拉克{rt8}||躲[利刃冲锋]落点与冲锋路线；[风暴]为固有伤害硬刷并先垫治疗{rt1}必断：援军读条{rt1}||65/35%[壁垒]开盾召唤援军，用[攻城炸药]炸盾/砸小怪，炸药arming后远离" },
    ["翼虫首领尼诺洛克"] = { order = 4, type = "BOSS", tips = "{rt8}翼虫首领尼诺洛克{rt8}||[速干树脂]点名持续移动/跳跃消除，否则被定身{rt1}无{rt1}||[强风]后退时顶风走位；躲红圈[毒潭]；过桥追击时贴边输出" },
    ["希克提克琥珀飞翼"] = { order = 5, type = "MOB", tips = "{rt8}重点怪：希克提克虫群/琥珀飞翼（路上）{rt8}||[投弹]随机火圈保持移动；[不稳定爆炸]死亡自爆远离{rt1}必断：投弹{rt1}||成就需先杀[琥珀飞翼]再击败沃加克" },
}

