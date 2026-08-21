-- ============================================================================
-- BossTips 10.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["10.0"] = {
    ["奈萨鲁斯"] = {
        name = "Neltharus",
        ["熔炉主管戈雷克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Forge Master Gorek{rt8}||[Forge Power] returns to anvil slam whole-group cooldowns; [Flame Shield] marked X cross fire spread||[Searing Hammer] after each segment dodge circle; tank [Searing Swing] knockback cooldowns; {rt1}interrupt [Cast Storm]{rt1}",
                ["normal"] = "{rt8}Forge Master Gorek{rt8}||[Forge Power] returns to anvil slam whole-group cooldowns; [Flame Shield] marked X cross fire spread||[Searing Hammer] after each segment dodge circle; tank [Searing Swing] knockback cooldowns; {rt1}interrupt [Cast Storm]{rt1}",
                ["heroic"] = "{rt8}Forge Master Gorek{rt8}||[Forge Power] returns to anvil slam whole-group cooldowns; [Flame Shield] marked X cross fire spread||[Searing Hammer] after each segment dodge circle; tank [Searing Swing] knockback cooldowns; {rt1}interrupt [Cast Storm]{rt1}",
                ["mythic"] = "{rt8}Forge Master Gorek{rt8}||[Forge Power] returns to anvil slam whole-group cooldowns; [Flame Shield] marked X cross fire spread||[Searing Hammer] after each segment dodge circle; tank [Searing Swing] knockback cooldowns; {rt1}interrupt [Cast Storm]{rt1}",
                ["mythicplus"] = "{rt8}Forge Master Gorek{rt8}||[Forge Power] returns to anvil slam whole-group cooldowns; [Flame Shield] marked X cross fire spread||[Searing Hammer] after each segment dodge circle; tank [Searing Swing] knockback cooldowns; {rt1}interrupt [Cast Storm]{rt1}",
            },
        },
        ["铁匠巨像"] = {
            type = "MOB",
            tips = "{rt8}Smith Colossus{rt8}||[Forge Fury] every 2s whole-group pulse damage, priority control-kill||",
        },
        ["卡拉希铁匠"] = {
            type = "MOB",
            tips = "{rt8}Kalaxxi Smith{rt8}||[Forge Stomp] whole-group fire AoE cooldowns; [Echoing Smash] tank damage keep cooldowns||",
        },
        ["查尔加斯，龙鳞之灾"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Chargath, Scale of the Brood{rt8}||[Earthbinding Spear] marks 3 players, pull chain into boss to break (break chain AoE stacks)||dodge [Magma Wave] / [Erupting Ground]; [Blade Lock] at full energy breaks his focus|",
                ["normal"] = "{rt8}Chargath, Scale of the Brood{rt8}||[Earthbinding Spear] marks 3 players, pull chain into boss to break (break chain AoE stacks)||dodge [Magma Wave] / [Erupting Ground]; [Blade Lock] at full energy breaks his focus|",
                ["heroic"] = "{rt8}Chargath, Scale of the Brood{rt8}||[Earthbinding Spear] marks 3 players, pull chain into boss to break (break chain AoE stacks)||dodge [Magma Wave] / [Erupting Ground]; [Blade Lock] at full energy breaks his focus|",
                ["mythic"] = "{rt8}Chargath, Scale of the Brood{rt8}||[Earthbinding Spear] marks 3 players, pull chain into boss to break (break chain AoE stacks)||dodge [Magma Wave] / [Erupting Ground]; [Blade Lock] at full energy breaks his focus|",
                ["mythicplus"] = "{rt8}Chargath, Scale of the Brood{rt8}||[Earthbinding Spear] marks 3 players, pull chain into boss to break (break chain AoE stacks)||dodge [Magma Wave] / [Erupting Ground]; [Blade Lock] at full energy breaks his focus|",
            },
        },
        ["督军莎尔佳"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warlord Shaarjia{rt8}||[Magma Shield] pick up glowing item to break shield (after break boss vulnerable); [Ember Embers] chase control||dodge [Dragon Kiln] frontal, [Flame Eruption]; {rt1}dispel tank's [Molten Gold]{rt1} curse",
                ["normal"] = "{rt8}Warlord Shaarjia{rt8}||[Magma Shield] pick up glowing item to break shield (after break boss vulnerable); [Ember Embers] chase control||dodge [Dragon Kiln] frontal, [Flame Eruption]; {rt1}dispel tank's [Molten Gold]{rt1} curse",
                ["heroic"] = "{rt8}Warlord Shaarjia{rt8}||[Magma Shield] pick up glowing item to break shield (after break boss vulnerable); [Ember Embers] chase control||dodge [Dragon Kiln] frontal, [Flame Eruption]; {rt1}dispel tank's [Molten Gold]{rt1} curse",
                ["mythic"] = "{rt8}Warlord Shaarjia{rt8}||[Magma Shield] pick up glowing item to break shield (after break boss vulnerable); [Ember Embers] chase control||dodge [Dragon Kiln] frontal, [Flame Eruption]; {rt1}dispel tank's [Molten Gold]{rt1} curse",
                ["mythicplus"] = "{rt8}Warlord Shaarjia{rt8}||[Magma Shield] pick up glowing item to break shield (after break boss vulnerable); [Ember Embers] chase control||dodge [Dragon Kiln] frontal, [Flame Eruption]; {rt1}dispel tank's [Molten Gold]{rt1} curse",
            },
        },
        ["卡拉希焰铸者"] = {
            type = "MOB",
            tips = "{rt8}Kalaxxi Flameforger{rt8}||{rt1}interrupt [Burning Comet]{rt1} (fire circle spread); [Searing Breath] head front dodge; [Burning Ember] ignites DoT|",
        },
        ["岩浆之牙"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Magma Fang{rt8}||[Lava Spit] marked leave group don't move; [Flame Charge] head against wall charge shorten path||at full energy [Violent Mutation] grows [Magma Tentacle] quick AoE to reduce damage; tank don't pull onto fire",
                ["normal"] = "{rt8}Magma Fang{rt8}||[Lava Spit] marked leave group don't move; [Flame Charge] head against wall charge shorten path||at full energy [Violent Mutation] grows [Magma Tentacle] quick AoE to reduce damage; tank don't pull onto fire",
                ["heroic"] = "{rt8}Magma Fang{rt8}||[Lava Spit] marked leave group don't move; [Flame Charge] head against wall charge shorten path||at full energy [Violent Mutation] grows [Magma Tentacle] quick AoE to reduce damage; tank don't pull onto fire",
                ["mythic"] = "{rt8}Magma Fang{rt8}||[Lava Spit] marked leave group don't move; [Flame Charge] head against wall charge shorten path||at full energy [Violent Mutation] grows [Magma Tentacle] quick AoE to reduce damage; tank don't pull onto fire",
                ["mythicplus"] = "{rt8}Magma Fang{rt8}||[Lava Spit] marked leave group don't move; [Flame Charge] head against wall charge shorten path||at full energy [Violent Mutation] grows [Magma Tentacle] quick AoE to reduce damage; tank don't pull onto fire",
            },
        },
        ["卡拉希碎骨者"] = {
            type = "MOB",
            tips = "{rt8}Kalaxxi Bonebreaker{rt8}||[Dragonbone Axe] random bleed can't interrupt priority clear; [Marrow Pierce] charges tank||",
        },
        ["卡拉希熔岩使"] = {
            type = "MOB",
            tips = "{rt8}Kalaxxi Lava Caller{rt8}||[Molten Barrier] can't interrupt and breaks shield explode; {rt1}after shield break quick interrupt [Molten Legion]{rt1} to clear adds|",
        },
        ["尖啸炽焰龙"] = {
            type = "MOB",
            tips = "{rt8}Shrieking Flame Dragon{rt8}||[Gleaming Storm] pushes whole group (against wall); [Searing Bite] tank damage fire physical||",
        },
    },
    ["注能大厅"] = {
        name = "Halls of Infusion",
        ["拜荒者掠食者"] = {
            type = "MOB",
            tips = "{rt8}Wildlander Predator{rt8}||[Tailwind] gives nearby speed + damage, {rt1}interrupt [Blast Gust]{rt1} (40-yard AoE)",
        },
        ["吞喉巨蛙"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gulping Frog{rt8}||[Devour] send 1 player stand in green circle to be eaten to prevent [Enrage]; clear tadpoles fast to avoid [Toxin] stacking||dodge [Cave-in] / [Belly Flop] circle",
                ["normal"] = "{rt8}Gulping Frog{rt8}||[Devour] send 1 player stand in green circle to be eaten to prevent [Enrage]; clear tadpoles fast to avoid [Toxin] stacking||dodge [Cave-in] / [Belly Flop] circle",
                ["heroic"] = "{rt8}Gulping Frog{rt8}||[Devour] send 1 player stand in green circle to be eaten to prevent [Enrage]; clear tadpoles fast to avoid [Toxin] stacking||dodge [Cave-in] / [Belly Flop] circle",
                ["mythic"] = "{rt8}Gulping Frog{rt8}||[Devour] send 1 player stand in green circle to be eaten to prevent [Enrage]; clear tadpoles fast to avoid [Toxin] stacking||dodge [Cave-in] / [Belly Flop] circle",
                ["mythicplus"] = "{rt8}Gulping Frog{rt8}||[Devour] send 1 player stand in green circle to be eaten to prevent [Enrage]; clear tadpoles fast to avoid [Toxin] stacking||dodge [Cave-in] / [Belly Flop] circle",
            },
        },
        ["不屈者卡金"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Unyielding Kajin{rt8}||[Hailstorm] drop ice bricks to block damage (each blocks 2 times), damaged brick 2nd time explodes [Avalanche]||dodge [Glacial Surge] ring, [Polar Wind]; {rt1}dispel [Frost Shock]{rt1}",
                ["normal"] = "{rt8}Unyielding Kajin{rt8}||[Hailstorm] drop ice bricks to block damage (each blocks 2 times), damaged brick 2nd time explodes [Avalanche]||dodge [Glacial Surge] ring, [Polar Wind]; {rt1}dispel [Frost Shock]{rt1}",
                ["heroic"] = "{rt8}Unyielding Kajin{rt8}||[Hailstorm] drop ice bricks to block damage (each blocks 2 times), damaged brick 2nd time explodes [Avalanche]||dodge [Glacial Surge] ring, [Polar Wind]; {rt1}dispel [Frost Shock]{rt1}",
                ["mythic"] = "{rt8}Unyielding Kajin{rt8}||[Hailstorm] drop ice bricks to block damage (each blocks 2 times), damaged brick 2nd time explodes [Avalanche]||dodge [Glacial Surge] ring, [Polar Wind]; {rt1}dispel [Frost Shock]{rt1}",
                ["mythicplus"] = "{rt8}Unyielding Kajin{rt8}||[Hailstorm] drop ice bricks to block damage (each blocks 2 times), damaged brick 2nd time explodes [Avalanche]||dodge [Glacial Surge] ring, [Polar Wind]; {rt1}dispel [Frost Shock]{rt1}",
            },
        },
        ["禁锢装置"] = {
            type = "MOB",
            tips = "{rt8}Restraining Device{rt8}||{rt1}interrupt [Banish]{rt1} (20-yard AoE) and [Restraining Beam]{rt1} (root high damage)",
        },
        ["好奇沼泽蝌蚪"] = {
            type = "MOB",
            tips = "{rt8}Curious Swamp Tadpole{rt8}||[Greedy Toxin] stack 10 = death, clear fast and fast; [Devour] send 1 player intentionally eaten to prevent [Enrage]",
        },
        ["雷夫提防御者"] = {
            type = "MOB",
            tips = "{rt8}Levity Defender{rt8}||{rt1}interrupt [Demoralizing Roar]{rt1} (damage reduction); [Spear Blade Flurry] bleed tank damage cooldowns",
        },
        ["拜荒者塑地师"] = {
            type = "MOB",
            tips = "{rt8}Boulderbreaker Shaper{rt8}||{rt1}interrupt [Earthshatter Smash]{rt1} (fast jump marked high damage); [Earth Shield] dispellable damage buff",
        },
        ["原始海啸"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Primal Tsunami{rt8}||after phase-change knockback kill [Flow Controller] from side corridor to return to P1; stand in water current path to avoid damage||{rt1}interrupt [Flow Impact]{rt1}; dodge [Surge]",
                ["normal"] = "{rt8}Primal Tsunami{rt8}||after phase-change knockback kill [Flow Controller] from side corridor to return to P1; stand in water current path to avoid damage||{rt1}interrupt [Flow Impact]{rt1}; dodge [Surge]",
                ["heroic"] = "{rt8}Primal Tsunami{rt8}||after phase-change knockback kill [Flow Controller] from side corridor to return to P1; stand in water current path to avoid damage||{rt1}interrupt [Flow Impact]{rt1}; dodge [Surge]",
                ["mythic"] = "{rt8}Primal Tsunami{rt8}||after phase-change knockback kill [Flow Controller] from side corridor to return to P1; stand in water current path to avoid damage||{rt1}interrupt [Flow Impact]{rt1}; dodge [Surge]",
                ["mythicplus"] = "{rt8}Primal Tsunami{rt8}||after phase-change knockback kill [Flow Controller] from side corridor to return to P1; stand in water current path to avoid damage||{rt1}interrupt [Flow Impact]{rt1}; dodge [Surge]",
            },
        },
        ["看护者伊里度斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Watcher Iridus{rt8}||P2 [Weakened Barrier] switch to 3 [Purification Device]s above to break shield; dodge [Spark Barrage] circle||{rt1}interrupt device [Purification Pulse]{rt1}; healer dispel [Overload Energy], tank pull device to stack boss",
                ["normal"] = "{rt8}Watcher Iridus{rt8}||P2 [Weakened Barrier] switch to 3 [Purification Device]s above to break shield; dodge [Spark Barrage] circle||{rt1}interrupt device [Purification Pulse]{rt1}; healer dispel [Overload Energy], tank pull device to stack boss",
                ["heroic"] = "{rt8}Watcher Iridus{rt8}||P2 [Weakened Barrier] switch to 3 [Purification Device]s above to break shield; dodge [Spark Barrage] circle||{rt1}interrupt device [Purification Pulse]{rt1}; healer dispel [Overload Energy], tank pull device to stack boss",
                ["mythic"] = "{rt8}Watcher Iridus{rt8}||P2 [Weakened Barrier] switch to 3 [Purification Device]s above to break shield; dodge [Spark Barrage] circle||{rt1}interrupt device [Purification Pulse]{rt1}; healer dispel [Overload Energy], tank pull device to stack boss",
                ["mythicplus"] = "{rt8}Watcher Iridus{rt8}||P2 [Weakened Barrier] switch to 3 [Purification Device]s above to break shield; dodge [Spark Barrage] circle||{rt1}interrupt device [Purification Pulse]{rt1}; healer dispel [Overload Energy], tank pull device to stack boss",
            },
        },
    },
    ["诺库德阻击战"] = {
        name = "The Nokhud Offensive",
        ["格拉尼斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Grannok{rt8}||at full energy before reading [Eruption] use [Dragonkiller Ballista] to interrupt and stun him (3 ballista positions randomly activate)||dodge [Earthshatter], {rt1}interrupt [Rock Shard]{rt1}; M+ priority control-kill [Nokhud Demolisher] to prevent ballista break|",
                ["normal"] = "{rt8}Grannok{rt8}||at full energy before reading [Eruption] use [Dragonkiller Ballista] to interrupt and stun him (3 ballista positions randomly activate)||dodge [Earthshatter], {rt1}interrupt [Rock Shard]{rt1}; M+ priority control-kill [Nokhud Demolisher] to prevent ballista break|",
                ["heroic"] = "{rt8}Grannok{rt8}||at full energy before reading [Eruption] use [Dragonkiller Ballista] to interrupt and stun him (3 ballista positions randomly activate)||dodge [Earthshatter], {rt1}interrupt [Rock Shard]{rt1}; M+ priority control-kill [Nokhud Demolisher] to prevent ballista break|",
                ["mythic"] = "{rt8}Grannok{rt8}||at full energy before reading [Eruption] use [Dragonkiller Ballista] to interrupt and stun him (3 ballista positions randomly activate)||dodge [Earthshatter], {rt1}interrupt [Rock Shard]{rt1}; M+ priority control-kill [Nokhud Demolisher] to prevent ballista break|",
                ["mythicplus"] = "{rt8}Grannok{rt8}||at full energy before reading [Eruption] use [Dragonkiller Ballista] to interrupt and stun him (3 ballista positions randomly activate)||dodge [Earthshatter], {rt1}interrupt [Rock Shard]{rt1}; M+ priority control-kill [Nokhud Demolisher] to prevent ballista break|",
            },
        },
        ["巴塔克"] = {
            type = "MOB",
            tips = "{rt8}Batak{rt8}||{rt1}must interrupt [Terrifying Roar]{rt1} (group fear 6s) or easy ADD; dodge [Wide Stomp]||",
        },
        ["诺库德号角手"] = {
            type = "MOB",
            tips = "{rt8}Nokhud Hornbearer{rt8}||{rt1}must interrupt [Rallying Cry]{rt1} (gives nearby +50% damage), priority control-kill||",
        },
        ["诺库德矛战士"] = {
            type = "MOB",
            tips = "{rt8}Nokhud Spearman{rt8}||[Impale] bleed can't interrupt, priority kill; don't let it stack tank damage||",
        },
        ["诺库德枪炮手"] = {
            type = "MOB",
            tips = "{rt8}Nokhud Gunner{rt8}||{rt1}must interrupt [Disrupting Roar]{rt1} (silence AoE); dodge [War Stomp], [Crippling Strike] cleave",
        },
        ["狂怒风暴"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Raging Storm{rt8}||eat [Lightning Orb] to maintain buff stacks (stand near boss as goalie) then enter center, approach healer on phase change||dodge [Lightning Strike] mark, {rt1}interrupt [Surging Energy]{rt1} (dispellable)",
                ["normal"] = "{rt8}Raging Storm{rt8}||eat [Lightning Orb] to maintain buff stacks (stand near boss as goalie) then enter center, approach healer on phase change||dodge [Lightning Strike] mark, {rt1}interrupt [Surging Energy]{rt1} (dispellable)",
                ["heroic"] = "{rt8}Raging Storm{rt8}||eat [Lightning Orb] to maintain buff stacks (stand near boss as goalie) then enter center, approach healer on phase change||dodge [Lightning Strike] mark, {rt1}interrupt [Surging Energy]{rt1} (dispellable)",
                ["mythic"] = "{rt8}Raging Storm{rt8}||eat [Lightning Orb] to maintain buff stacks (stand near boss as goalie) then enter center, approach healer on phase change||dodge [Lightning Strike] mark, {rt1}interrupt [Surging Energy]{rt1} (dispellable)",
                ["mythicplus"] = "{rt8}Raging Storm{rt8}||eat [Lightning Orb] to maintain buff stacks (stand near boss as goalie) then enter center, approach healer on phase change||dodge [Lightning Strike] mark, {rt1}interrupt [Surging Energy]{rt1} (dispellable)",
            },
        },
        ["提拉和马鲁克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Tilra and Maruk{rt8}||[Storm Arrow] whole group gather to line wind; after jump tank quickly pull two bosses together||{rt1}interrupt [Guardian Wind]{rt1}, dodge [Groundsplitter], [Terrifying Roar] fear|",
                ["normal"] = "{rt8}Tilra and Maruk{rt8}||[Storm Arrow] whole group gather to line wind; after jump tank quickly pull two bosses together||{rt1}interrupt [Guardian Wind]{rt1}, dodge [Groundsplitter], [Terrifying Roar] fear|",
                ["heroic"] = "{rt8}Tilra and Maruk{rt8}||[Storm Arrow] whole group gather to line wind; after jump tank quickly pull two bosses together||{rt1}interrupt [Guardian Wind]{rt1}, dodge [Groundsplitter], [Terrifying Roar] fear|",
                ["mythic"] = "{rt8}Tilra and Maruk{rt8}||[Storm Arrow] whole group gather to line wind; after jump tank quickly pull two bosses together||{rt1}interrupt [Guardian Wind]{rt1}, dodge [Groundsplitter], [Terrifying Roar] fear|",
                ["mythicplus"] = "{rt8}Tilra and Maruk{rt8}||[Storm Arrow] whole group gather to line wind; after jump tank quickly pull two bosses together||{rt1}interrupt [Guardian Wind]{rt1}, dodge [Groundsplitter], [Terrifying Roar] fear|",
            },
        },
        ["巴拉卡可汗"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Balak Khan{rt8}||P1 dodge [Iron Spear] landing + [Iron Stomp] path; P2 switch off 4 [Storm Mage]s to enter P3||{rt1}dispel tank's [Conduction Strike]{rt1}, [Static Spear] pulls whole group toward landing|",
                ["normal"] = "{rt8}Balak Khan{rt8}||P1 dodge [Iron Spear] landing + [Iron Stomp] path; P2 switch off 4 [Storm Mage]s to enter P3||{rt1}dispel tank's [Conduction Strike]{rt1}, [Static Spear] pulls whole group toward landing|",
                ["heroic"] = "{rt8}Balak Khan{rt8}||P1 dodge [Iron Spear] landing + [Iron Stomp] path; P2 switch off 4 [Storm Mage]s to enter P3||{rt1}dispel tank's [Conduction Strike]{rt1}, [Static Spear] pulls whole group toward landing|",
                ["mythic"] = "{rt8}Balak Khan{rt8}||P1 dodge [Iron Spear] landing + [Iron Stomp] path; P2 switch off 4 [Storm Mage]s to enter P3||{rt1}dispel tank's [Conduction Strike]{rt1}, [Static Spear] pulls whole group toward landing|",
                ["mythicplus"] = "{rt8}Balak Khan{rt8}||P1 dodge [Iron Spear] landing + [Iron Stomp] path; P2 switch off 4 [Storm Mage]s to enter P3||{rt1}dispel tank's [Conduction Strike]{rt1}, [Static Spear] pulls whole group toward landing|",
            },
        },
    },
    ["蕨皮山谷"] = {
        name = "Brackenhide Hollow",
        ["腐朽主母怒眼"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Decay Matron Gloweye{rt8}||[Decay Strength] adds damage by player's [Decay Rot] stacks, prioritize switch to [Decay Burst Totem]||dodge [Suffocating Decay Cloud] head front, [Decay Rift Strike] tank damage cooldowns; whole group control disease",
                ["normal"] = "{rt8}Decay Matron Gloweye{rt8}||[Decay Strength] adds damage by player's [Decay Rot] stacks, prioritize switch to [Decay Burst Totem]||dodge [Suffocating Decay Cloud] head front, [Decay Rift Strike] tank damage cooldowns; whole group control disease",
                ["heroic"] = "{rt8}Decay Matron Gloweye{rt8}||[Decay Strength] adds damage by player's [Decay Rot] stacks, prioritize switch to [Decay Burst Totem]||dodge [Suffocating Decay Cloud] head front, [Decay Rift Strike] tank damage cooldowns; whole group control disease",
                ["mythic"] = "{rt8}Decay Matron Gloweye{rt8}||[Decay Strength] adds damage by player's [Decay Rot] stacks, prioritize switch to [Decay Burst Totem]||dodge [Suffocating Decay Cloud] head front, [Decay Rift Strike] tank damage cooldowns; whole group control disease",
                ["mythicplus"] = "{rt8}Decay Matron Gloweye{rt8}||[Decay Strength] adds damage by player's [Decay Rot] stacks, prioritize switch to [Decay Burst Totem]||dodge [Suffocating Decay Cloud] head front, [Decay Rift Strike] tank damage cooldowns; whole group control disease",
            },
        },
        ["腐朽诵者"] = {
            type = "MOB",
            tips = "{rt8}Decay Chanter{rt8}||[Decay Burst] stacks disease [Decay] on whole group, quick dispel to avoid stacking",
        },
        ["劈爪的战团"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Clawpack Warband{rt8}||at 100 energy three-combo [Trick Totem] + [Decay Sense] + [Savage Charge], dodge charge stand behind tank||{rt1}switch to [Trick Totem]{rt1}; [Blood Fury] below 15% pop cooldowns; [Marked Slaughter] focus healer",
                ["normal"] = "{rt8}Clawpack Warband{rt8}||at 100 energy three-combo [Trick Totem] + [Decay Sense] + [Savage Charge], dodge charge stand behind tank||{rt1}switch to [Trick Totem]{rt1}; [Blood Fury] below 15% pop cooldowns; [Marked Slaughter] focus healer",
                ["heroic"] = "{rt8}Clawpack Warband{rt8}||at 100 energy three-combo [Trick Totem] + [Decay Sense] + [Savage Charge], dodge charge stand behind tank||{rt1}switch to [Trick Totem]{rt1}; [Blood Fury] below 15% pop cooldowns; [Marked Slaughter] focus healer",
                ["mythic"] = "{rt8}Clawpack Warband{rt8}||at 100 energy three-combo [Trick Totem] + [Decay Sense] + [Savage Charge], dodge charge stand behind tank||{rt1}switch to [Trick Totem]{rt1}; [Blood Fury] below 15% pop cooldowns; [Marked Slaughter] focus healer",
                ["mythicplus"] = "{rt8}Clawpack Warband{rt8}||at 100 energy three-combo [Trick Totem] + [Decay Sense] + [Savage Charge], dodge charge stand behind tank||{rt1}switch to [Trick Totem]{rt1}; [Blood Fury] below 15% pop cooldowns; [Marked Slaughter] focus healer",
            },
        },
        ["肠击"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gutrender{rt8}||open focus 2 [Rotfang Coyote]s; [Throw Meat] marked lure coyote onto [Snare Trap] to stun||{rt1}must interrupt [Master's Call]{rt1} (frees coyotes); dodge [One Shot] knockback and [Leap] landing||[Hunter's Tactics] gives nearby enemies +15% damage, don't stand next to boss",
                ["normal"] = "{rt8}Gutrender{rt8}||open focus 2 [Rotfang Coyote]s; [Throw Meat] marked lure coyote onto [Snare Trap] to stun||{rt1}must interrupt [Master's Call]{rt1} (frees coyotes); dodge [One Shot] knockback and [Leap] landing||[Hunter's Tactics] gives nearby enemies +15% damage, don't stand next to boss",
                ["heroic"] = "{rt8}Gutrender{rt8}||open focus 2 [Rotfang Coyote]s; [Throw Meat] marked lure coyote onto [Snare Trap] to stun||{rt1}must interrupt [Master's Call]{rt1} (frees coyotes); dodge [One Shot] knockback and [Leap] landing||[Hunter's Tactics] gives nearby enemies +15% damage, don't stand next to boss",
                ["mythic"] = "{rt8}Gutrender{rt8}||open focus 2 [Rotfang Coyote]s; [Throw Meat] marked lure coyote onto [Snare Trap] to stun||{rt1}must interrupt [Master's Call]{rt1} (frees coyotes); dodge [One Shot] knockback and [Leap] landing||[Hunter's Tactics] gives nearby enemies +15% damage, don't stand next to boss",
                ["mythicplus"] = "{rt8}Gutrender{rt8}||open focus 2 [Rotfang Coyote]s; [Throw Meat] marked lure coyote onto [Snare Trap] to stun||{rt1}must interrupt [Master's Call]{rt1} (frees coyotes); dodge [One Shot] knockback and [Leap] landing||[Hunter's Tactics] gives nearby enemies +15% damage, don't stand next to boss",
            },
        },
        ["树口"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Tree Maw{rt8}||take turns standing in green circle to be [Devoured] to prevent wipe (if none stands it goes full-screen); dodge [Sweep] head front||lure coyotes to trap to kill",
                ["normal"] = "{rt8}Tree Maw{rt8}||take turns standing in green circle to be [Devoured] to prevent wipe (if none stands it goes full-screen); dodge [Sweep] head front||lure coyotes to trap to kill",
                ["heroic"] = "{rt8}Tree Maw{rt8}||take turns standing in green circle to be [Devoured] to prevent wipe (if none stands it goes full-screen); dodge [Sweep] head front||lure coyotes to trap to kill",
                ["mythic"] = "{rt8}Tree Maw{rt8}||take turns standing in green circle to be [Devoured] to prevent wipe (if none stands it goes full-screen); dodge [Sweep] head front||lure coyotes to trap to kill",
                ["mythicplus"] = "{rt8}Tree Maw{rt8}||take turns standing in green circle to be [Devoured] to prevent wipe (if none stands it goes full-screen); dodge [Sweep] head front||lure coyotes to trap to kill",
            },
        },
        ["利爪战士"] = {
            type = "MOB",
            tips = "{rt8}Claw Warrior{rt8}||[Savage Clawrend] chases player heavy damage, stun / kite; [Bloody Bite] bleed heal to 90% to break",
        },
        ["诡爪秘术师"] = {
            type = "MOB",
            tips = "{rt8}Guileclaw Arcanist{rt8}||{rt1}interrupt [Earth Bolt]{rt1}; when buffed by [Decay Bolt] kill the totem first",
        },
        ["蕨皮战痕者"] = {
            type = "MOB",
            tips = "{rt8}Fernbark Warhound{rt8}||{rt1}must interrupt [Grin]{rt1} (group fear); [Group Tactics] gives nearby +15% dmg +25% haste priority kill",
        },
        ["腐语图腾"] = {
            type = "MOB",
            tips = "{rt8}Decay Totem{rt8}||[Corrupt Chant] buffs nearby enemies, quick focus kill",
        },
        ["残酷碎骨者"] = {
            type = "MOB",
            tips = "{rt8}Cruel Bonebreaker{rt8}||[Shattering Smash] tank damage + 30% slow, tank cooldowns",
        },
    },
    ["永恒黎明"] = {
        name = "Dawn of the Infinite",
        ["克罗妮卡"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Chronikar{rt8}||[Quicksand Stomp] drop at room end, at full energy [Eternal Shatter] dodge circle then step [Eternal Ember] to prevent [Ember Explosion]||tank each [Lifespan Shear] cooldowns; {rt1}interrupt [Eternal Corrosion]{rt1}",
                ["normal"] = "{rt8}Chronikar{rt8}||[Quicksand Stomp] drop at room end, at full energy [Eternal Shatter] dodge circle then step [Eternal Ember] to prevent [Ember Explosion]||tank each [Lifespan Shear] cooldowns; {rt1}interrupt [Eternal Corrosion]{rt1}",
                ["heroic"] = "{rt8}Chronikar{rt8}||[Quicksand Stomp] drop at room end, at full energy [Eternal Shatter] dodge circle then step [Eternal Ember] to prevent [Ember Explosion]||tank each [Lifespan Shear] cooldowns; {rt1}interrupt [Eternal Corrosion]{rt1}",
                ["mythic"] = "{rt8}Chronikar{rt8}||[Quicksand Stomp] drop at room end, at full energy [Eternal Shatter] dodge circle then step [Eternal Ember] to prevent [Ember Explosion]||tank each [Lifespan Shear] cooldowns; {rt1}interrupt [Eternal Corrosion]{rt1}",
                ["mythicplus"] = "{rt8}Chronikar{rt8}||[Quicksand Stomp] drop at room end, at full energy [Eternal Shatter] dodge circle then step [Eternal Ember] to prevent [Ember Explosion]||tank each [Lifespan Shear] cooldowns; {rt1}interrupt [Eternal Corrosion]{rt1}",
            },
        },
        ["永恒守护者提尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Eternal Watcher Tyr{rt8}||[Divide Strike] at least 2 eat or boss [Titan Empower]; dodge [Consecrated Ground] / [Infinite Annihilation]||pick up [Time Essence] to clear [Steal Time] (<=5 stacks); tank [Titan Smash] knockback cooldowns",
                ["normal"] = "{rt8}Eternal Watcher Tyr{rt8}||[Divide Strike] at least 2 eat or boss [Titan Empower]; dodge [Consecrated Ground] / [Infinite Annihilation]||pick up [Time Essence] to clear [Steal Time] (<=5 stacks); tank [Titan Smash] knockback cooldowns",
                ["heroic"] = "{rt8}Eternal Watcher Tyr{rt8}||[Divide Strike] at least 2 eat or boss [Titan Empower]; dodge [Consecrated Ground] / [Infinite Annihilation]||pick up [Time Essence] to clear [Steal Time] (<=5 stacks); tank [Titan Smash] knockback cooldowns",
                ["mythic"] = "{rt8}Eternal Watcher Tyr{rt8}||[Divide Strike] at least 2 eat or boss [Titan Empower]; dodge [Consecrated Ground] / [Infinite Annihilation]||pick up [Time Essence] to clear [Steal Time] (<=5 stacks); tank [Titan Smash] knockback cooldowns",
                ["mythicplus"] = "{rt8}Eternal Watcher Tyr{rt8}||[Divide Strike] at least 2 eat or boss [Titan Empower]; dodge [Consecrated Ground] / [Infinite Annihilation]||pick up [Time Essence] to clear [Steal Time] (<=5 stacks); tank [Titan Smash] knockback cooldowns",
            },
        },
        ["永恒杀戮者"] = {
            type = "MOB",
            tips = "{rt8}Eternal Slayer{rt8}||[Bronze Breath] head front side-step; [Eternal Curse] don't stand in circle||",
        },
        ["米罗克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Murok{rt8}||[Sandstorm Breath] head front dodge; [More Trouble] find real body avoid [Dragon Breath] preventing [Sandstorm Impact]||avoid [Time Trap]; [Familiar Face] kite chasers over trap to suspend",
                ["normal"] = "{rt8}Murok{rt8}||[Sandstorm Breath] head front dodge; [More Trouble] find real body avoid [Dragon Breath] preventing [Sandstorm Impact]||avoid [Time Trap]; [Familiar Face] kite chasers over trap to suspend",
                ["heroic"] = "{rt8}Murok{rt8}||[Sandstorm Breath] head front dodge; [More Trouble] find real body avoid [Dragon Breath] preventing [Sandstorm Impact]||avoid [Time Trap]; [Familiar Face] kite chasers over trap to suspend",
                ["mythic"] = "{rt8}Murok{rt8}||[Sandstorm Breath] head front dodge; [More Trouble] find real body avoid [Dragon Breath] preventing [Sandstorm Impact]||avoid [Time Trap]; [Familiar Face] kite chasers over trap to suspend",
                ["mythicplus"] = "{rt8}Murok{rt8}||[Sandstorm Breath] head front dodge; [More Trouble] find real body avoid [Dragon Breath] preventing [Sandstorm Impact]||avoid [Time Trap]; [Familiar Face] kite chasers over trap to suspend",
            },
        },
        ["时空领主戴欧斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Temporus{rt8}||after [Infinite Orb] one person offset step [Infinite Nova] second blast; [Summon Infinite Keeper] switch to Keeper||[Time Breath] head front; at 10% Nozdormu aids; {rt1}dispel [Time Burn]{rt1}",
                ["normal"] = "{rt8}Temporus{rt8}||after [Infinite Orb] one person offset step [Infinite Nova] second blast; [Summon Infinite Keeper] switch to Keeper||[Time Breath] head front; at 10% Nozdormu aids; {rt1}dispel [Time Burn]{rt1}",
                ["heroic"] = "{rt8}Temporus{rt8}||after [Infinite Orb] one person offset step [Infinite Nova] second blast; [Summon Infinite Keeper] switch to Keeper||[Time Breath] head front; at 10% Nozdormu aids; {rt1}dispel [Time Burn]{rt1}",
                ["mythic"] = "{rt8}Temporus{rt8}||after [Infinite Orb] one person offset step [Infinite Nova] second blast; [Summon Infinite Keeper] switch to Keeper||[Time Breath] head front; at 10% Nozdormu aids; {rt1}dispel [Time Burn]{rt1}",
                ["mythicplus"] = "{rt8}Temporus{rt8}||after [Infinite Orb] one person offset step [Infinite Nova] second blast; [Summon Infinite Keeper] switch to Keeper||[Time Breath] head front; at 10% Nozdormu aids; {rt1}dispel [Time Burn]{rt1}",
            },
        },
        ["凝时亡者"] = {
            type = "MOB",
            tips = "{rt8}Timeless Dead{rt8}||{rt1}interrupt [Infinite Arrow Rain]{rt1}; [Time Burst] dispel two players; [Tainted Sand] quick dispel||",
        },
        ["时间流具象"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Timeflow Manifestation{rt8}||stand in [Decaying Time] sector (loses 3% health per 3s) better than [Accelerating Time] (per 1s); dodge [Time Shard]||[Temporal] quick dispel; tank melee avoid [Dissociate]",
                ["normal"] = "{rt8}Timeflow Manifestation{rt8}||stand in [Decaying Time] sector (loses 3% health per 3s) better than [Accelerating Time] (per 1s); dodge [Time Shard]||[Temporal] quick dispel; tank melee avoid [Dissociate]",
                ["heroic"] = "{rt8}Timeflow Manifestation{rt8}||stand in [Decaying Time] sector (loses 3% health per 3s) better than [Accelerating Time] (per 1s); dodge [Time Shard]||[Temporal] quick dispel; tank melee avoid [Dissociate]",
                ["mythic"] = "{rt8}Timeflow Manifestation{rt8}||stand in [Decaying Time] sector (loses 3% health per 3s) better than [Accelerating Time] (per 1s); dodge [Time Shard]||[Temporal] quick dispel; tank melee avoid [Dissociate]",
                ["mythicplus"] = "{rt8}Timeflow Manifestation{rt8}||stand in [Decaying Time] sector (loses 3% health per 3s) better than [Accelerating Time] (per 1s); dodge [Time Shard]||[Temporal] quick dispel; tank melee avoid [Dissociate]",
            },
        },
        ["永恒织时者"] = {
            type = "MOB",
            tips = "{rt8}Eternal Timeweaver{rt8}||{rt1}interrupt [Time Dissolution]{rt1} (drops 50% haste move speed); [Eternal Timeshatter] reads [Temporal Slice] use disrupt / control to break|",
        },
        ["永恒渗透者"] = {
            type = "MOB",
            tips = "{rt8}Eternal Infiltrator{rt8}||[Eternal Curse] circle dodge, cooldowns eat [Infinite Fury]; [Plague Chunk] death gives nearby [Endless Hunger]||",
        },
        ["迦拉克隆之荒"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Galakrond's Wrath{rt8}||P1 dodge [Plague Seep] / [Corrosive Spit]; [Corruption] contact transfers to tank clear||P3 damage [Los'kelaaz] redirect to [Dazak]; break [Death Frost], dodge [Incinerating Plague Breath]",
                ["normal"] = "{rt8}Galakrond's Wrath{rt8}||P1 dodge [Plague Seep] / [Corrosive Spit]; [Corruption] contact transfers to tank clear||P3 damage [Los'kelaaz] redirect to [Dazak]; break [Death Frost], dodge [Incinerating Plague Breath]",
                ["heroic"] = "{rt8}Galakrond's Wrath{rt8}||P1 dodge [Plague Seep] / [Corrosive Spit]; [Corruption] contact transfers to tank clear||P3 damage [Los'kelaaz] redirect to [Dazak]; break [Death Frost], dodge [Incinerating Plague Breath]",
                ["mythic"] = "{rt8}Galakrond's Wrath{rt8}||P1 dodge [Plague Seep] / [Corrosive Spit]; [Corruption] contact transfers to tank clear||P3 damage [Los'kelaaz] redirect to [Dazak]; break [Death Frost], dodge [Incinerating Plague Breath]",
                ["mythicplus"] = "{rt8}Galakrond's Wrath{rt8}||P1 dodge [Plague Seep] / [Corrosive Spit]; [Corruption] contact transfers to tank clear||P3 damage [Los'kelaaz] redirect to [Dazak]; break [Death Frost], dodge [Incinerating Plague Breath]",
            },
        },
        ["迷时战场"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Temporal Battlefield{rt8}||whole fight boss cleaves 3 allies; dodge [Blade Storm] / [Shockwave]||[For the Horde / Alliance] re-summon allies continue overlap; tank [Decapitation] cooldowns",
                ["normal"] = "{rt8}Temporal Battlefield{rt8}||whole fight boss cleaves 3 allies; dodge [Blade Storm] / [Shockwave]||[For the Horde / Alliance] re-summon allies continue overlap; tank [Decapitation] cooldowns",
                ["heroic"] = "{rt8}Temporal Battlefield{rt8}||whole fight boss cleaves 3 allies; dodge [Blade Storm] / [Shockwave]||[For the Horde / Alliance] re-summon allies continue overlap; tank [Decapitation] cooldowns",
                ["mythic"] = "{rt8}Temporal Battlefield{rt8}||whole fight boss cleaves 3 allies; dodge [Blade Storm] / [Shockwave]||[For the Horde / Alliance] re-summon allies continue overlap; tank [Decapitation] cooldowns",
                ["mythicplus"] = "{rt8}Temporal Battlefield{rt8}||whole fight boss cleaves 3 allies; dodge [Blade Storm] / [Shockwave]||[For the Horde / Alliance] re-summon allies continue overlap; tank [Decapitation] cooldowns",
            },
        },
        ["提尔的先锋"] = {
            type = "MOB",
            tips = "{rt8}Tyra's Vanguard{rt8}||[Rending Slash] head front bleed dodge; [Eternal Twilight Mage] interrupt [Epoch Arrow] stun [Corrosive Arrow Rain]||",
        },
        ["伊律迪孔的造物"] = {
            type = "MOB",
            tips = "{rt8}Iridikron's Creation{rt8}||{rt1}interrupt [Stone Shard]{rt1}; pre-Iridikron trash||",
        },
        ["永恒守望者"] = {
            type = "MOB",
            tips = "{rt8}Eternal Watcher{rt8}||[Eternal Curse] circle dodge; [Infinite Fury] cooldowns eat; [Timeflow Pillager] interrupt [Temporal Shift]|",
        },
        ["伊律迪孔，石鳞之龙"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Iridikron, the Stone-Scaled Dragon{rt8}||[Extinction Impact] marked walk under Chromie's [Time Ward]; [Gravel Barrage] 4 players eat big circle tank eats small||[Earthsplit Eruption] break shield dodge [Earthshatter Spike]; [World's End Annihilation] whole-group cooldowns gather Chromie; keep Chromie health",
                ["normal"] = "{rt8}Iridikron, the Stone-Scaled Dragon{rt8}||[Extinction Impact] marked walk under Chromie's [Time Ward]; [Gravel Barrage] 4 players eat big circle tank eats small||[Earthsplit Eruption] break shield dodge [Earthshatter Spike]; [World's End Annihilation] whole-group cooldowns gather Chromie; keep Chromie health",
                ["heroic"] = "{rt8}Iridikron, the Stone-Scaled Dragon{rt8}||[Extinction Impact] marked walk under Chromie's [Time Ward]; [Gravel Barrage] 4 players eat big circle tank eats small||[Earthsplit Eruption] break shield dodge [Earthshatter Spike]; [World's End Annihilation] whole-group cooldowns gather Chromie; keep Chromie health",
                ["mythic"] = "{rt8}Iridikron, the Stone-Scaled Dragon{rt8}||[Extinction Impact] marked walk under Chromie's [Time Ward]; [Gravel Barrage] 4 players eat big circle tank eats small||[Earthsplit Eruption] break shield dodge [Earthshatter Spike]; [World's End Annihilation] whole-group cooldowns gather Chromie; keep Chromie health",
                ["mythicplus"] = "{rt8}Iridikron, the Stone-Scaled Dragon{rt8}||[Extinction Impact] marked walk under Chromie's [Time Ward]; [Gravel Barrage] 4 players eat big circle tank eats small||[Earthsplit Eruption] break shield dodge [Earthshatter Spike]; [World's End Annihilation] whole-group cooldowns gather Chromie; keep Chromie health",
            },
        },
    },
    ["奥达曼：提尔的遗产"] = {
        name = "Uldaman: Legacy of Tyr",
        ["不朽石巨像"] = {
            type = "MOB",
            tips = "{rt8}Undying Stone Colossus{rt8}||[Thunder Smash] 30-yard AoE ranged can outrange; [Bulwark Smash] tank damage||",
        },
        ["失落的矮人"] = {
            type = "BOSS",
            name = "Lost Dwarves",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lost Dwarves{rt8}||3 dwarves up with [Enrage]/[Stun]; control then focus fire.||{rt1}Must interrupt: none{rt1}||",
                ["normal"] = "{rt8}Lost Dwarves{rt8}||3 dwarves up with [Enrage]/[Stun]; control then focus fire.||{rt1}Must interrupt: none{rt1}||",
                ["heroic"] = "{rt8}Lost Dwarves{rt8}||3 dwarves up with [Enrage]/[Stun]; control then focus fire.||{rt1}Must interrupt: none{rt1}||",
                ["mythic"] = "{rt8}Lost Dwarves{rt8}||3 dwarves up with [Enrage]/[Stun]; control then focus fire.||{rt1}Must interrupt: none{rt1}||",
                ["mythicplus"] = "{rt8}Lost Dwarves{rt8}||3 dwarves up with [Enrage]/[Stun]; control then focus fire.||{rt1}Must interrupt: none{rt1}||",
            },
        },
        ["石化守卫"] = {
            type = "MOB",
            tips = "{rt8}Petrified Guard{rt8}||{rt1}interrupt / dispel [Earthguard]{rt1} (gives enemy damage reduction); [Earthshatter] leave circle don't step||",
        },
        ["爬行掠食者"] = {
            type = "MOB",
            tips = "{rt8}Crawling Predator{rt8}||[Pounce] random jump on face high damage heal full; venom fang poisons tank dispellable||",
        },
        ["石窖穴居人地占师"] = {
            type = "MOB",
            tips = "{rt8}Stonehoof Geomancer{rt8}||{rt1}interrupt [Stone Curse]{rt1} (triggers [Petrify] -> [Rock Eruption]); [Earth Shield] dispellable||",
        },
        ["布罗马奇"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Bromach{rt8}||drops [Quaking Totem] every 2s full-screen AoE—switch to it immediately; after totem dies adds stunned vulnerable||[Thunder Smash] big circle dodge; tank pulls boss into totem circle; summoned earthcallers group and interrupt",
                ["normal"] = "{rt8}Bromach{rt8}||drops [Quaking Totem] every 2s full-screen AoE—switch to it immediately; after totem dies adds stunned vulnerable||[Thunder Smash] big circle dodge; tank pulls boss into totem circle; summoned earthcallers group and interrupt",
                ["heroic"] = "{rt8}Bromach{rt8}||drops [Quaking Totem] every 2s full-screen AoE—switch to it immediately; after totem dies adds stunned vulnerable||[Thunder Smash] big circle dodge; tank pulls boss into totem circle; summoned earthcallers group and interrupt",
                ["mythic"] = "{rt8}Bromach{rt8}||drops [Quaking Totem] every 2s full-screen AoE—switch to it immediately; after totem dies adds stunned vulnerable||[Thunder Smash] big circle dodge; tank pulls boss into totem circle; summoned earthcallers group and interrupt",
                ["mythicplus"] = "{rt8}Bromach{rt8}||drops [Quaking Totem] every 2s full-screen AoE—switch to it immediately; after totem dies adds stunned vulnerable||[Thunder Smash] big circle dodge; tank pulls boss into totem circle; summoned earthcallers group and interrupt",
            },
        },
        ["哨兵塔隆达丝"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sentinel Talondras{rt8}||after dropping [Resonant Orb] tank eats 3 orbs (first 2 clear [Severity] last stun resets energy) to avoid knockback||[Devastating Stomp] full-screen; {rt1}interrupt [Crushing Stomp]{rt1}; at 100 energy [Titan Empower] immune + 50% dmg—quick control",
                ["normal"] = "{rt8}Sentinel Talondras{rt8}||after dropping [Resonant Orb] tank eats 3 orbs (first 2 clear [Severity] last stun resets energy) to avoid knockback||[Devastating Stomp] full-screen; {rt1}interrupt [Crushing Stomp]{rt1}; at 100 energy [Titan Empower] immune + 50% dmg—quick control",
                ["heroic"] = "{rt8}Sentinel Talondras{rt8}||after dropping [Resonant Orb] tank eats 3 orbs (first 2 clear [Severity] last stun resets energy) to avoid knockback||[Devastating Stomp] full-screen; {rt1}interrupt [Crushing Stomp]{rt1}; at 100 energy [Titan Empower] immune + 50% dmg—quick control",
                ["mythic"] = "{rt8}Sentinel Talondras{rt8}||after dropping [Resonant Orb] tank eats 3 orbs (first 2 clear [Severity] last stun resets energy) to avoid knockback||[Devastating Stomp] full-screen; {rt1}interrupt [Crushing Stomp]{rt1}; at 100 energy [Titan Empower] immune + 50% dmg—quick control",
                ["mythicplus"] = "{rt8}Sentinel Talondras{rt8}||after dropping [Resonant Orb] tank eats 3 orbs (first 2 clear [Severity] last stun resets energy) to avoid knockback||[Devastating Stomp] full-screen; {rt1}interrupt [Crushing Stomp]{rt1}; at 100 energy [Titan Empower] immune + 50% dmg—quick control",
            },
        },
        ["艾博隆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ebonlocke{rt8}||at full energy [Holy Barrier] invulnerable—switch to 4 [Keepers] to break phase (every 3s [Flame Wave])||[Unstable Ember] whole group spread; tank [Searing Smash] head front; {rt1}dispel [Searing Heat]{rt1}",
                ["normal"] = "{rt8}Ebonlocke{rt8}||at full energy [Holy Barrier] invulnerable—switch to 4 [Keepers] to break phase (every 3s [Flame Wave])||[Unstable Ember] whole group spread; tank [Searing Smash] head front; {rt1}dispel [Searing Heat]{rt1}",
                ["heroic"] = "{rt8}Ebonlocke{rt8}||at full energy [Holy Barrier] invulnerable—switch to 4 [Keepers] to break phase (every 3s [Flame Wave])||[Unstable Ember] whole group spread; tank [Searing Smash] head front; {rt1}dispel [Searing Heat]{rt1}",
                ["mythic"] = "{rt8}Ebonlocke{rt8}||at full energy [Holy Barrier] invulnerable—switch to 4 [Keepers] to break phase (every 3s [Flame Wave])||[Unstable Ember] whole group spread; tank [Searing Smash] head front; {rt1}dispel [Searing Heat]{rt1}",
                ["mythicplus"] = "{rt8}Ebonlocke{rt8}||at full energy [Holy Barrier] invulnerable—switch to 4 [Keepers] to break phase (every 3s [Flame Wave])||[Unstable Ember] whole group spread; tank [Searing Smash] head front; {rt1}dispel [Searing Heat]{rt1}",
            },
        },
        ["永恒掠夺者"] = {
            type = "MOB",
            tips = "{rt8}Eternal Pillager{rt8}||[Steal Time] aura stacks (dispellable), pull less; stunned doesn't stack, control to clear||",
        },
        ["洞窟探索者"] = {
            type = "MOB",
            tips = "{rt8}Cave Delver{rt8}||{rt1}must interrupt [Sonic Boom]{rt1} (AoE); bats||",
        },
        ["时空领主戴欧斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Temporus{rt8}||on phase change stand in [Time Zone] for haste; dodge [Eternal Orb] landing [Eternal Zone] (-haste)||tank [Quicksand Breath] head front; {rt1}dispel [Time Sink]{rt1} (dispel triggers [Time Eruption])",
                ["normal"] = "{rt8}Temporus{rt8}||on phase change stand in [Time Zone] for haste; dodge [Eternal Orb] landing [Eternal Zone] (-haste)||tank [Quicksand Breath] head front; {rt1}dispel [Time Sink]{rt1} (dispel triggers [Time Eruption])",
                ["heroic"] = "{rt8}Temporus{rt8}||on phase change stand in [Time Zone] for haste; dodge [Eternal Orb] landing [Eternal Zone] (-haste)||tank [Quicksand Breath] head front; {rt1}dispel [Time Sink]{rt1} (dispel triggers [Time Eruption])",
                ["mythic"] = "{rt8}Temporus{rt8}||on phase change stand in [Time Zone] for haste; dodge [Eternal Orb] landing [Eternal Zone] (-haste)||tank [Quicksand Breath] head front; {rt1}dispel [Time Sink]{rt1} (dispel triggers [Time Eruption])",
                ["mythicplus"] = "{rt8}Temporus{rt8}||on phase change stand in [Time Zone] for haste; dodge [Eternal Orb] landing [Eternal Zone] (-haste)||tank [Quicksand Breath] head front; {rt1}dispel [Time Sink]{rt1} (dispel triggers [Time Eruption])",
            },
        },
    },
    ["红玉新生法池"] = {
        name = "Ruby Life Pools",
        ["闪霜塑地者"] = {
            type = "MOB",
            tips = "{rt8}Flashfrost Shaper{rt8}||{rt1}must interrupt / stun [Earthshatter]{rt1} (40-yard AoE high damage), else very easy to lose members",
        },
        ["悖逆者德拉加尔"] = {
            type = "MOB",
            tips = "{rt8}Defier Dragar{rt8}||{rt1}must interrupt [Iron Barrage]{rt1}; dodge frontal [Flaming Charge], tank [Flame Barrage] cooldowns",
        },
        ["梅莉杜莎·寒妆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Melidrussa Chillworn{rt8}||dodge [Frigid Frostwind] when pulled run outward, [Ice Burst] head front don't eat||at 75%/45% summons [Charged Wyrmling] with [Ice Barrier], quickly break shield and AoE wyrmlings, healer dispel [Primordial Cold]||{rt1}must interrupt [Frost Overload]{rt1}",
                ["normal"] = "{rt8}Melidrussa Chillworn{rt8}||dodge [Frigid Frostwind] when pulled run outward, [Ice Burst] head front don't eat||at 75%/45% summons [Charged Wyrmling] with [Ice Barrier], quickly break shield and AoE wyrmlings, healer dispel [Primordial Cold]||{rt1}must interrupt [Frost Overload]{rt1}",
                ["heroic"] = "{rt8}Melidrussa Chillworn{rt8}||dodge [Frigid Frostwind] when pulled run outward, [Ice Burst] head front don't eat||at 75%/45% summons [Charged Wyrmling] with [Ice Barrier], quickly break shield and AoE wyrmlings, healer dispel [Primordial Cold]||{rt1}must interrupt [Frost Overload]{rt1}",
                ["mythic"] = "{rt8}Melidrussa Chillworn{rt8}||dodge [Frigid Frostwind] when pulled run outward, [Ice Burst] head front don't eat||at 75%/45% summons [Charged Wyrmling] with [Ice Barrier], quickly break shield and AoE wyrmlings, healer dispel [Primordial Cold]||{rt1}must interrupt [Frost Overload]{rt1}",
                ["mythicplus"] = "{rt8}Melidrussa Chillworn{rt8}||dodge [Frigid Frostwind] when pulled run outward, [Ice Burst] head front don't eat||at 75%/45% summons [Charged Wyrmling] with [Ice Barrier], quickly break shield and AoE wyrmlings, healer dispel [Primordial Cold]||{rt1}must interrupt [Frost Overload]{rt1}",
            },
        },
        ["柯姬雅·焰蹄"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kokia Blazehoof{rt8}||keep positioning don't block path, [Molten Boulder] marked circle spread step then leave||[Firebound Flame Storm] reads [Burnout] prioritize switch to kill||{rt1}must interrupt [Roaring Flame]{rt1} (whole-group damage)",
                ["normal"] = "{rt8}Kokia Blazehoof{rt8}||keep positioning don't block path, [Molten Boulder] marked circle spread step then leave||[Firebound Flame Storm] reads [Burnout] prioritize switch to kill||{rt1}must interrupt [Roaring Flame]{rt1} (whole-group damage)",
                ["heroic"] = "{rt8}Kokia Blazehoof{rt8}||keep positioning don't block path, [Molten Boulder] marked circle spread step then leave||[Firebound Flame Storm] reads [Burnout] prioritize switch to kill||{rt1}must interrupt [Roaring Flame]{rt1} (whole-group damage)",
                ["mythic"] = "{rt8}Kokia Blazehoof{rt8}||keep positioning don't block path, [Molten Boulder] marked circle spread step then leave||[Firebound Flame Storm] reads [Burnout] prioritize switch to kill||{rt1}must interrupt [Roaring Flame]{rt1} (whole-group damage)",
                ["mythicplus"] = "{rt8}Kokia Blazehoof{rt8}||keep positioning don't block path, [Molten Boulder] marked circle spread step then leave||[Firebound Flame Storm] reads [Burnout] prioritize switch to kill||{rt1}must interrupt [Roaring Flame]{rt1} (whole-group damage)",
            },
        },
        ["注能魔像"] = {
            type = "MOB",
            tips = "{rt8}Charged Golem{rt8}||dodge [Dig Impact] circle; tank cooldowns eat [Shattering Smash] tank damage, can kite out of melee",
        },
        ["闪霜织寒者"] = {
            type = "MOB",
            tips = "{rt8}Flashfrost Weavess{rt8}||{rt1}must interrupt [Ice Missiles] / [Frost Shield]{rt1}; shield dispellable, prioritize interrupt to prevent heal",
        },
        ["龙蛋巢"] = {
            type = "MOB",
            tips = "{rt8}Dragon Egg Nest{rt8}||don't step on ground dragon eggs—stepping hatches [Charged Wyrmling] stacking [Primordial Cold], go around",
        },
        ["基拉卡与厄克哈特·风脉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kilrak and Erkhart Windvein{rt8}||fire circle at feet marked go out to line fire, whole fight focus fire; [Shifting Wind] blows fire piles toward someone||{rt1}dispel tank's [Infernal Core]{rt1}, dodge [Storm Smash]",
                ["normal"] = "{rt8}Kilrak and Erkhart Windvein{rt8}||fire circle at feet marked go out to line fire, whole fight focus fire; [Shifting Wind] blows fire piles toward someone||{rt1}dispel tank's [Infernal Core]{rt1}, dodge [Storm Smash]",
                ["heroic"] = "{rt8}Kilrak and Erkhart Windvein{rt8}||fire circle at feet marked go out to line fire, whole fight focus fire; [Shifting Wind] blows fire piles toward someone||{rt1}dispel tank's [Infernal Core]{rt1}, dodge [Storm Smash]",
                ["mythic"] = "{rt8}Kilrak and Erkhart Windvein{rt8}||fire circle at feet marked go out to line fire, whole fight focus fire; [Shifting Wind] blows fire piles toward someone||{rt1}dispel tank's [Infernal Core]{rt1}, dodge [Storm Smash]",
                ["mythicplus"] = "{rt8}Kilrak and Erkhart Windvein{rt8}||fire circle at feet marked go out to line fire, whole fight focus fire; [Shifting Wind] blows fire piles toward someone||{rt1}dispel tank's [Infernal Core]{rt1}, dodge [Storm Smash]",
            },
        },
    },
    ["碧蓝魔馆"] = {
        name = "The Azure Vault",
        ["莱魔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lei'mor{rt8}||tank hold frontal [Surging Rift], whole group when marked big circle spread to bomb [Arcane Sprout] done||clear sprouts to reduce [Devour Stomp] damage; dodge [Empowered Strike] tank damage",
                ["normal"] = "{rt8}Lei'mor{rt8}||tank hold frontal [Surging Rift], whole group when marked big circle spread to bomb [Arcane Sprout] done||clear sprouts to reduce [Devour Stomp] damage; dodge [Empowered Strike] tank damage",
                ["heroic"] = "{rt8}Lei'mor{rt8}||tank hold frontal [Surging Rift], whole group when marked big circle spread to bomb [Arcane Sprout] done||clear sprouts to reduce [Devour Stomp] damage; dodge [Empowered Strike] tank damage",
                ["mythic"] = "{rt8}Lei'mor{rt8}||tank hold frontal [Surging Rift], whole group when marked big circle spread to bomb [Arcane Sprout] done||clear sprouts to reduce [Devour Stomp] damage; dodge [Empowered Strike] tank damage",
                ["mythicplus"] = "{rt8}Lei'mor{rt8}||tank hold frontal [Surging Rift], whole group when marked big circle spread to bomb [Arcane Sprout] done||clear sprouts to reduce [Devour Stomp] damage; dodge [Empowered Strike] tank damage",
            },
        },
        ["安布雷斯库"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ambrusk{rt8}||at 75%/50%/25% drops [Volatile Crystal], focus the hardened crystal then switch to small||{rt1}dispel tank's [Brutal Surge]{rt1}; dodge [Dragon Stomp] and [Volatile Vortex]",
                ["normal"] = "{rt8}Ambrusk{rt8}||at 75%/50%/25% drops [Volatile Crystal], focus the hardened crystal then switch to small||{rt1}dispel tank's [Brutal Surge]{rt1}; dodge [Dragon Stomp] and [Volatile Vortex]",
                ["heroic"] = "{rt8}Ambrusk{rt8}||at 75%/50%/25% drops [Volatile Crystal], focus the hardened crystal then switch to small||{rt1}dispel tank's [Brutal Surge]{rt1}; dodge [Dragon Stomp] and [Volatile Vortex]",
                ["mythic"] = "{rt8}Ambrusk{rt8}||at 75%/50%/25% drops [Volatile Crystal], focus the hardened crystal then switch to small||{rt1}dispel tank's [Brutal Surge]{rt1}; dodge [Dragon Stomp] and [Volatile Vortex]",
                ["mythicplus"] = "{rt8}Ambrusk{rt8}||at 75%/50%/25% drops [Volatile Crystal], focus the hardened crystal then switch to small||{rt1}dispel tank's [Brutal Surge]{rt1}; dodge [Dragon Stomp] and [Volatile Vortex]",
            },
        },
        ["泰拉什·灰翼"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Telash Greywing{rt8}||[Frost Bomb] marked leave group to drain; [Sub-Zero] enter blue [Arcane Sigil] to avoid||{rt1}interrupt [Frost Extinguisher]{rt1} breath",
                ["normal"] = "{rt8}Telash Greywing{rt8}||[Frost Bomb] marked leave group to drain; [Sub-Zero] enter blue [Arcane Sigil] to avoid||{rt1}interrupt [Frost Extinguisher]{rt1} breath",
                ["heroic"] = "{rt8}Telash Greywing{rt8}||[Frost Bomb] marked leave group to drain; [Sub-Zero] enter blue [Arcane Sigil] to avoid||{rt1}interrupt [Frost Extinguisher]{rt1} breath",
                ["mythic"] = "{rt8}Telash Greywing{rt8}||[Frost Bomb] marked leave group to drain; [Sub-Zero] enter blue [Arcane Sigil] to avoid||{rt1}interrupt [Frost Extinguisher]{rt1} breath",
                ["mythicplus"] = "{rt8}Telash Greywing{rt8}||[Frost Bomb] marked leave group to drain; [Sub-Zero] enter blue [Arcane Sigil] to avoid||{rt1}interrupt [Frost Extinguisher]{rt1} breath",
            },
        },
        ["青刃"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Azureblade{rt8}||P1 timely switch to [Dragonkin Image], boss frontal cleave tank hold||P2 [Oppressive Energy] quickly switch to 4 images then back to P1; {rt1}interrupt [Phantom Arrow]{rt1}",
                ["normal"] = "{rt8}Azureblade{rt8}||P1 timely switch to [Dragonkin Image], boss frontal cleave tank hold||P2 [Oppressive Energy] quickly switch to 4 images then back to P1; {rt1}interrupt [Phantom Arrow]{rt1}",
                ["heroic"] = "{rt8}Azureblade{rt8}||P1 timely switch to [Dragonkin Image], boss frontal cleave tank hold||P2 [Oppressive Energy] quickly switch to 4 images then back to P1; {rt1}interrupt [Phantom Arrow]{rt1}",
                ["mythic"] = "{rt8}Azureblade{rt8}||P1 timely switch to [Dragonkin Image], boss frontal cleave tank hold||P2 [Oppressive Energy] quickly switch to 4 images then back to P1; {rt1}interrupt [Phantom Arrow]{rt1}",
                ["mythicplus"] = "{rt8}Azureblade{rt8}||P1 timely switch to [Dragonkin Image], boss frontal cleave tank hold||P2 [Oppressive Energy] quickly switch to 4 images then back to P1; {rt1}interrupt [Phantom Arrow]{rt1}",
            },
        },
        ["龙裔破坏者"] = {
            type = "MOB",
            tips = "{rt8}Dragonkin Destroyer{rt8}||{rt1}interrupt [Savage Roar]{rt1} (30-yard AoE); [Shoulder Charge] charges player knockback don't get pushed off platform|",
        },
        ["虚空魔蟾"] = {
            type = "MOB",
            tips = "{rt8}Void Toad{rt8}||[Void Stomp] jumps at player landing AoE + dispel buff, can group-CC to gather||",
        },
        ["奥术幼龙"] = {
            type = "MOB",
            tips = "{rt8}Arcane Wyrmling{rt8}||if [Gaze] sees you it awakens whole room—use stun / breath / typhoon to control then kill, don't hard-tank|",
        },
        ["鳞破副官"] = {
            type = "MOB",
            tips = "{rt8}Scalebane Lieutenant{rt8}||[Demonbane Frenzy] gives nearby enemies +25% damage, pull alone or interrupt on cast||",
        },
    },
}
