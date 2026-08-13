-- BossTips Guide Data
-- Expansion: Midnight (12.0) — native ONLY (remakes of BfA/DF omitted; they live in 8.0/10.0 native + M+ Current)
-- Scope: Native dungeons only (NOT Mythic+).
-- NOTE: Edit in-game via Settings -> 攻略编辑. WTF overrides (BossTipsGlobalDB.guides) take PRIORITY.
--       M+ season files take priority over native on name collision.
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {} }
addon.GuideData.versions = addon.GuideData.versions or {}
addon.GuideData.versions["12.0"] = addon.GuideData.versions["12.0"] or {}
-- 版本标签与排序（主文件据此动态发现版本，无需修改主文件）
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.versionInfo["12.0"] = { label = "至暗之夜", order = 12 }


addon.GuideData.meta = addon.GuideData.meta or {}
-- 副本编号（Blizzard DB2：Map.db2 / JournalInstance.db2 / MapChallengeMode.db2）
addon.GuideData.meta["毒牙祭坛"] = { mapID = 2993, journalID = 1322, challengeID = 588 }
addon.GuideData.meta["密谋小径"] = { mapID = 2813, journalID = 1304, challengeID = 587 }
addon.GuideData.meta["纳洛拉克的洞穴"] = { mapID = 2825, journalID = 1311, challengeID = 586 }
addon.GuideData.meta["虚空之痕竞技场"] = { mapID = 2923, journalID = 1313, challengeID = 585 }
addon.GuideData.meta["夺目谷"] = { mapID = 2859, journalID = 1309, challengeID = 584 }


addon.GuideData.versions["12.0"]["毒牙祭坛"] = {
    ["拉维"] = { order = 1, type = "BOSS", tips = "{rt8}拉维{rt8}||开局交互摧毁6个[腐蚀迷雾图腾]开门；[进食狂热]阶段把Boss拉向无尸体的血肉堆、全员踩[脏食者]破盾||{rt1}[反刍]疾病需驱散并躲波、[三重喷吐]松散站位{rt1}||[腐肉喷发]前刷满血；[血之气息]近血肉堆涨攻速；坦[水击]重伤开减伤" },
    ["扭缠盘蛇"] = { order = 2, type = "BOSS", tips = "{rt8}扭缠盘蛇{rt8}||[同步毒液]全程持续掉血需群疗||{rt1}[毒性萎缩]连续三次必须每次打断{rt1}||[复仇猛攻]走出[钻地冲锋]线、把[毒液喷射]正面引离人群；[尾刃]坦减伤" },
    ["祖尔加"] = { order = 3, type = "BOSS", tips = "{rt8}祖尔加{rt8}||[仪式毒液]非史诗也出现、分摊/自疗||{rt1}打断/拦截[毒牙仪式]光束，被[毒牙强化]增伤者优先击杀规避{rt1}||[碎斧]按红色箭头躲飞斧、[切骨者]持续伤害驱散减伤" },
    ["腐蚀迷雾图腾"] = { order = 4, type = "MOB", tips = "{rt8}腐蚀迷雾图腾(重点怪){rt8}||入场首区6个图腾，交互摧毁开门；承受伤害不再打断摧毁||{rt1}速交互相隔摧毁、避开[不稳定图腾]持续毒伤{rt1}||交互范围已提高，优先清理守怪" },
    ["双毒牙劫掠者"] = { order = 5, type = "MOB", tips = "{rt8}双毒牙劫掠者(重点怪){rt8}||免疫控制，[瘫痪射击]需魔法驱散/自由||{rt1}把[毒息]正面朝外、[双重打击]坦开减伤{rt1}||近战高伤、远离正面" },
    ["高阶进化者"] = { order = 6, type = "MOB", tips = "{rt8}高阶进化者(重点怪){rt8}||[毒伤]读条必断、毒可驱||{rt1}用CC打断[进化]读条，防其变为[群体毒伤]{rt1}||优先控杀" },
    ["晋升之蛇"] = { order = 7, type = "MOB", tips = "{rt8}晋升之蛇(重点怪){rt8}||[感染]召幼体，被击败后幼体消失||{rt1}[穿刺嘶鸣]必断{rt1}||速清[幼体]防暴走，少踩剧毒旋风" },
}

