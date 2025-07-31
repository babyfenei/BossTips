local addonName, addon = ...

-- 添加版本号
addon.version = "1.2.7"

-- 创建主框架
local frame = CreateFrame("Frame")

local BossData = {
    -- 11.0 赛季副本
    ["千丝之城"] = {
        -- BOSS部分
        ["演说者基克斯威兹克"] = {
            tips = "{rt8}演说者基克斯威兹克{rt8}||开打以BOSS为中心身边出个圈，所有人保持自己在boss圈内，并躲开头前||两个疑之影点名，让开先驱散一个||喧神教化AOE时所有人提前跑位到BOSS头前||||BOSS定期砸地板放黑水需要坦克拉开||圈只会跟BOSS走，坦克不拉走大家只好硬踩黑水了！",
        },
        ["女王之牙"] = {
            tips = "{rt8}女王之牙{rt8}||打正在攻击的BOSS||P1: 恩格斯攻击，躲各种地板，维克斯释放寒冰镰刀时，两两分散，不要站一条直线，并开减伤应对之后的DEBUFF||P2: 维克斯攻击，点T白圈集中踩，避免倒T；点名紫圈原来人群。",
        },
        ["凝结聚合体"] = {
            tips = "{rt8}凝结聚合体{rt8}||BOSS召唤黑球从场地边缘飞向BOSS||需要去接球别让BOSS吃球回血||吃到球的队友会染一个DEBUFF需要奶妈刷爆他。",
        },
        ["大捻接师艾佐"] = {
            tips = "{rt8}大捻接师艾佐{rt8}||BOSS会点名所有人几秒后脚下出软泥||在打死软泥之前无限定身||需要所有人在点名时集合方便速度AOE掉软泥||如果能自己解定身的职业可以无视||否则会一直定身影响后续需要跑位技能的躲避。",
        },
        -- 小怪部分
        ["苏雷吉缚丝者"] = {
            tips = "{rt8}苏雷吉缚丝者{rt8}||{rt1}流丝缠缚{rt1}必须打断",
        },
        ["皇家虫群卫士"] = {
            tips = "{rt8}皇家虫群卫士{rt8}||{rt1}贪婪之虫{rt1}需要全员减伤",
        },
        ["安苏雷克的传令官"] = {
            tips = "{rt8}安苏雷克的传令官{rt8}||{rt1}扭曲思绪{rt1}必须打断",
        },
        ["隐秘网士"] = {
            tips = "{rt8}隐秘网士{rt8}||主目标优先击杀。阴织冲击、愈合之网必须打断",
        },
        ["苏雷吉反自然者"] = {
            tips = "{rt8}苏雷吉反自然者{rt8}||{rt1}虚空之波{rt1}，尽量群控，尽量打断",
        },
        ["长者织影"] = {
            tips = "{rt8}长者织影{rt8}||{rt1}晦幽纺纱{rt1}需要集中站位，A掉限制移动的网",
        },
    },

    ["破晨号"] = {
        -- BOSS部分
        ["代言人夏多克朗"] = {
            tips = "{rt8}代言人夏多克朗{rt8}||打断暗影箭，不要被光束碰到（P1三条P2四条），提前站位||治疗第一时间驱散燃烧之影DEBUFF，然后刷血刷爆吸收盾||中塌缩第一时间去场边放水（点名最远的2个人，看见读条就用位移技能跑）||BOSS放完黑水T注意打断并拉离黑水||BOSS 50% 1%上鸟远离飞船，1%那次可以直接飞往老2小怪",
        },
        ["阿努布伊卡斯"] = {
            tips = "{rt8}阿努布伊卡斯{rt8}||T卡墙，出现黑圈所有人躲开||对着空旷处放球，避开球正面，球飞得越远伤害越低,治疗注意被球撞的人||出现小怪群控AOE掉||BOSS AOE会越来越痛，规划好减伤和治疗。",
        },
        ["拉夏南"] = {
            tips = "{rt8}拉夏南{rt8}||P1：躲开地上白圈，绿色点名推波注意人群方向，治疗在AOE时注意抬血，不要猛捶BOSS，第一时间捡炸弹丢BOSS，捡炸弹时注意开减伤，治疗注意抬血||P2转场:直接飞到BOSS场地等，或者吃球跟着BOSS飞||P2:P2增加白圈点名技能，中白圈的跑场地边缘放圈再位移回来，全程BOSS点名非坦队友放绿线||被点名人自己改变站位让毒浪出现在边缘不影响其他队友||场地上出倒计时火药桶需要捡桶丢BOSS脸上炸它||否则桶会爆炸全团AOE||二阶段BOSS离开飞船的时候利用战斗中上鸟功能沿着NPC点亮的悬浮光球追击。",
        },
        -- 小怪部分
        ["夜幕祭师"] = {
            tips = "{rt8}夜幕祭师{rt8}||钢条{rt1}折磨光束{rt1}，尽量晕断。{rt1}钢条冥河之种{rt1}别驱散，躲开人群",
        },
        ["夜幕影法师"] = {
            tips = "{rt8}夜幕影法师{rt8}||{rt1}诱捕暗影{rt1}，必须打断",
        },
        ["夜幕司令官"] = {
            tips = "{rt8}夜幕司令官{rt8}||{rt1}深渊嚎叫{rt1}必须打断",
        },
        ["夜幕黑暗建筑师"] = {
            tips = "{rt8}夜幕黑暗建筑师{rt8}||{rt1}折磨喷发{rt1}，中圈离开人群开好减伤，招引增援迅速转火，小怪刚出开非常弱",
        },
    },

    ["艾拉-卡拉，回响之城"] = {
        -- BOSS部分
        ["阿瓦诺克斯"] = {
            tips = "{rt8}阿瓦诺克斯{rt8}||躲开地板，偶尔可以踩一下||三连击时，T注意覆盖减伤||治疗注意留技能给群体AOE||群控减速，并转火小怪||定期召唤小蜘蛛无仇恨追人，需要控住清理。",
        },
        ["阿努布泽克特"] = {
            tips = "{rt8}阿努布泽克特{rt8}||躲开地上头前地板和会移动的虫群。Boss二阶段会放全场AOE虫群之眼||注意站到boss前面的圈圈里，躲好技能，出去就是死||点名一名队友几秒后会出现一圈小虫群AOE需要离开人群放圈||BOSS读条钻地冲击时，近战远离，躲开戳刺方向，躲开点名留下的蓝圈。",
        },
        ["收割者吉卡塔尔"] = {
            tips = "{rt8}收割者吉卡塔尔{rt8}||冲击波不友好对人群放||出啥躲啥，被网住就昏迷6秒，不能驱散的||场地边缘出现的小软泥打死会留下黑水||人踩上去会被定身并身下出现一只小软需要打掉才能解除||BOSS引导大招全场吸人时所有人需要主动去踩黑水定身避免被吸入。",
        },
        -- 小怪部分
        ["充血的爬行者"] = {
            tips = "{rt8}充血的爬行者{rt8}||充血的爬行者 残血之后控制，或者走开",
        },
        ["颤声侍从"] = {
            tips = "{rt8}颤声侍从{rt8}||{rt1}共振弹幕{rt1}必须打断",
        },
        ["伊可辛"] = {
            tips = "{rt8}伊可辛{rt8}||{rt1}惊惧尖鸣{rt1}必须打断",
        },
        ["沾血的网法师"] = {
            tips = "{rt8}沾血的网法师{rt8}||{rt1}恶臭齐射{rt1}必须打断",
        },
        ["哨兵鹿壳虫"] = {
            tips = "{rt8}哨兵鹿壳虫{rt8}||{rt1}预警尖鸣{rt1}必须打断，优先击杀",
        },

        ["鲜血监督者"] = {
            tips = "{rt8}鲜血监督者{rt8}||{rt1}毒液箭雨{rt1}必须打断",
        },
    },
    ["矶石宝库"] = {
        -- BOSS部分
        ["E.D.N.A"] = {
            tips = "{rt8}E.D.N.A{rt8}||躲开地刺，BOSS读红条时分散，不要中2根，每次打掉2根地刺||T开大减伤吃第一个震地猛击，治疗注意刷T，并在第二个震地猛击前2秒驱散T DEBUFF||BOSS点名三个人放射线,会有箭头指引方向||被点名的人自己调整利用射线把场地上的石头炸掉。",
        },
        ["斯卡莫拉克"] = {
            tips = "{rt8}斯卡莫拉克{rt8}||安排人逐步每波打1到2个小怪，所有DPS吃球||虚空魔像，场地上召唤的水晶需要打掉||否则BOSS会定期吃掉水晶给自己上很厚的吸收盾||BOSS上盾AOE时开爆发打破盾。",
        },
        ["机械大师"] = {
            tips = "{rt8}机械大师{rt8}||全场放火阶段有一个方向固定没有火，站在没有火的通风口||打断矮子BOSS所有的熔铁之水||躲开机器人BOSS头前大火球（ZS可以盾反）大火球可以清地上的水||离开中间铁轨，躲开中间的泥头车||在机器人释放解体时，躲冲击波并开技能抬血||其中一人死掉另一人会开始全场持续AOE||需要平衡血量尽量一起死。",
        },
        ["虚空代言人艾里克"] = {
            tips = "{rt8}虚空代言人艾里克{rt8}||BOSS身边的两个虚空黑门，碰到就秒杀||被BOSS点名持续时间DOT||需要跑去黑门附近就会消失但别碰到黑门||BOSS点名放黑水尽量放边缘免得后期没地方站。",
        },
        -- 小怪部分
        ["阴森的虚空之魂"] = {
            tips = "{rt8}阴森的虚空之魂{rt8}||{rt1}咆哮恐惧{rt1}必须打断",
        },
        ["炉铸愈疗者"] = {
            tips = "{rt8}炉铸愈疗者{rt8}||{rt1}愈合{rt1}和{rt1}合金箭矢{rt1}尽量断，没有优先级",
        },
        ["熔炉装货工"] = {
            tips = "{rt8}熔炉装货工{rt8}||需要躲开头前，被点名开减伤",
        },
        ["咒炉塑石者"] = {
            tips = "{rt8}咒炉塑石者{rt8}||{rt1}爆地图腾{rt1}需要第一时间转火打掉",
        },
    },
    ["塞兹仙林的迷雾"] = {
        -- BOSS 部分
        ["英格拉·马洛克"] = {
            tips = "{rt8}英格拉·马洛克{rt8}||起手先打大个子不要开爆发||DPS 保留爆到大个子变绿||躲开地板技能||注意打断小个子技能。",
        },
        ["唤雾者"] = {
            tips = "{rt8}唤雾者{rt8}||BOSS 在 70%/40%/10%血量时召唤小怪头顶有类似迷宫的机制。必须找到与众不同的那个并击杀它||分身有AOE技能，没找到正确的分身不要打，打错死了全图爆炸 AOE||躲开闪避球，秒人的||T 注意打断拍拍手技能，只有 T 能断||鬼抓人目标使用位移技能远离狐狸，全队有控制技能减速技能的帮忙控制狐狸，不能羊。",
        },
        ["特雷德奥瓦"] = {
            tips = "{rt8}特雷德奥瓦{rt8}||70/40BOSS 有护盾，打破护盾并打断 BOSS||躲开旋涡，击杀小怪||如果被连线，彼此远离||酸蚀排放技能开始时不要大距离移动，防止最后满地图绿圈。||被点名向 T 跑，把小怪拉到 T 跟前接怪。",
        },
        -- 小怪部分
        ["纱雾防御者"] = {
            tips = "{rt8}纱雾防御者{rt8}||迷宫区域。每个区域有四个出口，只有一个出口是正确的，进入错误出口会被强制遣返初始地||每个出口会有一个迷雾覆盖的柱子，站人会显示图案||图案属性分为有圈叶子、无圈叶子、有圈实心花、无圈实心花、有圈空心花、无圈空心花||需要从这六种元素中找到那个与其他图案不相同的一个图案||比如三个都是没圈的，一个有圈的，那么带圈的那个就是正确路线||三个都是花，一个是叶子，那么叶子就是正确的路线。||不会走的跟着别人走，自己不要乱进门",
        },
        ["纱雾守护者"] = {
            tips = "{rt8}纱雾守护者{rt8}||{rt1}心能挥砍{rt1}，点 T 高伤。需要覆盖大减伤，拉出蓝圈，晕断飞踢",
        },
        ["纱雾钉刺蛾"] = {
            tips = "{rt8}纱雾钉刺蛾{rt8}||{rt1}心能注入{rt1}，需要做为主目标击杀，奶注意驱散，没驱散开减伤离开人群",
        },
        ["纱雾照看者"] = {
            tips = "{rt8}纱雾照看者{rt8}||{rt1}滋养森林{rt1}必须打断",
        },
        ["纱雾塑形者"] = {
            tips = "{rt8}纱雾塑形者{rt8}||{rt1}木棘外壳{rt1}必须打断",
        },
        ["锥喉酸咽者"] = {
            tips = "{rt8}锥喉酸咽者{rt8}||打断{rt1}模拟抗性{rt1}和{rt1}再生鼓舞{rt1}两个技能||躲玩家绿圈和地板绿圈||{rt1}酸性新星{rt1} AOE 技能注意开减伤。",
        },
        ["锥喉鹿角巨虫"] = {
            tips = "{rt8}锥喉鹿角巨虫{rt8}||打断{rt1}模拟抗性{rt1}和{rt1}再生鼓舞{rt1}两个技能||躲玩家绿圈和地板绿圈||{rt1}酸性新星{rt1} AOE 技能注意开减伤。",
        },
        ["德鲁斯特收割者"] = {
            tips = "{rt8}德鲁斯特收割者{rt8}||{rt1}收割精魂{rt1}必须打断。",
        },
        ["德鲁斯特暗爪者"] = {
            tips = "{rt8}德鲁斯特暗爪者{rt8}||死亡全队易伤，强韧高层需分拨处理。",
        },
        ["德鲁斯特碎枝者"] = {
            tips = "{rt8}德鲁斯特碎枝者{rt8}||躲开{rt1}荆棘爆发{rt1}50%全队 AOE，分开集火打死，不要平均修血",
        },
    },
    ["通灵战潮"] = {
        -- BOSS 部分
        ["凋骨"] = {
            tips = "{rt8}凋骨{rt8}||将呕吐物对准远离团队的方向||远离被点吐息的目标||杀小怪||躲开地板技能。",
        },
        ["阿玛厄斯"] = {
            tips = "{rt8}阿玛厄斯{rt8}||打断 BOSS||打断 FS 小怪，聚好小怪快速杀掉||躲避亡者领域||BOSS 定期会吐息冰旋转，DPS N 提前躲避到 BOSS 身后。",
        },
        ["外科医生缝肉"] = {
            tips = "{rt8}外科医生缝肉{rt8}||中肉钩点名的，站到小怪和 BOSS 中间，让箭头对准 BOSS，读条到 1 的时候闪开||BOSS 被拉下来开爆发||即时 BOSS 不在台上也要用肉钩对准 BOSS 来打断凝视||BOSS 快上台子时中肉钩可提前瞄准台子||上矛。嗜血打 BOSS。",
        },
        ["缚霜者纳尔佐"] = {
            tips = "{rt8}缚霜者纳尔佐{rt8}|| 躲避漩涡。||如果有人被冰冻，尽快离开他们的圆圈。在大圆圈为空之前不要驱散。圈内有人驱散会传染||如果被传送走，尽快跑下通道开位移技能躲避地图白圈并击杀怪物||完成后点 NPC 上来加 100%暴击 40 秒，50 秒后没上来直接秒杀||当你回来时，站在边缘放置冰块。",
        },
        -- 小怪部分
        ["尸体收割者"] = {
            tips = "{rt8}尸体收割者{rt8}||{rt1}排干液体{rt1}必须打断",
        },
        ["缝合先锋"] = {
            tips = "{rt8}缝合先锋{rt8}||攻击叠加攻速需要优先击杀。入口两边有盾，开安抚拿，第一波怪后面有矛，留着打 BOSS",
        },
        ["凋零之袋"] = {
            tips = "{rt8}凋零之袋{rt8}||{rt1}死亡爆炸{rt1}稍微躲开治疗抬血。",
        },
        ["佐尔拉姆斯通灵师"] = {
            tips = "{rt8}佐尔拉姆斯通灵师{rt8}||{rt1}严酷命运{rt1}随机点名，需要开减伤远离人群放绿水",
        },
        ["骷髅劫掠者"] = {
            tips = "{rt8}骷髅劫掠者{rt8}||{rt1}恐怖顺劈{rt1}躲开头前，刺耳尖啸是群控加 AOE 技能，必须打断",
        },
        ["佐尔拉姆斯愈骨者"] = {
            tips = "{rt8}佐尔拉姆斯愈骨者{rt8}||{rt1}最终交易{rt1}接骨{rt1}尽量打断控制||上桥之前左边盾右边球，安抚拿。重要的 3 根矛一定要顺路拿到。留者打老三用。",
        },
        ["忠诚的造物"] = {
            tips = "{rt8}忠诚的造物{rt8}||{rt1}脊锤重压{rt1}需躲开地板否则秒杀",
        },
    },
    ["格瑞姆巴托"] = {
        -- BOSS 部分
        ["乌比斯将军"] = {
            tips = "{rt8}乌比斯将军{rt8}||避开地面上的橙色圆圈。||当房间变成紫色时，寻找安全通道。总共 4 条通道。||放土圈注意不要封路，尽量放边上||三连斩 T 覆盖好减伤",
        },
        ["铸炉之主索朗格斯"] = {
            tips = "{rt8}铸炉之主索朗格斯{rt8}||拉着靠墙，其他人靠外，中点名注意移动放岩浆||boss 更换武器时，他会造成大量的范围伤害。||第 1 阶段是斧头，所有人把锥形地板火引在一起。||第 2 阶段是双持，坦克克星，对坦克进行大治疗||第 3 阶段是双手锤 - 风筝阶段。||重复。",
        },
        ["达加·燃影者"] = {
            tips = "{rt8}达加·燃影者{rt8}||第 1 阶段杀死小怪||第 2 阶段杀死小怪并避开旋风（这可能会变得很疯狂，帮助你的治疗，避开障碍物）||暗影烈焰箭尽量断，熵能诅咒能驱就驱||被点名的远离火人，其他人转火减速击杀||P1 平伤，P2 爆发，躲风||Boss 50%倒地",
        },
        ["埃鲁达克"] = {
            tips = "{rt8}埃鲁达克,地狱公爵{rt8}||避开触手||当房间开始缩小时收缩，但在我们拥有的狭小圆圈内尽可能保持分散。||被点名紫色圈的三个人不要吃二重圈||DK 绿罩，ZS 盾反踩触手，进风眼后被点名的贴边||等 BOSS AOE 结束后，A 掉小怪。",
        },
        -- 小怪部分
        ["暮光唤地者"] = {
            tips = "{rt8}暮光唤地者{rt8}||{rt1}剧烈震颤{rt1}必须打断",
        },
        ["暮光毁灭者"] = {
            tips = "{rt8}暮光毁灭者{rt8}||{rt1}晦暗之风{rt1}是钢条 AOE+击飞，注意卡墙",
        },
        ["受伤的红色幼龙"] = {
            tips = "{rt8}受伤的红色幼龙{rt8}||炸弹丢给巡逻加龙和 BOSS 前面双监督者波次",
        },
        ["暮光欺诈者"] = {
            tips = "{rt8}暮光欺诈者{rt8}||暮光欺诈者的灼烧心智必须打断",
        },
        ["暮光烈焰粉碎者"] = {
            tips = "{rt8}暮光烈焰粉碎者{rt8}||躲开头前，T 注意覆盖减伤",
        },
        ["暮光执行者"] = {
            tips = "{rt8}暮光执行者{rt8}||叠加攻速，叠几层以后晕怪清层数",
        },
        ["暮光熔岩操纵使"] = {
            tips = "{rt8}暮光熔岩操纵使{rt8}||躲地板，圈不互套，变身远离，治疗抬血||最好跳过这个怪。",
        },
        ["暮光术士"] = {
            tips = "{rt8}暮光术士{rt8}||{rt1}暗影烈焰笼罩{rt1}必须打断",
        },
        ["无面腐蚀者"] = {
            tips = "{rt8}无面腐蚀者{rt8}||{rt1}腐蚀{rt1}需要中点名的人开减伤",
        },
    },
    ["围攻伯拉勒斯"] = {
        ["“屠夫”血钩"] = {
            tips = "{rt8}“屠夫”血钩{rt8}||迅速解决自带的小怪后转火 BOSS||撞军火。||避开地板技能。",
        },
        ["恐怖船长洛克伍德"] = {
            tips = "{rt8}恐怖船长洛克伍德{rt8}||避开地面上的东西。||击杀小怪。||注意给 BOSS 上高额的减速 Dot||当大炮掉落时捡起来并向 boss 开火。",
        },
        ["哈达尔·黑渊"] = {
            tips = "{rt8}哈达尔·黑渊{rt8}||避开漩涡。||放[潮汐涌动]时，站在雕像的另一侧。坦克被点头前不要面对人群！继续第二波潮水，躲好||近战放水记得给远程留位置，贴雕像放水，躲连续两波海潮，循环到死。",
        },
        ["维克戈斯"] = {
            tips = "{rt8}维克戈斯{rt8}||先杀攫握恐魔，再杀攻城恐魔。||避开水圈，治疗驱散时要注意！圈里不能有别人。||当触手在平台上被杀死时，跳进大炮并射击 Boss。||在第二个平台上重复此操作。||在船平台上重复此操作。||狐人、地精、侏儒等使用变身玩具，否则桥上会游泳",
        },
        -- 小怪部分
        ["铁潮塑浪者"] = {
            tips = "{rt8}铁潮塑浪者{rt8}||防水甲壳必须打断",
        },
        ["水鼠帮劫掠者"] = {
            tips = "{rt8}水鼠帮劫掠者{rt8}||恶臭喷吐必须打断",
        },
        ["水鼠帮唤风者"] = {
            tips = "{rt8}水鼠帮唤风者{rt8}||窒息止水必须打断",
        },
        ["水鼠帮海盗"] = {
            tips = "{rt8}水鼠帮海盗{rt8}||钢条香蕉风暴尽可能晕断，注意躲避地上香蕉",
        },
        ["艾什凡指挥官"] = {
            tips = "{rt8}艾什凡指挥官{rt8}||强化怒吼必须打断||艾泽里特炸药，中白圈的出人群",
        },
    },

    -- 11.1赛季大米副本

    ["圣焰隐修院"] = {
        -- BOSS部分
        ["戴尔克莱上尉"] = {
            tips = "{rt8}戴尔克莱上尉{rt8}||被点名离开人群，boss的长矛会对路径上的所有人造成伤害||打断boss读条（战斗狂啸），不然会全队AOE，并且给buff小怪||BOSS找队友贴贴会带套，要打破这个套！||断狂啸，躲红线，掷矛很明显的红线不躲开必死。",
        },
        ["布朗派克男爵"] = {
            tips = "{rt8}布朗派克男爵{rt8}||断灼烧，依次、轮流开减伤踩地上火堆{rt1}献祭葬火{rt1}。||远程不要站在近战区域防止{rt1}谴罚者之盾{rt1}连击||点名远程的转转锤自己看着躲。",
        },
        ["隐修院长穆普雷"] = {
            tips = "{rt8}隐修院长穆普雷{rt8}||Boss会点名，地上会有一只{rt1}净涤{rt1}黄圈点谁追谁||并且黄圈还会放黑水，注意要远离人群，保持移动||BOSS半血会上楼，大伙跑楼梯追上去打掉BOSS护盾打断读条即可。||{rt1}盲目之光{rt1}时背对 Boss，躲新兵，新兵不需要打，破护盾，抽他！||心灵之火+盲目之光最好开减伤||{rt1}净涤{rt1}，可以假死、消失等技能让圈回去",
        },
        -- 小怪部分
        ["守卫队长苏雷曼"] = {
            tips = "{rt8}守卫队长苏雷曼{rt8}||{rt1}盾牌猛击{rt1}会击飞目标注意调整方向",
        },
        ["热诚的神射手"] = {
            tips = "{rt8}热诚的神射手{rt8}||{rt1}铁蒺藜{rt1}必须躲开",
        },
        ["阿拉希步兵"] = {
            tips = "{rt8}阿拉希步兵{rt8}||{rt1}防御{rt1}必须打断",
        },
        ["歇尼麦尔中士"] = {
            tips = "{rt8}歇尼麦尔中士{rt8}||{rt1}跃进打击{rt1}和{rt1}蛮力重击{rt1}必须躲开",
        },
        ["虔诚的牧师"] = {
            tips = "{rt8}虔诚的牧师{rt8}||{rt1}强效治疗术{rt1}必须打断",
        },
        ["阿拉希骑士"] = {
            tips = "{rt8}阿拉希骑士{rt8}||优先击杀",
        },
        ["铸炉大师达米安"] = {
            tips = "{rt8}铸炉大师达米安{rt8}||{rt1}热浪{rt1}地板技能，可以站台子上输出",
        },
        ["艾蕾娜·安博兰兹"] = {
            tips = "{rt8}艾蕾娜·安博兰兹{rt8}||{rt1}圣光栎辉{rt1}范围AOE",
        },
        ["热切的骑士"] = {
            tips = "{rt8}热切的骑士{rt8}||{rt1}奉献{rt1}躲开地板技能||{rt1}神圣鸣罪{rt1}范围AOE注意减伤群抬",
        },
        ["热心的圣殿骑士"] = {
            tips = "{rt8}热心的圣殿骑士{rt8}||{rt1}圣殿骑士之怒{rt1}可以偷BUFF或驱散，提供30%增伤",
        },
        ["狂热的咒术师"] = {
            tips = "{rt8}狂热的咒术师{rt8}||{rt1}火球术{rt1}{rt1}烈焰风暴{rt1}能断尽量断",
        },
        ["光耀之子"] = {
            tips = "{rt8}光耀之子{rt8}||{rt1}强光迸发{rt1}死亡时出圈，圈里的怪回30%血，T必须拉开小怪。||{rt1}纯净{rt1}必须开减伤",
        },
        ["亡灵法师"] = {
            tips = "{rt8}亡灵法师{rt8}||{rt1}连珠火球{rt1}必须打断",
        },
        ["复活的步兵"] = {
            tips = "{rt8}复活的步兵{rt8}||{rt1}圣光逐斥{rt1}死亡时AOE，注意逐一击杀。或者全体修血，怪快死亡时交群控",
        },
        ["布朗派克爵士"] = {
            tips = "{rt8}布朗派克爵士{rt8}||{rt1}辉耀烈焰{rt1}全程AOE，注意抬血，死亡时会爆炸AOE注意抬血。",
        },

    },
        ["驭雷栖巢"] = {
        -- BOSS部分
        ["凯里欧斯"] = {
            tips = "{rt8}凯里欧斯{rt8}||点名分散，||BOSS激光转圈躲避||被扫到昏迷8秒，注意躲避！||五个人点名的分散圈注意加血注意分散，套圈必死||BOSS满能量了会转阶段，集合站位，有四根射线会顺时针或者逆时针旋转中了必死||射线是在空心板刷新。提前站到实心板位置||并且所有人脚下会出圈肯定要躲开的，并且BOSS会持续AOE注意边移动边加血",
        },
        ["雷卫戈伦"] = {
            tips = "{rt8}雷卫戈伦{rt8}||轮流传{rt1}混沌腐蚀{rt1} Debuff，至少三人互相靠近循环，T可以吃2层。||BOSS大跳跃击||落地后产生四道往四面方向飞行的黑光柱，注意躲避||BOSS还会吸人不要被吸进圈里就好了||随机点名一个人高额的DOT时间到了会传给最近的一个人，||注意一个人不能被连续传两次不然伤害会加百分之三四百会直接暴毙，要均匀的传。",
        },
        ["虚空石畸体"] = {
            tips = "{rt8}虚空石畸体{rt8}||白圈炸石头，黑水靠边放，破盾后开爆发。||别站坦克背后！BOSS召唤出来的水晶速度转火打掉！||释放腐蚀随机点名2名玩家注意驱散治疗||石头一共3个。3个DPS各炸一个，石头没炸掉基本灭团",
        },
        -- 小怪部分
        ["军需官科拉泰特"] = {
            tips = "{rt8}军需官科拉泰特{rt8}||躲球。出熵能护盾时站后面打",
        },
        ["被诅咒的雷霆使"] = {
            tips = "{rt8}被诅咒的雷霆使{rt8}||{rt1}闪电箭{rt1}注意打断",
        },
        ["凝虚散播者"] = {
            tips = "{rt8}凝虚散播者{rt8}||{rt1}弧形虚空{rt1}注意开减伤",
        },
        ["被孵化的先知"] = {
            tips = "{rt8}被孵化的先知{rt8}||{rt1}渗透腐蚀{rt1}注意驱散诅咒。{rt1}虚空箭{rt1}注意打断。",
        },
        ["虚空晋升者"] = {
            tips = "{rt8}虚空晋升者{rt8}||{rt1}虚空箭{rt1}注意打断||{rt1}晦幽波{rt1}和千丝老1一样出4个方向的黑球注意躲避",
        },
        ["辐射虚空石"] = {
            tips = "{rt8}辐射虚空石{rt8}||第一时间躲地板圈。治疗注意刷好持续AOE",
        },
    },
    ["燧酿酒庄"] = {
        -- BOSS部分
        ["酿造大师阿德里尔"] = {
            tips = "{rt8}酿造大师阿德里尔{rt8}||醉酿投打T，预示着投掷燧酿要来了，||投掷燧酿会点名两个人高额伤害的单点需要开个减并及时躲开，||打到半血会去柜台进入无敌状态||需要有人去场地边缘给暴怒顾客送酒安抚解除无敌，注意此阶段开个减吃大红||平时站位尽量靠近BOSS，这个BOSS会随机点名一个大范围的头前，站的越近越容易躲开||地面的风躲开，会晕",
        },
        ["艾帕"] = {
            tips = "{rt8}艾帕{rt8}||会召唤三只小软一直试图碰到BOSS||如果碰到会给BOSS一个非常厚的吸收盾并造成大量AOE伤害。||需要坦克拉着BOSS风筝小软||其他人控制并尽快击杀掉小软。否则变红以后移动速度加倍||{rt1}喷涌佳酿{rt1}{rt1}燃烧发酵{rt1}注意开个减。||{rt1}燃烧发酵{rt1}驱散一个奶一个",
        },
        ["本克·鸣蜂"] = {
            tips = "{rt8}本克·鸣蜂{rt8}||需要有人上蜜蜂来撞桶，桶越少越好打。||召唤小蜂蜜控住杀掉即可。||BOSS会一直召蜜蜂，注意蜜蜂刚出来没有仇恨！！！谁比T先动手就会OT猝死||蜜蜂还会随机跳人高额流血DOT注意单保||蜂蜜料汁T带着贴边放，小蜜蜂在圈里打不死需要拉开，蜜蜂条件好可以1只蜜蜂踢多个桶。",
        },
        ["戈尔迪·底爵"] = {
            tips = "{rt8}戈尔迪·底爵{rt8}||场地上很多爆炸酒桶||BOSS点名坦克的击飞和点名非坦克的红圈都会引爆酒桶||产生四个方向爆炸波||利用这两个技能处理掉酒桶||否则BOSS后续大招AOE||会把所有剩余酒桶引爆造成全场伤害和满地火浪注意躲避||消大桶会叠加掉血dot，注意不要同时消桶||桶尽量消一个区域的，方便在遮天蔽日时站位。",
        },
        -- 小怪部分
        ["雇佣的打手"] = {
            tips = "{rt8}雇佣的打手{rt8}||{rt1}烈性酒桶{rt1}全团AOE。建议一次不要拉2只以上，优先击杀",
        },
        ["风险投资公司纵火狂"] = {
            tips = "{rt8}风险投资公司纵火狂{rt8}||{rt1}沸燃烈焰{rt1}尽量打断",
        },
        ["主厨丘伊"] = {
            tips = "{rt8}主厨丘伊{rt8}||最好单打，会给小怪免疫控制增伤BUFF",
        },
        ["粗心的酒花大地精"] = {
            tips = "{rt8}粗心的酒花大地精{rt8}||{rt1}l鲁莽搬运{rt1}撞墙AOE。自身晕3秒",
        },
        ["美味测试员"] = {
            tips = "{rt8}美味测试员{rt8}||{rt1}免费样品{rt1}必须打断，要不然大概率减员",
        },
        ["美味科学家"] = {
            tips = "{rt8}美味科学家{rt8}||{rt1}疗愈蜂蜜{rt1}能断尽量断，优先打断测试员",
        },
        ["驯蜂者"] = {
            tips = "{rt8}驯蜂者{rt8}||{rt1}狂野怒火{rt1}给小怪25%增伤，必须打断。",
        },
        ["风险投资公司蜂蜜收割者"] = {
            tips = "{rt8}风险投资公司蜂蜜收割者{rt8}||{rt1}蜂蜜惊喜{rt1}全团AOE。并叠加易伤DEBUFF，优先击杀。",
        },
        ["蜂王浆供应商"] = {
            tips = "{rt8}蜂王浆供应商{rt8}||{rt1}蜂蜜齐射{rt1}必须打断",
        },
        ["附和员"] = {
            tips = "{rt8}附和员{rt8}||死亡以后其他怪回满血。所以标记好点杀。",
        },
    },
    ["暗焰裂口"] = {
        -- BOSS部分
        ["老蜡须"] = {
            tips = "{rt8}老蜡须{rt8}||场地上很多小狗头人无仇恨追人||引到轨道上用矿车撞死||发红的轨道马上会来矿车。||躲Boss冲锋，被点名引小怪去铁轨让矿车撞死||不停召唤小怪的ADD战斗，小怪不需要打，靠铁轨撞就全撞死了，||BOSS会点名冲锋，冲锋路径也可以消小怪||“卑鄙诡术”是一个车必须第一时间转火打掉不然灭团。",
        },
        ["布雷炙孔"] = {
            tips = "{rt8}布雷炙孔{rt8}||被点名放火的人去场地边缘点亮蜡烛||BOSS的大招AOE跑到之前点亮的蜡烛一侧就能躲掉！||被点名红圈时靠近蜡烛，点燃越多越好；Boss 吹风时站在蜡烛方向，吹灭一两个蜡烛。||{rt1}灭火强风{rt1}会熄灭蜡烛，熄灭以后会出安全场地躲避{rt1}点燃{rt1}，尽量只灭一个蜡烛。",
        },
        ["蜡烛之王"] = {
            tips = "{rt8}蜡烛之王{rt8}||被BOSS点名飞刀了跑去蜡像后面档飞刀||被BOSS点名放黑圈了跑去蜡像旁边用黑圈炸掉蜡像||每轮五个蜡像尽量全部在本轮内处理完毕。||飞刀点名站在蜡像后面，身上紫圈要靠近蜡像。||BOSS会点名三个紫色大圈去框住蜡像就能消除||BOSS会恐惧{rt1}偏执失心{rt1}注意打断，||",
        },
        ["黑暗之主"] = {
            tips = "{rt8}黑暗之主{rt8}||需要有人去场地边缘捡油给灯添燃，一般由中{rt1}暗影冲击{rt1}黑圈的人出去搬||BOSS点名黑圈的人要跑远几步避免黑圈炸灯||BOSS读条吹灯需要一个人把灯捡起来拿开别被吹到||BOSS读条召唤的小怪可打断需要秒断。||被点名紫圈时远离蜡烛，Boss 冲击波时搬走蜡烛，读条 AOE 时所有 DPS 出去搬蜡烛。",
        },
        -- 小怪部分
        ["职阶监督者"] = {
            tips = "{rt8}职阶监督者{rt8}||{rt1}狂野抽打{rt1}会击飞小怪，T注意带好方向，不要让击飞的小怪ADD。也可以硬控被击飞的小怪",
        },
        ["皇家点芯者"] = {
            tips = "{rt8}皇家点芯者{rt8}||{rt1}点芯箭{rt1}必须打断",
        },
        ["狗头人履职者"] = {
            tips = "{rt8}狗头人履职者{rt8}||{rt1}梆！{rt1}会使目标眩晕3秒和漫游蜡烛地板技能形成combo，注意开减伤",
        },
        ["狗头人护焰者"] = {
            tips = "{rt8}狗头人护焰者{rt8}||{rt1}火焰箭{rt1}必须打断",
        },
        ["残步恐魔"] = {
            tips = "{rt8}残步恐魔{rt8}||{rt1}吸取光明{rt1}必须打断||所有人全程跟着车站在圈内打",
        },
    },
    ["水闸行动"] = {
        -- BOSS部分
        ["席尔瓦·层烁"] = {
            tips = "{rt8}席尔瓦·层烁{rt8}||小机器人会大风车并且点人追，追到了就被旋死但是吃晕控||建筑师会射钉枪钉住人并且后续有DOT伤害注意单保||扭血者会扭曲献血超高额AOE并且附带吸奶盾(重点！！！)||先打小飞机，飞机没了Boss进易伤，开SX打本体，循环即可。",
        },
        ["老大娘"] = {
            tips = "{rt8}老大娘{rt8}||注意转好无人机，优先先打小飞机，||{rt1}音爆{rt1}会沉默并且推你(站的越远越好躲开)注意方向不要让放到墙上||无人机的{rt1}终极失帧{rt1}需要第一时间打断，超高额AOE附带击退||飞机没了Boss进易伤，开SX打本体，循环即可。||毁灭风暴需要多开。终极失真必须打断。",
        },
        ["齐扎·迅索"] = {
            tips = "{rt8}齐扎·迅索{rt8}||双子boss必须同时死，合理利用boss点名清理完场地的炸弹||核心就是消好炸弹，消好炸弹就白给，炸弹炸了就灭团||点名红圈框住炸弹然后驱散，驱散也有高额伤害注意血线健康或者被点名的人开好减伤再驱散。||驱散越快炸飞的越低，反之越高||BOSS点名冲锋也会撞掉路上的炸弹，但是路径高额伤害注意躲开。",
        },
        ["布隆特"] = {
            tips = "{rt8}布隆特{rt8}||双子boss必须同时死，合理利用boss点名清理完场地的炸弹||核心就是消好炸弹，消好炸弹就白给，炸弹炸了就灭团||点名红圈框住炸弹然后驱散，驱散也有高额伤害注意血线健康或者被点名的人开好减伤再驱散。||驱散越快炸飞的越低，反之越高||BOSS点名冲锋也会撞掉路上的炸弹，但是路径高额伤害注意躲开。",
        },
        ["沼面"] = {
            tips = "{rt8}沼面{rt8}||开打之前说好往左或者往右走||开局BOSS会把人两两连接(五个人都在不会连接T)，两个人需要同手同脚不然互相拉扯，拉扯没伤害，但是这个BOSS全是地板||记住你犯错了走错了死的不止你自己还会把和你连接的队友害死||有什么躲开什么就好了，BOSS会全程高额AOE让治疗加血||铁链相连的俩人必须一点站位，躲好地板技能猛抽Boss。",
        },
        ["吉泽尔·超震"] = {
            tips = "{rt8}吉泽尔·超震{rt8}||{rt1}雷霆重拳{rt1}打T超级痛并且会被击飞，这个BOSS场地是可以掉下去的，注意站位||{rt1}超力震击{rt1}会点名两个人是非常痛的高额单点，需要我们着重单保或者自己开好个减||{rt1}跃动火花{rt1}会每个人一个火花追你，追到了必死，把火花引到没有电的水上会消除掉||身上带电圈不碰水（重要，要不然晕4秒），电火花追人站水后面||{rt1}超力震击{rt1}前注意自己的圈不要圈到水||注意队友之前会互相抢水！！！。",
        },
        -- 小怪部分
        ["暗索扭曲者"] = {
            tips = "{rt8}暗索扭曲者{rt8}||{rt1}扭曲鲜血{rt1}AOE注意加血",
        },
        ["载货机器人"] = {
            tips = "{rt8}载货机器人{rt8}||{rt1}s上紧发条{rt1}最好能晕断",
        },
        ["风险投资公司建筑师"] = {
            tips = "{rt8}风险投资公司建筑师{rt8}||{rt1}快速建造{rt1}优先打脚手架||{rt1}射钉枪{rt1}尽量驱散。",
        },
        ["风险投资公司勘探员"] = {
            tips = "{rt8}风险投资公司勘探员{rt8}||{rt1}勘测光束{rt1}必须打断",
        },
        ["风险管理潜水员"] = {
            tips = "{rt8}风险管理潜水员{rt8}||{rt1}鱼叉{rt1}必须打断",
        },
        ["撕碎王3000型"] = {
            tips = "{rt8}撕碎王3000型{rt8}||{rt1}碎切{rt1}躲4个方向的齿轮",
        },
        ["被惊扰的海藻"] = {
            tips = "{rt8}被惊扰的海藻{rt8}||{rt1}回春水藻{rt1}必须打断",
        },
        ["泡泡"] = {
            tips = "{rt8}泡泡{rt8}||{rt1}逆流{rt1}注意开减伤爆发群刷抬血",
        },
        ["风险投资公司电工"] = {
            tips = "{rt8}风险投资公司电工{rt8}||{rt1}闪电箭{rt1}必须打断||{rt1}过载{rt1}必须驱散要不然晕5秒",
        },
        ["被惊扰的海藻"] = {
            tips = "{rt8}被惊扰的海藻{rt8}||{rt1}回春水藻{rt1}必须打断",
        },
    },
    ["伤逝剧场"] = {
        -- BOSS部分
        ["斩首者德茜雅"] = {
            tips = "{rt8}斩首者德茜雅{rt8}||{rt1}通灵箭{rt1}必须打断||平时站位注意贴近BOSS不然BOSS有头前站远了躲不开||BOSS点名驱散优先驱散一个另一个注意单保会和其他技能形成combo||BOSS点名五个圈不能圈套圈注意分散并且伤害很高注意团刷.",
        },
        ["疫毒者巴瑟兰"] = {
            tips = "{rt8}疫毒者巴瑟兰{rt8}||{rt1}通灵箭{rt1}必须打断||平时站位注意贴近BOSS不然BOSS有头前站远了躲不开||BOSS点名驱散优先驱散一个另一个注意单保会和其他技能形成combo||BOSS点名五个圈不能圈套圈注意分散并且伤害很高注意团刷.",
        },
        ["受诅者赛泽尔"] = {
            tips = "{rt8}受诅者赛泽尔{rt8}||{rt1}通灵箭{rt1}必须打断。||平时站位注意贴近BOSS不然BOSS有头前站远了躲不开||BOSS点名驱散优先驱散一个另一个注意单保会和其他技能形成combo||BOSS点名五个圈不能圈套圈注意分散并且伤害很高注意团刷.",
        },
        ["斩血"] = {
            tips = "{rt8}斩血{rt8}||注意不要中锁链( 变成腊肠 )并且小怪跳人非常痛高层一跳大半管并且跳的非常频繁||BOSS技能简单粗暴就是容易被小怪跳暴毙，但是小怪吃晕控注意做好晕控.||躲好锁链是关键",
        },
        ["无堕者哈夫"] = {
            tips = "{rt8}无堕者哈夫{rt8}||战旗必须第一时间转火,层数高了战旗转不掉没位移就等死||马卓克萨斯之力超高额的AOE层数高了需要覆盖个减团减不然直接秒杀||战旗转的快随便打，转得慢大家一起死.||转到小场地的快速处理小怪并回来。",
        },
        ["库尔萨洛克"] = {
            tips = "{rt8}库尔萨洛克{rt8}||BOSS打T的头前注意躲开||BOSS每轮会点名两个人两个高额单点{rt1}黑暗之井{rt1}开个减注意加好血||重点是BOSS每轮会点名五个人招五个小怪{rt1}抽取灵魂{rt1}，小怪碰到BOSS直接灭团，集合放小怪并且迅速转火.||躲好场地的球，",
        },
        ["无尽女皇莫德蕾莎"] = {
            tips = "{rt8}无尽女皇莫德蕾莎{rt8}||BOSS点名五个绿圈集合的同时保持分散，出小怪给好控断迅速转掉||50%血转阶段注意高层给高个减群减||收割之镰打T很痛需要注意，T不注意会被秒杀||有啥躲啥,比较简单的BOSS但是非常考验走位",
        },
        -- 小怪部分
        ["狂怒的血角"] = {
            tips = "{rt8}狂怒的血角{rt8}||{rt1}暴脾气{rt1}必须打断",
        },
        ["战场祭祀"] = {
            tips = "{rt8}战场祭祀{rt8}||{rt1}通灵箭{rt1}必须打断",
        },
        ["裂伤者耐克萨拉"] = {
            tips = "{rt8}裂伤者耐克萨拉{rt8}||{rt1}旋风斩{rt1}，{rt1}剑刃旋风{rt1}AOE注意抬血||{rt1}打断怒吼{rt1}会打断施法并AOE。",
        },
        ["残暴者多基格"] = {
            tips = "{rt8}残暴者多基格{rt8}||{rt1}暴怒乱舞{rt1}打T很疼注意开减伤。躲开旋风斩",
        },
        ["蹒跚的弩手"] = {
            tips = "{rt8}蹒跚的弩手{rt8}||{rt1}锯齿箭{rt1}尽量驱散",
        },
        ["嗜血的哈鲁吉亚"] = {
            tips = "{rt8}嗜血的哈鲁吉亚{rt8}||{rt1}回旋利刃{rt1}可以卡视角躲避",
        },
        ["粉碎者赫文"] = {
            tips = "{rt8}粉碎者赫文{rt8}||{rt1}打断怒吼{rt1}可以卡视角躲避||{rt1}大地猛击{rt1}远离BOSS",
        },
        ["桎梏之魂"] = {
            tips = "{rt8}桎梏之魂{rt8}||{rt1}束缚灵魂{rt1}尽量群控",
        },
        ["狂热的缚魂者"] = {
            tips = "{rt8}狂热的缚魂者{rt8}||{rt1}通灵箭雨{rt1}必须打断||{rt1}通灵箭{rt1}尽量断。",
        },
        ["卑劣的暗语者"] = {
            tips = "{rt8}卑劣的暗语者{rt8}||{rt1}死亡之风{rt1}头前吹风必须躲开。||注意解诅咒",
        },
        ["腥臭屠夫"] = {
            tips = "{rt8}腥臭屠夫{rt8}||{rt1}吞噬血肉{rt1}尽量打断否则怪回血",
        },
        ["凋零淤泥喷射者"] = {
            tips = "{rt8}凋零淤泥喷射者{rt8}||{rt1}凋零释放{rt1}必须打断||死亡是4码内爆炸，注意躲避",
        },
    },

    ["暴富矿区"] = {
        -- BOSS部分
        ["投币式群体打击者"] = {
            tips = "{rt8}投币式群体打击者{rt8}||炸弹出来第一时间踢炸弹||注意把炸弹踢到BOSS脚下，每个人都要踢不然炸弹炸了直接灭团，炸弹会给BOSS易伤||T注意拉着走位不要让BOSS吸到场地上的金币不然会给BOSS增伤",
        },
        ["艾泽洛克"] = {
            tips = "{rt8}艾泽洛克{rt8}||地震回荡注意团刷||小怪会随机盯人别被追到||艾泽里特灌注会灌注一个小怪并且小怪会持续AOE注意第一时间转火||注意躲开头前。",
        },
        ["瑞克莎·流火"] = {
            tips = "{rt8}瑞克莎·流火{rt8}||{rt1}艾泽里特催化剂{rt1}贴边贴水放。||核心就是推进器冲击去消除BOSS场地上的地板就好了||中了推进器冲击注意个减注意单保(连点三次)",
        },
        ["商业大亨拉兹敦克"] = {
            tips = "{rt8}商业大亨拉兹敦克{rt8}||注意点名大圈不要套人，注意单保||注意贴着BOSS，不然BOSS的加特林机关枪躲不开，很快||着重注意BOSS的两个无人机，会以它为起始往前放地板，中了必死，无人机会到处飞(重点！！！)||50%血转阶段注意消好柱子并且出两个小怪迅速转掉一个，不然治疗压力很大||中钻地猛击的尽快跑到柱子跟前炸柱子",
        },

        -- 小怪部分
        ["雇来的刺客"] = {
            tips = "{rt8}雇来的刺客{rt8}||{rt1}淬毒之刃{rt1}必须打断",
        },
        ["零食商贩"] = {
            tips = "{rt8}零食商贩{rt8}||{rt1}冰镇汽水{rt1}必须打断",
        },
        ["风险投资公司塑地者"] = {
            tips = "{rt8}风险投资公司塑地者{rt8}||{rt1}石枪{rt1}必须打断",
        },
        ["艾泽里特提取者"] = {
            tips = "{rt8}艾泽里特提取者{rt8}||优先点杀",
        },
        ["巨石之怒"] = {
            tips = "{rt8}巨石之怒{rt8}||{rt1}狂怒地震{rt1}必须打断",
        },
        ["监工阿斯加里"] = {
            tips = "{rt8}监工阿斯加里{rt8}||{rt1}加班加点{rt1}尽量进攻驱散",
        },
        ["风险投资公司炼金师"] = {
            tips = "{rt8}风险投资公司炼金师{rt8}||两个技能都要打断。{rt1}转化{rt1}不能漏断",
        },
        ["风险投资公司策划"] = {
            tips = "{rt8}风险投资公司策划{rt8}||{rt1}头脑风暴{rt1}地上黄圈躲开 要不然沉默",
        },
        ["风险投资公司战争机器"] = {
            tips = "{rt8}风险投资公司战争机器{rt8}||{rt1}蛛形地雷{rt1}注意不要踩到地雷。",
        },
    },

    ["麦卡贡行动"] = {
        -- BOSS部分
        ["白金拳手"] = {
            tips = "{rt8}白金拳手{rt8}||注意不要踩雷就不可能有人猝死||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["仁慈侏儒4.U.型"] = {
            tips = "{rt8}仁慈侏儒4.U.型{rt8}||注意不要踩雷就不可能有人猝死||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["狂犬K.U.-J.0."] = {
            tips = "{rt8}狂犬K.U.-J.0.{rt8}||注意BOSS AOE的时候卡好箱子||BOSS点名T的DOT第一时间驱散T，驱散慢了T直接猝死||驱散了DOT会炸全团||BOSS点名三个红圈注意分散并且不要框住箱子不然箱子会变红然后爆炸||猎人等可站最远处假死让这个技能失效。",
        },
        ["首席机械师闪流"] = {
            tips = "{rt8}首席机械师闪流{rt8}||盆栽，出了第一时间转火。||它会第一时间打距离它最近的目标。注意开好个减，治疗注意单保||其他的都是地板、齿轮、火线、大圈 ||有啥躲啥 就没人掉血,走位一不小心直接暴毙！。",
        },
        ["麦卡贡国王"] = {
            tips = "{rt8}麦卡贡国王{rt8}||P1的单点会穿糖葫芦一键三连所以谁被点了不要站一条线上||P2会三连击点名也注意不要被穿糖葫芦||距离万磁臂越近伤害越高注意别被秒掉||T不在近战范围之内会直接灭团。",
        },

        -- 小怪部分
    },

    ["塔扎维什，帷纱集市"] = {
        -- BOSS部分
        -- 琳彩天街
        ["佐·菲克斯"] = {
            tips = "{rt8}佐·菲克斯{rt8}||[扣押违禁品][监禁室][审讯][武装安保]||||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["佐·格伦"] = {
            tips = "{rt8}佐·格伦{rt8}||[群体控制]，[压制冲击]，[威吓怒吼]||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["奥·麦扎"] = {
            tips = "{rt8}奥·麦扎{rt8}||[群体控制]，[压制冲击]，[威吓怒吼]||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["P.O.S.T.总管"] = {
            tips = "{rt8}P.O.S.T.总管{rt8}||[有害液体]，[邮包]，[不稳定的货物]，[炼金残渣]|| AOE的时候卡好箱子||BOSS点名T的DOT第一时间驱散T，驱散慢了T直接猝死||驱散了DOT会炸全团||BOSS点名三个红圈注意分散并且不要框住箱子不然箱子会变红然后爆炸||猎人等可站最远处假死让这个技能失效。",
        },
        ["阿尔克鲁克斯"] = {
            tips = "{rt8}阿尔克鲁克斯{rt8}||盆栽，出了第一时间转火。||它会第一时间打距离它最近的目标。注意开好个减，治疗注意单保||其他的都是地板、齿轮、火线、大圈 ||有啥躲啥 就没人掉血,走位一不小心直接暴毙！。",
        },
        ["阿喀琉忒"] = {
            tips = "{rt8}阿喀琉忒{rt8}||盆栽，出了第一时间转火。||它会第一时间打距离它最近的目标。注意开好个减，治疗注意单保||其他的都是地板、齿轮、火线、大圈 ||有啥躲啥 就没人掉血,走位一不小心直接暴毙！。",
        },
        ["雯扎·金线"] = {
            tips = "{rt8}雯扎·金线{rt8}||盆栽，出了第一时间转火。||它会第一时间打距离它最近的目标。注意开好个减，治疗注意单保||其他的都是地板、齿轮、火线、大圈 ||有啥躲啥 就没人掉血,走位一不小心直接暴毙！。",
        },
        ["索·阿兹密"] = {
            tips = "{rt8}索·阿兹密{rt8}||P1的单点会穿糖葫芦一键三连所以谁被点了不要站一条线上||P2会三连击点名也注意不要被穿糖葫芦||距离万磁臂越近伤害越高注意别被秒掉||T不在近战范围之内会直接灭团。",
        },
        -- 索·莉亚的宏图
        ["希尔布兰德"] = {
            tips = "{rt8}希尔布兰德{rt8}||[扣押违禁品][监禁室][审讯][武装安保]||||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["时空船长钩尾"] = {
            tips = "{rt8}佐·格伦{rt8}||[群体控制]，[压制冲击]，[威吓怒吼]||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["索·莉亚"] = {
            tips = "{rt8}索·莉亚{rt8}||[有害液体]，[邮包]，[不稳定的货物]，[炼金残渣]|| AOE的时候卡好箱子||BOSS点名T的DOT第一时间驱散T，驱散慢了T直接猝死||驱散了DOT会炸全团||BOSS点名三个红圈注意分散并且不要框住箱子不然箱子会变红然后爆炸||猎人等可站最远处假死让这个技能失效。",
        },

        -- 小怪部分
        -- 琳彩天街
        ["大门看护者佐·马兹"] = {
            tips = "{rt8}大门看护者佐·马兹{rt8}||代理打击||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["海关保安"] = {
            tips = "{rt8}海关保安{rt8}||注意不要踩雷就不可能有人猝死||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["装甲监工"] = {
            tips = "{rt8}装甲监工{rt8}||光线切分者||注意BOSS AOE的时候卡好箱子||BOSS点名T的DOT第一时间驱散T，驱散慢了T直接猝死||驱散了DOT会炸全团||BOSS点名三个红圈注意分散并且不要框住箱子不然箱子会变红然后爆炸||猎人等可站最远处假死让这个技能失效。",
        },
        ["传送门操控师佐·达赫"] = {
            tips = "{rt8}传送门操控师佐·达赫{rt8}||[裂隙冲击]||盆栽，出了第一时间转火。||它会第一时间打距离它最近的目标。注意开好个减，治疗注意单保||其他的都是地板、齿轮、火线、大圈 ||有啥躲啥 就没人掉血,走位一不小心直接暴毙！。",
        },
        ["追踪者佐·刻斯"] = {
            tips = "{rt8}追踪者佐·刻斯{rt8}||[光线切分者][封锁][监管锁链]||P1的单点会穿糖葫芦一键三连所以谁被点了不要站一条线上||P2会三连击点名也注意不要被穿糖葫芦||距离万磁臂越近伤害越高注意别被秒掉||T不在近战范围之内会直接灭团。",
        },
        ["上古熔火恶犬"] = {
            tips = "{rt8}上古熔火恶犬{rt8}||[上古恐慌]||必须打断，漏断会造成降低50%急速，攻击速度延长100%。||两只狗要同时死，要不然会满血复活",
        },
        ["暴怒的恐角龙"] = {
            tips = "{rt8}暴怒的恐角龙{rt8}||[狂暴冲锋]||会对目标和怪中间所有人眩晕2秒，注意躲开",
        },
        ["老练的火花法师"] = {
            tips = "{rt8}老练的火花法师{rt8}||[凌光齐射]||必须打断。",
        },
        ["指挥官佐·法"] = {
            tips = "{rt8}指挥官佐·法{rt8}||注意：这个一般大米不打直接跳过,点他后面的台子可以传送尾王脱战||[[震荡地雷]]||注意躲避地上地雷，踩地雷3码内晕3秒||[致命武力]||被链接的2个玩家注意远离彼此。",
        },
        ["财团智囊"] = {
            tips = "{rt8}财团智囊{rt8}||[[光尘闪回]]||躲避地上的圈。",
        },
        -- 索·莉亚的宏图
        ["浊盐碎壳者"] = {
            tips = "{rt8}浊盐碎壳者{rt8}||[鱼群鼓舞]，[鱼人战吼]||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["浊盐鱼术师"] = {
            tips = "{rt8}浊盐鱼术师{rt8}||[鱼群鼓舞]，[水箭]||很多地板中了伤害很低但是会把你击飞到雷上去||注意两个BOSS修好血一起死不然一个死了另一个会AOE每次AOE比上次多加20%伤害||十秒之后就是加200%伤害直接灭团。",
        },
        ["踏滨巨人"] = {
            tips = "{rt8}踏滨巨人{rt8}||[海潮践踏]，[投掷巨石]||注意BOSS AOE的时候卡好箱子||BOSS点名T的DOT第一时间驱散T，驱散慢了T直接猝死||驱散了DOT会炸全团||BOSS点名三个红圈注意分散并且不要框住箱子不然箱子会变红然后爆炸||猎人等可站最远处假死让这个技能失效。",
        },
        ["浊盐缚鳞者"] = {
            tips = "{rt8}浊盐缚鳞者{rt8}||[活力鱼串]，[鱼群鼓舞]||盆栽，出了第一时间转火。||它会第一时间打距离它最近的目标。注意开好个减，治疗注意单保||其他的都是地板、齿轮、火线、大圈 ||有啥躲啥 就没人掉血,走位一不小心直接暴毙！。",
        },
        ["雷铸守护者"] = {
            tips = "{rt8}雷铸守护者{rt8}||[连环爆裂][充能脉冲]||P1的单点会穿糖葫芦一键三连所以谁被点了不要站一条线上||P2会三连击点名也注意不要被穿糖葫芦||距离万磁臂越近伤害越高注意别被秒掉||T不在近战范围之内会直接灭团。",
        },
        ["肌肉虬结的水手"] = {
            tips = "{rt8}肌肉虬结的水手{rt8}||[超级塞松啤酒]||必须打断，漏断会造成降低50%急速，攻击速度延长100%。",
        },
        ["时沙号海潮贤者"] = {
            tips = "{rt8}时沙号海潮贤者{rt8}||[海潮爆发][盐渍飞弹]||必须打断，漏断会对目标和怪中间所有人眩晕2秒。",
        },
        ["盛装的星辰先知"] = {
            tips = "{rt8}盛装的星辰先知{rt8}||[游移之星][流浪的脉冲星]||必须打断。",
        },
        ["专心的祭师"] = {
            tips = "{rt8}专心的祭师{rt8}||[凌光箭][不稳定的裂隙]||注意躲避地上地雷，踩地雷3码内晕3秒||[致命武力]||被链接的2个玩家注意远离彼此。",
        },
    },

  
    ["尼鲁巴尔王宫"] = {
        ["噬灭者乌格拉克斯"] = {
            tips = "{rt8}噬灭者乌格拉克斯{rt8}||被大圈标记的玩家找人分摊伤害||吃了分摊的要逃离 boss，避免被拖到 boss 下方||躲避网状物，并用绿色酸液圆圈清除它们||当能量降到 0 时，BOSS 会跳到平台中央，将所有人击退并消失进 P2||躲避 boss 冲锋，打出现的小怪||boss 出现后送它吃小怪尸体回能量进 P1",
        },
        ["血缚恐魔"] = {
            tips = "{rt8}血缚恐魔{rt8}||单阶段战斗，分内外场||没事不要去血池游泳，会死||受到 Boss 吐息的可以进内场杀小怪||分两队轮流进内场||内场小怪注意打断||被 boss 点名放圈的要边跑边放||能量 100 了会大圈炸人全团跑开",
        },
        ["席克兰"] = {
            tips = "{rt8}席克兰{rt8}||单阶段纯单体战斗||BOSS 会穿过玩家留下幽灵，放幽灵尽量靠近，节约场地||BOSS 点名几个玩家射光，就用光消除场地上的幽灵||幽灵消除了会留个圈，别踩",
        },
        ["拉夏南"] = {
            tips = "{rt8}拉夏南{rt8}||单阶段，boss 会两边飞||BOSS 点名放绿线，看好方向躲避||绿线会变成波浪，被点名的放到边边上去||小怪拉一起打，近战位不能没人，没人会 AOE",
        },
    },
}

