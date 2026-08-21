-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["6.0"] = {
    ["地狱火堡垒"] = {
        name = "Hellfire Citadel",
        ["钢铁劫掠者"] = {
            type = "BOSS",
            name = "Iron Reaver",
            tipsByDifficulty = {
                ["lfr"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["normal"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["heroic"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["mythic"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["mythicplus"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
            },
        },
        ["科尔莫克"] = {
            type = "BOSS",
            name = "Kormrok",
            tipsByDifficulty = {
                ["lfr"] = "[Hand] mark needs pull together; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Hand] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Hand] mark needs pull together; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Hand] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Hand] mark needs pull together; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Hand] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Hand] mark needs pull together; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Hand] marked pull together{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Hand] mark needs pull together; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Hand] marked pull together{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["戈尔菲恩德"] = {
            type = "BOSS",
            name = "Gorefiend",
            tipsByDifficulty = {
                ["lfr"] = "[Soul] mark needs rescue; [Corruption] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Soul] mark needs rescue; [Corruption] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Soul] mark needs rescue; [Corruption] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Soul] mark needs rescue; [Corruption] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Soul] mark needs rescue; [Corruption] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Soul] marked rescue{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["暗影领主伊斯卡尔"] = {
            type = "BOSS",
            name = "Shadow-Lord Iskar",
            tipsByDifficulty = {
                ["lfr"] = "[Eye] needs pass; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; pass eye, dodge shadow{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Eye] needs pass; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; pass eye, dodge shadow{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Eye] needs pass; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; pass eye, dodge shadow{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Eye] needs pass; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; pass eye, dodge shadow{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Eye] needs pass; [Shadow] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; pass eye, dodge shadow{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["永恒者索克雷萨"] = {
            type = "BOSS",
            name = "Sorceras the Eternal",
            tipsByDifficulty = {
                ["lfr"] = "[Soul] needs hunt; [Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hunt soul{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Soul] needs hunt; [Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hunt soul{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Soul] needs hunt; [Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hunt soul{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Soul] needs hunt; [Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hunt soul{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Soul] needs hunt; [Fel]; [Frenzy] timer||{rt1}Must interrupt/burst: none; hunt soul{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["祖尔霍拉克"] = {
            type = "BOSS",
            name = "Hellfire Assault",
            tipsByDifficulty = {
                ["lfr"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["normal"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["heroic"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["mythic"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["mythicplus"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
            },
        },
        ["阿克蒙德"] = {
            type = "BOSS",
            name = "Archimonde",
            tipsByDifficulty = {
                ["lfr"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["地狱火高阶议会"] = {
            type = "BOSS",
            name = "Hellfire High Council",
            tipsByDifficulty = {
                ["lfr"] = "[Three Advisors] shared health split; [Fire/Shadow/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Advisors] shared health split; [Fire/Shadow/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Advisors] shared health split; [Fire/Shadow/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Advisors] shared health split; [Fire/Shadow/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Advisors] shared health split; [Fire/Shadow/Fel] mixed||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["基尔罗格·死眼"] = {
            type = "BOSS",
            name = "Kilrogg Deadeye",
            tipsByDifficulty = {
                ["lfr"] = "[Vision] needs enter vision hit; [Eye] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter vision hit{rt1}||Tank: hold; DPS: enter vision",
                ["normal"] = "[Vision] needs enter vision hit; [Eye] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter vision hit{rt1}||Tank: hold; DPS: enter vision",
                ["heroic"] = "[Vision] needs enter vision hit; [Eye] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter vision hit{rt1}||Tank: hold; DPS: enter vision",
                ["mythic"] = "[Vision] needs enter vision hit; [Eye] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter vision hit{rt1}||Tank: hold; DPS: enter vision",
                ["mythicplus"] = "[Vision] needs enter vision hit; [Eye] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter vision hit{rt1}||Tank: hold; DPS: enter vision",
            },
        },
        ["邪能领主扎库恩"] = {
            type = "BOSS",
            name = "Fel Lord Zakuun",
            tipsByDifficulty = {
                ["lfr"] = "[Maze] needs follow route; [Fel] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by maze{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Maze] needs follow route; [Fel] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by maze{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Maze] needs follow route; [Fel] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by maze{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Maze] needs follow route; [Fel] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by maze{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Maze] needs follow route; [Fel] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by maze{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["玛诺洛斯"] = {
            type = "BOSS",
            name = "Mannoroth",
            tipsByDifficulty = {
                ["lfr"] = "[Fel] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fel] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Fel] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fel] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Fel] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fel] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Fel] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fel] marked share{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Fel] mark needs share; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fel] marked share{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["地狱火突袭"] = {
            type = "BOSS",
            name = "Hellfire Assault",
            tipsByDifficulty = {
                ["lfr"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["normal"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["heroic"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["mythic"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
                ["mythicplus"] = "[Multiple Waves] continuous adds + vehicle; [Fire]||{rt1}Must interrupt/burst: clear adds, vehicle advance{rt1}||Tank: hold; DPS: clear adds",
            },
        },
        ["暴君维哈里"] = {
            type = "BOSS",
            name = "Tyrant Velhari",
            tipsByDifficulty = {
                ["lfr"] = "[Light/Dark] two phase switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Light/Dark] two phase switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Light/Dark] two phase switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Light/Dark] two phase switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Light/Dark] two phase switch needs change positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by light/dark{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
    ["黑石铸造厂"] = {
        name = "Blackrock Foundry",
        ["黑手"] = {
            type = "BOSS",
            name = "Blackhand",
            tipsByDifficulty = {
                ["lfr"] = "[Anvil] periodic slam ground; [Bomb] mark; P3[Furnace]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge anvil, [Bomb] place circle{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Anvil] periodic slam ground; [Bomb] mark; P3[Furnace]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge anvil, [Bomb] place circle{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Anvil] periodic slam ground; [Bomb] mark; P3[Furnace]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge anvil, [Bomb] place circle{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Anvil] periodic slam ground; [Bomb] mark; P3[Furnace]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge anvil, [Bomb] place circle{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Anvil] periodic slam ground; [Bomb] mark; P3[Furnace]; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge anvil, [Bomb] place circle{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["克罗莫格"] = {
            type = "BOSS",
            name = "Kromog",
            tipsByDifficulty = {
                ["lfr"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["索加尔"] = {
            type = "BOSS",
            name = "Kromog",
            tipsByDifficulty = {
                ["lfr"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Shockwave] needs jump; [Stone Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Stone Fist] marked away, jump shockwave{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["奥雷戈格"] = {
            type = "BOSS",
            name = "Oregorger",
            tipsByDifficulty = {
                ["lfr"] = "[Roll] needs dodge; [Ore] eat ore grow strong; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge roll, eat ore{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Roll] needs dodge; [Ore] eat ore grow strong; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge roll, eat ore{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Roll] needs dodge; [Ore] eat ore grow strong; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge roll, eat ore{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Roll] needs dodge; [Ore] eat ore grow strong; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge roll, eat ore{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Roll] needs dodge; [Ore] eat ore grow strong; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge roll, eat ore{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["钢铁女武神"] = {
            type = "BOSS",
            name = "The Iron Maidens",
            tipsByDifficulty = {
                ["lfr"] = "[Three Valkyrie] shared health split; [Torpedo]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Valkyrie] shared health split; [Torpedo]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Valkyrie] shared health split; [Torpedo]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Valkyrie] shared health split; [Torpedo]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Valkyrie] shared health split; [Torpedo]; [Frenzy] timer||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["烈焰编织者卡格拉兹"] = {
            type = "BOSS",
            name = "Flamebender Ka'graz",
            tipsByDifficulty = {
                ["lfr"] = "[Two Dragons] needs pull apart; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two dragons{rt1}||Tank: dual tank; DPS: focus",
                ["normal"] = "[Two Dragons] needs pull apart; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two dragons{rt1}||Tank: dual tank; DPS: focus",
                ["heroic"] = "[Two Dragons] needs pull apart; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two dragons{rt1}||Tank: dual tank; DPS: focus",
                ["mythic"] = "[Two Dragons] needs pull apart; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two dragons{rt1}||Tank: dual tank; DPS: focus",
                ["mythicplus"] = "[Two Dragons] needs pull apart; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; split pull two dragons{rt1}||Tank: dual tank; DPS: focus",
            },
        },
        ["兽王达玛拉克"] = {
            type = "BOSS",
            name = "Beastlord Darmac",
            tipsByDifficulty = {
                ["lfr"] = "[Beast] periodic summon needs control; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill beast; focus{rt1}||Tank: hold; DPS: control adds",
                ["normal"] = "[Beast] periodic summon needs control; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill beast; focus{rt1}||Tank: hold; DPS: control adds",
                ["heroic"] = "[Beast] periodic summon needs control; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill beast; focus{rt1}||Tank: hold; DPS: control adds",
                ["mythic"] = "[Beast] periodic summon needs control; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill beast; focus{rt1}||Tank: hold; DPS: control adds",
                ["mythicplus"] = "[Beast] periodic summon needs control; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill beast; focus{rt1}||Tank: hold; DPS: control adds",
            },
        },
        ["格鲁尔"] = {
            type = "BOSS",
            name = "Gruul",
            tipsByDifficulty = {
                ["lfr"] = "[Shatter] mark needs away; [Geo] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shatter] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Shatter] mark needs away; [Geo] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shatter] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Shatter] mark needs away; [Geo] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shatter] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Shatter] mark needs away; [Geo] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shatter] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Shatter] mark needs away; [Geo] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Shatter] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["熔炉"] = {
            type = "BOSS",
            name = "The Blast Furnace",
            tipsByDifficulty = {
                ["lfr"] = "[Lava] splash needs dodge; [Element] tank pick up; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge lava{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Lava] splash needs dodge; [Element] tank pick up; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge lava{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Lava] splash needs dodge; [Element] tank pick up; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge lava{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Lava] splash needs dodge; [Element] tank pick up; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge lava{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Lava] splash needs dodge; [Element] tank pick up; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge lava{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["汉斯加尔与弗兰佐克"] = {
            type = "BOSS",
            name = "Hans'gar and Franzok",
            tipsByDifficulty = {
                ["lfr"] = "[Stamp] periodic needs dodge; [Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge stamp{rt1}||Tank: dual tank; DPS: focus",
                ["normal"] = "[Stamp] periodic needs dodge; [Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge stamp{rt1}||Tank: dual tank; DPS: focus",
                ["heroic"] = "[Stamp] periodic needs dodge; [Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge stamp{rt1}||Tank: dual tank; DPS: focus",
                ["mythic"] = "[Stamp] periodic needs dodge; [Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge stamp{rt1}||Tank: dual tank; DPS: focus",
                ["mythicplus"] = "[Stamp] periodic needs dodge; [Fist] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge stamp{rt1}||Tank: dual tank; DPS: focus",
            },
        },
    },
    ["悬锤堡"] = {
        name = "Highmaul",
        ["双子奥格隆"] = {
            type = "BOSS",
            name = "Twin Ogron",
            tipsByDifficulty = {
                ["lfr"] = "[Twins] need kill simultaneously; [Charge]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Twins] need kill simultaneously; [Charge]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Twins] need kill simultaneously; [Charge]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Twins] need kill simultaneously; [Charge]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Twins] need kill simultaneously; [Charge]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["卡加斯·刃拳"] = {
            type = "BOSS",
            name = "Kargath Bladefist",
            tipsByDifficulty = {
                ["lfr"] = "[Iron Cage] needs pull; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull iron cage, dodge spear{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Iron Cage] needs pull; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull iron cage, dodge spear{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Iron Cage] needs pull; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull iron cage, dodge spear{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Iron Cage] needs pull; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull iron cage, dodge spear{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Iron Cage] needs pull; [Spear] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull iron cage, dodge spear{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["元首马尔高克"] = {
            type = "BOSS",
            name = "Imperator Mar'gok",
            tipsByDifficulty = {
                ["lfr"] = "[Arcane] mark needs away; [Teleport]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Arcane] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Arcane] mark needs away; [Teleport]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Arcane] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Arcane] mark needs away; [Teleport]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Arcane] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Arcane] mark needs away; [Teleport]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Arcane] marked away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Arcane] mark needs away; [Teleport]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Arcane] marked away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["屠夫"] = {
            type = "BOSS",
            name = "The Butcher",
            tipsByDifficulty = {
                ["lfr"] = "[Cleave] raid high damage needs tank swap; [Frenzy] timer||{rt1}Must interrupt/burst: none; swap tank avoid cleave{rt1}||Tank: dual tank; Healer: raid heal",
                ["normal"] = "[Cleave] raid high damage needs tank swap; [Frenzy] timer||{rt1}Must interrupt/burst: none; swap tank avoid cleave{rt1}||Tank: dual tank; Healer: raid heal",
                ["heroic"] = "[Cleave] raid high damage needs tank swap; [Frenzy] timer||{rt1}Must interrupt/burst: none; swap tank avoid cleave{rt1}||Tank: dual tank; Healer: raid heal",
                ["mythic"] = "[Cleave] raid high damage needs tank swap; [Frenzy] timer||{rt1}Must interrupt/burst: none; swap tank avoid cleave{rt1}||Tank: dual tank; Healer: raid heal",
                ["mythicplus"] = "[Cleave] raid high damage needs tank swap; [Frenzy] timer||{rt1}Must interrupt/burst: none; swap tank avoid cleave{rt1}||Tank: dual tank; Healer: raid heal",
            },
        },
        ["布雷肯斯波雷"] = {
            type = "BOSS",
            name = "Brackenspore",
            tipsByDifficulty = {
                ["lfr"] = "[Mushroom] needs step heal; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; step mushroom heal{rt1}||Tank: hold; Healer: step mushroom",
                ["normal"] = "[Mushroom] needs step heal; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; step mushroom heal{rt1}||Tank: hold; Healer: step mushroom",
                ["heroic"] = "[Mushroom] needs step heal; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; step mushroom heal{rt1}||Tank: hold; Healer: step mushroom",
                ["mythic"] = "[Mushroom] needs step heal; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; step mushroom heal{rt1}||Tank: hold; Healer: step mushroom",
                ["mythicplus"] = "[Mushroom] needs step heal; [Poison] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; step mushroom heal{rt1}||Tank: hold; Healer: step mushroom",
            },
        },
        ["泰克图斯"] = {
            type = "BOSS",
            name = "Tectus",
            tipsByDifficulty = {
                ["lfr"] = "[Earth] needs hit exposed; [Earthquake]; [Split]||{rt1}Must interrupt/burst: none; hit exposed, focus clone{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Earth] needs hit exposed; [Earthquake]; [Split]||{rt1}Must interrupt/burst: none; hit exposed, focus clone{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Earth] needs hit exposed; [Earthquake]; [Split]||{rt1}Must interrupt/burst: none; hit exposed, focus clone{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Earth] needs hit exposed; [Earthquake]; [Split]||{rt1}Must interrupt/burst: none; hit exposed, focus clone{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Earth] needs hit exposed; [Earthquake]; [Split]||{rt1}Must interrupt/burst: none; hit exposed, focus clone{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["科拉格"] = {
            type = "BOSS",
            name = "Ko'ragh",
            tipsByDifficulty = {
                ["lfr"] = "[Shield] needs focus break; [Mana] needs control; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: break shield",
                ["normal"] = "[Shield] needs focus break; [Mana] needs control; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: break shield",
                ["heroic"] = "[Shield] needs focus break; [Mana] needs control; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: break shield",
                ["mythic"] = "[Shield] needs focus break; [Mana] needs control; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: break shield",
                ["mythicplus"] = "[Shield] needs focus break; [Mana] needs control; [Frenzy] timer||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: break shield",
            },
        },
    },
}
