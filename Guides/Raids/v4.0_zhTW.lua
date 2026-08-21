-- ============================================================================
-- BossTips 4.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["4.0"] = {
    ["火焰之地"] = {
        name = "火焰之地",
        ["拉格纳罗斯"] = {
            type = "BOSS",
            name = "拉格納羅斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}拉格納羅斯{rt8}||[種子]點名需遠離引爆；[熔火]全團；[錘]落點；P3[擊飛]||{rt1}必斷/速殺：無；[種子]被點名遠離、躲錘{rt1}||坦：拉；輸出：躲機制",
            },
        },
        ["奥利瑟拉佐尔"] = {
            type = "BOSS",
            name = "奧利瑟拉佐爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧利瑟拉佐爾{rt8}||[飛行]階段需喫[灰燼]保火；[俯衝]；[重生]||{rt1}必斷/速殺：無；喫灰燼維持、躲俯衝{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["大管家斯塔格海尔"] = {
            type = "BOSS",
            name = "大管家斯塔格海爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}大管家斯塔格海爾{rt8}||[毒/火]兩形態切換需換站位；[蠍子]階段；[狂暴]計時||{rt1}必斷/速殺：無；按形態換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["沙诺克斯"] = {
            type = "BOSS",
            name = "沙諾克斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}沙諾克斯{rt8}||[陷阱]放置需拉狗踩；[狂暴]狗；[火]||{rt1}必斷/速殺：無；拉狗踩陷阱{rt1}||坦：拉；輸出：控狗",
            },
        },
        ["贝丝蒂拉克"] = {
            type = "BOSS",
            name = "貝絲蒂拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}貝絲蒂拉克{rt8}||[網]上蜘蛛網打卵；[下落]階段落地；[毒]dot||{rt1}必斷/速殺：無；網上清卵、落地轉火{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["莱诺斯领主"] = {
            type = "BOSS",
            name = "萊諾斯領主",
            tipsByDifficulty = {
                ["normal"] = "{rt8}萊諾斯領主{rt8}||[腳]需打腿控移動；[熔岩]落點||{rt1}必斷/速殺：無；打腿限制移動{rt1}||坦：拉；輸出：打腿",
            },
        },
        ["巴拉克雷斯"] = {
            type = "BOSS",
            name = "巴拉克雷斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}巴拉克雷斯{rt8}||[盾]需集火破；[刀片]點名；[治療]add||{rt1}必斷/速殺：無；集火破盾{rt1}||坦：拉；輸出：控add",
            },
        },
    },
    ["暮光堡垒"] = {
        name = "暮光堡壘",
        ["哈尔弗斯·碎龙者"] = {
            type = "BOSS",
            name = "哈爾弗斯·碎龍者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}哈爾弗斯·碎龍者{rt8}||[龍]綁着不同龍提供buff，需先殺對應龍削弱；[定時]計時||{rt1}必斷/速殺：無；按龍buff決定擊殺順序{rt1}||坦：拉住；輸出：轉火龍",
            },
        },
        ["古加尔"] = {
            type = "BOSS",
            name = "古加爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}古加爾{rt8}||[寄生]點名；[暗影]dot；[火]；P2[狂亂]加速||{rt1}必斷/速殺：無；[寄生]被點名遠離{rt1}||坦：拉住；治療：解毒",
            },
        },
        ["瓦里奥娜与瑟拉利昂"] = {
            type = "BOSS",
            name = "瓦里奧娜與瑟拉利昂",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瓦里奧娜與瑟拉利昂{rt8}||[雙龍]輪流入場，[深呼吸]與[隕石]需躲；[暗影]dot||{rt1}必斷/速殺：無；躲深呼吸與隕石{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["辛奈丝特拉"] = {
            type = "BOSS",
            name = "辛奈絲特拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}辛奈絲特拉{rt8}||[孵化]召喚小龍需清；[暗影]高傷；[狂暴]計時||{rt1}必斷/速殺：無；清小龍{rt1}||坦：拉住；輸出：清小龍",
            },
        },
        ["晋升者议会"] = {
            type = "BOSS",
            name = "晉升者議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}晉升者議會{rt8}||[四元素]火/冰/土/風分階段，需打斷對應；[融合]||{rt1}必斷/速殺：按元素打斷；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
    },
    ["巨龙之魂"] = {
        name = "巨龍之魂",
        ["莫卓克"] = {
            type = "BOSS",
            name = "莫卓克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}莫卓克{rt8}||[水晶]點名需撞水晶分擔；[踐踏]全團；[狂暴]計時||{rt1}必斷/速殺：無；[水晶]被點名撞水晶分擔{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["黑角"] = {
            type = "BOSS",
            name = "黑角",
            tipsByDifficulty = {
                ["normal"] = "{rt8}黑角{rt8}||[船戰]需打炮擊龍；[降臨]落地階段；[運輸機]||{rt1}必斷/速殺：無；操炮擊龍{rt1}||坦：拉；輸出：操炮",
            },
        },
        ["死亡之翼的疯狂"] = {
            type = "BOSS",
            name = "死亡之翼的瘋狂",
            tipsByDifficulty = {
                ["normal"] = "{rt8}死亡之翼的瘋狂{rt8}||[平臺]多平臺輪流，[血液]點名需分擔；[灼燒]；P4[本體]||{rt1}必斷/速殺：無；[血液]被點名分擔{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["不眠的约沙伊"] = {
            type = "BOSS",
            name = "不眠的約沙伊",
            tipsByDifficulty = {
                ["normal"] = "{rt8}不眠的約沙伊{rt8}||[膿液]按顏色決定擊殺順序(紅優先)；[觸手]||{rt1}必斷/速殺：無；按顏色順序集火{rt1}||坦：拉；輸出：按色集火",
            },
        },
        ["奥特拉希昂"] = {
            type = "BOSS",
            name = "奧特拉希昂",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧特拉希昂{rt8}||[時光]按時序躲[暮光]；[英勇]階段需爆發；[狂暴]計時||{rt1}必斷/速殺：無；按時光機制跑位{rt1}||坦：拉；輸出：英勇期爆發",
            },
        },
        ["督军佐诺兹"] = {
            type = "BOSS",
            name = "督軍佐諾茲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}督軍佐諾茲{rt8}||[黑球]點名需撞球分擔；[暗]全團；[狂暴]計時||{rt1}必斷/速殺：無；[黑球]被點名撞球{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["哈加拉·风暴绑缚者"] = {
            type = "BOSS",
            name = "哈加拉·風暴綁縛者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}哈加拉·風暴綁縛者{rt8}||[冰/電]兩階段切換，冰需[冰鏈]連、電需分散；[風暴]||{rt1}必斷/速殺：無；冰階段連鏈電階段散{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["死亡之翼的脊背"] = {
            type = "BOSS",
            name = "死亡之翼的脊背",
            tipsByDifficulty = {
                ["normal"] = "{rt8}死亡之翼的脊背{rt8}||[裝甲]需打腐化鋼板並[捆]固定；[觸手]需拉離；載具階段||{rt1}必斷/速殺：無；打鋼板捆觸手{rt1}||坦：拉觸手；輸出：打鋼板",
            },
        },
    },
    ["黑翼血环"] = {
        name = "黑翼血環",
        ["奇美隆"] = {
            type = "BOSS",
            name = "奇美隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奇美隆{rt8}||[雙重打擊]致命需雙坦；[滅絕]全團秒需抬血；[劇毒]dot||{rt1}必斷/速殺：無；[滅絕]時全員保命{rt1}||坦：雙坦；治療：滅絕期爆發",
            },
        },
        ["阿特拉米德"] = {
            type = "BOSS",
            name = "阿特拉米德",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿特拉米德{rt8}||[音波]需看地面圈躲；[追蹤]點名；[沉默]||{rt1}必斷/速殺：無；躲音波圈{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["玛洛拉克"] = {
            type = "BOSS",
            name = "瑪洛拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瑪洛拉克{rt8}||[試管]需按顏色打斷對應；[釋放]階段；[火/冰]||{rt1}必斷/速殺：按試管顏色打斷；集火{rt1}||坦：拉；輸出：控試管",
            },
        },
        ["玛格玛尔"] = {
            type = "BOSS",
            name = "瑪格瑪爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瑪格瑪爾{rt8}||[鏈]需把頭拉到[釘]上釘住減傷；[噴火]正面||{rt1}必斷/速殺：無；拉頭釘住{rt1}||坦：拉頭；輸出：釘",
            },
        },
        ["欧姆诺顿防御系统"] = {
            type = "BOSS",
            name = "歐姆諾頓防禦系統",
            tipsByDifficulty = {
                ["normal"] = "{rt8}歐姆諾頓防禦系統{rt8}||[四機器人]毒/火/冰/電輪流激活，需對應應對；[切換]||{rt1}必斷/速殺：按激活機器人打斷；轉火{rt1}||坦：拉；輸出：按激活集火",
            },
        },
        ["奈法利安"] = {
            type = "BOSS",
            name = "奈法利安",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奈法利安{rt8}||[電極]需站同極；[暗影]全團；P2[龍骨]點名||{rt1}必斷/速殺：無；按電極站位{rt1}||坦：拉；輸出：轉火",
            },
        },
    },
    ["风神王座"] = {
        name = "風神王座",
        ["奥拉基尔"] = {
            type = "BOSS",
            name = "奧拉基爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧拉基爾{rt8}||[階段]風/電/冰/土輪流，[閃電]點名；[狂暴]計時||{rt1}必斷/速殺：無；按階段應對{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["风之议会"] = {
            type = "BOSS",
            name = "風之議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}風之議會{rt8}||[三元素]需同時擊殺防回血；[風/電/冰]混合||{rt1}必斷/速殺：無；同時集火三元素{rt1}||坦：分坦；輸出：集火",
            },
        },
    },
}