-- 当前副本的 boss 集合
local currentInstanceBosses = {}

-- 跟踪当前显示的 BOSS 和手动隐藏状态
local currentBoss = nil
local manuallyHidden = false

-- 自定义函数，用于输出表的详细信息
local function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- 确保 BossTipsDB 存在且包含必要的子表
local function ensureDBExists()
    if not BossTipsDB then
        BossTipsDB = {}
    end
    if not BossTipsDB.TipsFramePosition then
        BossTipsDB.TipsFramePosition = {}
    end
    if not BossTipsDB.TipsFrameSize then
        BossTipsDB.TipsFrameSize = {}
    end
    if not BossTipsDB.ButtonPosition then
        BossTipsDB.ButtonPosition = {}
    end
end
ensureDBExists()

-- 更新当前副本的 boss 集合
local function UpdateCurrentInstanceBosses()
    wipe(currentInstanceBosses)
    local instanceName = GetInstanceInfo()
    if BossData[instanceName] then
        for bossName, _ in pairs(BossData[instanceName]) do
            currentInstanceBosses[bossName] = true
        end
    end
end

-- 检查目标是否为已知的 boss
local function IsKnownBoss(target)
    return currentInstanceBosses[target] or false
end

-- 获取 boss 的攻略信息
local function GetBossTips(target)
    local instanceName = GetInstanceInfo()
    return BossData[instanceName] and BossData[instanceName][target] and BossData[instanceName][target].tips or nil
