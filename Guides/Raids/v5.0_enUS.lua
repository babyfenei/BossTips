-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["5.0"] = {
    ["雷霆王座"] = {
        name = "Throne of Thunder",
        ["铁库昂"] = {
            type = "BOSS",
            name = "Iron Qon",
            tipsByDifficulty = {
                ["lfr"] = "[Four Phase] wind/fire/ice/lightning rotate, need corresponding positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Four Phase] wind/fire/ice/lightning rotate, need corresponding positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Four Phase] wind/fire/ice/lightning rotate, need corresponding positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Four Phase] wind/fire/ice/lightning rotate, need corresponding positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Four Phase] wind/fire/ice/lightning rotate, need corresponding positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["长者议会"] = {
            type = "BOSS",
            name = "The Spirit Kings",
            tipsByDifficulty = {
                ["lfr"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["双后"] = {
            type = "BOSS",
            name = "The Twin Consorts",
            tipsByDifficulty = {
                ["lfr"] = "[Twins] need kill simultaneously; [Ice/Fire] mixed; [Mind Control]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Twins] need kill simultaneously; [Ice/Fire] mixed; [Mind Control]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Twins] need kill simultaneously; [Ice/Fire] mixed; [Mind Control]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Twins] need kill simultaneously; [Ice/Fire] mixed; [Mind Control]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Twins] need kill simultaneously; [Ice/Fire] mixed; [Mind Control]||{rt1}Must interrupt/burst: none; focus simultaneously{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["美拉盖拉"] = {
            type = "BOSS",
            name = "Megaera",
            tipsByDifficulty = {
                ["lfr"] = "[Multi Head] needs interrupt head prevent revive; [Acid]; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt head prevent revive; focus{rt1}||Tank: hold; DPS: break head",
                ["normal"] = "[Multi Head] needs interrupt head prevent revive; [Acid]; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt head prevent revive; focus{rt1}||Tank: hold; DPS: break head",
                ["heroic"] = "[Multi Head] needs interrupt head prevent revive; [Acid]; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt head prevent revive; focus{rt1}||Tank: hold; DPS: break head",
                ["mythic"] = "[Multi Head] needs interrupt head prevent revive; [Acid]; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt head prevent revive; focus{rt1}||Tank: hold; DPS: break head",
                ["mythicplus"] = "[Multi Head] needs interrupt head prevent revive; [Acid]; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt head prevent revive; focus{rt1}||Tank: hold; DPS: break head",
            },
        },
        ["霍利顿"] = {
            type = "BOSS",
            name = "Horridon",
            tipsByDifficulty = {
                ["lfr"] = "[Adds] multi-door summon needs control; [Frenzy] timer||{rt1}Must interrupt/burst: control/clear door adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["normal"] = "[Adds] multi-door summon needs control; [Frenzy] timer||{rt1}Must interrupt/burst: control/clear door adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["heroic"] = "[Adds] multi-door summon needs control; [Frenzy] timer||{rt1}Must interrupt/burst: control/clear door adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["mythic"] = "[Adds] multi-door summon needs control; [Frenzy] timer||{rt1}Must interrupt/burst: control/clear door adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["mythicplus"] = "[Adds] multi-door summon needs control; [Frenzy] timer||{rt1}Must interrupt/burst: control/clear door adds; focus{rt1}||Tank: hold; DPS: control adds",
            },
        },
        ["托托斯"] = {
            type = "BOSS",
            name = "Tortos",
            tipsByDifficulty = {
                ["lfr"] = "[Shell] needs hit exposed; [Earthquake]; [Turtle] needs control||{rt1}Must interrupt/burst: none; hit exposed, control turtle{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Shell] needs hit exposed; [Earthquake]; [Turtle] needs control||{rt1}Must interrupt/burst: none; hit exposed, control turtle{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Shell] needs hit exposed; [Earthquake]; [Turtle] needs control||{rt1}Must interrupt/burst: none; hit exposed, control turtle{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Shell] needs hit exposed; [Earthquake]; [Turtle] needs control||{rt1}Must interrupt/burst: none; hit exposed, control turtle{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Shell] needs hit exposed; [Earthquake]; [Turtle] needs control||{rt1}Must interrupt/burst: none; hit exposed, control turtle{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["雷登"] = {
            type = "BOSS",
            name = "Ra-den",
            tipsByDifficulty = {
                ["lfr"] = "[Ball] complex mechanic, need move by hint; [Frenzy] timer (hidden)||{rt1}Must interrupt/burst: none; move by hint{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Ball] complex mechanic, need move by hint; [Frenzy] timer (hidden)||{rt1}Must interrupt/burst: none; move by hint{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Ball] complex mechanic, need move by hint; [Frenzy] timer (hidden)||{rt1}Must interrupt/burst: none; move by hint{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Ball] complex mechanic, need move by hint; [Frenzy] timer (hidden)||{rt1}Must interrupt/burst: none; move by hint{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Ball] complex mechanic, need move by hint; [Frenzy] timer (hidden)||{rt1}Must interrupt/burst: none; move by hint{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["普利莫求斯"] = {
            type = "BOSS",
            name = "Primordius",
            tipsByDifficulty = {
                ["lfr"] = "[Ball] needs eat [Slime] grow strong; [Mutation]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat slime grow strong{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Ball] needs eat [Slime] grow strong; [Mutation]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat slime grow strong{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Ball] needs eat [Slime] grow strong; [Mutation]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat slime grow strong{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Ball] needs eat [Slime] grow strong; [Mutation]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat slime grow strong{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Ball] needs eat [Slime] grow strong; [Mutation]; [Frenzy] timer||{rt1}Must interrupt/burst: none; eat slime grow strong{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["雷神"] = {
            type = "BOSS",
            name = "Lei Shen",
            tipsByDifficulty = {
                ["lfr"] = "[Platform] multi-mechanic rotate, [Chain]; [Lightning] raid-wide; P3[Invincible]||{rt1}Must interrupt/burst: none; respond by platform mechanic{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Platform] multi-mechanic rotate, [Chain]; [Lightning] raid-wide; P3[Invincible]||{rt1}Must interrupt/burst: none; respond by platform mechanic{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Platform] multi-mechanic rotate, [Chain]; [Lightning] raid-wide; P3[Invincible]||{rt1}Must interrupt/burst: none; respond by platform mechanic{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Platform] multi-mechanic rotate, [Chain]; [Lightning] raid-wide; P3[Invincible]||{rt1}Must interrupt/burst: none; respond by platform mechanic{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Platform] multi-mechanic rotate, [Chain]; [Lightning] raid-wide; P3[Invincible]||{rt1}Must interrupt/burst: none; respond by platform mechanic{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["吉库恩"] = {
            type = "BOSS",
            name = "Ji-Kun",
            tipsByDifficulty = {
                ["lfr"] = "[Egg] needs hit egg; [Poison] landing; [Dive]||{rt1}Must interrupt/burst: none; hit egg, dodge poison{rt1}||Tank: hold; DPS: hit egg",
                ["normal"] = "[Egg] needs hit egg; [Poison] landing; [Dive]||{rt1}Must interrupt/burst: none; hit egg, dodge poison{rt1}||Tank: hold; DPS: hit egg",
                ["heroic"] = "[Egg] needs hit egg; [Poison] landing; [Dive]||{rt1}Must interrupt/burst: none; hit egg, dodge poison{rt1}||Tank: hold; DPS: hit egg",
                ["mythic"] = "[Egg] needs hit egg; [Poison] landing; [Dive]||{rt1}Must interrupt/burst: none; hit egg, dodge poison{rt1}||Tank: hold; DPS: hit egg",
                ["mythicplus"] = "[Egg] needs hit egg; [Poison] landing; [Dive]||{rt1}Must interrupt/burst: none; hit egg, dodge poison{rt1}||Tank: hold; DPS: hit egg",
            },
        },
        ["破坏者金罗克"] = {
            type = "BOSS",
            name = "Jin'rokh the Breaker",
            tipsByDifficulty = {
                ["lfr"] = "[Water] mark needs stand water reduce damage; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Water] mark needs stand water reduce damage; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Water] mark needs stand water reduce damage; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Water] mark needs stand water reduce damage; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Water] mark needs stand water reduce damage; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Water] marked stand water{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["遗忘者杜鲁姆"] = {
            type = "BOSS",
            name = "Durumu the Forgotten",
            tipsByDifficulty = {
                ["lfr"] = "[Beam] needs watch [Eye] move; [Red/Blue] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by beam{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Beam] needs watch [Eye] move; [Red/Blue] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by beam{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Beam] needs watch [Eye] move; [Red/Blue] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by beam{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Beam] needs watch [Eye] move; [Red/Blue] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by beam{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Beam] needs watch [Eye] move; [Red/Blue] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by beam{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["黑暗活化体"] = {
            type = "BOSS",
            name = "Dark Animus",
            tipsByDifficulty = {
                ["lfr"] = "[Ball] needs pull [Animated] into circle remove; [Energy]; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull animated into circle{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Ball] needs pull [Animated] into circle remove; [Energy]; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull animated into circle{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Ball] needs pull [Animated] into circle remove; [Energy]; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull animated into circle{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Ball] needs pull [Animated] into circle remove; [Energy]; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull animated into circle{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Ball] needs pull [Animated] into circle remove; [Energy]; [Frenzy] timer||{rt1}Must interrupt/burst: none; pull animated into circle{rt1}||Tank: hold; DPS: focus",
            },
        },
    },
    ["永春台"] = {
        name = "Terrace of Endless Spring",
        ["惧之煞"] = {
            type = "BOSS",
            name = "Sha of Fear",
            tipsByDifficulty = {
                ["lfr"] = "[Fear] mark needs dodge [Light]; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fear] marked dodge light{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Fear] mark needs dodge [Light]; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fear] marked dodge light{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Fear] mark needs dodge [Light]; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fear] marked dodge light{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Fear] mark needs dodge [Light]; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fear] marked dodge light{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Fear] mark needs dodge [Light]; [Tentacle]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Fear] marked dodge light{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["无尽者守护者"] = {
            type = "BOSS",
            name = "Protectors of the Endless",
            tipsByDifficulty = {
                ["lfr"] = "[Three Guardians] shared health split focus; [Light/Shadow] phase switch||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Guardians] shared health split focus; [Light/Shadow] phase switch||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Guardians] shared health split focus; [Light/Shadow] phase switch||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Guardians] shared health split focus; [Light/Shadow] phase switch||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Guardians] shared health split focus; [Light/Shadow] phase switch||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["烛龙"] = {
            type = "BOSS",
            name = "Tsulong",
            tipsByDifficulty = {
                ["lfr"] = "[Day/Night] day needs interrupt, night needs keep blood; [Light]||{rt1}Must interrupt/burst: day interrupt by mechanic; night keep blood{rt1}||Tank: hold; Healer: night keep blood",
                ["normal"] = "[Day/Night] day needs interrupt, night needs keep blood; [Light]||{rt1}Must interrupt/burst: day interrupt by mechanic; night keep blood{rt1}||Tank: hold; Healer: night keep blood",
                ["heroic"] = "[Day/Night] day needs interrupt, night needs keep blood; [Light]||{rt1}Must interrupt/burst: day interrupt by mechanic; night keep blood{rt1}||Tank: hold; Healer: night keep blood",
                ["mythic"] = "[Day/Night] day needs interrupt, night needs keep blood; [Light]||{rt1}Must interrupt/burst: day interrupt by mechanic; night keep blood{rt1}||Tank: hold; Healer: night keep blood",
                ["mythicplus"] = "[Day/Night] day needs interrupt, night needs keep blood; [Light]||{rt1}Must interrupt/burst: day interrupt by mechanic; night keep blood{rt1}||Tank: hold; Healer: night keep blood",
            },
        },
        ["雷施"] = {
            type = "BOSS",
            name = "Lei Shi",
            tipsByDifficulty = {
                ["lfr"] = "[Stealth] periodic disappear needs stop attack find position; [Water Stream]; [Splash]||{rt1}Must interrupt/burst: none; stealth stop attack locate{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Stealth] periodic disappear needs stop attack find position; [Water Stream]; [Splash]||{rt1}Must interrupt/burst: none; stealth stop attack locate{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Stealth] periodic disappear needs stop attack find position; [Water Stream]; [Splash]||{rt1}Must interrupt/burst: none; stealth stop attack locate{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Stealth] periodic disappear needs stop attack find position; [Water Stream]; [Splash]||{rt1}Must interrupt/burst: none; stealth stop attack locate{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Stealth] periodic disappear needs stop attack find position; [Water Stream]; [Splash]||{rt1}Must interrupt/burst: none; stealth stop attack locate{rt1}||Tank: hold; DPS: focus",
            },
        },
    },
    ["决战奥格瑞玛"] = {
        name = "Siege of Orgrimmar",
        ["堕落的守护者"] = {
            type = "BOSS",
            name = "The Fallen Protectors",
            tipsByDifficulty = {
                ["lfr"] = "[Three Protectors] shared health split; [Mind Control]; [Shadow]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Protectors] shared health split; [Mind Control]; [Shadow]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Protectors] shared health split; [Mind Control]; [Shadow]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Protectors] shared health split; [Mind Control]; [Shadow]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Protectors] shared health split; [Mind Control]; [Shadow]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["嗜血的索克"] = {
            type = "BOSS",
            name = "Thok the Bloodthirsty",
            tipsByDifficulty = {
                ["lfr"] = "[Cage] needs rescue captured; [Poison] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; rescue captured{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Cage] needs rescue captured; [Poison] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; rescue captured{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Cage] needs rescue captured; [Poison] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; rescue captured{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Cage] needs rescue captured; [Poison] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; rescue captured{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Cage] needs rescue captured; [Poison] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; rescue captured{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["潘达利亚的战利品"] = {
            type = "BOSS",
            name = "The Pandaria Treasure",
            tipsByDifficulty = {
                ["lfr"] = "[Chest] open both sides clear adds, time-limited kill||{rt1}Must interrupt/burst: none; time-limited open chest clear adds{rt1}||Tank: split tanks; DPS: clear adds",
                ["normal"] = "[Chest] open both sides clear adds, time-limited kill||{rt1}Must interrupt/burst: none; time-limited open chest clear adds{rt1}||Tank: split tanks; DPS: clear adds",
                ["heroic"] = "[Chest] open both sides clear adds, time-limited kill||{rt1}Must interrupt/burst: none; time-limited open chest clear adds{rt1}||Tank: split tanks; DPS: clear adds",
                ["mythic"] = "[Chest] open both sides clear adds, time-limited kill||{rt1}Must interrupt/burst: none; time-limited open chest clear adds{rt1}||Tank: split tanks; DPS: clear adds",
                ["mythicplus"] = "[Chest] open both sides clear adds, time-limited kill||{rt1}Must interrupt/burst: none; time-limited open chest clear adds{rt1}||Tank: split tanks; DPS: clear adds",
            },
        },
        ["加尔鲁什·地狱咆哮"] = {
            type = "BOSS",
            name = "Garrosh Hellscream",
            tipsByDifficulty = {
                ["lfr"] = "[Iron Star] needs dodge; [Mind Control]; P2[Horde]; P3[Void] raid-wide||{rt1}Must interrupt/burst: none; dodge iron star, P2 respond{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Iron Star] needs dodge; [Mind Control]; P2[Horde]; P3[Void] raid-wide||{rt1}Must interrupt/burst: none; dodge iron star, P2 respond{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Iron Star] needs dodge; [Mind Control]; P2[Horde]; P3[Void] raid-wide||{rt1}Must interrupt/burst: none; dodge iron star, P2 respond{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Iron Star] needs dodge; [Mind Control]; P2[Horde]; P3[Void] raid-wide||{rt1}Must interrupt/burst: none; dodge iron star, P2 respond{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Iron Star] needs dodge; [Mind Control]; P2[Horde]; P3[Void] raid-wide||{rt1}Must interrupt/burst: none; dodge iron star, P2 respond{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["迦拉卡斯"] = {
            type = "BOSS",
            name = "Galakras",
            tipsByDifficulty = {
                ["lfr"] = "[Tower] needs hit tower trigger; [Dragon] phase; [Adds]||{rt1}Must interrupt/burst: none; hit tower trigger, clear adds{rt1}||Tank: split tanks; DPS: hit tower",
                ["normal"] = "[Tower] needs hit tower trigger; [Dragon] phase; [Adds]||{rt1}Must interrupt/burst: none; hit tower trigger, clear adds{rt1}||Tank: split tanks; DPS: hit tower",
                ["heroic"] = "[Tower] needs hit tower trigger; [Dragon] phase; [Adds]||{rt1}Must interrupt/burst: none; hit tower trigger, clear adds{rt1}||Tank: split tanks; DPS: hit tower",
                ["mythic"] = "[Tower] needs hit tower trigger; [Dragon] phase; [Adds]||{rt1}Must interrupt/burst: none; hit tower trigger, clear adds{rt1}||Tank: split tanks; DPS: hit tower",
                ["mythicplus"] = "[Tower] needs hit tower trigger; [Dragon] phase; [Adds]||{rt1}Must interrupt/burst: none; hit tower trigger, clear adds{rt1}||Tank: split tanks; DPS: hit tower",
            },
        },
        ["纳兹戈林将军"] = {
            type = "BOSS",
            name = "General Nazgrim",
            tipsByDifficulty = {
                ["lfr"] = "[War Banner] needs pull; [Adds] summon; [Frenzy] timer||{rt1}Must interrupt/burst: pull war banner, clear adds; focus{rt1}||Tank: hold; DPS: pull banner",
                ["normal"] = "[War Banner] needs pull; [Adds] summon; [Frenzy] timer||{rt1}Must interrupt/burst: pull war banner, clear adds; focus{rt1}||Tank: hold; DPS: pull banner",
                ["heroic"] = "[War Banner] needs pull; [Adds] summon; [Frenzy] timer||{rt1}Must interrupt/burst: pull war banner, clear adds; focus{rt1}||Tank: hold; DPS: pull banner",
                ["mythic"] = "[War Banner] needs pull; [Adds] summon; [Frenzy] timer||{rt1}Must interrupt/burst: pull war banner, clear adds; focus{rt1}||Tank: hold; DPS: pull banner",
                ["mythicplus"] = "[War Banner] needs pull; [Adds] summon; [Frenzy] timer||{rt1}Must interrupt/burst: pull war banner, clear adds; focus{rt1}||Tank: hold; DPS: pull banner",
            },
        },
        ["马尔考洛克"] = {
            type = "BOSS",
            name = "Malkorok",
            tipsByDifficulty = {
                ["lfr"] = "[Ball] mark needs pull together share; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together share{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Ball] mark needs pull together share; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together share{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Ball] mark needs pull together share; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together share{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Ball] mark needs pull together share; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together share{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Ball] mark needs pull together share; [Landing] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ball] marked pull together share{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["钢铁战神"] = {
            type = "BOSS",
            name = "Iron Juggernaut",
            tipsByDifficulty = {
                ["lfr"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["normal"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["heroic"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["mythic"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
                ["mythicplus"] = "[Cannon] needs hit cannon; [Mine]; [Frenzy] timer||{rt1}Must interrupt/burst: none; operate cannon, dodge mine{rt1}||Tank: hold; DPS: operate cannon",
            },
        },
        ["攻城师黑弗斯"] = {
            type = "BOSS",
            name = "Siegecrafter Blackfuse",
            tipsByDifficulty = {
                ["lfr"] = "[Conveyor] needs interrupt corresponding; [Mine]; [Disassemble]||{rt1}Must interrupt/burst: interrupt by conveyor; focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Conveyor] needs interrupt corresponding; [Mine]; [Disassemble]||{rt1}Must interrupt/burst: interrupt by conveyor; focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Conveyor] needs interrupt corresponding; [Mine]; [Disassemble]||{rt1}Must interrupt/burst: interrupt by conveyor; focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Conveyor] needs interrupt corresponding; [Mine]; [Disassemble]||{rt1}Must interrupt/burst: interrupt by conveyor; focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Conveyor] needs interrupt corresponding; [Mine]; [Disassemble]||{rt1}Must interrupt/burst: interrupt by conveyor; focus{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["库卡隆黑暗萨满"] = {
            type = "BOSS",
            name = "Kor'kron Dark Shaman",
            tipsByDifficulty = {
                ["lfr"] = "[Fire/Lightning] two shamans split sides, need corresponding positioning; [Totem]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Fire/Lightning] two shamans split sides, need corresponding positioning; [Totem]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Fire/Lightning] two shamans split sides, need corresponding positioning; [Totem]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Fire/Lightning] two shamans split sides, need corresponding positioning; [Totem]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Fire/Lightning] two shamans split sides, need corresponding positioning; [Totem]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["伊墨苏斯"] = {
            type = "BOSS",
            name = "Immerseus",
            tipsByDifficulty = {
                ["lfr"] = "[Water Drop] needs hit to prevent heal; [Corruption] dot; [Phase]||{rt1}Must interrupt/burst: none; hit water drop prevent heal{rt1}||Tank: hold; DPS: focus water drop",
                ["normal"] = "[Water Drop] needs hit to prevent heal; [Corruption] dot; [Phase]||{rt1}Must interrupt/burst: none; hit water drop prevent heal{rt1}||Tank: hold; DPS: focus water drop",
                ["heroic"] = "[Water Drop] needs hit to prevent heal; [Corruption] dot; [Phase]||{rt1}Must interrupt/burst: none; hit water drop prevent heal{rt1}||Tank: hold; DPS: focus water drop",
                ["mythic"] = "[Water Drop] needs hit to prevent heal; [Corruption] dot; [Phase]||{rt1}Must interrupt/burst: none; hit water drop prevent heal{rt1}||Tank: hold; DPS: focus water drop",
                ["mythicplus"] = "[Water Drop] needs hit to prevent heal; [Corruption] dot; [Phase]||{rt1}Must interrupt/burst: none; hit water drop prevent heal{rt1}||Tank: hold; DPS: focus water drop",
            },
        },
        ["诺鲁什"] = {
            type = "BOSS",
            name = "Norushen",
            tipsByDifficulty = {
                ["lfr"] = "[Test] enter inner field clear [Doubt] ball; [Corruption] dot||{rt1}Must interrupt/burst: none; enter inner field clear doubt ball{rt1}||Tank: hold; DPS: enter inner field",
                ["normal"] = "[Test] enter inner field clear [Doubt] ball; [Corruption] dot||{rt1}Must interrupt/burst: none; enter inner field clear doubt ball{rt1}||Tank: hold; DPS: enter inner field",
                ["heroic"] = "[Test] enter inner field clear [Doubt] ball; [Corruption] dot||{rt1}Must interrupt/burst: none; enter inner field clear doubt ball{rt1}||Tank: hold; DPS: enter inner field",
                ["mythic"] = "[Test] enter inner field clear [Doubt] ball; [Corruption] dot||{rt1}Must interrupt/burst: none; enter inner field clear doubt ball{rt1}||Tank: hold; DPS: enter inner field",
                ["mythicplus"] = "[Test] enter inner field clear [Doubt] ball; [Corruption] dot||{rt1}Must interrupt/burst: none; enter inner field clear doubt ball{rt1}||Tank: hold; DPS: enter inner field",
            },
        },
        ["傲之煞"] = {
            type = "BOSS",
            name = "Sha of Pride",
            tipsByDifficulty = {
                ["lfr"] = "[Pride] full needs spread; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Pride] full spread{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Pride] full needs spread; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Pride] full spread{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Pride] full needs spread; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Pride] full spread{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Pride] full needs spread; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Pride] full spread{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Pride] full needs spread; [Light] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Pride] full spread{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["螳螂妖英杰"] = {
            type = "BOSS",
            name = "The Klaxxi Paragons",
            tipsByDifficulty = {
                ["lfr"] = "[Paragons] rotate activate, need corresponding respond; [Poison]||{rt1}Must interrupt/burst: by paragon mechanic; focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Paragons] rotate activate, need corresponding respond; [Poison]||{rt1}Must interrupt/burst: by paragon mechanic; focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Paragons] rotate activate, need corresponding respond; [Poison]||{rt1}Must interrupt/burst: by paragon mechanic; focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Paragons] rotate activate, need corresponding respond; [Poison]||{rt1}Must interrupt/burst: by paragon mechanic; focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Paragons] rotate activate, need corresponding respond; [Poison]||{rt1}Must interrupt/burst: by paragon mechanic; focus{rt1}||Tank: hold; DPS: focus",
            },
        },
    },
    ["恐惧之心"] = {
        name = "Heart of Fear",
        ["帝国宰相佐拉洛克"] = {
            type = "BOSS",
            name = "Imperial Vizier Zor'lok",
            tipsByDifficulty = {
                ["lfr"] = "[Convert] by room mechanic switch needs move; [Mind Control]; [Decay]||{rt1}Must interrupt/burst: none; move by room{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Convert] by room mechanic switch needs move; [Mind Control]; [Decay]||{rt1}Must interrupt/burst: none; move by room{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Convert] by room mechanic switch needs move; [Mind Control]; [Decay]||{rt1}Must interrupt/burst: none; move by room{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Convert] by room mechanic switch needs move; [Mind Control]; [Decay]||{rt1}Must interrupt/burst: none; move by room{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Convert] by room mechanic switch needs move; [Mind Control]; [Decay]||{rt1}Must interrupt/burst: none; move by room{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["琥珀塑形者昂绍克"] = {
            type = "BOSS",
            name = "Amber-Shaper Un'sok",
            tipsByDifficulty = {
                ["lfr"] = "[Amber] absorb needs break; [Construct] phase; [Toxic]||{rt1}Must interrupt/burst: none; hit amber construct{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Amber] absorb needs break; [Construct] phase; [Toxic]||{rt1}Must interrupt/burst: none; hit amber construct{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Amber] absorb needs break; [Construct] phase; [Toxic]||{rt1}Must interrupt/burst: none; hit amber construct{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Amber] absorb needs break; [Construct] phase; [Toxic]||{rt1}Must interrupt/burst: none; hit amber construct{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Amber] absorb needs break; [Construct] phase; [Toxic]||{rt1}Must interrupt/burst: none; hit amber construct{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["风领主梅尔加拉克"] = {
            type = "BOSS",
            name = "Wind Lord Mel'jarak",
            tipsByDifficulty = {
                ["lfr"] = "[Adds] periodic summon needs control; [Whirlwind]; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["normal"] = "[Adds] periodic summon needs control; [Whirlwind]; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["heroic"] = "[Adds] periodic summon needs control; [Whirlwind]; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["mythic"] = "[Adds] periodic summon needs control; [Whirlwind]; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds; focus{rt1}||Tank: hold; DPS: control adds",
                ["mythicplus"] = "[Adds] periodic summon needs control; [Whirlwind]; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds; focus{rt1}||Tank: hold; DPS: control adds",
            },
        },
        ["女皇谢兹卡尔"] = {
            type = "BOSS",
            name = "Empress Shek'zeer",
            tipsByDifficulty = {
                ["lfr"] = "[Poison] high dot needs spread; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; spread{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Poison] high dot needs spread; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; spread{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Poison] high dot needs spread; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; spread{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Poison] high dot needs spread; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; spread{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Poison] high dot needs spread; [Mind Control] mark; [Frenzy] timer||{rt1}Must interrupt/burst: [Mind Control] quick interrupt rescue; spread{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["剑圣塔亚克"] = {
            type = "BOSS",
            name = "Blade Lord Ta'yak",
            tipsByDifficulty = {
                ["lfr"] = "[Gale] push; [Blade] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge gale{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Gale] push; [Blade] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge gale{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Gale] push; [Blade] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge gale{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Gale] push; [Blade] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge gale{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Gale] push; [Blade] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; dodge gale{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["加拉隆"] = {
            type = "BOSS",
            name = "Garalon",
            tipsByDifficulty = {
                ["lfr"] = "[Leg] need hit leg weaken body; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit leg reduce{rt1}||Tank: hold; DPS: hit leg",
                ["normal"] = "[Leg] need hit leg weaken body; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit leg reduce{rt1}||Tank: hold; DPS: hit leg",
                ["heroic"] = "[Leg] need hit leg weaken body; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit leg reduce{rt1}||Tank: hold; DPS: hit leg",
                ["mythic"] = "[Leg] need hit leg weaken body; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit leg reduce{rt1}||Tank: hold; DPS: hit leg",
                ["mythicplus"] = "[Leg] need hit leg weaken body; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; hit leg reduce{rt1}||Tank: hold; DPS: hit leg",
            },
        },
    },
    ["魔古山宝库"] = {
        name = "Mogu'shan Vaults",
        ["缚灵者戈拉亚"] = {
            type = "BOSS",
            name = "Gara'jal the Spiritbinder",
            tipsByDifficulty = {
                ["lfr"] = "[Spirit] need enter spirit rescue captured; [Shadow] dot||{rt1}Must interrupt/burst: none; enter spirit rescue ally{rt1}||Tank: hold; DPS: enter spirit",
                ["normal"] = "[Spirit] need enter spirit rescue captured; [Shadow] dot||{rt1}Must interrupt/burst: none; enter spirit rescue ally{rt1}||Tank: hold; DPS: enter spirit",
                ["heroic"] = "[Spirit] need enter spirit rescue captured; [Shadow] dot||{rt1}Must interrupt/burst: none; enter spirit rescue ally{rt1}||Tank: hold; DPS: enter spirit",
                ["mythic"] = "[Spirit] need enter spirit rescue captured; [Shadow] dot||{rt1}Must interrupt/burst: none; enter spirit rescue ally{rt1}||Tank: hold; DPS: enter spirit",
                ["mythicplus"] = "[Spirit] need enter spirit rescue captured; [Shadow] dot||{rt1}Must interrupt/burst: none; enter spirit rescue ally{rt1}||Tank: hold; DPS: enter spirit",
            },
        },
        ["石头守卫"] = {
            type = "BOSS",
            name = "The Stone Guard",
            tipsByDifficulty = {
                ["lfr"] = "[Gem] need by color activate corresponding; [Pet] tank pick up||{rt1}Must interrupt/burst: none; activate by gem color{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Gem] need by color activate corresponding; [Pet] tank pick up||{rt1}Must interrupt/burst: none; activate by gem color{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Gem] need by color activate corresponding; [Pet] tank pick up||{rt1}Must interrupt/burst: none; activate by gem color{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Gem] need by color activate corresponding; [Pet] tank pick up||{rt1}Must interrupt/burst: none; activate by gem color{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Gem] need by color activate corresponding; [Pet] tank pick up||{rt1}Must interrupt/burst: none; activate by gem color{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["伊拉贡"] = {
            type = "BOSS",
            name = "Elegon",
            tipsByDifficulty = {
                ["lfr"] = "[Energy] need hit [Star] restore energy; [Beam]; [Heroic] phase||{rt1}Must interrupt/burst: none; hit star restore, dodge beam{rt1}||Tank: hold; DPS: hit star",
                ["normal"] = "[Energy] need hit [Star] restore energy; [Beam]; [Heroic] phase||{rt1}Must interrupt/burst: none; hit star restore, dodge beam{rt1}||Tank: hold; DPS: hit star",
                ["heroic"] = "[Energy] need hit [Star] restore energy; [Beam]; [Heroic] phase||{rt1}Must interrupt/burst: none; hit star restore, dodge beam{rt1}||Tank: hold; DPS: hit star",
                ["mythic"] = "[Energy] need hit [Star] restore energy; [Beam]; [Heroic] phase||{rt1}Must interrupt/burst: none; hit star restore, dodge beam{rt1}||Tank: hold; DPS: hit star",
                ["mythicplus"] = "[Energy] need hit [Star] restore energy; [Beam]; [Heroic] phase||{rt1}Must interrupt/burst: none; hit star restore, dodge beam{rt1}||Tank: hold; DPS: hit star",
            },
        },
        ["皇帝的意志"] = {
            type = "BOSS",
            name = "The Emperor's Will",
            tipsByDifficulty = {
                ["lfr"] = "[Puppet] dual tank pull, [Energy] full needs interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt before energy full; focus{rt1}||Tank: dual tank; DPS: quick kill",
                ["normal"] = "[Puppet] dual tank pull, [Energy] full needs interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt before energy full; focus{rt1}||Tank: dual tank; DPS: quick kill",
                ["heroic"] = "[Puppet] dual tank pull, [Energy] full needs interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt before energy full; focus{rt1}||Tank: dual tank; DPS: quick kill",
                ["mythic"] = "[Puppet] dual tank pull, [Energy] full needs interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt before energy full; focus{rt1}||Tank: dual tank; DPS: quick kill",
                ["mythicplus"] = "[Puppet] dual tank pull, [Energy] full needs interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: interrupt before energy full; focus{rt1}||Tank: dual tank; DPS: quick kill",
            },
        },
        ["灵魂王"] = {
            type = "BOSS",
            name = "The Spirit Kings",
            tipsByDifficulty = {
                ["lfr"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Four Kings] rotate activate, need interrupt corresponding; [Shared]||{rt1}Must interrupt/burst: interrupt by king; one by one{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["受诅者冯"] = {
            type = "BOSS",
            name = "Feng the Accursed",
            tipsByDifficulty = {
                ["lfr"] = "[Element] fire/lightning/ice rotate, need interrupt corresponding; [Phase]||{rt1}Must interrupt/burst: interrupt by element; focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Element] fire/lightning/ice rotate, need interrupt corresponding; [Phase]||{rt1}Must interrupt/burst: interrupt by element; focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Element] fire/lightning/ice rotate, need interrupt corresponding; [Phase]||{rt1}Must interrupt/burst: interrupt by element; focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Element] fire/lightning/ice rotate, need interrupt corresponding; [Phase]||{rt1}Must interrupt/burst: interrupt by element; focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Element] fire/lightning/ice rotate, need interrupt corresponding; [Phase]||{rt1}Must interrupt/burst: interrupt by element; focus{rt1}||Tank: hold; DPS: focus",
            },
        },
    },
}
