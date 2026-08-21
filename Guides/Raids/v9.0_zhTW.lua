-- ============================================================================
-- BossTips 9.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["9.0"] = {
    ["纳斯利亚堡"] = {
        name = "納斯利亞堡",
        ["血誓议会"] = {
            type = "BOSS",
            name = "血誓議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}血誓議會{rt8}||[三吸血鬼]需打斷對應；[舞]機制；[狂暴]計時||{rt1}必斷/速殺：按機制打斷；逐個{rt1}||坦：拉；輸出：集火",
            },
        },
        ["尖啸翼"] = {
            type = "BOSS",
            name = "尖嘯翼",
            tipsByDifficulty = {
                ["normal"] = "{rt8}尖嘯翼{rt8}||[音波]需看地面躲；[點名]；[狂暴]計時||{rt1}必斷/速殺：無；躲音波圈{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["伊涅瓦·暗脉女士"] = {
            type = "BOSS",
            name = "伊涅瓦·暗脈女士",
            tipsByDifficulty = {
                ["normal"] = "{rt8}伊涅瓦·暗脈女士{rt8}||[球]需打；[吸]dot；[狂暴]計時||{rt1}必斷/速殺：無；打球、速殺{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["狩猎者阿尔提莫"] = {
            type = "BOSS",
            name = "狩獵者阿爾提莫",
            tipsByDifficulty = {
                ["normal"] = "{rt8}狩獵者阿爾提莫{rt8}||[狗]需分拉；[點名]；[狂暴]計時||{rt1}必斷/速殺：無；分拉狗{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["工匠佐莫克斯"] = {
            type = "BOSS",
            name = "工匠佐莫克斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}工匠佐莫克斯{rt8}||[傳送]需拉一起；[寶]點名；[狂暴]計時||{rt1}必斷/速殺：無；[寶]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["德纳修斯大帝"] = {
            type = "BOSS",
            name = "德納修斯大帝",
            tipsByDifficulty = {
                ["normal"] = "{rt8}德納修斯大帝{rt8}||[鏡]需躲；[收割]點名；P3[本體]；[狂暴]計時||{rt1}必斷/速殺：無；躲鏡、P3應對{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["泥拳"] = {
            type = "BOSS",
            name = "泥拳",
            tipsByDifficulty = {
                ["normal"] = "{rt8}泥拳{rt8}||[砸]點名需遠離；[破牆]；[狂暴]計時||{rt1}必斷/速殺：無；[砸]被點名遠離、躲牆{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["饥渴毁灭者"] = {
            type = "BOSS",
            name = "飢渴毀滅者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}飢渴毀滅者{rt8}||[球]點名需拉一起；[爆炸]；[狂暴]計時||{rt1}必斷/速殺：無；[球]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["石卫军将领"] = {
            type = "BOSS",
            name = "石衛軍將領",
            tipsByDifficulty = {
                ["normal"] = "{rt8}石衛軍將領{rt8}||[雙將]共享血量分邊；[石]；[狂暴]計時||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["太阳王救赎"] = {
            type = "BOSS",
            name = "太陽王救贖",
            tipsByDifficulty = {
                ["normal"] = "{rt8}太陽王救贖{rt8}||[救]需保[凱爾薩斯]血量；[火]階段；[狂暴]計時||{rt1}必斷/速殺：無；保血、打敵{rt1}||坦：拉；輸出：轉火",
            },
        },
    },
    ["初诞者圣墓"] = {
        name = "初誕者聖墓",
        ["贪食吞噬者斯科莱克斯"] = {
            type = "BOSS",
            name = "貪食吞噬者斯科萊克斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}貪食吞噬者斯科萊克斯{rt8}||[鑽地]需打露頭；[刺]；[狂暴]計時||{rt1}必斷/速殺：無；打露頭、速殺{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["万神殿原型"] = {
            type = "BOSS",
            name = "萬神殿原型",
            tipsByDifficulty = {
                ["normal"] = "{rt8}萬神殿原型{rt8}||[四神]需集火單隻；[混合]；[狂暴]計時||{rt1}必斷/速殺：無；集火單隻{rt1}||坦：拉；輸出：集火",
            },
        },
        ["守夜卫士"] = {
            type = "BOSS",
            name = "守夜衛士",
            tipsByDifficulty = {
                ["normal"] = "{rt8}守夜衛士{rt8}||[炮]需打；[電]全團；[狂暴]計時||{rt1}必斷/速殺：無；打炮、躲電{rt1}||坦：拉；輸出：操炮",
            },
        },
        ["恐惧领主"] = {
            type = "BOSS",
            name = "恐懼領主",
            tipsByDifficulty = {
                ["normal"] = "{rt8}恐懼領主{rt8}||[雙]需集火單隻；[幻象]；[狂暴]計時||{rt1}必斷/速殺：無；集火單隻{rt1}||坦：拉；輸出：集火",
            },
        },
        ["工匠佐莫克斯·再临"] = {
            type = "BOSS",
            name = "工匠佐莫克斯·再臨",
            tipsByDifficulty = {
                ["normal"] = "{rt8}工匠佐莫克斯·再臨{rt8}||[傳送]需拉一起；[寶]點名；[狂暴]計時||{rt1}必斷/速殺：無；[寶]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["安度因·乌瑞恩"] = {
            type = "BOSS",
            name = "安度因·烏瑞恩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}安度因·烏瑞恩{rt8}||[寶]需打；[心控]點名；P2[光明]；[狂暴]計時||{rt1}必斷/速殺：[心控]速斷救人；打寶{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["典狱长"] = {
            type = "BOSS",
            name = "典獄長",
            tipsByDifficulty = {
                ["normal"] = "{rt8}典獄長{rt8}||[多重]多機制輪換，[鏈]；[霜]全團；P3[本體]||{rt1}必斷/速殺：無；按階段應對{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["堕落先知道塞格涅"] = {
            type = "BOSS",
            name = "墮落先知道塞格涅",
            tipsByDifficulty = {
                ["normal"] = "{rt8}墮落先知道塞格涅{rt8}||[球]點名需遠離；[聖]全團；[狂暴]計時||{rt1}必斷/速殺：無；[球]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["莱盖隆"] = {
            type = "BOSS",
            name = "萊蓋隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}萊蓋隆{rt8}||[星]點名需遠離；[坍縮]；[狂暴]計時||{rt1}必斷/速殺：無；[星]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["回收者哈拉顿"] = {
            type = "BOSS",
            name = "回收者哈拉頓",
            tipsByDifficulty = {
                ["normal"] = "{rt8}回收者哈拉頓{rt8}||[鑽地]需打露頭；[激光]；[狂暴]計時||{rt1}必斷/速殺：無；打露頭、躲激光{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["首席建筑师利胡维姆"] = {
            type = "BOSS",
            name = "首席建築師利胡維姆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}首席建築師利胡維姆{rt8}||[構造]需打斷；[塊]點名；[狂暴]計時||{rt1}必斷/速殺：按構造打斷；集火{rt1}||坦：拉；輸出：轉火",
            },
        },
    },
    ["统御圣所"] = {
        name = "統御聖所",
        ["塔拉格鲁"] = {
            type = "BOSS",
            name = "塔拉格魯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}塔拉格魯{rt8}||[門]需按順序開；[衝]；[狂暴]計時||{rt1}必斷/速殺：無；按門順序、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["裂魂者多玛赞"] = {
            type = "BOSS",
            name = "裂魂者多瑪贊",
            tipsByDifficulty = {
                ["normal"] = "{rt8}裂魂者多瑪贊{rt8}||[鏈]需拉一起；[魂]；[狂暴]計時||{rt1}必斷/速殺：無；[鏈]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["希尔瓦娜斯·风行者"] = {
            type = "BOSS",
            name = "希爾瓦娜斯·風行者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}希爾瓦娜斯·風行者{rt8}||[鏈]點名需拉；[箭]；P2[風]；[狂暴]計時||{rt1}必斷/速殺：無；[鏈]被點名拉、P2應對{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["痛苦工匠拉兹纳尔"] = {
            type = "BOSS",
            name = "痛苦工匠拉茲納爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}痛苦工匠拉茲納爾{rt8}||[鐵]需看地面躲；[釘]點名；[狂暴]計時||{rt1}必斷/速殺：無；看地面躲鐵、[釘]遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["初诞者卫士"] = {
            type = "BOSS",
            name = "初誕者衛士",
            tipsByDifficulty = {
                ["normal"] = "{rt8}初誕者衛士{rt8}||[盾]需破；[激光]；[狂暴]計時||{rt1}必斷/速殺：無；破盾、躲激光{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["九人议会"] = {
            type = "BOSS",
            name = "九人議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}九人議會{rt8}||[九]需集火單隻；[幻象]；[狂暴]計時||{rt1}必斷/速殺：無；集火單隻{rt1}||坦：拉；輸出：集火",
            },
        },
        ["克尔苏加德"] = {
            type = "BOSS",
            name = "克爾蘇加德",
            tipsByDifficulty = {
                ["normal"] = "{rt8}克爾蘇加德{rt8}||[冰箱]需進；[魂]點名；[狂暴]計時||{rt1}必斷/速殺：無；進冰箱、[魂]救{rt1}||坦：拉；輸出：進門",
            },
        },
        ["命运抄写者罗-卡洛"] = {
            type = "BOSS",
            name = "命運抄寫者羅-卡洛",
            tipsByDifficulty = {
                ["normal"] = "{rt8}命運抄寫者羅-卡洛{rt8}||[符]需對應站位；[星]點名；[狂暴]計時||{rt1}必斷/速殺：無；按符站位、[星]遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["典狱长之眼"] = {
            type = "BOSS",
            name = "典獄長之眼",
            tipsByDifficulty = {
                ["normal"] = "{rt8}典獄長之眼{rt8}||[眼]點名需遠離；[鏈]；[狂暴]計時||{rt1}必斷/速殺：無；[眼]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["耐奥祖残魂"] = {
            type = "BOSS",
            name = "耐奧祖殘魂",
            tipsByDifficulty = {
                ["normal"] = "{rt8}耐奧祖殘魂{rt8}||[球]需拉；[霜]全團；[狂暴]計時||{rt1}必斷/速殺：無；[球]被點名拉{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
}