end

-- 封装保存位置的函数，以 UIParent 为参考系
local function SavePosition(frame, savedVar)
    local point, _, relativePoint, xOffset, yOffset = frame:GetPoint(1, UIParent)
    savedVar.point = point
    savedVar.relativeTo = "UIParent"
    savedVar.relativePoint = relativePoint
    savedVar.xOffset = xOffset
    savedVar.yOffset = yOffset
   -- print("Saved Position Debug: Point - " .. point .. ", RelativeTo - UIParent, RelativePoint - " .. relativePoint .. ", XOffset - " .. xOffset .. ", YOffset - " .. yOffset)
end

-- 封装保存大小的函数
local function SaveSize(frame, savedVar)
    savedVar.width = frame:GetWidth()
    savedVar.height = frame:GetHeight()
    --print("Saved Size: Width - " .. savedVar.width .. ", Height - " .. savedVar.height)
end

-- 封装加载位置的函数
local function LoadPosition(frame, savedVar, defaultPoint, defaultRelativeTo, defaultRelativePoint, defaultXOffset, defaultYOffset)
    -- 输出 savedVar 的内容，用于调试
    --print("SavedVar Content:", dump(savedVar))

    if savedVar and type(savedVar) == "table" and savedVar.point and savedVar.relativePoint and savedVar.xOffset and savedVar.yOffset then
        local validRelativeTo = _G[savedVar.relativeTo] or defaultRelativeTo
        if validRelativeTo then
            frame:SetPoint(savedVar.point, validRelativeTo, savedVar.relativePoint, savedVar.xOffset, savedVar.yOffset)
           -- print("Loaded Saved Position: Point - " .. savedVar.point .. ", RelativeTo - " .. (validRelativeTo and validRelativeTo:GetName() or "nil") .. ", RelativePoint - " .. savedVar.relativePoint .. ", XOffset - " .. savedVar.xOffset .. ", YOffset - " .. savedVar.yOffset)
        else
            --print("Invalid relativeTo object for loading position. Using default position.")
            frame:SetPoint(defaultPoint, defaultRelativeTo, defaultRelativePoint, defaultXOffset, defaultYOffset)
            --print("Loaded Default Position: Point - " .. defaultPoint .. ", RelativeTo - " .. (defaultRelativeTo and defaultRelativeTo:GetName() or "nil") .. ", RelativePoint - " .. defaultRelativePoint .. ", XOffset - " .. defaultXOffset .. ", YOffset - " .. defaultYOffset)
        end
    else
        frame:SetPoint(defaultPoint, defaultRelativeTo, defaultRelativePoint, defaultXOffset, defaultYOffset)
        print("Loaded Default Position: Point - " .. defaultPoint .. ", RelativeTo - " .. (defaultRelativeTo and defaultRelativeTo:GetName() or "nil") .. ", RelativePoint - " .. defaultRelativePoint .. ", XOffset - " .. defaultXOffset .. ", YOffset - " .. defaultYOffset)
    end
    -- 确保按钮显示
    frame:Show()
    -- 调试：输出按钮的大小和透明度
    --print("Button Size: Width - " .. frame:GetWidth() .. ", Height - " .. frame:GetHeight())
    --print("Button Alpha: " .. frame:GetAlpha())