addon.GuideData.versions["12.0"]["密谋小径"] = {
    ["凯斯媞亚·魔力之心"] = { order = 1, type = "BOSS", tips = "{rt8}凯斯媞亚·魔力之心{rt8}||坦与宠物[啃啃]换坦，速杀宠物触发石化削弱Boss||{rt1}[镜像]出现立刻CC并集火、[邪能风暴]必断{rt1}||[混乱弹幕]正面躲、坦开减伤" },
    ["赞恩·刃悲"] = { order = 2, type = "BOSS", tips = "{rt8}赞恩·刃悲{rt8}||[剧毒]坦及时驱毒/自疗||{rt1}[当日送达]扔桶阶段全力rush{rt1}||派人踩[邪能桶]消除、未开桶可挡手枪；[杀戮盛宴]群疗" },
    ["歼灭者萨祖克斯"] = { order = 3, type = "BOSS", tips = "{rt8}歼灭者萨祖克斯{rt8}||躲正面斧砍，保持移动||{rt1}被点名生成的[巨斧]速拆防增伤{rt1}||坦居中、[魔化狂怒]开大减伤带位躲[邪能池]；[燃烧脚步]长持续考验走位" },
    ["利希尔·烬怒"] = { order = 4, type = "BOSS", tips = "{rt8}利希尔·烬怒{rt8}||[古尔丹之指]召小鬼后走[恶魔之门]穿[邪能波]免伤||{rt1}[混乱之箭]最高优先级打断{rt1}||坦接[恐惧魔]集火、[邪能波]增益存活恶魔100%急速务必先清；[邪能护盾]减伤无视" },
    ["腐化的术士"] = { order = 5, type = "MOB", tips = "{rt8}腐化的术士(重点怪){rt8}||[厄运诅咒]全队分摊伤害||{rt1}诅咒及时驱散/治疗{rt1}||优先控杀减少叠层" },
    ["酒馆事件"] = { order = 6, type = "MOB", tips = "{rt8}酒馆事件(重点){rt8}||限时五星，清怪累积进度达5星即结束拿增益||{rt1}事件期间勿切换角色、集火快速达标{rt1}||达5星进度已降20%、增益持续4分钟" },
}

addon.GuideData.versions["12.0"]["纳洛拉克的洞穴"] = {
    ["囤宝狂人"] = { order = 1, type = "BOSS", tips = "{rt8}囤宝狂人{rt8}||坦居中；[资源措施]在90/70/40%强化技能||{rt1}蘑菇堆[腐烂蘑菇]须12s内踩完否则[腐臭爆发]{rt1}||血肉→[强力吼叫]击退+DoT群疗、骨堆→[骨刺猛击]躲圈；[毒性孢子]驱毒" },
    ["寒冬哨兵"] = { order = 2, type = "BOSS", tips = "{rt8}寒冬哨兵{rt8}||躲[狂怒疾风]与[碎裂冷颤核心]||{rt1}[霜冻风暴]贴近Boss10码安全区输出破盾、防击退{rt1}||[冰川折磨]魔法可驱、[凛冬帷幕]叠层增伤需控距；雪堆可防滑" },
    ["纳洛拉克"] = { order = 3, type = "BOSS", tips = "{rt8}纳洛拉克{rt8}||[战神之怒/压倒性强攻]为团队机制，祖尔加拉跳坦身后开防御姿态||{rt1}[回响]分身放边缘、被点名远离{rt1}||[强力咆哮]击退站位于不被推入险地；坦[强力猛击]注意冲击区" },
    ["献祭供奉"] = { order = 4, type = "MOB", tips = "{rt8}献祭供奉(重点){rt8}||路上集齐6份供奉(浆果/钓鱼/苹果桶)才能召唤囤宝狂人||{rt1}熊德/炼金25点可点香升1%全能、雪原补给吃[锚定符文]减50%推力{rt1}||提前规划路线" },
    ["饥渴之灵"] = { order = 5, type = "MOB", tips = "{rt8}饥渴之灵(重点怪){rt8}||免疫控制||{rt1}优先击杀[饥饿雕像]、[痛苦盛宴]读条群疗{rt1}||[饥饿诅咒]诅咒驱散、控杀" },
    ["凛风隘口"] = { order = 6, type = "MOB", tips = "{rt8}凛风隘口(重点){rt8}||雪堆后藏身避[凛风]推力||{rt1}击败[冬暴]可停该区凛风、雪堆防冰面滑倒{rt1}||低优先级可绕" },
}

