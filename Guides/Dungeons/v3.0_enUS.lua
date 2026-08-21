-- ============================================================================
-- BossTips 3.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["3.0"] = {
    ["萨隆矿坑"] = {
        name = "Azjol-Nerub",
        ["天灾领主泰兰努斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Scourgelord Tyrannus{rt8}||[Overlord's Brand] don't hit the branded target (reflects to tank); [Frostbite Mark] run away to avoid chain stuns||[Frost Breath] Rimefang spreads in the air; kite across the ice",
                ["normal"] = "{rt8}Scourgelord Tyrannus{rt8}||[Overlord's Brand] don't hit the branded target (reflects to tank); [Frostbite Mark] run away to avoid chain stuns||[Frost Breath] Rimefang spreads in the air; kite across the ice",
                ["heroic"] = "{rt8}Scourgelord Tyrannus{rt8}||[Overlord's Brand] don't hit the branded target (reflects to tank); [Frostbite Mark] run away to avoid chain stuns||[Frost Breath] Rimefang spreads in the air; kite across the ice",
                ["mythic"] = "{rt8}Scourgelord Tyrannus{rt8}||[Overlord's Brand] don't hit the branded target (reflects to tank); [Frostbite Mark] run away to avoid chain stuns||[Frost Breath] Rimefang spreads in the air; kite across the ice",
                ["mythicplus"] = "{rt8}Scourgelord Tyrannus{rt8}||[Overlord's Brand] don't hit the branded target (reflects to tank); [Frostbite Mark] run away to avoid chain stuns||[Frost Breath] Rimefang spreads in the air; kite across the ice",
            },
        },
        ["折磨者"] = {
            type = "MOB",
            tips = "{rt8}Torturer{rt8}||[Black Brand] the marked takes +50% shadow damage—dispel||{rt1}Must interrupt: the curse{rt1}||",
        },
        ["死亡低语暗影施法者"] = {
            type = "MOB",
            tips = "{rt8}Deathwhisper Shadowcaster{rt8}||[Seed / Shadow Bolt], interrupt; pairs with the Torturer||{rt1}Must interrupt: Shadow Bolt{rt1}||",
        },
        ["伊克和科瑞克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ick and Krick{rt8}||dodge [Poison Pool]; [Pursuit] the marked player kites; [Exploding Arrow Volley] move to dodge the orbs||Krick commands from Ick's back",
                ["normal"] = "{rt8}Ick and Krick{rt8}||dodge [Poison Pool]; [Pursuit] the marked player kites; [Exploding Arrow Volley] move to dodge the orbs||Krick commands from Ick's back",
                ["heroic"] = "{rt8}Ick and Krick{rt8}||dodge [Poison Pool]; [Pursuit] the marked player kites; [Exploding Arrow Volley] move to dodge the orbs||Krick commands from Ick's back",
                ["mythic"] = "{rt8}Ick and Krick{rt8}||dodge [Poison Pool]; [Pursuit] the marked player kites; [Exploding Arrow Volley] move to dodge the orbs||Krick commands from Ick's back",
                ["mythicplus"] = "{rt8}Ick and Krick{rt8}||dodge [Poison Pool]; [Pursuit] the marked player kites; [Exploding Arrow Volley] move to dodge the orbs||Krick commands from Ick's back",
            },
        },
        ["熔炉之主加弗斯特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Forgemaster Garfrost{rt8}||[Permafrost] use Saronite rocks to LOS the aura; dodge [Thunderclap]; dispel [Frost Strike] slow||at 33% he empowers his weapon, doubling ice damage—watch the stacks",
                ["normal"] = "{rt8}Forgemaster Garfrost{rt8}||[Permafrost] use Saronite rocks to LOS the aura; dodge [Thunderclap]; dispel [Frost Strike] slow||at 33% he empowers his weapon, doubling ice damage—watch the stacks",
                ["heroic"] = "{rt8}Forgemaster Garfrost{rt8}||[Permafrost] use Saronite rocks to LOS the aura; dodge [Thunderclap]; dispel [Frost Strike] slow||at 33% he empowers his weapon, doubling ice damage—watch the stacks",
                ["mythic"] = "{rt8}Forgemaster Garfrost{rt8}||[Permafrost] use Saronite rocks to LOS the aura; dodge [Thunderclap]; dispel [Frost Strike] slow||at 33% he empowers his weapon, doubling ice damage—watch the stacks",
                ["mythicplus"] = "{rt8}Forgemaster Garfrost{rt8}||[Permafrost] use Saronite rocks to LOS the aura; dodge [Thunderclap]; dispel [Frost Strike] slow||at 33% he empowers his weapon, doubling ice damage—watch the stacks",
            },
        },
        ["天空召唤者+冰霜始祖龙"] = {
            type = "MOB",
            tips = "{rt8}Skyrider + Frostwyrm{rt8}||[Frost Breath] from the dragon's back is hard for ranged to reach; prioritize killing the drake / dragon||{rt1}Priority kill: the proto-drake{rt1}||",
        },
    },
    ["映像大厅"] = {
        name = "Halls of Reflection",
        ["法瑞克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Falric{rt8}||[Despair] reduces whole-group damage / healing; [AOE Attack] no group heal—high pressure||Clear the 4 waves of ghosts before fighting",
                ["normal"] = "{rt8}Falric{rt8}||[Despair] reduces whole-group damage / healing; [AOE Attack] no group heal—high pressure||Clear the 4 waves of ghosts before fighting",
                ["heroic"] = "{rt8}Falric{rt8}||[Despair] reduces whole-group damage / healing; [AOE Attack] no group heal—high pressure||Clear the 4 waves of ghosts before fighting",
                ["mythic"] = "{rt8}Falric{rt8}||[Despair] reduces whole-group damage / healing; [AOE Attack] no group heal—high pressure||Clear the 4 waves of ghosts before fighting",
                ["mythicplus"] = "{rt8}Falric{rt8}||[Despair] reduces whole-group damage / healing; [AOE Attack] no group heal—high pressure||Clear the 4 waves of ghosts before fighting",
            },
        },
        ["鬼魅牧师"] = {
            type = "MOB",
            tips = "{rt8}Wraith Priest{rt8}||[Fear] group + [Dark Heal]—prioritize killing / interrupting||{rt1}Must interrupt: Heal / Fear{rt1}||",
        },
        ["魅影法师"] = {
            type = "MOB",
            tips = "{rt8}Phantom Mage{rt8}||Summons [Illusion] that explodes on death—stay away; [Flame Storm] dodge||{rt1}Must interrupt: Fireball{rt1}||",
        },
        ["复活的巫医"] = {
            type = "MOB",
            tips = "{rt8}Resurrected Witch Doctor{rt8}||Escape fight [Shadow Bolt Volley] + [Curse of Doom]—handle first||{rt1}Kill fast: Witch Doctor{rt1}||",
        },
        ["逃离阿尔萨斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Fleeing Arthas{rt8}||Escape fight: follow the leader forward, clear trash so the ice wall vanishes; don't attack the boss ([Frostmourne's Wrath] wipes the raid)||[Cruel Winter] lose HP outside 10 yards",
                ["normal"] = "{rt8}Fleeing Arthas{rt8}||Escape fight: follow the leader forward, clear trash so the ice wall vanishes; don't attack the boss ([Frostmourne's Wrath] wipes the raid)||[Cruel Winter] lose HP outside 10 yards",
                ["heroic"] = "{rt8}Fleeing Arthas{rt8}||Escape fight: follow the leader forward, clear trash so the ice wall vanishes; don't attack the boss ([Frostmourne's Wrath] wipes the raid)||[Cruel Winter] lose HP outside 10 yards",
                ["mythic"] = "{rt8}Fleeing Arthas{rt8}||Escape fight: follow the leader forward, clear trash so the ice wall vanishes; don't attack the boss ([Frostmourne's Wrath] wipes the raid)||[Cruel Winter] lose HP outside 10 yards",
                ["mythicplus"] = "{rt8}Fleeing Arthas{rt8}||Escape fight: follow the leader forward, clear trash so the ice wall vanishes; don't attack the boss ([Frostmourne's Wrath] wipes the raid)||[Cruel Winter] lose HP outside 10 yards",
            },
        },
        ["玛维恩"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Maivin{rt8}||[Corruption Well] leave quickly; [Corrupt Flesh] tank max HP -25%||[Annihilate] tank pops defensives",
                ["normal"] = "{rt8}Maivin{rt8}||[Corruption Well] leave quickly; [Corrupt Flesh] tank max HP -25%||[Annihilate] tank pops defensives",
                ["heroic"] = "{rt8}Maivin{rt8}||[Corruption Well] leave quickly; [Corrupt Flesh] tank max HP -25%||[Annihilate] tank pops defensives",
                ["mythic"] = "{rt8}Maivin{rt8}||[Corruption Well] leave quickly; [Corrupt Flesh] tank max HP -25%||[Annihilate] tank pops defensives",
                ["mythicplus"] = "{rt8}Maivin{rt8}||[Corruption Well] leave quickly; [Corrupt Flesh] tank max HP -25%||[Annihilate] tank pops defensives",
            },
        },
    },
    ["魔环"] = {
        name = "The Oculus",
        ["魔网守护者埃雷苟斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ley-Guardian Eregos{rt8}||dragon vs dragon; [Phase Shift] dodge the blue circles; [Arcane Barrage] spread out||whole group stands at the boss's feet",
                ["normal"] = "{rt8}Ley-Guardian Eregos{rt8}||dragon vs dragon; [Phase Shift] dodge the blue circles; [Arcane Barrage] spread out||whole group stands at the boss's feet",
                ["heroic"] = "{rt8}Ley-Guardian Eregos{rt8}||dragon vs dragon; [Phase Shift] dodge the blue circles; [Arcane Barrage] spread out||whole group stands at the boss's feet",
                ["mythic"] = "{rt8}Ley-Guardian Eregos{rt8}||dragon vs dragon; [Phase Shift] dodge the blue circles; [Arcane Barrage] spread out||whole group stands at the boss's feet",
                ["mythicplus"] = "{rt8}Ley-Guardian Eregos{rt8}||dragon vs dragon; [Phase Shift] dodge the blue circles; [Arcane Barrage] spread out||whole group stands at the boss's feet",
            },
        },
        ["魔网幼龙"] = {
            type = "MOB",
            tips = "{rt8}Arcane Wyrmling{rt8}||the dragon you must mount at the start; use its abilities to fight||{rt1}Priority kill: the enemy dragon{rt1}||",
        },
        ["法师领主伊洛姆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Archmage Iloom{rt8}||clear the trash first; [Time Stop] stun, [Blizzard] dodge||summons illusions",
                ["normal"] = "{rt8}Archmage Iloom{rt8}||clear the trash first; [Time Stop] stun, [Blizzard] dodge||summons illusions",
                ["heroic"] = "{rt8}Archmage Iloom{rt8}||clear the trash first; [Time Stop] stun, [Blizzard] dodge||summons illusions",
                ["mythic"] = "{rt8}Archmage Iloom{rt8}||clear the trash first; [Time Stop] stun, [Blizzard] dodge||summons illusions",
                ["mythicplus"] = "{rt8}Archmage Iloom{rt8}||clear the trash first; [Time Stop] stun, [Blizzard] dodge||summons illusions",
            },
        },
        ["审讯者达库斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Inquisitor Drakus{rt8}||[Bomb] mines—dodge; dragon-riding fight, tank uses the dragon to hold||clear the 2 attendants",
                ["normal"] = "{rt8}Inquisitor Drakus{rt8}||[Bomb] mines—dodge; dragon-riding fight, tank uses the dragon to hold||clear the 2 attendants",
                ["heroic"] = "{rt8}Inquisitor Drakus{rt8}||[Bomb] mines—dodge; dragon-riding fight, tank uses the dragon to hold||clear the 2 attendants",
                ["mythic"] = "{rt8}Inquisitor Drakus{rt8}||[Bomb] mines—dodge; dragon-riding fight, tank uses the dragon to hold||clear the 2 attendants",
                ["mythicplus"] = "{rt8}Inquisitor Drakus{rt8}||[Bomb] mines—dodge; dragon-riding fight, tank uses the dragon to hold||clear the 2 attendants",
            },
        },
        ["虚灵法师"] = {
            type = "MOB",
            tips = "{rt8}Ethereal Mage{rt8}||caster—interrupt||{rt1}Must interrupt: Shadow Bolt{rt1}||",
        },
        ["瓦尔洛斯·云击"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Varos Cloudstrider{rt8}||hit from behind (front is AoE); ride the dragon around to the back to DPS||[Chain Lightning] spread out",
                ["normal"] = "{rt8}Varos Cloudstrider{rt8}||hit from behind (front is AoE); ride the dragon around to the back to DPS||[Chain Lightning] spread out",
                ["heroic"] = "{rt8}Varos Cloudstrider{rt8}||hit from behind (front is AoE); ride the dragon around to the back to DPS||[Chain Lightning] spread out",
                ["mythic"] = "{rt8}Varos Cloudstrider{rt8}||hit from behind (front is AoE); ride the dragon around to the back to DPS||[Chain Lightning] spread out",
                ["mythicplus"] = "{rt8}Varos Cloudstrider{rt8}||hit from behind (front is AoE); ride the dragon around to the back to DPS||[Chain Lightning] spread out",
            },
        },
    },
    ["灵魂洪炉"] = {
        name = "Forge of Souls",
        ["噬魂者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Soul Devourer{rt8}||[Mirror Soul] stop attacking while linked; [Phantom Strike] interrupt||{rt1}Must interrupt: [Phantom Strike]{rt1}||randomly teleports players into a realm; kill the small soul to escape",
                ["normal"] = "{rt8}Soul Devourer{rt8}||[Mirror Soul] stop attacking while linked; [Phantom Strike] interrupt||{rt1}Must interrupt: [Phantom Strike]{rt1}||randomly teleports players into a realm; kill the small soul to escape",
                ["heroic"] = "{rt8}Soul Devourer{rt8}||[Mirror Soul] stop attacking while linked; [Phantom Strike] interrupt||{rt1}Must interrupt: [Phantom Strike]{rt1}||randomly teleports players into a realm; kill the small soul to escape",
                ["mythic"] = "{rt8}Soul Devourer{rt8}||[Mirror Soul] stop attacking while linked; [Phantom Strike] interrupt||{rt1}Must interrupt: [Phantom Strike]{rt1}||randomly teleports players into a realm; kill the small soul to escape",
                ["mythicplus"] = "{rt8}Soul Devourer{rt8}||[Mirror Soul] stop attacking while linked; [Phantom Strike] interrupt||{rt1}Must interrupt: [Phantom Strike]{rt1}||randomly teleports players into a realm; kill the small soul to escape",
            },
        },
        ["饥饿鬼魂"] = {
            type = "MOB",
            tips = "{rt8}Ravenous Ghoul{rt8}||[Mass Fear], tank should hold and burst it down first—don't wander off and aggro adds||{rt1}Priority kill: the ghoul{rt1}||",
        },
        ["灵魂收割者"] = {
            type = "MOB",
            tips = "{rt8}Soul Reaper{rt8}||stacks a dispellable bleed DoT on the tank; healer should dispel promptly||",
        },
        ["灵魂碎片"] = {
            type = "MOB",
            tips = "{rt8}Soul Shard{rt8}||spawns during the Brannokh fight; DPS should destroy it to stop the boss from lifestealing||{rt1}Priority kill: Shard{rt1}||",
        },
        ["布隆亚姆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Brannokh{rt8}||tank holds it center, facing away; DPS must kill the [Soul Shard] orb or the boss heals||{rt1}Priority kill: Soul Shard{rt1}||at 40% [Soul Storm] the whole group stacks together",
                ["normal"] = "{rt8}Brannokh{rt8}||tank holds it center, facing away; DPS must kill the [Soul Shard] orb or the boss heals||{rt1}Priority kill: Soul Shard{rt1}||at 40% [Soul Storm] the whole group stacks together",
                ["heroic"] = "{rt8}Brannokh{rt8}||tank holds it center, facing away; DPS must kill the [Soul Shard] orb or the boss heals||{rt1}Priority kill: Soul Shard{rt1}||at 40% [Soul Storm] the whole group stacks together",
                ["mythic"] = "{rt8}Brannokh{rt8}||tank holds it center, facing away; DPS must kill the [Soul Shard] orb or the boss heals||{rt1}Priority kill: Soul Shard{rt1}||at 40% [Soul Storm] the whole group stacks together",
                ["mythicplus"] = "{rt8}Brannokh{rt8}||tank holds it center, facing away; DPS must kill the [Soul Shard] orb or the boss heals||{rt1}Priority kill: Soul Shard{rt1}||at 40% [Soul Storm] the whole group stacks together",
            },
        },
    },
    ["魔枢"] = {
        name = "The Nexus",
        ["指挥官库鲁尔格"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Commander Kolurg{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Horde view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["normal"] = "{rt8}Commander Kolurg{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Horde view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["heroic"] = "{rt8}Commander Kolurg{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Horde view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["mythic"] = "{rt8}Commander Kolurg{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Horde view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["mythicplus"] = "{rt8}Commander Kolurg{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Horde view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
            },
        },
        ["塑树者奥莫洛克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Treemender Oomarok{rt8}||[Spell Reflection] don't cast / don't hit him; [Crystal Spike] dodge||move away after [Stomp]||tank faces away",
                ["normal"] = "{rt8}Treemender Oomarok{rt8}||[Spell Reflection] don't cast / don't hit him; [Crystal Spike] dodge||move away after [Stomp]||tank faces away",
                ["heroic"] = "{rt8}Treemender Oomarok{rt8}||[Spell Reflection] don't cast / don't hit him; [Crystal Spike] dodge||move away after [Stomp]||tank faces away",
                ["mythic"] = "{rt8}Treemender Oomarok{rt8}||[Spell Reflection] don't cast / don't hit him; [Crystal Spike] dodge||move away after [Stomp]||tank faces away",
                ["mythicplus"] = "{rt8}Treemender Oomarok{rt8}||[Spell Reflection] don't cast / don't hit him; [Crystal Spike] dodge||move away after [Stomp]||tank faces away",
            },
        },
        ["阿诺玛鲁斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Anomalus{rt8}||[Chaotic Rift] stay 15 yards away; during [Rift Charge] the boss shrinks and is invulnerable—kill the small light orbs to end it||healers stand last, take the lightning in rotation||Achievement: kill without breaking any rifts",
                ["normal"] = "{rt8}Anomalus{rt8}||[Chaotic Rift] stay 15 yards away; during [Rift Charge] the boss shrinks and is invulnerable—kill the small light orbs to end it||healers stand last, take the lightning in rotation||Achievement: kill without breaking any rifts",
                ["heroic"] = "{rt8}Anomalus{rt8}||[Chaotic Rift] stay 15 yards away; during [Rift Charge] the boss shrinks and is invulnerable—kill the small light orbs to end it||healers stand last, take the lightning in rotation||Achievement: kill without breaking any rifts",
                ["mythic"] = "{rt8}Anomalus{rt8}||[Chaotic Rift] stay 15 yards away; during [Rift Charge] the boss shrinks and is invulnerable—kill the small light orbs to end it||healers stand last, take the lightning in rotation||Achievement: kill without breaking any rifts",
                ["mythicplus"] = "{rt8}Anomalus{rt8}||[Chaotic Rift] stay 15 yards away; during [Rift Charge] the boss shrinks and is invulnerable—kill the small light orbs to end it||healers stand last, take the lightning in rotation||Achievement: kill without breaking any rifts",
            },
        },
        ["克莉斯塔萨"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Keristrasza{rt8}||[Extreme Cold] stacking slow—keep moving; [Crystal Breath] dodge the front||tank holds in the corner, group spreads out",
                ["normal"] = "{rt8}Keristrasza{rt8}||[Extreme Cold] stacking slow—keep moving; [Crystal Breath] dodge the front||tank holds in the corner, group spreads out",
                ["heroic"] = "{rt8}Keristrasza{rt8}||[Extreme Cold] stacking slow—keep moving; [Crystal Breath] dodge the front||tank holds in the corner, group spreads out",
                ["mythic"] = "{rt8}Keristrasza{rt8}||[Extreme Cold] stacking slow—keep moving; [Crystal Breath] dodge the front||tank holds in the corner, group spreads out",
                ["mythicplus"] = "{rt8}Keristrasza{rt8}||[Extreme Cold] stacking slow—keep moving; [Crystal Breath] dodge the front||tank holds in the corner, group spreads out",
            },
        },
        ["指挥官斯托比德"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Commander Stoutbeard{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Alliance view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["normal"] = "{rt8}Commander Stoutbeard{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Alliance view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["heroic"] = "{rt8}Commander Stoutbeard{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Alliance view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["mythic"] = "{rt8}Commander Stoutbeard{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Alliance view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
                ["mythicplus"] = "{rt8}Commander Stoutbeard{rt8}||[Whirlwind] 8-yard radius—melee dodge; [Charge] random 2s stun; [Intimidating Shout] group fear 4.5s||{rt1}Priority kill: the 2 healing minions{rt1}||heroic only (Alliance view); pull to the room entrance to avoid fearing adds; [Battle Shout] gives allies +20% damage",
            },
        },
        ["魔网奇术师"] = {
            type = "MOB",
            tips = "{rt8}Arcane Weaver{rt8}||[Blizzard] wait for the cast, then interrupt||{rt1}Must interrupt: Blizzard{rt1}||",
        },
        ["大魔导师泰蕾丝塔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Grand Magister Telestra{rt8}||at 66%/33% she splits into images (fire/ice/arcane); focus each one down one by one, AoE them together||{rt1}Must interrupt: [Blizzard][Frost Nova]{rt1}||dodge [Gravity Well]; the images can't be killed while casting",
                ["normal"] = "{rt8}Grand Magister Telestra{rt8}||at 66%/33% she splits into images (fire/ice/arcane); focus each one down one by one, AoE them together||{rt1}Must interrupt: [Blizzard][Frost Nova]{rt1}||dodge [Gravity Well]; the images can't be killed while casting",
                ["heroic"] = "{rt8}Grand Magister Telestra{rt8}||at 66%/33% she splits into images (fire/ice/arcane); focus each one down one by one, AoE them together||{rt1}Must interrupt: [Blizzard][Frost Nova]{rt1}||dodge [Gravity Well]; the images can't be killed while casting",
                ["mythic"] = "{rt8}Grand Magister Telestra{rt8}||at 66%/33% she splits into images (fire/ice/arcane); focus each one down one by one, AoE them together||{rt1}Must interrupt: [Blizzard][Frost Nova]{rt1}||dodge [Gravity Well]; the images can't be killed while casting",
                ["mythicplus"] = "{rt8}Grand Magister Telestra{rt8}||at 66%/33% she splits into images (fire/ice/arcane); focus each one down one by one, AoE them together||{rt1}Must interrupt: [Blizzard][Frost Nova]{rt1}||dodge [Gravity Well]; the images can't be killed while casting",
            },
        },
        ["法力猎手"] = {
            type = "MOB",
            tips = "{rt8}Mana Hunter{rt8}||drains mana + [Renew] self-heals—prioritize killing / interrupting||{rt1}Must interrupt: [Renew][Mana Burn]{rt1}||",
        },
    },
    ["紫罗兰监狱"] = {
        name = "The Violet Hold",
        ["湮灭者祖拉玛特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Voidcaller Zaramat{rt8}||[Void Sentry] imps do heavy AoE; bring melee, dispel the boss's healing-reduction buff||Achievement: don't kill the void sentries",
                ["normal"] = "{rt8}Voidcaller Zaramat{rt8}||[Void Sentry] imps do heavy AoE; bring melee, dispel the boss's healing-reduction buff||Achievement: don't kill the void sentries",
                ["heroic"] = "{rt8}Voidcaller Zaramat{rt8}||[Void Sentry] imps do heavy AoE; bring melee, dispel the boss's healing-reduction buff||Achievement: don't kill the void sentries",
                ["mythic"] = "{rt8}Voidcaller Zaramat{rt8}||[Void Sentry] imps do heavy AoE; bring melee, dispel the boss's healing-reduction buff||Achievement: don't kill the void sentries",
                ["mythicplus"] = "{rt8}Voidcaller Zaramat{rt8}||[Void Sentry] imps do heavy AoE; bring melee, dispel the boss's healing-reduction buff||Achievement: don't kill the void sentries",
            },
        },
        ["谢沃兹"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Xevozz{rt8}||[Arcane Barrage]; summons [Isthvael's Orb] arcane explosions—ignore the orb and fight the boss around the ramp||",
                ["normal"] = "{rt8}Xevozz{rt8}||[Arcane Barrage]; summons [Isthvael's Orb] arcane explosions—ignore the orb and fight the boss around the ramp||",
                ["heroic"] = "{rt8}Xevozz{rt8}||[Arcane Barrage]; summons [Isthvael's Orb] arcane explosions—ignore the orb and fight the boss around the ramp||",
                ["mythic"] = "{rt8}Xevozz{rt8}||[Arcane Barrage]; summons [Isthvael's Orb] arcane explosions—ignore the orb and fight the boss around the ramp||",
                ["mythicplus"] = "{rt8}Xevozz{rt8}||[Arcane Barrage]; summons [Isthvael's Orb] arcane explosions—ignore the orb and fight the boss around the ramp||",
            },
        },
        ["塞安妮苟萨"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Cyanigosa{rt8}||final boss; [Arcane Breath] tank faces away; dodge [Blizzard]/[Cleave]||heroic: use defense crystal to keep the seal at 100%",
                ["normal"] = "{rt8}Cyanigosa{rt8}||final boss; [Arcane Breath] tank faces away; dodge [Blizzard]/[Cleave]||heroic: use defense crystal to keep the seal at 100%",
                ["heroic"] = "{rt8}Cyanigosa{rt8}||final boss; [Arcane Breath] tank faces away; dodge [Blizzard]/[Cleave]||heroic: use defense crystal to keep the seal at 100%",
                ["mythic"] = "{rt8}Cyanigosa{rt8}||final boss; [Arcane Breath] tank faces away; dodge [Blizzard]/[Cleave]||heroic: use defense crystal to keep the seal at 100%",
                ["mythicplus"] = "{rt8}Cyanigosa{rt8}||final boss; [Arcane Breath] tank faces away; dodge [Blizzard]/[Cleave]||heroic: use defense crystal to keep the seal at 100%",
            },
        },
        ["艾库隆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ekokun{rt8}||break the [Protective Bubble] shield (after break: knockback + water elementals spawn); clear the small waters or the boss heals||spread out",
                ["normal"] = "{rt8}Ekokun{rt8}||break the [Protective Bubble] shield (after break: knockback + water elementals spawn); clear the small waters or the boss heals||spread out",
                ["heroic"] = "{rt8}Ekokun{rt8}||break the [Protective Bubble] shield (after break: knockback + water elementals spawn); clear the small waters or the boss heals||spread out",
                ["mythic"] = "{rt8}Ekokun{rt8}||break the [Protective Bubble] shield (after break: knockback + water elementals spawn); clear the small waters or the boss heals||spread out",
                ["mythicplus"] = "{rt8}Ekokun{rt8}||break the [Protective Bubble] shield (after break: knockback + water elementals spawn); clear the small waters or the boss heals||spread out",
            },
        },
        ["拉文索尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lavanthor{rt8}||dragon boss; [Frost Bomb] when airborne run to the center platform; spread 8 yards to dodge [Glacial Wind]||don't go to the dragon's head or tail",
                ["normal"] = "{rt8}Lavanthor{rt8}||dragon boss; [Frost Bomb] when airborne run to the center platform; spread 8 yards to dodge [Glacial Wind]||don't go to the dragon's head or tail",
                ["heroic"] = "{rt8}Lavanthor{rt8}||dragon boss; [Frost Bomb] when airborne run to the center platform; spread 8 yards to dodge [Glacial Wind]||don't go to the dragon's head or tail",
                ["mythic"] = "{rt8}Lavanthor{rt8}||dragon boss; [Frost Bomb] when airborne run to the center platform; spread 8 yards to dodge [Glacial Wind]||don't go to the dragon's head or tail",
                ["mythicplus"] = "{rt8}Lavanthor{rt8}||dragon boss; [Frost Bomb] when airborne run to the center platform; spread 8 yards to dodge [Glacial Wind]||don't go to the dragon's head or tail",
            },
        },
        ["埃雷克姆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Erekem{rt8}||brings 2 guards; kill the guards first, then the boss; dispel [Bloodlust]||{rt1}Must interrupt: guard healing chain{rt1}||heroic: leave one guard for last",
                ["normal"] = "{rt8}Erekem{rt8}||brings 2 guards; kill the guards first, then the boss; dispel [Bloodlust]||{rt1}Must interrupt: guard healing chain{rt1}||heroic: leave one guard for last",
                ["heroic"] = "{rt8}Erekem{rt8}||brings 2 guards; kill the guards first, then the boss; dispel [Bloodlust]||{rt1}Must interrupt: guard healing chain{rt1}||heroic: leave one guard for last",
                ["mythic"] = "{rt8}Erekem{rt8}||brings 2 guards; kill the guards first, then the boss; dispel [Bloodlust]||{rt1}Must interrupt: guard healing chain{rt1}||heroic: leave one guard for last",
                ["mythicplus"] = "{rt8}Erekem{rt8}||brings 2 guards; kill the guards first, then the boss; dispel [Bloodlust]||{rt1}Must interrupt: guard healing chain{rt1}||heroic: leave one guard for last",
            },
        },
        ["摩拉格"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Moragg{rt8}||[Mind Flay]; applies a [percent-health drain DoT] to the tank—heal through it||just tank and DPS",
                ["normal"] = "{rt8}Moragg{rt8}||[Mind Flay]; applies a [percent-health drain DoT] to the tank—heal through it||just tank and DPS",
                ["heroic"] = "{rt8}Moragg{rt8}||[Mind Flay]; applies a [percent-health drain DoT] to the tank—heal through it||just tank and DPS",
                ["mythic"] = "{rt8}Moragg{rt8}||[Mind Flay]; applies a [percent-health drain DoT] to the tank—heal through it||just tank and DPS",
                ["mythicplus"] = "{rt8}Moragg{rt8}||[Mind Flay]; applies a [percent-health drain DoT] to the tank—heal through it||just tank and DPS",
            },
        },
        ["监狱守卫"] = {
            type = "MOB",
            tips = "{rt8}Prison Guard{rt8}||each boss wave brings 2-3 guards—clear them first; keep [Defense Crystal] seal up, don't drop it||{rt1}Priority kill: the attendants{rt1}||don't kill the watcher NPC",
        },
    },
    ["古达克"] = {
        name = "Gundrak",
        ["迦尔达拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gal'darah{rt8}||rhino form [Impale] rescue the gored player; human form [Whirlwind] melee dodge||spread out",
                ["normal"] = "{rt8}Gal'darah{rt8}||rhino form [Impale] rescue the gored player; human form [Whirlwind] melee dodge||spread out",
                ["heroic"] = "{rt8}Gal'darah{rt8}||rhino form [Impale] rescue the gored player; human form [Whirlwind] melee dodge||spread out",
                ["mythic"] = "{rt8}Gal'darah{rt8}||rhino form [Impale] rescue the gored player; human form [Whirlwind] melee dodge||spread out",
                ["mythicplus"] = "{rt8}Gal'darah{rt8}||rhino form [Impale] rescue the gored player; human form [Whirlwind] melee dodge||spread out",
            },
        },
        ["达卡莱祭司"] = {
            type = "MOB",
            tips = "{rt8}Drakkari Priest{rt8}||heals the trolls—prioritize killing / interrupting||{rt1}Must interrupt: healing{rt1}||",
        },
        ["凶残的伊克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Savage Ick{rt8}||heroic only; [Spit] cone—tank faces away; [Enrage] at 90s—tank pops shield wall||will pounce on any member; tank grabs aggro",
                ["normal"] = "{rt8}Savage Ick{rt8}||heroic only; [Spit] cone—tank faces away; [Enrage] at 90s—tank pops shield wall||will pounce on any member; tank grabs aggro",
                ["heroic"] = "{rt8}Savage Ick{rt8}||heroic only; [Spit] cone—tank faces away; [Enrage] at 90s—tank pops shield wall||will pounce on any member; tank grabs aggro",
                ["mythic"] = "{rt8}Savage Ick{rt8}||heroic only; [Spit] cone—tank faces away; [Enrage] at 90s—tank pops shield wall||will pounce on any member; tank grabs aggro",
                ["mythicplus"] = "{rt8}Savage Ick{rt8}||heroic only; [Spit] cone—tank faces away; [Enrage] at 90s—tank pops shield wall||will pounce on any member; tank grabs aggro",
            },
        },
        ["达卡莱火焰编织者"] = {
            type = "MOB",
            tips = "{rt8}Drakkari Fire Weaver{rt8}||knockback / pushes you off the cliff—stand with your back to the wall; control priority||{rt1}Priority kill: the quake-caster{rt1}||",
        },
        ["斯拉德兰"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Slad'ran{rt8}||[Poison Nova] stay 15 yards away; summons [Venom-drakes] prioritize AoE (cocoons must be broken)||tank pulls around the outside",
                ["normal"] = "{rt8}Slad'ran{rt8}||[Poison Nova] stay 15 yards away; summons [Venom-drakes] prioritize AoE (cocoons must be broken)||tank pulls around the outside",
                ["heroic"] = "{rt8}Slad'ran{rt8}||[Poison Nova] stay 15 yards away; summons [Venom-drakes] prioritize AoE (cocoons must be broken)||tank pulls around the outside",
                ["mythic"] = "{rt8}Slad'ran{rt8}||[Poison Nova] stay 15 yards away; summons [Venom-drakes] prioritize AoE (cocoons must be broken)||tank pulls around the outside",
                ["mythicplus"] = "{rt8}Slad'ran{rt8}||[Poison Nova] stay 15 yards away; summons [Venom-drakes] prioritize AoE (cocoons must be broken)||tank pulls around the outside",
            },
        },
        ["莫拉比"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Moorabi{rt8}||[Transform to Mammoth] interrupt the cast (after 30% only 0.5s window); after transform the earthquake doubles||take turns kicking / silencing",
                ["normal"] = "{rt8}Moorabi{rt8}||[Transform to Mammoth] interrupt the cast (after 30% only 0.5s window); after transform the earthquake doubles||take turns kicking / silencing",
                ["heroic"] = "{rt8}Moorabi{rt8}||[Transform to Mammoth] interrupt the cast (after 30% only 0.5s window); after transform the earthquake doubles||take turns kicking / silencing",
                ["mythic"] = "{rt8}Moorabi{rt8}||[Transform to Mammoth] interrupt the cast (after 30% only 0.5s window); after transform the earthquake doubles||take turns kicking / silencing",
                ["mythicplus"] = "{rt8}Moorabi{rt8}||[Transform to Mammoth] interrupt the cast (after 30% only 0.5s window); after transform the earthquake doubles||take turns kicking / silencing",
            },
        },
        ["达卡莱巨像"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Drakkari Colossus{rt8}||at 50% splits into [Drakkari Elemental], invulnerable while split; dodge [Purple Slime]; at elemental 50% they recombine—loop||tank pulls around the arena, whole group moves",
                ["normal"] = "{rt8}Drakkari Colossus{rt8}||at 50% splits into [Drakkari Elemental], invulnerable while split; dodge [Purple Slime]; at elemental 50% they recombine—loop||tank pulls around the arena, whole group moves",
                ["heroic"] = "{rt8}Drakkari Colossus{rt8}||at 50% splits into [Drakkari Elemental], invulnerable while split; dodge [Purple Slime]; at elemental 50% they recombine—loop||tank pulls around the arena, whole group moves",
                ["mythic"] = "{rt8}Drakkari Colossus{rt8}||at 50% splits into [Drakkari Elemental], invulnerable while split; dodge [Purple Slime]; at elemental 50% they recombine—loop||tank pulls around the arena, whole group moves",
                ["mythicplus"] = "{rt8}Drakkari Colossus{rt8}||at 50% splits into [Drakkari Elemental], invulnerable while split; dodge [Purple Slime]; at elemental 50% they recombine—loop||tank pulls around the arena, whole group moves",
            },
        },
    },
    ["乌特加德城堡"] = {
        name = "Utgarde Keep",
        ["掠夺者因格瓦尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ingvar the Plunderer{rt8}||P1 tank faces away from group to dodge [Cleave]/[Greater Cleave]; [Astounding Roar] casters cancel casts||P2 undead form [Shadow Axe] kite around pillar, [Lamenting Throat] move away||Axe moves slow—use pillars to evade",
                ["normal"] = "{rt8}Ingvar the Plunderer{rt8}||P1 tank faces away from group to dodge [Cleave]/[Greater Cleave]; [Astounding Roar] casters cancel casts||P2 undead form [Shadow Axe] kite around pillar, [Lamenting Throat] move away||Axe moves slow—use pillars to evade",
                ["heroic"] = "{rt8}Ingvar the Plunderer{rt8}||P1 tank faces away from group to dodge [Cleave]/[Greater Cleave]; [Astounding Roar] casters cancel casts||P2 undead form [Shadow Axe] kite around pillar, [Lamenting Throat] move away||Axe moves slow—use pillars to evade",
                ["mythic"] = "{rt8}Ingvar the Plunderer{rt8}||P1 tank faces away from group to dodge [Cleave]/[Greater Cleave]; [Astounding Roar] casters cancel casts||P2 undead form [Shadow Axe] kite around pillar, [Lamenting Throat] move away||Axe moves slow—use pillars to evade",
                ["mythicplus"] = "{rt8}Ingvar the Plunderer{rt8}||P1 tank faces away from group to dodge [Cleave]/[Greater Cleave]; [Astounding Roar] casters cancel casts||P2 undead form [Shadow Axe] kite around pillar, [Lamenting Throat] move away||Axe moves slow—use pillars to evade",
            },
        },
        ["原始龙"] = {
            type = "MOB",
            tips = "{rt8}Proto-Drake{rt8}||Fire breath + knockback—when pulling, don't face other mobs||Tank takes the front; ranged spread out",
        },
        ["凯雷塞斯王子"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Prince Keleseth{rt8}||Kill the 4 Vrykul councilors before the boss; [Ice Tomb] marks a target—break it to free; [Summon Skeletons] group-pull and AoE||{rt1}Kill fast: Ice Tomb / Skeletons{rt1}||Ice Tomb can be Ice Block / Bubble / trinket; prioritize skeletons",
                ["normal"] = "{rt8}Prince Keleseth{rt8}||Kill the 4 Vrykul councilors before the boss; [Ice Tomb] marks a target—break it to free; [Summon Skeletons] group-pull and AoE||{rt1}Kill fast: Ice Tomb / Skeletons{rt1}||Ice Tomb can be Ice Block / Bubble / trinket; prioritize skeletons",
                ["heroic"] = "{rt8}Prince Keleseth{rt8}||Kill the 4 Vrykul councilors before the boss; [Ice Tomb] marks a target—break it to free; [Summon Skeletons] group-pull and AoE||{rt1}Kill fast: Ice Tomb / Skeletons{rt1}||Ice Tomb can be Ice Block / Bubble / trinket; prioritize skeletons",
                ["mythic"] = "{rt8}Prince Keleseth{rt8}||Kill the 4 Vrykul councilors before the boss; [Ice Tomb] marks a target—break it to free; [Summon Skeletons] group-pull and AoE||{rt1}Kill fast: Ice Tomb / Skeletons{rt1}||Ice Tomb can be Ice Block / Bubble / trinket; prioritize skeletons",
                ["mythicplus"] = "{rt8}Prince Keleseth{rt8}||Kill the 4 Vrykul councilors before the boss; [Ice Tomb] marks a target—break it to free; [Summon Skeletons] group-pull and AoE||{rt1}Kill fast: Ice Tomb / Skeletons{rt1}||Ice Tomb can be Ice Block / Bubble / trinket; prioritize skeletons",
            },
        },
        ["投掷人形怪"] = {
            type = "MOB",
            tips = "{rt8}Throwing Humanoid{rt8}||Before Ingvar, 2 waves: throwers + wolves + dragon riders—control before fighting||{rt1}Kill fast: throwers{rt1}||",
        },
        ["符文师"] = {
            type = "MOB",
            tips = "{rt8}Rune Master{rt8}||Places various runes on self / allies ([Explosive Rune] most dangerous)—prioritize killing||{rt1}Kill fast: Rune Master{rt1}||When pulling don't face other mobs to avoid ADDs",
        },
        ["斯卡瓦尔德和达尔隆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Skvald and Dalron{rt8}||Kill the caster Dalron ([Shadow Bolt]) first, then the melee Skvald ([Charge][Stone Strike knockback])||{rt1}Must interrupt: Dalron [Shadow Bolt], Skvald [Stone Strike]{rt1}||When either dies they become ghosts and revive—can't stably tank; melee dying easily OT heals",
                ["normal"] = "{rt8}Skvald and Dalron{rt8}||Kill the caster Dalron ([Shadow Bolt]) first, then the melee Skvald ([Charge][Stone Strike knockback])||{rt1}Must interrupt: Dalron [Shadow Bolt], Skvald [Stone Strike]{rt1}||When either dies they become ghosts and revive—can't stably tank; melee dying easily OT heals",
                ["heroic"] = "{rt8}Skvald and Dalron{rt8}||Kill the caster Dalron ([Shadow Bolt]) first, then the melee Skvald ([Charge][Stone Strike knockback])||{rt1}Must interrupt: Dalron [Shadow Bolt], Skvald [Stone Strike]{rt1}||When either dies they become ghosts and revive—can't stably tank; melee dying easily OT heals",
                ["mythic"] = "{rt8}Skvald and Dalron{rt8}||Kill the caster Dalron ([Shadow Bolt]) first, then the melee Skvald ([Charge][Stone Strike knockback])||{rt1}Must interrupt: Dalron [Shadow Bolt], Skvald [Stone Strike]{rt1}||When either dies they become ghosts and revive—can't stably tank; melee dying easily OT heals",
                ["mythicplus"] = "{rt8}Skvald and Dalron{rt8}||Kill the caster Dalron ([Shadow Bolt]) first, then the melee Skvald ([Charge][Stone Strike knockback])||{rt1}Must interrupt: Dalron [Shadow Bolt], Skvald [Stone Strike]{rt1}||When either dies they become ghosts and revive—can't stably tank; melee dying easily OT heals",
            },
        },
    },
    ["艾卓-尼鲁布"] = {
        name = "Ahn'kahet: The Old Kingdom",
        ["看门者克里克希尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Keeper Krik'thir{rt8}||[Mind Flay] interrupt; [Curse of Fatigue] slow—dispel; [Summon Scarabs] AoE them down||enrages at 10%||Achievement: kill while all three watchers are alive",
                ["normal"] = "{rt8}Keeper Krik'thir{rt8}||[Mind Flay] interrupt; [Curse of Fatigue] slow—dispel; [Summon Scarabs] AoE them down||enrages at 10%||Achievement: kill while all three watchers are alive",
                ["heroic"] = "{rt8}Keeper Krik'thir{rt8}||[Mind Flay] interrupt; [Curse of Fatigue] slow—dispel; [Summon Scarabs] AoE them down||enrages at 10%||Achievement: kill while all three watchers are alive",
                ["mythic"] = "{rt8}Keeper Krik'thir{rt8}||[Mind Flay] interrupt; [Curse of Fatigue] slow—dispel; [Summon Scarabs] AoE them down||enrages at 10%||Achievement: kill while all three watchers are alive",
                ["mythicplus"] = "{rt8}Keeper Krik'thir{rt8}||[Mind Flay] interrupt; [Curse of Fatigue] slow—dispel; [Summon Scarabs] AoE them down||enrages at 10%||Achievement: kill while all three watchers are alive",
            },
        },
        ["尼鲁布潜地者"] = {
            type = "MOB",
            tips = "{rt8}Nerubian Burrower{rt8}||after burrowing, [Burrow Strike] erupts from beneath your feet—keep moving||",
        },
        ["看守者"] = {
            type = "MOB",
            tips = "{rt8}Warden{rt8}||group poison spray / blind / enrage—watch positioning to avoid||{rt1}Must interrupt: [Mass Blind]{rt1}||",
        },
        ["阿努巴拉克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Anub'arak{rt8}||every 25% he burrows and summons adds + [Impale]; focus fire during the surface phase||[Swarm Storm] dodge||stay as a group",
                ["normal"] = "{rt8}Anub'arak{rt8}||every 25% he burrows and summons adds + [Impale]; focus fire during the surface phase||[Swarm Storm] dodge||stay as a group",
                ["heroic"] = "{rt8}Anub'arak{rt8}||every 25% he burrows and summons adds + [Impale]; focus fire during the surface phase||[Swarm Storm] dodge||stay as a group",
                ["mythic"] = "{rt8}Anub'arak{rt8}||every 25% he burrows and summons adds + [Impale]; focus fire during the surface phase||[Swarm Storm] dodge||stay as a group",
                ["mythicplus"] = "{rt8}Anub'arak{rt8}||every 25% he burrows and summons adds + [Impale]; focus fire during the surface phase||[Swarm Storm] dodge||stay as a group",
            },
        },
        ["蛛网施法者"] = {
            type = "MOB",
            tips = "{rt8}Web Weaver{rt8}||[Web] roots a teammate—break it quickly to free them||{rt1}Must interrupt: Web{rt1}||",
        },
        ["哈多诺克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hadronox{rt8}||dodge [Poison Cloud]; [Web Grip] roots you—teammate must break it||[Lifesteal] small spiders shouldn't enter the poison cloud to heal||tank pulls away from the tunnel",
                ["normal"] = "{rt8}Hadronox{rt8}||dodge [Poison Cloud]; [Web Grip] roots you—teammate must break it||[Lifesteal] small spiders shouldn't enter the poison cloud to heal||tank pulls away from the tunnel",
                ["heroic"] = "{rt8}Hadronox{rt8}||dodge [Poison Cloud]; [Web Grip] roots you—teammate must break it||[Lifesteal] small spiders shouldn't enter the poison cloud to heal||tank pulls away from the tunnel",
                ["mythic"] = "{rt8}Hadronox{rt8}||dodge [Poison Cloud]; [Web Grip] roots you—teammate must break it||[Lifesteal] small spiders shouldn't enter the poison cloud to heal||tank pulls away from the tunnel",
                ["mythicplus"] = "{rt8}Hadronox{rt8}||dodge [Poison Cloud]; [Web Grip] roots you—teammate must break it||[Lifesteal] small spiders shouldn't enter the poison cloud to heal||tank pulls away from the tunnel",
            },
        },
    },
    ["乌特加德之巅"] = {
        name = "Utgarde Pinnacle",
        ["始祖龙骑兵"] = {
            type = "MOB",
            tips = "{rt8}Proto-Drake Knight{rt8}||Drake-back throw + cleave; before Skadi use harpoons on the drakes||Stay away from the drake's head breath",
        },
        ["戈托克·苍蹄"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gortok Palehoof{rt8}||Patchwerk-style fight; [Withering Roar] whole group loses HP + max-HP reduction (stacks), heavy healer pressure||{rt1}Must interrupt: [Impale] DoT{rt1}||Can be disarmed; DPS maximize output while surviving",
                ["normal"] = "{rt8}Gortok Palehoof{rt8}||Patchwerk-style fight; [Withering Roar] whole group loses HP + max-HP reduction (stacks), heavy healer pressure||{rt1}Must interrupt: [Impale] DoT{rt1}||Can be disarmed; DPS maximize output while surviving",
                ["heroic"] = "{rt8}Gortok Palehoof{rt8}||Patchwerk-style fight; [Withering Roar] whole group loses HP + max-HP reduction (stacks), heavy healer pressure||{rt1}Must interrupt: [Impale] DoT{rt1}||Can be disarmed; DPS maximize output while surviving",
                ["mythic"] = "{rt8}Gortok Palehoof{rt8}||Patchwerk-style fight; [Withering Roar] whole group loses HP + max-HP reduction (stacks), heavy healer pressure||{rt1}Must interrupt: [Impale] DoT{rt1}||Can be disarmed; DPS maximize output while surviving",
                ["mythicplus"] = "{rt8}Gortok Palehoof{rt8}||Patchwerk-style fight; [Withering Roar] whole group loses HP + max-HP reduction (stacks), heavy healer pressure||{rt1}Must interrupt: [Impale] DoT{rt1}||Can be disarmed; DPS maximize output while surviving",
            },
        },
        ["狂暴维库人"] = {
            type = "MOB",
            tips = "{rt8}Enraged Vrykul{rt8}||Goes into Frenzy—control or prioritize focus fire||",
        },
        ["伊米隆国王"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}King Ymiron{rt8}||During [Bane] whole group stops; [Fetid Rot] disease—dispel||At 66%/33% summons the king's soul for new abilities—dispel||Tank faces away, dodge [Dark Smash]",
                ["normal"] = "{rt8}King Ymiron{rt8}||During [Bane] whole group stops; [Fetid Rot] disease—dispel||At 66%/33% summons the king's soul for new abilities—dispel||Tank faces away, dodge [Dark Smash]",
                ["heroic"] = "{rt8}King Ymiron{rt8}||During [Bane] whole group stops; [Fetid Rot] disease—dispel||At 66%/33% summons the king's soul for new abilities—dispel||Tank faces away, dodge [Dark Smash]",
                ["mythic"] = "{rt8}King Ymiron{rt8}||During [Bane] whole group stops; [Fetid Rot] disease—dispel||At 66%/33% summons the king's soul for new abilities—dispel||Tank faces away, dodge [Dark Smash]",
                ["mythicplus"] = "{rt8}King Ymiron{rt8}||During [Bane] whole group stops; [Fetid Rot] disease—dispel||At 66%/33% summons the king's soul for new abilities—dispel||Tank faces away, dodge [Dark Smash]",
            },
        },
        ["席瓦拉·索格蕾"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Svala Sorrowgrave{rt8}||Pull the boss to the steps; she flies up and casts [Ritual of Sword] binding a random player—work together to kill the ritualist to free them||{rt1}Kill fast: the ritualist (banshee){rt1}||Within 20s the sword drops and explodes; rescue priority",
                ["normal"] = "{rt8}Svala Sorrowgrave{rt8}||Pull the boss to the steps; she flies up and casts [Ritual of Sword] binding a random player—work together to kill the ritualist to free them||{rt1}Kill fast: the ritualist (banshee){rt1}||Within 20s the sword drops and explodes; rescue priority",
                ["heroic"] = "{rt8}Svala Sorrowgrave{rt8}||Pull the boss to the steps; she flies up and casts [Ritual of Sword] binding a random player—work together to kill the ritualist to free them||{rt1}Kill fast: the ritualist (banshee){rt1}||Within 20s the sword drops and explodes; rescue priority",
                ["mythic"] = "{rt8}Svala Sorrowgrave{rt8}||Pull the boss to the steps; she flies up and casts [Ritual of Sword] binding a random player—work together to kill the ritualist to free them||{rt1}Kill fast: the ritualist (banshee){rt1}||Within 20s the sword drops and explodes; rescue priority",
                ["mythicplus"] = "{rt8}Svala Sorrowgrave{rt8}||Pull the boss to the steps; she flies up and casts [Ritual of Sword] binding a random player—work together to kill the ritualist to free them||{rt1}Kill fast: the ritualist (banshee){rt1}||Within 20s the sword drops and explodes; rescue priority",
            },
        },
        ["残忍的斯卡迪"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Cruel Skadi{rt8}||Use harpoons to hook the boss; [Whirlwind] melee stay away, [Poison Spear] dispelable||{rt1}Kill fast: adds pick up harpoons{rt1}||During deep breath stand where there's no ice fog",
                ["normal"] = "{rt8}Cruel Skadi{rt8}||Use harpoons to hook the boss; [Whirlwind] melee stay away, [Poison Spear] dispelable||{rt1}Kill fast: adds pick up harpoons{rt1}||During deep breath stand where there's no ice fog",
                ["heroic"] = "{rt8}Cruel Skadi{rt8}||Use harpoons to hook the boss; [Whirlwind] melee stay away, [Poison Spear] dispelable||{rt1}Kill fast: adds pick up harpoons{rt1}||During deep breath stand where there's no ice fog",
                ["mythic"] = "{rt8}Cruel Skadi{rt8}||Use harpoons to hook the boss; [Whirlwind] melee stay away, [Poison Spear] dispelable||{rt1}Kill fast: adds pick up harpoons{rt1}||During deep breath stand where there's no ice fog",
                ["mythicplus"] = "{rt8}Cruel Skadi{rt8}||Use harpoons to hook the boss; [Whirlwind] melee stay away, [Poison Spear] dispelable||{rt1}Kill fast: adds pick up harpoons{rt1}||During deep breath stand where there's no ice fog",
            },
        },
        ["维库治疗者"] = {
            type = "MOB",
            tips = "{rt8}Vrykul Healer{rt8}||Heals the Vrykul—prioritize killing / interrupting heal||{rt1}Must interrupt: Heal{rt1}||",
        },
    },
    ["闪电大厅"] = {
        name = "Halls of Lightning",
        ["沃尔坎"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Volkhan{rt8}||During [Shattering Stomp] stay away from [Stone Statue]; kill [Magmantine] fast||Boss <30% casts Shattering Stomp",
                ["normal"] = "{rt8}Volkhan{rt8}||During [Shattering Stomp] stay away from [Stone Statue]; kill [Magmantine] fast||Boss <30% casts Shattering Stomp",
                ["heroic"] = "{rt8}Volkhan{rt8}||During [Shattering Stomp] stay away from [Stone Statue]; kill [Magmantine] fast||Boss <30% casts Shattering Stomp",
                ["mythic"] = "{rt8}Volkhan{rt8}||During [Shattering Stomp] stay away from [Stone Statue]; kill [Magmantine] fast||Boss <30% casts Shattering Stomp",
                ["mythicplus"] = "{rt8}Volkhan{rt8}||During [Shattering Stomp] stay away from [Stone Statue]; kill [Magmantine] fast||Boss <30% casts Shattering Stomp",
            },
        },
        ["洛肯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Loken{rt8}||[Lightning Nova] when casting, run back ~20 yards; [Lightning Surge] closer = less damage, stand at 20 yards||[Arc Lightning] jumps—spread out",
                ["normal"] = "{rt8}Loken{rt8}||[Lightning Nova] when casting, run back ~20 yards; [Lightning Surge] closer = less damage, stand at 20 yards||[Arc Lightning] jumps—spread out",
                ["heroic"] = "{rt8}Loken{rt8}||[Lightning Nova] when casting, run back ~20 yards; [Lightning Surge] closer = less damage, stand at 20 yards||[Arc Lightning] jumps—spread out",
                ["mythic"] = "{rt8}Loken{rt8}||[Lightning Nova] when casting, run back ~20 yards; [Lightning Surge] closer = less damage, stand at 20 yards||[Arc Lightning] jumps—spread out",
                ["mythicplus"] = "{rt8}Loken{rt8}||[Lightning Nova] when casting, run back ~20 yards; [Lightning Surge] closer = less damage, stand at 20 yards||[Arc Lightning] jumps—spread out",
            },
        },
        ["艾欧纳尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ionar{rt8}||[Static Overload] affected player leaves the group; [Dissipate] becomes lightning orbs—everyone dodge, run toward the entrance||[Ball Lightning] lands—dodge",
                ["normal"] = "{rt8}Ionar{rt8}||[Static Overload] affected player leaves the group; [Dissipate] becomes lightning orbs—everyone dodge, run toward the entrance||[Ball Lightning] lands—dodge",
                ["heroic"] = "{rt8}Ionar{rt8}||[Static Overload] affected player leaves the group; [Dissipate] becomes lightning orbs—everyone dodge, run toward the entrance||[Ball Lightning] lands—dodge",
                ["mythic"] = "{rt8}Ionar{rt8}||[Static Overload] affected player leaves the group; [Dissipate] becomes lightning orbs—everyone dodge, run toward the entrance||[Ball Lightning] lands—dodge",
                ["mythicplus"] = "{rt8}Ionar{rt8}||[Static Overload] affected player leaves the group; [Dissipate] becomes lightning orbs—everyone dodge, run toward the entrance||[Ball Lightning] lands—dodge",
            },
        },
        ["符文矮人施法者"] = {
            type = "MOB",
            tips = "{rt8}Rune Dwarf Caster{rt8}||[Chain Lightning] high damage—prioritize killing / interrupting||{rt1}Must interrupt: Chain Lightning{rt1}||",
        },
        ["熔岩傀儡"] = {
            type = "MOB",
            tips = "{rt8}Magmantine{rt8}||Explodes on death; don't stand near the corpse, pull to the slope to AoE||[Molten Armor] stacks up to 10",
        },
        ["比亚格里将军"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}General Bjarngrim{rt8}||Three stances: [Frenzy] dodge Whirlwind, [Weapons] Mortal Strike heal, [Defensive] shield reflect—don't cast||When charged, don't hit; switch to adds",
                ["normal"] = "{rt8}General Bjarngrim{rt8}||Three stances: [Frenzy] dodge Whirlwind, [Weapons] Mortal Strike heal, [Defensive] shield reflect—don't cast||When charged, don't hit; switch to adds",
                ["heroic"] = "{rt8}General Bjarngrim{rt8}||Three stances: [Frenzy] dodge Whirlwind, [Weapons] Mortal Strike heal, [Defensive] shield reflect—don't cast||When charged, don't hit; switch to adds",
                ["mythic"] = "{rt8}General Bjarngrim{rt8}||Three stances: [Frenzy] dodge Whirlwind, [Weapons] Mortal Strike heal, [Defensive] shield reflect—don't cast||When charged, don't hit; switch to adds",
                ["mythicplus"] = "{rt8}General Bjarngrim{rt8}||Three stances: [Frenzy] dodge Whirlwind, [Weapons] Mortal Strike heal, [Defensive] shield reflect—don't cast||When charged, don't hit; switch to adds",
            },
        },
    },
    ["安卡赫特：古代王国"] = {
        name = "Ahn'kahet: The Old Kingdom",
        ["安卡哈尔守望者"] = {
            type = "MOB",
            tips = "{rt8}Ahn'kahet Watcher{rt8}||[Dark Spear] Shadow Bolt—interrupt||{rt1}Must interrupt: Dark Spear{rt1}||",
        },
        ["埃曼尼塔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Emanita{rt8}||[Mini] whole group damage -75%: stand next to a healthy mushroom and kill it to clear; [Poison Mushroom] stepping on it takes DoT||{rt1}Must clear: [Venom Bolt][Entangling Roots]{rt1}||Heroic optional; disable AoE so you don't lose the healthy mushroom; [Knockback] tank watch positioning",
                ["normal"] = "{rt8}Emanita{rt8}||[Mini] whole group damage -75%: stand next to a healthy mushroom and kill it to clear; [Poison Mushroom] stepping on it takes DoT||{rt1}Must clear: [Venom Bolt][Entangling Roots]{rt1}||Heroic optional; disable AoE so you don't lose the healthy mushroom; [Knockback] tank watch positioning",
                ["heroic"] = "{rt8}Emanita{rt8}||[Mini] whole group damage -75%: stand next to a healthy mushroom and kill it to clear; [Poison Mushroom] stepping on it takes DoT||{rt1}Must clear: [Venom Bolt][Entangling Roots]{rt1}||Heroic optional; disable AoE so you don't lose the healthy mushroom; [Knockback] tank watch positioning",
                ["mythic"] = "{rt8}Emanita{rt8}||[Mini] whole group damage -75%: stand next to a healthy mushroom and kill it to clear; [Poison Mushroom] stepping on it takes DoT||{rt1}Must clear: [Venom Bolt][Entangling Roots]{rt1}||Heroic optional; disable AoE so you don't lose the healthy mushroom; [Knockback] tank watch positioning",
                ["mythicplus"] = "{rt8}Emanita{rt8}||[Mini] whole group damage -75%: stand next to a healthy mushroom and kill it to clear; [Poison Mushroom] stepping on it takes DoT||{rt1}Must clear: [Venom Bolt][Entangling Roots]{rt1}||Heroic optional; disable AoE so you don't lose the healthy mushroom; [Knockback] tank watch positioning",
            },
        },
        ["传令官沃拉兹"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Herald Volaz{rt8}||[Madness] hit the Mirror Soul (your own illusion), stop and wait to sober up||{rt1}Must interrupt/kill fast: the mirror{rt1}||Group stays close to avoid friendly fire",
                ["normal"] = "{rt8}Herald Volaz{rt8}||[Madness] hit the Mirror Soul (your own illusion), stop and wait to sober up||{rt1}Must interrupt/kill fast: the mirror{rt1}||Group stays close to avoid friendly fire",
                ["heroic"] = "{rt8}Herald Volaz{rt8}||[Madness] hit the Mirror Soul (your own illusion), stop and wait to sober up||{rt1}Must interrupt/kill fast: the mirror{rt1}||Group stays close to avoid friendly fire",
                ["mythic"] = "{rt8}Herald Volaz{rt8}||[Madness] hit the Mirror Soul (your own illusion), stop and wait to sober up||{rt1}Must interrupt/kill fast: the mirror{rt1}||Group stays close to avoid friendly fire",
                ["mythicplus"] = "{rt8}Herald Volaz{rt8}||[Madness] hit the Mirror Soul (your own illusion), stop and wait to sober up||{rt1}Must interrupt/kill fast: the mirror{rt1}||Group stays close to avoid friendly fire",
            },
        },
        ["塔达拉姆王子"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Prince Taldaram{rt8}||[Embrace of the Vampyr] lifesteal—when being drained, whole group burns him to free; [Flame Sphere] run away||[Bloodlust] heals||",
                ["normal"] = "{rt8}Prince Taldaram{rt8}||[Embrace of the Vampyr] lifesteal—when being drained, whole group burns him to free; [Flame Sphere] run away||[Bloodlust] heals||",
                ["heroic"] = "{rt8}Prince Taldaram{rt8}||[Embrace of the Vampyr] lifesteal—when being drained, whole group burns him to free; [Flame Sphere] run away||[Bloodlust] heals||",
                ["mythic"] = "{rt8}Prince Taldaram{rt8}||[Embrace of the Vampyr] lifesteal—when being drained, whole group burns him to free; [Flame Sphere] run away||[Bloodlust] heals||",
                ["mythicplus"] = "{rt8}Prince Taldaram{rt8}||[Embrace of the Vampyr] lifesteal—when being drained, whole group burns him to free; [Flame Sphere] run away||[Bloodlust] heals||",
            },
        },
        ["纳多克斯长老"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Elder Nadox{rt8}||[Brood Plague] disease—dispel; [Ahn'kahet Guardian] spawns—kill instantly (aura makes boss invincible)||{rt1}Kill fast: the Guardian{rt1}||Small bugs die on their own",
                ["normal"] = "{rt8}Elder Nadox{rt8}||[Brood Plague] disease—dispel; [Ahn'kahet Guardian] spawns—kill instantly (aura makes boss invincible)||{rt1}Kill fast: the Guardian{rt1}||Small bugs die on their own",
                ["heroic"] = "{rt8}Elder Nadox{rt8}||[Brood Plague] disease—dispel; [Ahn'kahet Guardian] spawns—kill instantly (aura makes boss invincible)||{rt1}Kill fast: the Guardian{rt1}||Small bugs die on their own",
                ["mythic"] = "{rt8}Elder Nadox{rt8}||[Brood Plague] disease—dispel; [Ahn'kahet Guardian] spawns—kill instantly (aura makes boss invincible)||{rt1}Kill fast: the Guardian{rt1}||Small bugs die on their own",
                ["mythicplus"] = "{rt8}Elder Nadox{rt8}||[Brood Plague] disease—dispel; [Ahn'kahet Guardian] spawns—kill instantly (aura makes boss invincible)||{rt1}Kill fast: the Guardian{rt1}||Small bugs die on their own",
            },
        },
        ["无面者追随者"] = {
            type = "MOB",
            tips = "{rt8}Faceless Follower{rt8}||[Fear] group—dispel fear / trinket||Spread out",
        },
        ["黑暗信徒"] = {
            type = "MOB",
            tips = "{rt8}Dark Cultist{rt8}||Heals the Faceless—prioritize killing / interrupting||{rt1}Must interrupt: Heal{rt1}||",
        },
        ["耶戈达·觅影者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Jedoga Shadowseeker{rt8}||[Sacrifice] marks a player—others move away from the marked||[Chain Lightning] spread||She drops from the sky",
                ["normal"] = "{rt8}Jedoga Shadowseeker{rt8}||[Sacrifice] marks a player—others move away from the marked||[Chain Lightning] spread||She drops from the sky",
                ["heroic"] = "{rt8}Jedoga Shadowseeker{rt8}||[Sacrifice] marks a player—others move away from the marked||[Chain Lightning] spread||She drops from the sky",
                ["mythic"] = "{rt8}Jedoga Shadowseeker{rt8}||[Sacrifice] marks a player—others move away from the marked||[Chain Lightning] spread||She drops from the sky",
                ["mythicplus"] = "{rt8}Jedoga Shadowseeker{rt8}||[Sacrifice] marks a player—others move away from the marked||[Chain Lightning] spread||She drops from the sky",
            },
        },
    },
    ["达克萨隆要塞"] = {
        name = "Drak'Tharon Keep",
        ["达卡莱萨满"] = {
            type = "MOB",
            tips = "{rt8}Drakkari Shaman{rt8}||heals the warrior—kill the shaman first, then the commander||{rt1}Must interrupt: healing{rt1}||",
        },
        ["先知萨隆亚"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Prophet Saronya{rt8}||dodge [Poison Cloud]; [Flesh Rot] turns you into a skeleton (only tank taunts; others use bone shield / DPS)||DoTs and pets keep working||",
                ["normal"] = "{rt8}Prophet Saronya{rt8}||dodge [Poison Cloud]; [Flesh Rot] turns you into a skeleton (only tank taunts; others use bone shield / DPS)||DoTs and pets keep working||",
                ["heroic"] = "{rt8}Prophet Saronya{rt8}||dodge [Poison Cloud]; [Flesh Rot] turns you into a skeleton (only tank taunts; others use bone shield / DPS)||DoTs and pets keep working||",
                ["mythic"] = "{rt8}Prophet Saronya{rt8}||dodge [Poison Cloud]; [Flesh Rot] turns you into a skeleton (only tank taunts; others use bone shield / DPS)||DoTs and pets keep working||",
                ["mythicplus"] = "{rt8}Prophet Saronya{rt8}||dodge [Poison Cloud]; [Flesh Rot] turns you into a skeleton (only tank taunts; others use bone shield / DPS)||DoTs and pets keep working||",
            },
        },
        ["暴龙之王爵德"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}King Dred{rt8}||[Pitiful Roar] fear; pull the boss out of the cage to avoid fearing adds||[Ripping Charge] tank uses cooldowns to survive||",
                ["normal"] = "{rt8}King Dred{rt8}||[Pitiful Roar] fear; pull the boss out of the cage to avoid fearing adds||[Ripping Charge] tank uses cooldowns to survive||",
                ["heroic"] = "{rt8}King Dred{rt8}||[Pitiful Roar] fear; pull the boss out of the cage to avoid fearing adds||[Ripping Charge] tank uses cooldowns to survive||",
                ["mythic"] = "{rt8}King Dred{rt8}||[Pitiful Roar] fear; pull the boss out of the cage to avoid fearing adds||[Ripping Charge] tank uses cooldowns to survive||",
                ["mythicplus"] = "{rt8}King Dred{rt8}||[Pitiful Roar] fear; pull the boss out of the cage to avoid fearing adds||[Ripping Charge] tank uses cooldowns to survive||",
            },
        },
        ["托尔戈"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Trollgore{rt8}||[Consume] stacks damage (can be LOS'd); [Corpse Explosion] stay 5 yards away; [Infected Wound] disease—dispel||mobs swarm in, tank groups and AoEs them||",
                ["normal"] = "{rt8}Trollgore{rt8}||[Consume] stacks damage (can be LOS'd); [Corpse Explosion] stay 5 yards away; [Infected Wound] disease—dispel||mobs swarm in, tank groups and AoEs them||",
                ["heroic"] = "{rt8}Trollgore{rt8}||[Consume] stacks damage (can be LOS'd); [Corpse Explosion] stay 5 yards away; [Infected Wound] disease—dispel||mobs swarm in, tank groups and AoEs them||",
                ["mythic"] = "{rt8}Trollgore{rt8}||[Consume] stacks damage (can be LOS'd); [Corpse Explosion] stay 5 yards away; [Infected Wound] disease—dispel||mobs swarm in, tank groups and AoEs them||",
                ["mythicplus"] = "{rt8}Trollgore{rt8}||[Consume] stacks damage (can be LOS'd); [Corpse Explosion] stay 5 yards away; [Infected Wound] disease—dispel||mobs swarm in, tank groups and AoEs them||",
            },
        },
        ["召唤者诺沃斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Summoner Novos{rt8}||protected by [Arcane Field]; kill 4 [Crystal Handlers] to stop his summons||dodge [Blizzard]||clear the mobs at both ends of the stairs before engaging",
                ["normal"] = "{rt8}Summoner Novos{rt8}||protected by [Arcane Field]; kill 4 [Crystal Handlers] to stop his summons||dodge [Blizzard]||clear the mobs at both ends of the stairs before engaging",
                ["heroic"] = "{rt8}Summoner Novos{rt8}||protected by [Arcane Field]; kill 4 [Crystal Handlers] to stop his summons||dodge [Blizzard]||clear the mobs at both ends of the stairs before engaging",
                ["mythic"] = "{rt8}Summoner Novos{rt8}||protected by [Arcane Field]; kill 4 [Crystal Handlers] to stop his summons||dodge [Blizzard]||clear the mobs at both ends of the stairs before engaging",
                ["mythicplus"] = "{rt8}Summoner Novos{rt8}||protected by [Arcane Field]; kill 4 [Crystal Handlers] to stop his summons||dodge [Blizzard]||clear the mobs at both ends of the stairs before engaging",
            },
        },
        ["蜘蛛"] = {
            type = "MOB",
            tips = "{rt8}Spider{rt8}||at low health it flees and summons small spiders—CC and burst it before it resets||",
        },
        ["灵魂法师"] = {
            type = "MOB",
            tips = "{rt8}Soul Mage{rt8}||places [Black Water / Void Zone] high-damage pools—clear them fast if you step in; prioritize killing||{rt1}Priority kill: Soul Mage{rt1}||",
        },
    },
    ["冠军的试炼"] = {
        name = "Trial of the Champion",
        ["纯洁者耶德瑞克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Purifier Isidorus{rt8}||one of these at random; [Confession] dispel, [Holy Shield] break the shield; Paletress summons memories—interrupt the healing||dodge props thrown by the audience",
                ["normal"] = "{rt8}Purifier Isidorus{rt8}||one of these at random; [Confession] dispel, [Holy Shield] break the shield; Paletress summons memories—interrupt the healing||dodge props thrown by the audience",
                ["heroic"] = "{rt8}Purifier Isidorus{rt8}||one of these at random; [Confession] dispel, [Holy Shield] break the shield; Paletress summons memories—interrupt the healing||dodge props thrown by the audience",
                ["mythic"] = "{rt8}Purifier Isidorus{rt8}||one of these at random; [Confession] dispel, [Holy Shield] break the shield; Paletress summons memories—interrupt the healing||dodge props thrown by the audience",
                ["mythicplus"] = "{rt8}Purifier Isidorus{rt8}||one of these at random; [Confession] dispel, [Holy Shield] break the shield; Paletress summons memories—interrupt the healing||dodge props thrown by the audience",
            },
        },
        ["持戟士兵"] = {
            type = "MOB",
            tips = "{rt8}Lance Champion{rt8}||vehicle-phase trash; three layers of shield + javelin charge—AoE them down||{rt1}Priority kill: the trash{rt1}||",
        },
        ["黑骑士"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The Black Knight{rt8}||P1 [Ghoul] tank holds; P2 [Death's Mark] run away; P3 [Necrotic Whirl] dodge||the three phases trigger in sequence",
                ["normal"] = "{rt8}The Black Knight{rt8}||P1 [Ghoul] tank holds; P2 [Death's Mark] run away; P3 [Necrotic Whirl] dodge||the three phases trigger in sequence",
                ["heroic"] = "{rt8}The Black Knight{rt8}||P1 [Ghoul] tank holds; P2 [Death's Mark] run away; P3 [Necrotic Whirl] dodge||the three phases trigger in sequence",
                ["mythic"] = "{rt8}The Black Knight{rt8}||P1 [Ghoul] tank holds; P2 [Death's Mark] run away; P3 [Necrotic Whirl] dodge||the three phases trigger in sequence",
                ["mythicplus"] = "{rt8}The Black Knight{rt8}||P1 [Ghoul] tank holds; P2 [Death's Mark] run away; P3 [Necrotic Whirl] dodge||the three phases trigger in sequence",
            },
        },
        ["观众"] = {
            type = "MOB",
            tips = "{rt8}Spectator{rt8}||throws traps / stun-apples from the stands—dodge the dense drops||",
        },
        ["银色神官帕尔崔丝"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Silver Confessor Paletress{rt8}||at 50% health she summons [Memory of the Past] illusions and grants herself a reflect shield (damage reduction + reflect); kill the illusion to break the shield before damaging the boss||{rt1}Must interrupt: [Holy Smite][Holy Fire]{rt1}||interrupt [Renew]; the illusion's [Nightmare Awakening] fears, [Shadows of the Past] slows 90%, [Old Wounds] physical DoT",
                ["normal"] = "{rt8}Silver Confessor Paletress{rt8}||at 50% health she summons [Memory of the Past] illusions and grants herself a reflect shield (damage reduction + reflect); kill the illusion to break the shield before damaging the boss||{rt1}Must interrupt: [Holy Smite][Holy Fire]{rt1}||interrupt [Renew]; the illusion's [Nightmare Awakening] fears, [Shadows of the Past] slows 90%, [Old Wounds] physical DoT",
                ["heroic"] = "{rt8}Silver Confessor Paletress{rt8}||at 50% health she summons [Memory of the Past] illusions and grants herself a reflect shield (damage reduction + reflect); kill the illusion to break the shield before damaging the boss||{rt1}Must interrupt: [Holy Smite][Holy Fire]{rt1}||interrupt [Renew]; the illusion's [Nightmare Awakening] fears, [Shadows of the Past] slows 90%, [Old Wounds] physical DoT",
                ["mythic"] = "{rt8}Silver Confessor Paletress{rt8}||at 50% health she summons [Memory of the Past] illusions and grants herself a reflect shield (damage reduction + reflect); kill the illusion to break the shield before damaging the boss||{rt1}Must interrupt: [Holy Smite][Holy Fire]{rt1}||interrupt [Renew]; the illusion's [Nightmare Awakening] fears, [Shadows of the Past] slows 90%, [Old Wounds] physical DoT",
                ["mythicplus"] = "{rt8}Silver Confessor Paletress{rt8}||at 50% health she summons [Memory of the Past] illusions and grants herself a reflect shield (damage reduction + reflect); kill the illusion to break the shield before damaging the boss||{rt1}Must interrupt: [Holy Smite][Holy Fire]{rt1}||interrupt [Renew]; the illusion's [Nightmare Awakening] fears, [Shadows of the Past] slows 90%, [Old Wounds] physical DoT",
            },
        },
        ["总冠军"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The Champion{rt8}||vehicle fight: grab a lance from the rack and mount up; [Javelin] breaks the shield, [Charge] deals damage||let the Warbringer share the load; knock the rider off and stomp",
                ["normal"] = "{rt8}The Champion{rt8}||vehicle fight: grab a lance from the rack and mount up; [Javelin] breaks the shield, [Charge] deals damage||let the Warbringer share the load; knock the rider off and stomp",
                ["heroic"] = "{rt8}The Champion{rt8}||vehicle fight: grab a lance from the rack and mount up; [Javelin] breaks the shield, [Charge] deals damage||let the Warbringer share the load; knock the rider off and stomp",
                ["mythic"] = "{rt8}The Champion{rt8}||vehicle fight: grab a lance from the rack and mount up; [Javelin] breaks the shield, [Charge] deals damage||let the Warbringer share the load; knock the rider off and stomp",
                ["mythicplus"] = "{rt8}The Champion{rt8}||vehicle fight: grab a lance from the rack and mount up; [Javelin] breaks the shield, [Charge] deals damage||let the Warbringer share the load; knock the rider off and stomp",
            },
        },
    },
    ["岩石大厅"] = {
        name = "Halls of Stone",
        ["铁矮人法师"] = {
            type = "MOB",
            tips = "{rt8}Iron Dwarf Mage{rt8}||High-damage caster—prioritize killing / interrupting||{rt1}Must interrupt: Shadow Bolt{rt1}||",
        },
        ["远古法庭"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The Ancient Tribunal{rt8}||Brann Bronzebeard escort event (not a boss fight): 3 masks fire Arcane Bolt / Shadow Orb / Fire Beam in sequence; adds charge Brann—tank must hold them||{rt1}Must tank: Dark Rune Guardian / Mage{rt1}||Protect Brann (~40k HP) from dying; move to dodge ground beams and shadow impacts",
                ["normal"] = "{rt8}The Ancient Tribunal{rt8}||Brann Bronzebeard escort event (not a boss fight): 3 masks fire Arcane Bolt / Shadow Orb / Fire Beam in sequence; adds charge Brann—tank must hold them||{rt1}Must tank: Dark Rune Guardian / Mage{rt1}||Protect Brann (~40k HP) from dying; move to dodge ground beams and shadow impacts",
                ["heroic"] = "{rt8}The Ancient Tribunal{rt8}||Brann Bronzebeard escort event (not a boss fight): 3 masks fire Arcane Bolt / Shadow Orb / Fire Beam in sequence; adds charge Brann—tank must hold them||{rt1}Must tank: Dark Rune Guardian / Mage{rt1}||Protect Brann (~40k HP) from dying; move to dodge ground beams and shadow impacts",
                ["mythic"] = "{rt8}The Ancient Tribunal{rt8}||Brann Bronzebeard escort event (not a boss fight): 3 masks fire Arcane Bolt / Shadow Orb / Fire Beam in sequence; adds charge Brann—tank must hold them||{rt1}Must tank: Dark Rune Guardian / Mage{rt1}||Protect Brann (~40k HP) from dying; move to dodge ground beams and shadow impacts",
                ["mythicplus"] = "{rt8}The Ancient Tribunal{rt8}||Brann Bronzebeard escort event (not a boss fight): 3 masks fire Arcane Bolt / Shadow Orb / Fire Beam in sequence; adds charge Brann—tank must hold them||{rt1}Must tank: Dark Rune Guardian / Mage{rt1}||Protect Brann (~40k HP) from dying; move to dodge ground beams and shadow impacts",
            },
        },
        ["克莱斯塔卢斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Krystallus{rt8}||[Boulder Throw] dodge; [Stomp] then move away; [Shatter] petrify—damage each other||Group spreads out, don't clump",
                ["normal"] = "{rt8}Krystallus{rt8}||[Boulder Throw] dodge; [Stomp] then move away; [Shatter] petrify—damage each other||Group spreads out, don't clump",
                ["heroic"] = "{rt8}Krystallus{rt8}||[Boulder Throw] dodge; [Stomp] then move away; [Shatter] petrify—damage each other||Group spreads out, don't clump",
                ["mythic"] = "{rt8}Krystallus{rt8}||[Boulder Throw] dodge; [Stomp] then move away; [Shatter] petrify—damage each other||Group spreads out, don't clump",
                ["mythicplus"] = "{rt8}Krystallus{rt8}||[Boulder Throw] dodge; [Stomp] then move away; [Shatter] petrify—damage each other||Group spreads out, don't clump",
            },
        },
        ["冷酷的构造者"] = {
            type = "MOB",
            tips = "{rt8}The Cruel Construct{rt8}||Casts [Stun]; at low HP [Self-Destruct]—prioritize killing or move away||{rt1}Kill fast: the Construct{rt1}||",
        },
        ["悲伤圣女"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Weeping Saint{rt8}||[Pillar of Sadness] dodge the light pillar; [Storm of Sorrow] black water—stay outside; [Wave of Grief] repentance root—dispel||Tank pulls to center",
                ["normal"] = "{rt8}Weeping Saint{rt8}||[Pillar of Sadness] dodge the light pillar; [Storm of Sorrow] black water—stay outside; [Wave of Grief] repentance root—dispel||Tank pulls to center",
                ["heroic"] = "{rt8}Weeping Saint{rt8}||[Pillar of Sadness] dodge the light pillar; [Storm of Sorrow] black water—stay outside; [Wave of Grief] repentance root—dispel||Tank pulls to center",
                ["mythic"] = "{rt8}Weeping Saint{rt8}||[Pillar of Sadness] dodge the light pillar; [Storm of Sorrow] black water—stay outside; [Wave of Grief] repentance root—dispel||Tank pulls to center",
                ["mythicplus"] = "{rt8}Weeping Saint{rt8}||[Pillar of Sadness] dodge the light pillar; [Storm of Sorrow] black water—stay outside; [Wave of Grief] repentance root—dispel||Tank pulls to center",
            },
        },
        ["塑铁者斯约尼尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sjonnir the Ironforge{rt8}||[Lightning Shield] don't melee (reflects); [Iron Sludge] slow—dodge||Tank faces away, ranged DPS",
                ["normal"] = "{rt8}Sjonnir the Ironforge{rt8}||[Lightning Shield] don't melee (reflects); [Iron Sludge] slow—dodge||Tank faces away, ranged DPS",
                ["heroic"] = "{rt8}Sjonnir the Ironforge{rt8}||[Lightning Shield] don't melee (reflects); [Iron Sludge] slow—dodge||Tank faces away, ranged DPS",
                ["mythic"] = "{rt8}Sjonnir the Ironforge{rt8}||[Lightning Shield] don't melee (reflects); [Iron Sludge] slow—dodge||Tank faces away, ranged DPS",
                ["mythicplus"] = "{rt8}Sjonnir the Ironforge{rt8}||[Lightning Shield] don't melee (reflects); [Iron Sludge] slow—dodge||Tank faces away, ranged DPS",
            },
        },
    },
}