end

-- 封装加载大小的函数
local function LoadSize(frame, savedVar, defaultWidth, defaultHeight)
    if savedVar and type(savedVar) == "table" and savedVar.width and savedVar.height then
        frame:SetSize(savedVar.width, savedVar.height)
        --print("Loaded Saved Size: Width - " .. savedVar.width .. ", Height - " .. savedVar.height)
    else
        frame:SetSize(defaultWidth, defaultHeight)
        --print("Loaded Default Size: Width - " .. defaultWidth .. ", Height - " .. defaultHeight)
    end
end

-- 创建攻略窗体
local tipsFrame = CreateFrame("Frame", "BossTipsFrame", UIParent)
LoadSize(tipsFrame, BossTipsDB.TipsFrameSize, 400, 300)
LoadPosition(tipsFrame, BossTipsDB.TipsFramePosition, "BOTTOMLEFT", ChatFrame1Tab, "TOPLEFT", 20, 20)
tipsFrame:SetFrameStrata("BACKGROUND")
tipsFrame:Hide()


-- 使攻略窗体可移动
tipsFrame:SetMovable(true)
tipsFrame:EnableMouse(true)
tipsFrame:RegisterForDrag("LeftButton")
tipsFrame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
tipsFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    SavePosition(self, BossTipsDB.TipsFramePosition)
    --print("TipsFrame Saved Position: Point - " .. self:GetPoint())
