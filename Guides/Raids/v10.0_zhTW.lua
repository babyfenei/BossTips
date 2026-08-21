-- ============================================================================
-- BossTips 10.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["10.0"] = {
    ["阿梅达希尔，梦境之愿"] = {
        name = "阿梅達希爾，夢境之願",
        ["纠结根须"] = {
            type = "BOSS",
            name = "糾結根鬚",
            tipsByDifficulty = {
                ["normal"] = "{rt8}糾結根鬚{rt8}||[根]點名需遠離；[毒]dot；[狂暴]計時||{rt1}必斷/速殺：無；[根]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["炽燃菲拉克斯"] = {
            type = "BOSS",
            name = "熾燃菲拉克斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}熾燃菲拉克斯{rt8}||[火]全團高傷；[飛行]階段；[狂暴]計時||{rt1}必斷/速殺：無；躲火、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["沃尔科罗斯"] = {
            type = "BOSS",
            name = "沃爾科羅斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}沃爾科羅斯{rt8}||[鏈]需拉一起；[火]全團；[狂暴]計時||{rt1}必斷/速殺：無；[鏈]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["斯莫德隆"] = {
            type = "BOSS",
            name = "斯莫德隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}斯莫德隆{rt8}||[熔岩]需躲；[衝]；[狂暴]計時||{rt1}必斷/速殺：無；躲熔岩{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["火焰守护者拉罗达尔"] = {
            type = "BOSS",
            name = "火焰守護者拉羅達爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}火焰守護者拉羅達爾{rt8}||[火]需控；[樹]階段；[狂暴]計時||{rt1}必斷/速殺：無；控火、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["残酷的伊吉拉"] = {
            type = "BOSS",
            name = "殘酷的伊吉拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}殘酷的伊吉拉{rt8}||[箭]點名需遠離；[盾]；[狂暴]計時||{rt1}必斷/速殺：無；[箭]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["梦境议会"] = {
            type = "BOSS",
            name = "夢境議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}夢境議會{rt8}||[三夢]共享血量分邊；[混合]；[狂暴]計時||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["火焰先知廷德拉尔"] = {
            type = "BOSS",
            name = "火焰先知廷德拉爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}火焰先知廷德拉爾{rt8}||[星]點名需遠離；[風]；[狂暴]計時||{rt1}必斷/速殺：無；[星]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["轮回编织者尼缪"] = {
            type = "BOSS",
            name = "輪迴編織者尼繆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}輪迴編織者尼繆{rt8}||[環]需對應站位；[點名]；[狂暴]計時||{rt1}必斷/速殺：無；按環站位{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["亚贝鲁斯，焰影熔炉"] = {
        name = "亞貝魯斯，焰影熔爐",
        ["被遗忘的实验"] = {
            type = "BOSS",
            name = "被遺忘的實驗",
            tipsByDifficulty = {
                ["normal"] = "{rt8}被遺忘的實驗{rt8}||[雙形態]切換需應對；[毒]dot；[狂暴]計時||{rt1}必斷/速殺：無；按形態應對{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["长者拉肖克"] = {
            type = "BOSS",
            name = "長者拉肖克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}長者拉肖克{rt8}||[能量]滿需打斷；[重擊]坦；[狂暴]計時||{rt1}必斷/速殺：能量滿前打斷；集火{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["警戒管家兹斯卡尔恩"] = {
            type = "BOSS",
            name = "警戒管家茲斯卡爾恩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}警戒管家茲斯卡爾恩{rt8}||[陷阱]需處理；[火]；[狂暴]計時||{rt1}必斷/速殺：無；處理陷阱、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["耐萨里奥回响"] = {
            type = "BOSS",
            name = "耐薩里奧迴響",
            tipsByDifficulty = {
                ["normal"] = "{rt8}耐薩里奧迴響{rt8}||[崩裂]點名需遠離；[熔岩]全團；P3[本體]；[狂暴]計時||{rt1}必斷/速殺：無；[崩裂]被點名遠離{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["融合密室"] = {
            type = "BOSS",
            name = "融合密室",
            tipsByDifficulty = {
                ["normal"] = "{rt8}融合密室{rt8}||[雙怪]需同時擊殺；[毒/火]混合；[狂暴]計時||{rt1}必斷/速殺：無；同時集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["地狱熔铸卡扎拉"] = {
            type = "BOSS",
            name = "地獄熔鑄卡扎拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}地獄熔鑄卡扎拉{rt8}||[火]全團高傷；[衝]；[狂暴]計時||{rt1}必斷/速殺：無；躲火、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["鳞长萨卡雷斯"] = {
            type = "BOSS",
            name = "鱗長薩卡雷斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鱗長薩卡雷斯{rt8}||[虛空]點名需遠離；[召喚]階段；[狂暴]計時||{rt1}必斷/速殺：無；[虛空]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["扎卡利突袭"] = {
            type = "BOSS",
            name = "扎卡利突襲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}扎卡利突襲{rt8}||[多波]小怪+載具；[火]；[狂暴]計時||{rt1}必斷/速殺：清小怪、載具推進{rt1}||坦：拉；輸出：清小怪",
            },
        },
        ["玛格莫拉克"] = {
            type = "BOSS",
            name = "瑪格莫拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瑪格莫拉克{rt8}||[鏈]需拉一起；[噴]；[狂暴]計時||{rt1}必斷/速殺：無；[鏈]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["化身巨龙牢窟"] = {
        name = "化身巨龍牢窟",
        ["飞升的达西娅"] = {
            type = "BOSS",
            name = "飛昇的達西婭",
            tipsByDifficulty = {
                ["normal"] = "{rt8}飛昇的達西婭{rt8}||[風]點名需遠離；[升]階段；[狂暴]計時||{rt1}必斷/速殺：無；[風]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["寒息森纳丝"] = {
            type = "BOSS",
            name = "寒息森納絲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}寒息森納絲{rt8}||[冰]點名需遠離；[網]；[狂暴]計時||{rt1}必斷/速殺：無；[冰]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["库罗格·恐图腾"] = {
            type = "BOSS",
            name = "庫羅格·恐圖騰",
            tipsByDifficulty = {
                ["normal"] = "{rt8}庫羅格·恐圖騰{rt8}||[圖騰]需打；[土]階段；[狂暴]計時||{rt1}必斷/速殺：無；打圖騰、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["噬雷者拉兹加斯"] = {
            type = "BOSS",
            name = "噬雷者拉茲加斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}噬雷者拉茲加斯{rt8}||[雷]全團高傷；[鏈]點名；[狂暴]計時||{rt1}必斷/速殺：無；躲雷、[鏈]拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["孵雏者迪乌娜"] = {
            type = "BOSS",
            name = "孵雛者迪烏娜",
            tipsByDifficulty = {
                ["normal"] = "{rt8}孵雛者迪烏娜{rt8}||[蛋]需保；[龍]階段；[狂暴]計時||{rt1}必斷/速殺：無；保蛋、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["泰罗斯"] = {
            type = "BOSS",
            name = "泰羅斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}泰羅斯{rt8}||[石]需打露頭；[震]；[狂暴]計時||{rt1}必斷/速殺：無；打露頭、速殺{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["埃拉诺格"] = {
            type = "BOSS",
            name = "埃拉諾格",
            tipsByDifficulty = {
                ["normal"] = "{rt8}埃拉諾格{rt8}||[環節]需拉一起；[火]全團；[狂暴]計時||{rt1}必斷/速殺：無；[環節]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["原始议会"] = {
            type = "BOSS",
            name = "原始議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}原始議會{rt8}||[四元素]需集火單隻；[混合]；[狂暴]計時||{rt1}必斷/速殺：無；集火單隻{rt1}||坦：分坦；輸出：集火",
            },
        },
    },
}
