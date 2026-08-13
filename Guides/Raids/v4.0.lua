-- ============================================================================
-- BossTips Raid Guide Data —— 版本 4.0 团本攻略
-- 实例 key 为国服名；首领 key 为国服名；encounterId 取自 BigWigs/DBM（原样保留）。
-- 攻略格式：{rt8}名字{rt8}||[机制]描述||{rt1}必断/速杀：…{rt1}||坦：…治疗：…输出：…
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["4.0"] = addon.GuideData.raids["4.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 暮光堡垒 (instanceId 671) =====================
addon.GuideData.raids["4.0"]["暮光堡垒"] = {
    ["哈尔弗斯·碎龙者"] = { order = 1, type = "BOSS", tips = [=[{rt8}哈尔弗斯·碎龙者{rt8}||[龙]绑着不同龙提供buff，需先杀对应龙削弱；[定时]计时||{rt1}必断/速杀：无；按龙buff决定击杀顺序{rt1}||坦：拉住；输出：转火龙]=], tipsByDifficulty = {} },
    ["瓦里奥娜与瑟拉利昂"] = { order = 2, type = "BOSS", tips = [=[{rt8}瓦里奥娜与瑟拉利昂{rt8}||[双龙]轮流入场，[深呼吸]与[陨石]需躲；[暗影]dot||{rt1}必断/速杀：无；躲深呼吸与陨石{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["晋升者议会"] = { order = 3, type = "BOSS", tips = [=[{rt8}晋升者议会{rt8}||[四元素]火/冰/土/风分阶段，需打断对应；[融合]||{rt1}必断/速杀：按元素打断；分边集火{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["古加尔"] = { order = 4, type = "BOSS", tips = [=[{rt8}古加尔{rt8}||[寄生]点名；[暗影]dot；[火]；P2[狂乱]加速||{rt1}必断/速杀：无；[寄生]被点名远离{rt1}||坦：拉住；治疗：解毒]=], tipsByDifficulty = {} },
    ["辛奈丝特拉"] = { order = 5, type = "BOSS", tips = [=[{rt8}辛奈丝特拉{rt8}||[孵化]召唤小龙需清；[暗影]高伤；[狂暴]计时||{rt1}必断/速杀：无；清小龙{rt1}||坦：拉住；输出：清小龙]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["暮光堡垒"] = { isRaid = true, instanceId = 671, encounterIds = {
    ["哈尔弗斯·碎龙者"] = 156,
    ["瓦里奥娜与瑟拉利昂"] = 157,
    ["晋升者议会"] = 158,
    ["古加尔"] = 167,
    ["辛奈丝特拉"] = 168,
} }

-- ===================== 黑翼血环 (instanceId 669) =====================
addon.GuideData.raids["4.0"]["黑翼血环"] = {
    ["欧姆诺顿防御系统"] = { order = 1, type = "BOSS", tips = [=[{rt8}欧姆诺顿防御系统{rt8}||[四机器人]毒/火/冰/电轮流激活，需对应应对；[切换]||{rt1}必断/速杀：按激活机器人打断；转火{rt1}||坦：拉；输出：按激活集火]=], tipsByDifficulty = {} },
    ["玛格玛尔"] = { order = 2, type = "BOSS", tips = [=[{rt8}玛格玛尔{rt8}||[链]需把头拉到[钉]上钉住减伤；[喷火]正面||{rt1}必断/速杀：无；拉头钉住{rt1}||坦：拉头；输出：钉]=], tipsByDifficulty = {} },
    ["阿特拉米德"] = { order = 3, type = "BOSS", tips = [=[{rt8}阿特拉米德{rt8}||[音波]需看地面圈躲；[追踪]点名；[沉默]||{rt1}必断/速杀：无；躲音波圈{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["奇美隆"] = { order = 4, type = "BOSS", tips = [=[{rt8}奇美隆{rt8}||[双重打击]致命需双坦；[灭绝]全团秒需抬血；[剧毒]dot||{rt1}必断/速杀：无；[灭绝]时全员保命{rt1}||坦：双坦；治疗：灭绝期爆发]=], tipsByDifficulty = {} },
    ["玛洛拉克"] = { order = 5, type = "BOSS", tips = [=[{rt8}玛洛拉克{rt8}||[试管]需按颜色打断对应；[释放]阶段；[火/冰]||{rt1}必断/速杀：按试管颜色打断；集火{rt1}||坦：拉；输出：控试管]=], tipsByDifficulty = {} },
    ["奈法利安"] = { order = 6, type = "BOSS", tips = [=[{rt8}奈法利安{rt8}||[电极]需站同极；[暗影]全团；P2[龙骨]点名||{rt1}必断/速杀：无；按电极站位{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["黑翼血环"] = { isRaid = true, instanceId = 669, encounterIds = {
    ["欧姆诺顿防御系统"] = 169,
    ["玛格玛尔"] = 170,
    ["阿特拉米德"] = 171,
    ["奇美隆"] = 172,
    ["玛洛拉克"] = 173,
    ["奈法利安"] = 174,
} }

-- ===================== 巨龙之魂 (instanceId 967) =====================
addon.GuideData.raids["4.0"]["巨龙之魂"] = {
    ["莫卓克"] = { order = 1, type = "BOSS", tips = [=[{rt8}莫卓克{rt8}||[水晶]点名需撞水晶分担；[践踏]全团；[狂暴]计时||{rt1}必断/速杀：无；[水晶]被点名撞水晶分担{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["哈加拉·风暴绑缚者"] = { order = 2, type = "BOSS", tips = [=[{rt8}哈加拉·风暴绑缚者{rt8}||[冰/电]两阶段切换，冰需[冰链]连、电需分散；[风暴]||{rt1}必断/速杀：无；冰阶段连链电阶段散{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["死亡之翼的脊背"] = { order = 3, type = "BOSS", tips = [=[{rt8}死亡之翼的脊背{rt8}||[装甲]需打腐化钢板并[捆]固定；[触手]需拉离；载具阶段||{rt1}必断/速杀：无；打钢板捆触手{rt1}||坦：拉触手；输出：打钢板]=], tipsByDifficulty = {} },
    ["督军佐诺兹"] = { order = 4, type = "BOSS", tips = [=[{rt8}督军佐诺兹{rt8}||[黑球]点名需撞球分担；[暗]全团；[狂暴]计时||{rt1}必断/速杀：无；[黑球]被点名撞球{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["不眠的约沙伊"] = { order = 5, type = "BOSS", tips = [=[{rt8}不眠的约沙伊{rt8}||[脓液]按颜色决定击杀顺序(红优先)；[触手]||{rt1}必断/速杀：无；按颜色顺序集火{rt1}||坦：拉；输出：按色集火]=], tipsByDifficulty = {} },
    ["奥特拉希昂"] = { order = 6, type = "BOSS", tips = [=[{rt8}奥特拉希昂{rt8}||[时光]按时序躲[暮光]；[英勇]阶段需爆发；[狂暴]计时||{rt1}必断/速杀：无；按时光机制跑位{rt1}||坦：拉；输出：英勇期爆发]=], tipsByDifficulty = {} },
    ["黑角"] = { order = 7, type = "BOSS", tips = [=[{rt8}黑角{rt8}||[船战]需打炮击龙；[降临]落地阶段；[运输机]||{rt1}必断/速杀：无；操炮击龙{rt1}||坦：拉；输出：操炮]=], tipsByDifficulty = {} },
    ["死亡之翼的疯狂"] = { order = 8, type = "BOSS", tips = [=[{rt8}死亡之翼的疯狂{rt8}||[平台]多平台轮流，[血液]点名需分担；[灼烧]；P4[本体]||{rt1}必断/速杀：无；[血液]被点名分担{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["巨龙之魂"] = { isRaid = true, instanceId = 967, encounterIds = {
    ["莫卓克"] = 311,
    ["哈加拉·风暴绑缚者"] = 317,
    ["死亡之翼的脊背"] = 318,
    ["督军佐诺兹"] = 324,
    ["不眠的约沙伊"] = 325,
    ["奥特拉希昂"] = 331,
    ["黑角"] = 332,
    ["死亡之翼的疯狂"] = 333,
} }

-- ===================== 火焰之地 (instanceId 720) =====================
addon.GuideData.raids["4.0"]["火焰之地"] = {
    ["贝丝蒂拉克"] = { order = 1, type = "BOSS", tips = [=[{rt8}贝丝蒂拉克{rt8}||[网]上蜘蛛网打卵；[下落]阶段落地；[毒]dot||{rt1}必断/速杀：无；网上清卵、落地转火{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["莱诺斯领主"] = { order = 2, type = "BOSS", tips = [=[{rt8}莱诺斯领主{rt8}||[脚]需打腿控移动；[熔岩]落点||{rt1}必断/速杀：无；打腿限制移动{rt1}||坦：拉；输出：打腿]=], tipsByDifficulty = {} },
    ["奥利瑟拉佐尔"] = { order = 3, type = "BOSS", tips = [=[{rt8}奥利瑟拉佐尔{rt8}||[飞行]阶段需吃[灰烬]保火；[俯冲]；[重生]||{rt1}必断/速杀：无；吃灰烬维持、躲俯冲{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["沙诺克斯"] = { order = 4, type = "BOSS", tips = [=[{rt8}沙诺克斯{rt8}||[陷阱]放置需拉狗踩；[狂暴]狗；[火]||{rt1}必断/速杀：无；拉狗踩陷阱{rt1}||坦：拉；输出：控狗]=], tipsByDifficulty = {} },
    ["巴拉克雷斯"] = { order = 5, type = "BOSS", tips = [=[{rt8}巴拉克雷斯{rt8}||[盾]需集火破；[刀片]点名；[治疗]add||{rt1}必断/速杀：无；集火破盾{rt1}||坦：拉；输出：控add]=], tipsByDifficulty = {} },
    ["大管家斯塔格海尔"] = { order = 6, type = "BOSS", tips = [=[{rt8}大管家斯塔格海尔{rt8}||[毒/火]两形态切换需换站位；[蝎子]阶段；[狂暴]计时||{rt1}必断/速杀：无；按形态换站位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["拉格纳罗斯"] = { order = 7, type = "BOSS", tips = [=[{rt8}拉格纳罗斯{rt8}||[种子]点名需远离引爆；[熔火]全团；[锤]落点；P3[击飞]||{rt1}必断/速杀：无；[种子]被点名远离、躲锤{rt1}||坦：拉；输出：躲机制]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["火焰之地"] = { isRaid = true, instanceId = 720, encounterIds = {
    ["贝丝蒂拉克"] = 192,
    ["莱诺斯领主"] = 193,
    ["奥利瑟拉佐尔"] = 194,
    ["沙诺克斯"] = 195,
    ["巴拉克雷斯"] = 196,
    ["大管家斯塔格海尔"] = 197,
    ["拉格纳罗斯"] = 198,
} }

-- ===================== 风神王座 (instanceId 754) =====================
addon.GuideData.raids["4.0"]["风神王座"] = {
    ["风之议会"] = { order = 1, type = "BOSS", tips = [=[{rt8}风之议会{rt8}||[三元素]需同时击杀防回血；[风/电/冰]混合||{rt1}必断/速杀：无；同时集火三元素{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["奥拉基尔"] = { order = 2, type = "BOSS", tips = [=[{rt8}奥拉基尔{rt8}||[阶段]风/电/冰/土轮流，[闪电]点名；[狂暴]计时||{rt1}必断/速杀：无；按阶段应对{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["风神王座"] = { isRaid = true, instanceId = 754, encounterIds = {
    ["风之议会"] = 154,
    ["奥拉基尔"] = 155,
} }