end)

-- 使攻略窗体可调整大小
tipsFrame:SetResizable(true)
local MIN_WIDTH = 200
local MIN_HEIGHT = 200
tipsFrame:SetScript("OnSizeChanged", function(self, width, height)
    if width < MIN_WIDTH then
        self:SetWidth(MIN_WIDTH)
    end
    if height < MIN_HEIGHT then
        self:SetHeight(MIN_HEIGHT)
    end
end)

local resizeHandle = CreateFrame("Button", nil, tipsFrame)
resizeHandle:SetSize(16, 16)
resizeHandle:SetPoint("BOTTOMRIGHT", -4, 4)
resizeHandle:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
resizeHandle:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
resizeHandle:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
resizeHandle:EnableMouse(true)
resizeHandle:RegisterForDrag("LeftButton")
resizeHandle:SetScript("OnDragStart", function()
    tipsFrame:StartSizing("BOTTOMRIGHT")
end)
resizeHandle:SetScript("OnDragStop", function()
    tipsFrame:StopMovingOrSizing()
    SavePosition(tipsFrame, BossTipsDB.TipsFramePosition)
    SaveSize(tipsFrame, BossTipsDB.TipsFrameSize)
    --print("TipsFrame Resized and Position Saved")
end)

-- 创建攻略文本（修改字体初始化）
local tipsText = tipsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
tipsText:SetPoint("TOPLEFT", 10, -10)
tipsText:SetPoint("BOTTOMRIGHT", -10, 40)
tipsText:SetJustifyH("LEFT")
tipsText:SetJustifyV("TOP")
tipsText:SetFont("Fonts\\FRIZQT__.TTF", BossTipsDB.FontSize or 18, "OUTLINE")  -- 使用数据库存储的字体大小