addon.GuideData.versions["12.0"]["虚空之痕竞技场"] = {
    ["塔兹拉尔"] = { order = 1, type = "BOSS", tips = "{rt8}塔兹拉尔{rt8}||远离[黑暗裂隙]吸力圈||{rt1}坦[宇宙尖刺]开减伤、[聚合暗影]召[空灵暗影]速杀{rt1}||躲[虚空冲刺]线；[空灵碎片]分散避免同人吃双发；[星界召回]后调整站位" },
    ["阿特洛苏斯"] = { order = 2, type = "BOSS", tips = "{rt8}阿特洛苏斯{rt8}||躲[剧毒吐息]正面锥||{rt1}[巨兽咆哮]坦开减伤、召[剧毒爬行者]速清{rt1}||踩[毒液喷溅]毒池掉血、绕净地拉怪；保持移动避击退" },
    ["煞戎努斯"] = { order = 3, type = "BOSS", tips = "{rt8}煞戎努斯{rt8}||将[引力宝珠]引到[不稳定奇点]6码内销毁||{rt1}[凝缩质量]叠层减速需控距{rt1}||[虚空瀑流]/[宇宙冲击]击退躲线；新[黑暗浪潮]以坦为目标" },
    ["笼控者"] = { order = 4, type = "MOB", tips = "{rt8}笼控者(重点怪){rt8}||周边笼子不停刷怪||{rt1}优先击杀[笼控者]止刷{rt1}||否则无限清同一波" },
    ["法术风暴拉杰克斯"] = { order = 5, type = "MOB", tips = "{rt8}法术风暴拉杰克斯(重点怪){rt8}||[雷鸣风暴]随机落雷||{rt1}[干扰宝珠]未及时击杀降全队急速{rt1}||已移除狂暴台风" },
    ["防御龟"] = { order = 6, type = "MOB", tips = "{rt8}防御龟(重点怪){rt8}||[龟甲防御]引导有限||{rt1}引导完眩晕并吃额外伤害，趁机爆发{rt1}||集火窗口" },
}

addon.GuideData.versions["12.0"]["夺目谷"] = {
    ["光明众花"] = { order = 1, type = "BOSS", tips = "{rt8}光明众花(梅蒂克/莱克希/凯兹基特){rt8}||三人共享血量均衡输出；[基石猛击]坦减伤并躲[肥沃壤土]||{rt1}[光束]必断、站入[光明之花光束]阻挡[光饱]层数{rt1}||防[光明之花蔓生]全团AoE；[荆棘扇]散开、[棘刃]流血群疗" },
    ["圣光猎手伊库兹"] = { order = 2, type = "BOSS", tips = "{rt8}圣光猎手伊库兹{rt8}||清/躲[血棘根须]防定身||{rt1}[翠绿践踏]击退远离边缘、[嗜血凝视]被点名跑动引Boss过根须销毁{rt1}||[棘唤者咆哮]群疗；50%[光狂暴怒]开爆发" },
    ["护光者鲁伊亚"] = { order = 3, type = "BOSS", tips = "{rt8}护光者鲁伊亚{rt8}||月鹿形态躲[光陨]圈与[光焰]射线||{rt1}[守卫之怒]必断{rt1}||熊形态[粉碎打击]散开、[剧痛撕咬]叠层流血需奶满清除；40%[谷灵]全技能循环开爆发" },
    ["兹欧凯特"] = { order = 4, type = "BOSS", tips = "{rt8}兹欧凯特{rt8}||速杀[光生鞭笞者]防潜入休眠||{rt1}[光明之花精华]宝珠均匀分人踩防Boss获盾{rt1}||用[浓缩光束]正面清休眠鞭笞者(留水坑靠边)；坦[棘刺]减伤、[渗流木质]群疗" },
    ["辉光棘颚"] = { order = 5, type = "MOB", tips = "{rt8}辉光棘颚(重点怪){rt8}||免疫控制||{rt1}[剧痛撕咬]坦流血需净毒、躲[日焰吐息]正面{rt1}||优先控杀" },
    ["薯蛙主母"] = { order = 6, type = "MOB", tips = "{rt8}薯蛙主母(重点怪){rt8}||[舌卷]把坦抛飞注意站位||{rt1}[剧毒喷吐]群毒驱散、速清[蟾卵]防爆幼蛙{rt1}||[新生的薯蛙]击退注意" },
}
