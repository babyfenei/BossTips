-- ============================================================================
-- BossTips 6.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["6.0"] = {
    ["悬锤堡"] = {
        name = "懸錘堡",
        ["元首马尔高克"] = {
            type = "BOSS",
            name = "元首馬爾高克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}元首馬爾高克{rt8}||[奧能]點名需遠離；[傳送]；[狂暴]計時||{rt1}必斷/速殺：無；[奧能]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["布雷肯斯波雷"] = {
            type = "BOSS",
            name = "佈雷肯斯波雷",
            tipsByDifficulty = {
                ["normal"] = "{rt8}佈雷肯斯波雷{rt8}||[蘑菇]需踩回血；[毒]dot；[狂暴]計時||{rt1}必斷/速殺：無；踩蘑菇回血{rt1}||坦：拉；治療：踩蘑菇",
            },
        },
        ["泰克图斯"] = {
            type = "BOSS",
            name = "泰克圖斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}泰克圖斯{rt8}||[土]需打露頭；[地震]；[分裂]||{rt1}必斷/速殺：無；打露頭、轉火分身{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["科拉格"] = {
            type = "BOSS",
            name = "科拉格",
            tipsByDifficulty = {
                ["normal"] = "{rt8}科拉格{rt8}||[護盾]需集火破；[法力]需控；[狂暴]計時||{rt1}必斷/速殺：無；集火破盾{rt1}||坦：拉；輸出：破盾",
            },
        },
        ["卡加斯·刃拳"] = {
            type = "BOSS",
            name = "卡加斯·刃拳",
            tipsByDifficulty = {
                ["normal"] = "{rt8}卡加斯·刃拳{rt8}||[鐵欄]需拉；[矛]點名；[狂暴]計時||{rt1}必斷/速殺：無；拉鐵欄、躲矛{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["屠夫"] = {
            type = "BOSS",
            name = "屠夫",
            tipsByDifficulty = {
                ["normal"] = "{rt8}屠夫{rt8}||[順劈]全團高傷需換坦；[狂暴]計時||{rt1}必斷/速殺：無；換坦防順劈{rt1}||坦：雙坦；治療：團刷",
            },
        },
        ["双子奥格隆"] = {
            type = "BOSS",
            name = "雙子奧格隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}雙子奧格隆{rt8}||[雙子]需同時擊殺；[衝撞]||{rt1}必斷/速殺：無；同時集火{rt1}||坦：分坦；輸出：集火",
            },
        },
    },
    ["黑石铸造厂"] = {
        name = "黑石鑄造廠",
        ["索加尔"] = {
            type = "BOSS",
            name = "索加爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}索加爾{rt8}||[火車]需按信號燈跑位；[炸彈]；[狂暴]計時||{rt1}必斷/速殺：無；按信號燈跑位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["兽王达玛拉克"] = {
            type = "BOSS",
            name = "獸王達瑪拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}獸王達瑪拉克{rt8}||[野獸]週期召喚需控；[矛]點名；[狂暴]計時||{rt1}必斷/速殺：控/殺野獸；集火{rt1}||坦：拉；輸出：控小怪",
            },
        },
        ["克罗莫格"] = {
            type = "BOSS",
            name = "克羅莫格",
            tipsByDifficulty = {
                ["normal"] = "{rt8}克羅莫格{rt8}||[震波]需跳；[石拳]點名；[狂暴]計時||{rt1}必斷/速殺：無；[石拳]被點名遠離、跳震波{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["熔炉"] = {
            type = "BOSS",
            name = "熔爐",
            tipsByDifficulty = {
                ["normal"] = "{rt8}熔爐{rt8}||[熔岩]噴濺需躲；[元素]坦接；[狂暴]計時||{rt1}必斷/速殺：無；躲熔岩{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["汉斯加尔与弗兰佐克"] = {
            type = "BOSS",
            name = "漢斯加爾與弗蘭佐克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}漢斯加爾與弗蘭佐克{rt8}||[衝壓]週期需躲；[拳]點名；[狂暴]計時||{rt1}必斷/速殺：無；躲衝壓{rt1}||坦：雙坦；輸出：集火",
            },
        },
        ["烈焰编织者卡格拉兹"] = {
            type = "BOSS",
            name = "烈焰編織者卡格拉茲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}烈焰編織者卡格拉茲{rt8}||[雙龍]需分開拉；[火]全團；[狂暴]計時||{rt1}必斷/速殺：無；分拉雙龍{rt1}||坦：雙坦；輸出：集火",
            },
        },
        ["格鲁尔"] = {
            type = "BOSS",
            name = "格魯爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}格魯爾{rt8}||[碎裂]點名需遠離；[地質]全團；[狂暴]計時||{rt1}必斷/速殺：無；[碎裂]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["钢铁女武神"] = {
            type = "BOSS",
            name = "鋼鐵女武神",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鋼鐵女武神{rt8}||[三女武神]共享血量分邊；[魚雷]；[狂暴]計時||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["黑手"] = {
            type = "BOSS",
            name = "黑手",
            tipsByDifficulty = {
                ["normal"] = "{rt8}黑手{rt8}||[鐵砧]週期砸地；[炸彈]點名；P3[熔爐]；[狂暴]計時||{rt1}必斷/速殺：無；躲鐵砧、[炸彈]放圈{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["奥雷戈格"] = {
            type = "BOSS",
            name = "奧雷戈格",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧雷戈格{rt8}||[滾動]需躲；[礦]喫礦變強；[狂暴]計時||{rt1}必斷/速殺：無；躲滾動、喫礦{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["地狱火堡垒"] = {
        name = "地獄火堡壘",
        ["地狱火突袭"] = {
            type = "BOSS",
            name = "地獄火突襲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}地獄火突襲{rt8}||[多波]連續小怪+載具；[火]||{rt1}必斷/速殺：清小怪、載具推進{rt1}||坦：拉；輸出：清小怪",
            },
        },
        ["邪能领主扎库恩"] = {
            type = "BOSS",
            name = "邪能領主扎庫恩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}邪能領主扎庫恩{rt8}||[迷宮]需按路線走；[邪能]dot；[狂暴]計時||{rt1}必斷/速殺：無；按迷宮走位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["祖尔霍拉克"] = {
            type = "BOSS",
            name = "祖爾霍拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}祖爾霍拉克{rt8}||[光/暗]兩階段，需對應站位；[狂暴]計時||{rt1}必斷/速殺：無；按光暗換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["戈尔菲恩德"] = {
            type = "BOSS",
            name = "戈爾菲恩德",
            tipsByDifficulty = {
                ["normal"] = "{rt8}戈爾菲恩德{rt8}||[魂]點名需救；[腐蝕]dot；[狂暴]計時||{rt1}必斷/速殺：無；[魂]被點名救{rt1}||坦：拉；輸出：救人",
            },
        },
        ["阿克蒙德"] = {
            type = "BOSS",
            name = "阿克蒙德",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿克蒙德{rt8}||[手]點名秒殺需遠離；[火]全團；[狂暴]計時||{rt1}必斷/速殺：[手]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["暗影领主伊斯卡尔"] = {
            type = "BOSS",
            name = "暗影領主伊斯卡爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}暗影領主伊斯卡爾{rt8}||[眼]需傳；[暗影]dot；[狂暴]計時||{rt1}必斷/速殺：無；傳眼、躲暗影{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["科尔莫克"] = {
            type = "BOSS",
            name = "科爾莫克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}科爾莫克{rt8}||[手]點名需拉一起；[落地]全團；[狂暴]計時||{rt1}必斷/速殺：無；[手]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["地狱火高阶议会"] = {
            type = "BOSS",
            name = "地獄火高階議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}地獄火高階議會{rt8}||[三顧問]共享血量分邊；[火/暗/邪]混合||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["永恒者索克雷萨"] = {
            type = "BOSS",
            name = "永恆者索克雷薩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}永恆者索克雷薩{rt8}||[靈魂]需獵殺；[邪能]；[狂暴]計時||{rt1}必斷/速殺：無；獵殺靈魂{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["玛诺洛斯"] = {
            type = "BOSS",
            name = "瑪諾洛斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瑪諾洛斯{rt8}||[邪能]點名需分擔；[狂暴]計時||{rt1}必斷/速殺：無；[邪能]被點名分擔{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["钢铁劫掠者"] = {
            type = "BOSS",
            name = "鋼鐵劫掠者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鋼鐵劫掠者{rt8}||[炮]需打炮；[地雷]；[狂暴]計時||{rt1}必斷/速殺：無；操炮、躲雷{rt1}||坦：拉；輸出：操炮",
            },
        },
        ["基尔罗格·死眼"] = {
            type = "BOSS",
            name = "基爾羅格·死眼",
            tipsByDifficulty = {
                ["normal"] = "{rt8}基爾羅格·死眼{rt8}||[幻象]需進幻象打；[眼]點名；[狂暴]計時||{rt1}必斷/速殺：無；進幻象打{rt1}||坦：拉；輸出：進幻象",
            },
        },
        ["暴君维哈里"] = {
            type = "BOSS",
            name = "暴君維哈里",
            tipsByDifficulty = {
                ["normal"] = "{rt8}暴君維哈里{rt8}||[光/暗]兩階段切換需換站位；[狂暴]計時||{rt1}必斷/速殺：無；按光暗換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
}