-- 创建字体调整按钮
local fontSizeButton = CreateFrame("Button", nil, tipsFrame, "UIPanelButtonTemplate")
fontSizeButton:SetSize(100, 25)
fontSizeButton:SetPoint("BOTTOMLEFT", 10, 10)
fontSizeButton:SetText("字体: " .. (BossTipsDB.FontSize or 18))
fontSizeButton:SetScript("OnMouseDown", function(self, button)
    -- 左键增大字体，右键减小字体
    if button == "LeftButton" then
        BossTipsDB.FontSize = math.min((BossTipsDB.FontSize or 18) + 2, 32)
    elseif button == "RightButton" then
        BossTipsDB.FontSize = math.max((BossTipsDB.FontSize or 18) - 2, 12)
    end
    tipsText:SetFont("Fonts\\FRIZQT__.TTF", BossTipsDB.FontSize, "OUTLINE")
    self:SetText("字体: " .. BossTipsDB.FontSize)
end)

-- 创建半透明背景
local bg = tipsFrame:CreateTexture(nil, "BACKGROUND")
bg:SetAllPoints()
bg:SetColorTexture(0, 0, 0, 0.3)  -- 黑色背景，50%透明度

-- 修改 SendLongMessage 函数
local function SendLongMessage(message, chatType)
    -- 如果未传入聊天类型参数，则根据人数确定聊天类型
    if not chatType then
        chatType = determineChatType(message)
    end
    local parts = {strsplit("||", message)}
    -- 创建一个新的表，用于存储排序后的部分内容
    local sortedParts = {}
    for _, part in ipairs(parts) do
        local trimmedPart = strtrim(part)
        if trimmedPart ~= "" then
            table.insert(sortedParts, trimmedPart)
        end
    end
    -- 使用一个计数器来跟踪当前要发送的部分索引
    local index = 1
    local delay = 0.5
    local function sendNext()
        if index <= #sortedParts then
            SendChatMessage(sortedParts[index], chatType)
            index = index + 1
            C_Timer.After(delay, sendNext)
        end
    end
    sendNext()
end

-- 创建发送按钮
local sendButton = CreateFrame("Button", nil, tipsFrame, "UIPanelButtonTemplate")
sendButton:SetSize(80, 25)
sendButton:SetPoint("BOTTOMRIGHT", -30, 10)
sendButton:SetText("发送")
-- 修改发送按钮的点击脚本
sendButton:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        local target = UnitName("target")
        local tips = GetBossTips(target)
        if tips then
            SendLongMessage(tips)
        end
    elseif button == "RightButton" then
        local target = UnitName("target")
        local tips = GetBossTips(target)
        if tips then
            SendLongMessage(tips, "YELL")
        end
    end
end)

-- 确定聊天类型的函数，根据当前队伍人数判断
function determineChatType(message)
    local groupSize = GetNumGroupMembers()
    if groupSize > 0 and groupSize <= 5 then
        return "PARTY"
    elseif groupSize > 5 then
        return "RAID"
    else
        return "SAY"
    end
end

-- 创建收起/展开按钮
local toggleButton = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
toggleButton:SetSize(80, 40)
toggleButton:SetText("无攻略")
toggleButton:Enable() -- 让按钮默认启用

-- 延迟加载按钮位置信息
local function LoadButtonPosition()
    ensureDBExists()
    LoadPosition(toggleButton, BossTipsDB.ButtonPosition, "TOPRIGHT", ChatFrame1Tab, "TOPRIGHT", 200, 20)

    -- 使按钮可移动
    toggleButton:SetMovable(true)
    toggleButton:EnableMouse(true)
    toggleButton:RegisterForDrag("LeftButton")
    toggleButton:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    toggleButton:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        SavePosition(self, BossTipsDB.ButtonPosition)
        -- Debug 输出按钮位置信息
        local point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint()
        --print("ToggleButton Position: Point - " .. point .. ", RelativeTo - UIParent, RelativePoint - " .. relativePoint .. ", XOffset - " .. xOffset .. ", YOffset - " .. yOffset)
    end)
end

toggleButton:SetScript("OnClick", function()
    if tipsFrame:IsShown() then
        tipsFrame:Hide()
        toggleButton:SetText("显示")
        manuallyHidden = true
    else
        tipsFrame:Show()
        toggleButton:SetText("隐藏")
        manuallyHidden = false
    end
end)

toggleButton:SetScript("OnMouseDown", function(self, button)
    if button == "RightButton" then
        local target = UnitName("target")
        local tips = GetBossTips(target)
        if tips then
            SendLongMessage(tips, "YELL")
        end
    end
end)

-- 更新框体可见性
local function UpdateFrameVisibility()
    local target = UnitName("target")
    if IsKnownBoss(target) then
        if target ~= currentBoss then
            manuallyHidden = false  -- 默认设置为显示状态
            currentBoss = target
        end

        local tips = GetBossTips(target)
        if tips then
            -- 去除大括号内容
            tips = string.gsub(tips, "{[^}]*}", "")
            -- 将"||"替换为换行
            tips = string.gsub(tips, "||", "\n")
            local formattedTips = string.format("|cFFFFFF00%s|r\n\n%s", target, tips)
            tipsText:SetText(formattedTips)
        end

        toggleButton:Enable()
        if tipsFrame:IsShown() then
            toggleButton:SetText("隐藏")
        else
            toggleButton:SetText("显示")
        end

        if not manuallyHidden then
            tipsFrame:Show()
        else
            tipsFrame:Hide()
        end
    else
        tipsFrame:Hide()
        currentBoss = nil
        toggleButton:SetText("无攻略")
        -- 注释掉禁用按钮的代码，让按钮保持可用
        -- toggleButton:Disable() 
    end

    toggleButton:Show() -- 始终显示按钮
end

-- 主事件处理函数
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        UpdateCurrentInstanceBosses()
        manuallyHidden = false
        currentBoss = nil
        C_Timer.After(1, LoadButtonPosition) -- 延迟 1 秒加载按钮位置信息
        UpdateFrameVisibility()
    elseif event == "ZONE_CHANGED_NEW_AREA" then
        UpdateCurrentInstanceBosses()
        manuallyHidden = false
        currentBoss = nil
        UpdateFrameVisibility()
    elseif event == "PLAYER_TARGET_CHANGED" then
        UpdateFrameVisibility()
    end
end)

-- 注册事件
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")

-- 在控制台输出版本信息
print("|cFF00FF00BossTips|r version " .. addon.version .. " loaded.")