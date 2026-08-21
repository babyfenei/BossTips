-- ============================================================================
-- BossTips 6.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["6.0"] = {
    ["奥金顿"] = {
        name = "Auchindoun",
        ["塔隆戈尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Talonghast{rt8}||at 75% transitions, random warlock spec; [Chaos Rain / Immolate / Unstable Affliction] dispel||{rt1}Must interrupt: [Drain Life][Fel Rain][Chaos Bolt][Immolate]{rt1}||affliction [Seed of Evil] marked runs from group; demon [Chaos Wave] dodge; heroic [Abyssal Fiend] kite",
                ["normal"] = "{rt8}Talonghast{rt8}||at 75% transitions, random warlock spec; [Chaos Rain / Immolate / Unstable Affliction] dispel||{rt1}Must interrupt: [Drain Life][Fel Rain][Chaos Bolt][Immolate]{rt1}||affliction [Seed of Evil] marked runs from group; demon [Chaos Wave] dodge; heroic [Abyssal Fiend] kite",
                ["heroic"] = "{rt8}Talonghast{rt8}||at 75% transitions, random warlock spec; [Chaos Rain / Immolate / Unstable Affliction] dispel||{rt1}Must interrupt: [Drain Life][Fel Rain][Chaos Bolt][Immolate]{rt1}||affliction [Seed of Evil] marked runs from group; demon [Chaos Wave] dodge; heroic [Abyssal Fiend] kite",
                ["mythic"] = "{rt8}Talonghast{rt8}||at 75% transitions, random warlock spec; [Chaos Rain / Immolate / Unstable Affliction] dispel||{rt1}Must interrupt: [Drain Life][Fel Rain][Chaos Bolt][Immolate]{rt1}||affliction [Seed of Evil] marked runs from group; demon [Chaos Wave] dodge; heroic [Abyssal Fiend] kite",
                ["mythicplus"] = "{rt8}Talonghast{rt8}||at 75% transitions, random warlock spec; [Chaos Rain / Immolate / Unstable Affliction] dispel||{rt1}Must interrupt: [Drain Life][Fel Rain][Chaos Bolt][Immolate]{rt1}||affliction [Seed of Evil] marked runs from group; demon [Chaos Wave] dodge; heroic [Abyssal Fiend] kite",
            },
        },
        ["缚魂者尼娅米"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Soulbinder Nyami{rt8}||[Soul Vessel] stand in the center safe zone, outer ring takes damage; priority kill summoned adds||{rt1}Must interrupt: [Arbiter's Hammer][Arcane Bolt]{rt1}||[Mind Blast][Shadow Word: Pain]; entangled mage [Arcane Bomb] touch orb / explodes on expiry",
                ["normal"] = "{rt8}Soulbinder Nyami{rt8}||[Soul Vessel] stand in the center safe zone, outer ring takes damage; priority kill summoned adds||{rt1}Must interrupt: [Arbiter's Hammer][Arcane Bolt]{rt1}||[Mind Blast][Shadow Word: Pain]; entangled mage [Arcane Bomb] touch orb / explodes on expiry",
                ["heroic"] = "{rt8}Soulbinder Nyami{rt8}||[Soul Vessel] stand in the center safe zone, outer ring takes damage; priority kill summoned adds||{rt1}Must interrupt: [Arbiter's Hammer][Arcane Bolt]{rt1}||[Mind Blast][Shadow Word: Pain]; entangled mage [Arcane Bomb] touch orb / explodes on expiry",
                ["mythic"] = "{rt8}Soulbinder Nyami{rt8}||[Soul Vessel] stand in the center safe zone, outer ring takes damage; priority kill summoned adds||{rt1}Must interrupt: [Arbiter's Hammer][Arcane Bolt]{rt1}||[Mind Blast][Shadow Word: Pain]; entangled mage [Arcane Bomb] touch orb / explodes on expiry",
                ["mythicplus"] = "{rt8}Soulbinder Nyami{rt8}||[Soul Vessel] stand in the center safe zone, outer ring takes damage; priority kill summoned adds||{rt1}Must interrupt: [Arbiter's Hammer][Arcane Bolt]{rt1}||[Mind Blast][Shadow Word: Pain]; entangled mage [Arcane Bomb] touch orb / explodes on expiry",
            },
        },
        ["警戒者凯萨尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Watcher Kethiel{rt8}||[Hallowed Ground] spawn—step away immediately; [Consecration Light] while casting hide behind [Holy Shield]||{rt1}don't stand: [Consecrated Strike] rift and [Hallowed Ground]{rt1}||heroic [Fate] detonates all Hallowed Ground—see circle, move away; tank pulls boss away from shield",
                ["normal"] = "{rt8}Watcher Kethiel{rt8}||[Hallowed Ground] spawn—step away immediately; [Consecration Light] while casting hide behind [Holy Shield]||{rt1}don't stand: [Consecrated Strike] rift and [Hallowed Ground]{rt1}||heroic [Fate] detonates all Hallowed Ground—see circle, move away; tank pulls boss away from shield",
                ["heroic"] = "{rt8}Watcher Kethiel{rt8}||[Hallowed Ground] spawn—step away immediately; [Consecration Light] while casting hide behind [Holy Shield]||{rt1}don't stand: [Consecrated Strike] rift and [Hallowed Ground]{rt1}||heroic [Fate] detonates all Hallowed Ground—see circle, move away; tank pulls boss away from shield",
                ["mythic"] = "{rt8}Watcher Kethiel{rt8}||[Hallowed Ground] spawn—step away immediately; [Consecration Light] while casting hide behind [Holy Shield]||{rt1}don't stand: [Consecrated Strike] rift and [Hallowed Ground]{rt1}||heroic [Fate] detonates all Hallowed Ground—see circle, move away; tank pulls boss away from shield",
                ["mythicplus"] = "{rt8}Watcher Kethiel{rt8}||[Hallowed Ground] spawn—step away immediately; [Consecration Light] while casting hide behind [Holy Shield]||{rt1}don't stand: [Consecrated Strike] rift and [Hallowed Ground]{rt1}||heroic [Fate] detonates all Hallowed Ground—see circle, move away; tank pulls boss away from shield",
            },
        },
        ["阿扎凯尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Azakel{rt8}||during transition invulnerable summons adds: demon guards tank pulls away, Flame Trickster focus||{rt1}Must interrupt: [Laughing Pyromaniac] fire spells{rt1}||[Flame Curtain] spread don't overlap; fire pool [Fel Pool] dodge; clear summons fast",
                ["normal"] = "{rt8}Azakel{rt8}||during transition invulnerable summons adds: demon guards tank pulls away, Flame Trickster focus||{rt1}Must interrupt: [Laughing Pyromaniac] fire spells{rt1}||[Flame Curtain] spread don't overlap; fire pool [Fel Pool] dodge; clear summons fast",
                ["heroic"] = "{rt8}Azakel{rt8}||during transition invulnerable summons adds: demon guards tank pulls away, Flame Trickster focus||{rt1}Must interrupt: [Laughing Pyromaniac] fire spells{rt1}||[Flame Curtain] spread don't overlap; fire pool [Fel Pool] dodge; clear summons fast",
                ["mythic"] = "{rt8}Azakel{rt8}||during transition invulnerable summons adds: demon guards tank pulls away, Flame Trickster focus||{rt1}Must interrupt: [Laughing Pyromaniac] fire spells{rt1}||[Flame Curtain] spread don't overlap; fire pool [Fel Pool] dodge; clear summons fast",
                ["mythicplus"] = "{rt8}Azakel{rt8}||during transition invulnerable summons adds: demon guards tank pulls away, Flame Trickster focus||{rt1}Must interrupt: [Laughing Pyromaniac] fire spells{rt1}||[Flame Curtain] spread don't overlap; fire pool [Fel Pool] dodge; clear summons fast",
            },
        },
        ["萨格雷魔导师"] = {
            type = "MOB",
            tips = "{rt8}Shattrath Arcanist{rt8}||[Arcane Bomb] orb touch or expiry explodes—keep moving and spread||{rt1}Must interrupt: [Arcane Bolt]{rt1}||corridor trash isn't dangerous but shares the boss's abilities—learn them early",
        },
        ["萨格雷慰魂者"] = {
            type = "MOB",
            tips = "{rt8}Shattrath Soother{rt8}||[Void Transfer] health-swap can't be interrupted; [Void Mend] can be interrupted and the heal is dispellable||{rt1}Must interrupt: [Void Mend]{rt1}||healers prioritize CC-killing to avoid mobs being heavily healed",
        },
    },
    ["血槌炉渣矿井"] = {
        name = "Bloodmaul Slag Mines",
        ["守奴人库鲁斯托"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kur'talos the Slave-Watcher{rt8}||dodge frontal [Earthshatter Stomp] and the [Crushing Leap] mark; priority kill enslaved enemy miners||{rt1}Must interrupt: [Frenzied Bellow] damage buff or the group wipes{rt1}||[Shattering Smash] knocks back whole group; the marked gets focused by miners and ignores taunt—healer keep up",
                ["normal"] = "{rt8}Kur'talos the Slave-Watcher{rt8}||dodge frontal [Earthshatter Stomp] and the [Crushing Leap] mark; priority kill enslaved enemy miners||{rt1}Must interrupt: [Frenzied Bellow] damage buff or the group wipes{rt1}||[Shattering Smash] knocks back whole group; the marked gets focused by miners and ignores taunt—healer keep up",
                ["heroic"] = "{rt8}Kur'talos the Slave-Watcher{rt8}||dodge frontal [Earthshatter Stomp] and the [Crushing Leap] mark; priority kill enslaved enemy miners||{rt1}Must interrupt: [Frenzied Bellow] damage buff or the group wipes{rt1}||[Shattering Smash] knocks back whole group; the marked gets focused by miners and ignores taunt—healer keep up",
                ["mythic"] = "{rt8}Kur'talos the Slave-Watcher{rt8}||dodge frontal [Earthshatter Stomp] and the [Crushing Leap] mark; priority kill enslaved enemy miners||{rt1}Must interrupt: [Frenzied Bellow] damage buff or the group wipes{rt1}||[Shattering Smash] knocks back whole group; the marked gets focused by miners and ignores taunt—healer keep up",
                ["mythicplus"] = "{rt8}Kur'talos the Slave-Watcher{rt8}||dodge frontal [Earthshatter Stomp] and the [Crushing Leap] mark; priority kill enslaved enemy miners||{rt1}Must interrupt: [Frenzied Bellow] damage buff or the group wipes{rt1}||[Shattering Smash] knocks back whole group; the marked gets focused by miners and ignores taunt—healer keep up",
            },
        },
        ["戈洛克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gor'lok{rt8}||when lava appears at your feet, reposition; priority kill [Unstable Slag] before it reaches the furnace||{rt1}Must interrupt: [Molten Impact] to prevent [Lava Core] stacking{rt1}||[Lava Burst] spawns lava at your feet; dispel [Searing Burn] fire damage buff; 3 stacks of core triggers [Lava Barrage]",
                ["normal"] = "{rt8}Gor'lok{rt8}||when lava appears at your feet, reposition; priority kill [Unstable Slag] before it reaches the furnace||{rt1}Must interrupt: [Molten Impact] to prevent [Lava Core] stacking{rt1}||[Lava Burst] spawns lava at your feet; dispel [Searing Burn] fire damage buff; 3 stacks of core triggers [Lava Barrage]",
                ["heroic"] = "{rt8}Gor'lok{rt8}||when lava appears at your feet, reposition; priority kill [Unstable Slag] before it reaches the furnace||{rt1}Must interrupt: [Molten Impact] to prevent [Lava Core] stacking{rt1}||[Lava Burst] spawns lava at your feet; dispel [Searing Burn] fire damage buff; 3 stacks of core triggers [Lava Barrage]",
                ["mythic"] = "{rt8}Gor'lok{rt8}||when lava appears at your feet, reposition; priority kill [Unstable Slag] before it reaches the furnace||{rt1}Must interrupt: [Molten Impact] to prevent [Lava Core] stacking{rt1}||[Lava Burst] spawns lava at your feet; dispel [Searing Burn] fire damage buff; 3 stacks of core triggers [Lava Barrage]",
                ["mythicplus"] = "{rt8}Gor'lok{rt8}||when lava appears at your feet, reposition; priority kill [Unstable Slag] before it reaches the furnace||{rt1}Must interrupt: [Molten Impact] to prevent [Lava Core] stacking{rt1}||[Lava Burst] spawns lava at your feet; dispel [Searing Burn] fire damage buff; 3 stacks of core triggers [Lava Barrage]",
            },
        },
        ["罗托尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Roltall{rt8}||stand at the bridge edge to dodge [Fire Bombardment]; move along the bridge to avoid being pushed into [Searing Slag] by [Heat Wave]||{rt1}heroic [Fire Bombardment] returns—watch behind you{rt1}||[Heat Wave] burns and knocks back each second; ranged stay away to avoid [Searing Aura] slow casting",
                ["normal"] = "{rt8}Roltall{rt8}||stand at the bridge edge to dodge [Fire Bombardment]; move along the bridge to avoid being pushed into [Searing Slag] by [Heat Wave]||{rt1}heroic [Fire Bombardment] returns—watch behind you{rt1}||[Heat Wave] burns and knocks back each second; ranged stay away to avoid [Searing Aura] slow casting",
                ["heroic"] = "{rt8}Roltall{rt8}||stand at the bridge edge to dodge [Fire Bombardment]; move along the bridge to avoid being pushed into [Searing Slag] by [Heat Wave]||{rt1}heroic [Fire Bombardment] returns—watch behind you{rt1}||[Heat Wave] burns and knocks back each second; ranged stay away to avoid [Searing Aura] slow casting",
                ["mythic"] = "{rt8}Roltall{rt8}||stand at the bridge edge to dodge [Fire Bombardment]; move along the bridge to avoid being pushed into [Searing Slag] by [Heat Wave]||{rt1}heroic [Fire Bombardment] returns—watch behind you{rt1}||[Heat Wave] burns and knocks back each second; ranged stay away to avoid [Searing Aura] slow casting",
                ["mythicplus"] = "{rt8}Roltall{rt8}||stand at the bridge edge to dodge [Fire Bombardment]; move along the bridge to avoid being pushed into [Searing Slag] by [Heat Wave]||{rt1}heroic [Fire Bombardment] returns—watch behind you{rt1}||[Heat Wave] burns and knocks back each second; ranged stay away to avoid [Searing Aura] slow casting",
            },
        },
        ["玛格莫拉图斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Magmolatus{rt8}||first kill the fire elementals the forgemaster summons; after low health [Magma Momma] enters the fight||{rt1}Must interrupt: [Flame Storm] and [Dancing Flame / Withering Flame]{rt1}||[Crushing Smash][Slag Smash] high damage with stun; priority kill [Lava Elemental]; dispel [Dancing Flame][Withering Flame]",
                ["normal"] = "{rt8}Magmolatus{rt8}||first kill the fire elementals the forgemaster summons; after low health [Magma Momma] enters the fight||{rt1}Must interrupt: [Flame Storm] and [Dancing Flame / Withering Flame]{rt1}||[Crushing Smash][Slag Smash] high damage with stun; priority kill [Lava Elemental]; dispel [Dancing Flame][Withering Flame]",
                ["heroic"] = "{rt8}Magmolatus{rt8}||first kill the fire elementals the forgemaster summons; after low health [Magma Momma] enters the fight||{rt1}Must interrupt: [Flame Storm] and [Dancing Flame / Withering Flame]{rt1}||[Crushing Smash][Slag Smash] high damage with stun; priority kill [Lava Elemental]; dispel [Dancing Flame][Withering Flame]",
                ["mythic"] = "{rt8}Magmolatus{rt8}||first kill the fire elementals the forgemaster summons; after low health [Magma Momma] enters the fight||{rt1}Must interrupt: [Flame Storm] and [Dancing Flame / Withering Flame]{rt1}||[Crushing Smash][Slag Smash] high damage with stun; priority kill [Lava Elemental]; dispel [Dancing Flame][Withering Flame]",
                ["mythicplus"] = "{rt8}Magmolatus{rt8}||first kill the fire elementals the forgemaster summons; after low health [Magma Momma] enters the fight||{rt1}Must interrupt: [Flame Storm] and [Dancing Flame / Withering Flame]{rt1}||[Crushing Smash][Slag Smash] high damage with stun; priority kill [Lava Elemental]; dispel [Dancing Flame][Withering Flame]",
            },
        },
        ["血槌苦工"] = {
            type = "MOB",
            tips = "{rt8}Bloodmaul Laborer{rt8}||control / focus the shadow casters, avoid the purple smoke [Silence] pool stacking||{rt1}Priority kill: the caster summoning purple smoke{rt1}||before Roltall's bridge there are multiple patrols—engage in place to avoid pulling them",
        },
    },
    ["恐轨车站"] = {
        name = "Iron Docks",
        ["黑石火炮手"] = {
            type = "MOB",
            tips = "{rt8}Blackrock Gunner & Heavy Trooper{rt8}||[Suppressing Fire] similar—hide behind cover; Heavy [Charge] dodge sideways||{rt1}control: focus the gunner{rt1}||station platform has many corners—use cover for line of sight",
        },
        ["箭火和波尔卡"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Arrowburn and Polka{rt8}||tank aims [Berserker Charge] at the rocket light to interrupt [Missile Barrage]; dodge red circles and [VX18 Target Eliminator]||{rt1}tank: [Berserker Charge] hit the rocket light to break missiles{rt1}||Polka [Slam][Crusher] raids-wide; rocket light [Lock On] damage buff needs interrupt; Polka dies → rocket light enrages",
                ["normal"] = "{rt8}Arrowburn and Polka{rt8}||tank aims [Berserker Charge] at the rocket light to interrupt [Missile Barrage]; dodge red circles and [VX18 Target Eliminator]||{rt1}tank: [Berserker Charge] hit the rocket light to break missiles{rt1}||Polka [Slam][Crusher] raids-wide; rocket light [Lock On] damage buff needs interrupt; Polka dies → rocket light enrages",
                ["heroic"] = "{rt8}Arrowburn and Polka{rt8}||tank aims [Berserker Charge] at the rocket light to interrupt [Missile Barrage]; dodge red circles and [VX18 Target Eliminator]||{rt1}tank: [Berserker Charge] hit the rocket light to break missiles{rt1}||Polka [Slam][Crusher] raids-wide; rocket light [Lock On] damage buff needs interrupt; Polka dies → rocket light enrages",
                ["mythic"] = "{rt8}Arrowburn and Polka{rt8}||tank aims [Berserker Charge] at the rocket light to interrupt [Missile Barrage]; dodge red circles and [VX18 Target Eliminator]||{rt1}tank: [Berserker Charge] hit the rocket light to break missiles{rt1}||Polka [Slam][Crusher] raids-wide; rocket light [Lock On] damage buff needs interrupt; Polka dies → rocket light enrages",
                ["mythicplus"] = "{rt8}Arrowburn and Polka{rt8}||tank aims [Berserker Charge] at the rocket light to interrupt [Missile Barrage]; dodge red circles and [VX18 Target Eliminator]||{rt1}tank: [Berserker Charge] hit the rocket light to break missiles{rt1}||Polka [Slam][Crusher] raids-wide; rocket light [Lock On] damage buff needs interrupt; Polka dies → rocket light enrages",
            },
        },
        ["啸天者托瓦拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Howling Banshee Tovra{rt8}||[Spinning Spear] the marked moves away from group; don't step on [Freezing Trap]; don't stand in [Diffusion Energy] pool||{rt1}dodge: [Spinning Spear][Thunder Breath] raid-wide{rt1}||heroic [Hunter's Mark] drops [Explosive Spear] reposition; trap root use freedom—can't dispel",
                ["normal"] = "{rt8}Howling Banshee Tovra{rt8}||[Spinning Spear] the marked moves away from group; don't step on [Freezing Trap]; don't stand in [Diffusion Energy] pool||{rt1}dodge: [Spinning Spear][Thunder Breath] raid-wide{rt1}||heroic [Hunter's Mark] drops [Explosive Spear] reposition; trap root use freedom—can't dispel",
                ["heroic"] = "{rt8}Howling Banshee Tovra{rt8}||[Spinning Spear] the marked moves away from group; don't step on [Freezing Trap]; don't stand in [Diffusion Energy] pool||{rt1}dodge: [Spinning Spear][Thunder Breath] raid-wide{rt1}||heroic [Hunter's Mark] drops [Explosive Spear] reposition; trap root use freedom—can't dispel",
                ["mythic"] = "{rt8}Howling Banshee Tovra{rt8}||[Spinning Spear] the marked moves away from group; don't step on [Freezing Trap]; don't stand in [Diffusion Energy] pool||{rt1}dodge: [Spinning Spear][Thunder Breath] raid-wide{rt1}||heroic [Hunter's Mark] drops [Explosive Spear] reposition; trap root use freedom—can't dispel",
                ["mythicplus"] = "{rt8}Howling Banshee Tovra{rt8}||[Spinning Spear] the marked moves away from group; don't step on [Freezing Trap]; don't stand in [Diffusion Energy] pool||{rt1}dodge: [Spinning Spear][Thunder Breath] raid-wide{rt1}||heroic [Hunter's Mark] drops [Explosive Spear] reposition; trap root use freedom—can't dispel",
            },
        },
        ["尼托格·雷塔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Nitrog Quikfuse{rt8}||at 60% flees toward the cannon; kill [Bombers], grab [Blackrock Shells] and man the cannon to bombard; [Suppressing Fire] hide behind cover||{rt1}clear fast: Bombers drop shells—mount cannon{rt1}||continuous adds need tanking; [Blackrock Mortar][Blackrock Grenade] dodge landing; after cannon destroyed, kill directly",
                ["normal"] = "{rt8}Nitrog Quikfuse{rt8}||at 60% flees toward the cannon; kill [Bombers], grab [Blackrock Shells] and man the cannon to bombard; [Suppressing Fire] hide behind cover||{rt1}clear fast: Bombers drop shells—mount cannon{rt1}||continuous adds need tanking; [Blackrock Mortar][Blackrock Grenade] dodge landing; after cannon destroyed, kill directly",
                ["heroic"] = "{rt8}Nitrog Quikfuse{rt8}||at 60% flees toward the cannon; kill [Bombers], grab [Blackrock Shells] and man the cannon to bombard; [Suppressing Fire] hide behind cover||{rt1}clear fast: Bombers drop shells—mount cannon{rt1}||continuous adds need tanking; [Blackrock Mortar][Blackrock Grenade] dodge landing; after cannon destroyed, kill directly",
                ["mythic"] = "{rt8}Nitrog Quikfuse{rt8}||at 60% flees toward the cannon; kill [Bombers], grab [Blackrock Shells] and man the cannon to bombard; [Suppressing Fire] hide behind cover||{rt1}clear fast: Bombers drop shells—mount cannon{rt1}||continuous adds need tanking; [Blackrock Mortar][Blackrock Grenade] dodge landing; after cannon destroyed, kill directly",
                ["mythicplus"] = "{rt8}Nitrog Quikfuse{rt8}||at 60% flees toward the cannon; kill [Bombers], grab [Blackrock Shells] and man the cannon to bombard; [Suppressing Fire] hide behind cover||{rt1}clear fast: Bombers drop shells—mount cannon{rt1}||continuous adds need tanking; [Blackrock Mortar][Blackrock Grenade] dodge landing; after cannon destroyed, kill directly",
            },
        },
        ["恐轨炮击走廊"] = {
            type = "MOB",
            tips = "{rt8}Fear-Rail Barrage Corridor{rt8}||train bombardment zone; when [Artillery Cover] hide behind box / pillar and push forward, don't fall to the ship's stern and eat the backfire||{rt1}push fast: keep moving, don't stop{rt1}||same mechanic as the captain fight; pausing gets you artillery-covered and one-shot",
        },
    },
    ["通天峰"] = {
        name = "Skyreach",
        ["兰吉特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ranjit{rt8}||[Wind Wall] spawn—position before it; [Disc Vortex] when split into 4 quadrants, run in the same direction||{rt1}side-step: [Piercing Rush]{rt1}||heroic [Lens Flare] random mark drops [Blazing Ground] at edge; start with Bloodlust on the easiest phase",
                ["normal"] = "{rt8}Ranjit{rt8}||[Wind Wall] spawn—position before it; [Disc Vortex] when split into 4 quadrants, run in the same direction||{rt1}side-step: [Piercing Rush]{rt1}||heroic [Lens Flare] random mark drops [Blazing Ground] at edge; start with Bloodlust on the easiest phase",
                ["heroic"] = "{rt8}Ranjit{rt8}||[Wind Wall] spawn—position before it; [Disc Vortex] when split into 4 quadrants, run in the same direction||{rt1}side-step: [Piercing Rush]{rt1}||heroic [Lens Flare] random mark drops [Blazing Ground] at edge; start with Bloodlust on the easiest phase",
                ["mythic"] = "{rt8}Ranjit{rt8}||[Wind Wall] spawn—position before it; [Disc Vortex] when split into 4 quadrants, run in the same direction||{rt1}side-step: [Piercing Rush]{rt1}||heroic [Lens Flare] random mark drops [Blazing Ground] at edge; start with Bloodlust on the easiest phase",
                ["mythicplus"] = "{rt8}Ranjit{rt8}||[Wind Wall] spawn—position before it; [Disc Vortex] when split into 4 quadrants, run in the same direction||{rt1}side-step: [Piercing Rush]{rt1}||heroic [Lens Flare] random mark drops [Blazing Ground] at edge; start with Bloodlust on the easiest phase",
            },
        },
        ["阿拉卡纳斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Arakna{rt8}||stand in the sunlight beam to block [Charging] and heal; [Blast] raid damage escalates each time||{rt1}side-step: [Shatter] left/right arm slam{rt1}||sun prototype beam keeps healing—multiple players block light; soft enrage—watch mana",
                ["normal"] = "{rt8}Arakna{rt8}||stand in the sunlight beam to block [Charging] and heal; [Blast] raid damage escalates each time||{rt1}side-step: [Shatter] left/right arm slam{rt1}||sun prototype beam keeps healing—multiple players block light; soft enrage—watch mana",
                ["heroic"] = "{rt8}Arakna{rt8}||stand in the sunlight beam to block [Charging] and heal; [Blast] raid damage escalates each time||{rt1}side-step: [Shatter] left/right arm slam{rt1}||sun prototype beam keeps healing—multiple players block light; soft enrage—watch mana",
                ["mythic"] = "{rt8}Arakna{rt8}||stand in the sunlight beam to block [Charging] and heal; [Blast] raid damage escalates each time||{rt1}side-step: [Shatter] left/right arm slam{rt1}||sun prototype beam keeps healing—multiple players block light; soft enrage—watch mana",
                ["mythicplus"] = "{rt8}Arakna{rt8}||stand in the sunlight beam to block [Charging] and heal; [Blast] raid damage escalates each time||{rt1}side-step: [Shatter] left/right arm slam{rt1}||sun prototype beam keeps healing—multiple players block light; soft enrage—watch mana",
            },
        },
        ["高阶贤者维里克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Sage Viryx{rt8}||[Blazing Ground] random mark—drop at edge; [Summon Sunspear] dodge before landing||{rt1}Must interrupt: [Solar Wrath]{rt1}||[Brilliant Shield] charge dodge; spawns [Sharp-Eye] focus; platform edge—don't get blown off",
                ["normal"] = "{rt8}High Sage Viryx{rt8}||[Blazing Ground] random mark—drop at edge; [Summon Sunspear] dodge before landing||{rt1}Must interrupt: [Solar Wrath]{rt1}||[Brilliant Shield] charge dodge; spawns [Sharp-Eye] focus; platform edge—don't get blown off",
                ["heroic"] = "{rt8}High Sage Viryx{rt8}||[Blazing Ground] random mark—drop at edge; [Summon Sunspear] dodge before landing||{rt1}Must interrupt: [Solar Wrath]{rt1}||[Brilliant Shield] charge dodge; spawns [Sharp-Eye] focus; platform edge—don't get blown off",
                ["mythic"] = "{rt8}High Sage Viryx{rt8}||[Blazing Ground] random mark—drop at edge; [Summon Sunspear] dodge before landing||{rt1}Must interrupt: [Solar Wrath]{rt1}||[Brilliant Shield] charge dodge; spawns [Sharp-Eye] focus; platform edge—don't get blown off",
                ["mythicplus"] = "{rt8}High Sage Viryx{rt8}||[Blazing Ground] random mark—drop at edge; [Summon Sunspear] dodge before landing||{rt1}Must interrupt: [Solar Wrath]{rt1}||[Brilliant Shield] charge dodge; spawns [Sharp-Eye] focus; platform edge—don't get blown off",
            },
        },
        ["鲁克兰"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rukhran{rt8}||[Piercing Quill] while casting hide behind the central pillar for line of sight; [Ember Feather] spawns—clear fast||{rt1}Must interrupt / clear: [Shrill] and [Blazing Feather]{rt1}||platform has only one pillar—whole group huddles for cover; wind blows players—watch positioning",
                ["normal"] = "{rt8}Rukhran{rt8}||[Piercing Quill] while casting hide behind the central pillar for line of sight; [Ember Feather] spawns—clear fast||{rt1}Must interrupt / clear: [Shrill] and [Blazing Feather]{rt1}||platform has only one pillar—whole group huddles for cover; wind blows players—watch positioning",
                ["heroic"] = "{rt8}Rukhran{rt8}||[Piercing Quill] while casting hide behind the central pillar for line of sight; [Ember Feather] spawns—clear fast||{rt1}Must interrupt / clear: [Shrill] and [Blazing Feather]{rt1}||platform has only one pillar—whole group huddles for cover; wind blows players—watch positioning",
                ["mythic"] = "{rt8}Rukhran{rt8}||[Piercing Quill] while casting hide behind the central pillar for line of sight; [Ember Feather] spawns—clear fast||{rt1}Must interrupt / clear: [Shrill] and [Blazing Feather]{rt1}||platform has only one pillar—whole group huddles for cover; wind blows players—watch positioning",
                ["mythicplus"] = "{rt8}Rukhran{rt8}||[Piercing Quill] while casting hide behind the central pillar for line of sight; [Ember Feather] spawns—clear fast||{rt1}Must interrupt / clear: [Shrill] and [Blazing Feather]{rt1}||platform has only one pillar—whole group huddles for cover; wind blows players—watch positioning",
            },
        },
        ["飞盘大师"] = {
            type = "MOB",
            tips = "{rt8}Disc Master{rt8}||[Spinning Blade] raid-wide damage—spread||{rt1}dodge: [Spinning Blade] sweep{rt1}||same area as Sun Priest—prioritize CC-killing the threatening casters",
        },
        ["太阳元素"] = {
            type = "MOB",
            tips = "{rt8}Solar Elemental{rt8}||[Solar Heal] heals enemies to full; [Sun's Fury / Flame Burst] must interrupt||{rt1}Must interrupt: [Flame Burst]{rt1}||priority kill Solar Elementals and Sun Priests to avoid enemies being healed",
        },
    },
    ["永茂林地"] = {
        name = "The Everbloom",
        ["艾里塔克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Eritak{rt8}||[Web Spray] split front/back into two halves to dodge; [Venom Sac Spray] mark drop at edge||{rt1}Must interrupt: [Web Wrap] root / [Toxic Barrage]{rt1}||small spiders [Venom] focus; heroic [Web] traps people—need rescuing",
                ["normal"] = "{rt8}Eritak{rt8}||[Web Spray] split front/back into two halves to dodge; [Venom Sac Spray] mark drop at edge||{rt1}Must interrupt: [Web Wrap] root / [Toxic Barrage]{rt1}||small spiders [Venom] focus; heroic [Web] traps people—need rescuing",
                ["heroic"] = "{rt8}Eritak{rt8}||[Web Spray] split front/back into two halves to dodge; [Venom Sac Spray] mark drop at edge||{rt1}Must interrupt: [Web Wrap] root / [Toxic Barrage]{rt1}||small spiders [Venom] focus; heroic [Web] traps people—need rescuing",
                ["mythic"] = "{rt8}Eritak{rt8}||[Web Spray] split front/back into two halves to dodge; [Venom Sac Spray] mark drop at edge||{rt1}Must interrupt: [Web Wrap] root / [Toxic Barrage]{rt1}||small spiders [Venom] focus; heroic [Web] traps people—need rescuing",
                ["mythicplus"] = "{rt8}Eritak{rt8}||[Web Spray] split front/back into two halves to dodge; [Venom Sac Spray] mark drop at edge||{rt1}Must interrupt: [Web Wrap] root / [Toxic Barrage]{rt1}||small spiders [Venom] focus; heroic [Web] traps people—need rescuing",
            },
        },
        ["雅努"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Janu{rt8}||during [Genesis] step on grass to kill [Sprout] before it becomes [Wild Lasher]; protect Archmage Bai Hu||{rt1}dodge: [Mighty Smash] frontal cone stun{rt1}||[Verdant Eruption] treant roots tank; Bai Hu [Wildfire] +300% damage; lush treants block her casts—burst them",
                ["normal"] = "{rt8}Janu{rt8}||during [Genesis] step on grass to kill [Sprout] before it becomes [Wild Lasher]; protect Archmage Bai Hu||{rt1}dodge: [Mighty Smash] frontal cone stun{rt1}||[Verdant Eruption] treant roots tank; Bai Hu [Wildfire] +300% damage; lush treants block her casts—burst them",
                ["heroic"] = "{rt8}Janu{rt8}||during [Genesis] step on grass to kill [Sprout] before it becomes [Wild Lasher]; protect Archmage Bai Hu||{rt1}dodge: [Mighty Smash] frontal cone stun{rt1}||[Verdant Eruption] treant roots tank; Bai Hu [Wildfire] +300% damage; lush treants block her casts—burst them",
                ["mythic"] = "{rt8}Janu{rt8}||during [Genesis] step on grass to kill [Sprout] before it becomes [Wild Lasher]; protect Archmage Bai Hu||{rt1}dodge: [Mighty Smash] frontal cone stun{rt1}||[Verdant Eruption] treant roots tank; Bai Hu [Wildfire] +300% damage; lush treants block her casts—burst them",
                ["mythicplus"] = "{rt8}Janu{rt8}||during [Genesis] step on grass to kill [Sprout] before it becomes [Wild Lasher]; protect Archmage Bai Hu||{rt1}dodge: [Mighty Smash] frontal cone stun{rt1}||[Verdant Eruption] treant roots tank; Bai Hu [Wildfire] +300% damage; lush treants block her casts—burst them",
            },
        },
        ["远古的保卫者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ancient Protector{rt8}||interrupt [Awaken] heal and [Venom Bloom] raid stun; [Venom Charge] mark dodge||{rt1}Must interrupt: [Awaken][Venom Bloom]{rt1}||[Water Fury][Earth Fury] raid DoT; Druid [Venom Charge] after 4s slams—leave a gap; spread",
                ["normal"] = "{rt8}Ancient Protector{rt8}||interrupt [Awaken] heal and [Venom Bloom] raid stun; [Venom Charge] mark dodge||{rt1}Must interrupt: [Awaken][Venom Bloom]{rt1}||[Water Fury][Earth Fury] raid DoT; Druid [Venom Charge] after 4s slams—leave a gap; spread",
                ["heroic"] = "{rt8}Ancient Protector{rt8}||interrupt [Awaken] heal and [Venom Bloom] raid stun; [Venom Charge] mark dodge||{rt1}Must interrupt: [Awaken][Venom Bloom]{rt1}||[Water Fury][Earth Fury] raid DoT; Druid [Venom Charge] after 4s slams—leave a gap; spread",
                ["mythic"] = "{rt8}Ancient Protector{rt8}||interrupt [Awaken] heal and [Venom Bloom] raid stun; [Venom Charge] mark dodge||{rt1}Must interrupt: [Awaken][Venom Bloom]{rt1}||[Water Fury][Earth Fury] raid DoT; Druid [Venom Charge] after 4s slams—leave a gap; spread",
                ["mythicplus"] = "{rt8}Ancient Protector{rt8}||interrupt [Awaken] heal and [Venom Bloom] raid stun; [Venom Charge] mark dodge||{rt1}Must interrupt: [Awaken][Venom Bloom]{rt1}||[Water Fury][Earth Fury] raid DoT; Druid [Venom Charge] after 4s slams—leave a gap; spread",
            },
        },
        ["大法师索尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Archmage Sol{rt8}||after [Frost Nova] back off; dodge [Arcane Orb] rolling; [Time Warp] speeds up mobs||{rt1}Must interrupt: [Frostbolt][Flame Storm]{rt1}||heroic [Time Rift] summons past self; [Arcane Explosion] spread; control trash",
                ["normal"] = "{rt8}Archmage Sol{rt8}||after [Frost Nova] back off; dodge [Arcane Orb] rolling; [Time Warp] speeds up mobs||{rt1}Must interrupt: [Frostbolt][Flame Storm]{rt1}||heroic [Time Rift] summons past self; [Arcane Explosion] spread; control trash",
                ["heroic"] = "{rt8}Archmage Sol{rt8}||after [Frost Nova] back off; dodge [Arcane Orb] rolling; [Time Warp] speeds up mobs||{rt1}Must interrupt: [Frostbolt][Flame Storm]{rt1}||heroic [Time Rift] summons past self; [Arcane Explosion] spread; control trash",
                ["mythic"] = "{rt8}Archmage Sol{rt8}||after [Frost Nova] back off; dodge [Arcane Orb] rolling; [Time Warp] speeds up mobs||{rt1}Must interrupt: [Frostbolt][Flame Storm]{rt1}||heroic [Time Rift] summons past self; [Arcane Explosion] spread; control trash",
                ["mythicplus"] = "{rt8}Archmage Sol{rt8}||after [Frost Nova] back off; dodge [Arcane Orb] rolling; [Time Warp] speeds up mobs||{rt1}Must interrupt: [Frostbolt][Flame Storm]{rt1}||heroic [Time Rift] summons past self; [Arcane Explosion] spread; control trash",
            },
        },
        ["腐化孢子"] = {
            type = "MOB",
            tips = "{rt8}Corrupt Spores & Overgrowth Thorns{rt8}||[Wrath of Nature] DoT raid-wide; [Thorn Entangle] root—break free fast||{rt1}Must interrupt: [Corrupt Spore Spray]{rt1}||Evergreen Thorns [Entangle] control, prioritize clearing small spider swarms to avoid stacking",
        },
        ["枯木"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Withered Wood{rt8}||pull away from [Erratic Growth] vines; [Charred Breath] cone at tank; hit water orb before it arrives||{rt1}control: heroic [Erratic Growth] keeps spawning{rt1}||[Brittle Bark] phase focus; water orb [Water Burst] kills—whole-group damage; water orb touching vine activates it into a mob",
                ["normal"] = "{rt8}Withered Wood{rt8}||pull away from [Erratic Growth] vines; [Charred Breath] cone at tank; hit water orb before it arrives||{rt1}control: heroic [Erratic Growth] keeps spawning{rt1}||[Brittle Bark] phase focus; water orb [Water Burst] kills—whole-group damage; water orb touching vine activates it into a mob",
                ["heroic"] = "{rt8}Withered Wood{rt8}||pull away from [Erratic Growth] vines; [Charred Breath] cone at tank; hit water orb before it arrives||{rt1}control: heroic [Erratic Growth] keeps spawning{rt1}||[Brittle Bark] phase focus; water orb [Water Burst] kills—whole-group damage; water orb touching vine activates it into a mob",
                ["mythic"] = "{rt8}Withered Wood{rt8}||pull away from [Erratic Growth] vines; [Charred Breath] cone at tank; hit water orb before it arrives||{rt1}control: heroic [Erratic Growth] keeps spawning{rt1}||[Brittle Bark] phase focus; water orb [Water Burst] kills—whole-group damage; water orb touching vine activates it into a mob",
                ["mythicplus"] = "{rt8}Withered Wood{rt8}||pull away from [Erratic Growth] vines; [Charred Breath] cone at tank; hit water orb before it arrives||{rt1}control: heroic [Erratic Growth] keeps spawning{rt1}||[Brittle Bark] phase focus; water orb [Water Burst] kills—whole-group damage; water orb touching vine activates it into a mob",
            },
        },
    },
    ["影月墓地"] = {
        name = "Shadowmoon Burial Grounds",
        ["骨喉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Bonemaw{rt8}||during [Inhale] get sucked—stand in [Necrotic Slime] to avoid being swallowed; [Body Slam] purple light dodge landing||{rt1}dodge: [Putrid Breath] ground{rt1}||slime pool [Necrosis] continuous damage—don't stand normally; heroic feed 25 corpse spiders achievement",
                ["normal"] = "{rt8}Bonemaw{rt8}||during [Inhale] get sucked—stand in [Necrotic Slime] to avoid being swallowed; [Body Slam] purple light dodge landing||{rt1}dodge: [Putrid Breath] ground{rt1}||slime pool [Necrosis] continuous damage—don't stand normally; heroic feed 25 corpse spiders achievement",
                ["heroic"] = "{rt8}Bonemaw{rt8}||during [Inhale] get sucked—stand in [Necrotic Slime] to avoid being swallowed; [Body Slam] purple light dodge landing||{rt1}dodge: [Putrid Breath] ground{rt1}||slime pool [Necrosis] continuous damage—don't stand normally; heroic feed 25 corpse spiders achievement",
                ["mythic"] = "{rt8}Bonemaw{rt8}||during [Inhale] get sucked—stand in [Necrotic Slime] to avoid being swallowed; [Body Slam] purple light dodge landing||{rt1}dodge: [Putrid Breath] ground{rt1}||slime pool [Necrosis] continuous damage—don't stand normally; heroic feed 25 corpse spiders achievement",
                ["mythicplus"] = "{rt8}Bonemaw{rt8}||during [Inhale] get sucked—stand in [Necrotic Slime] to avoid being swallowed; [Body Slam] purple light dodge landing||{rt1}dodge: [Putrid Breath] ground{rt1}||slime pool [Necrosis] continuous damage—don't stand normally; heroic feed 25 corpse spiders achievement",
            },
        },
        ["影月奴役者"] = {
            type = "MOB",
            tips = "{rt8}Shadowmoon Enslaver{rt8}||[Dominate] buffs the soul—dangerous for tank; long-CC only one; [Void Lash] must interrupt||{rt1}Must interrupt: [Void Lash]{rt1}||the enslaved soul itself is harmless; multiple dominating at once stresses the tank",
        },
        ["纳利什"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Nhallish{rt8}||[Soul Drain] after splitting fight your own soul to return and get [Soul Return] 40% damage buff; dodge [Void Vortex]||{rt1}Must interrupt: [Void Burst][Void Annihilation]{rt1}||[Tomb Digging] summons souls need tanking; [Void Vortex] pulls—stand at edge; don't stand in purple pool",
                ["normal"] = "{rt8}Nhallish{rt8}||[Soul Drain] after splitting fight your own soul to return and get [Soul Return] 40% damage buff; dodge [Void Vortex]||{rt1}Must interrupt: [Void Burst][Void Annihilation]{rt1}||[Tomb Digging] summons souls need tanking; [Void Vortex] pulls—stand at edge; don't stand in purple pool",
                ["heroic"] = "{rt8}Nhallish{rt8}||[Soul Drain] after splitting fight your own soul to return and get [Soul Return] 40% damage buff; dodge [Void Vortex]||{rt1}Must interrupt: [Void Burst][Void Annihilation]{rt1}||[Tomb Digging] summons souls need tanking; [Void Vortex] pulls—stand at edge; don't stand in purple pool",
                ["mythic"] = "{rt8}Nhallish{rt8}||[Soul Drain] after splitting fight your own soul to return and get [Soul Return] 40% damage buff; dodge [Void Vortex]||{rt1}Must interrupt: [Void Burst][Void Annihilation]{rt1}||[Tomb Digging] summons souls need tanking; [Void Vortex] pulls—stand at edge; don't stand in purple pool",
                ["mythicplus"] = "{rt8}Nhallish{rt8}||[Soul Drain] after splitting fight your own soul to return and get [Soul Return] 40% damage buff; dodge [Void Vortex]||{rt1}Must interrupt: [Void Burst][Void Annihilation]{rt1}||[Tomb Digging] summons souls need tanking; [Void Vortex] pulls—stand at edge; don't stand in purple pool",
            },
        },
        ["耐奥祖"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ner'zhul{rt8}||[Lightning Pillar] flash—dodge; [Shadow Bolt] frontal cone; [Bone Wall] focus one side then break through||{rt1}Must interrupt: [Shadow Bolt Volley][Fear Ward]{rt1}||heroic [Soul Drain] drains souls for damage buff; in soul-split phase fight your own soul like Nalis",
                ["normal"] = "{rt8}Ner'zhul{rt8}||[Lightning Pillar] flash—dodge; [Shadow Bolt] frontal cone; [Bone Wall] focus one side then break through||{rt1}Must interrupt: [Shadow Bolt Volley][Fear Ward]{rt1}||heroic [Soul Drain] drains souls for damage buff; in soul-split phase fight your own soul like Nalis",
                ["heroic"] = "{rt8}Ner'zhul{rt8}||[Lightning Pillar] flash—dodge; [Shadow Bolt] frontal cone; [Bone Wall] focus one side then break through||{rt1}Must interrupt: [Shadow Bolt Volley][Fear Ward]{rt1}||heroic [Soul Drain] drains souls for damage buff; in soul-split phase fight your own soul like Nalis",
                ["mythic"] = "{rt8}Ner'zhul{rt8}||[Lightning Pillar] flash—dodge; [Shadow Bolt] frontal cone; [Bone Wall] focus one side then break through||{rt1}Must interrupt: [Shadow Bolt Volley][Fear Ward]{rt1}||heroic [Soul Drain] drains souls for damage buff; in soul-split phase fight your own soul like Nalis",
                ["mythicplus"] = "{rt8}Ner'zhul{rt8}||[Lightning Pillar] flash—dodge; [Shadow Bolt] frontal cone; [Bone Wall] focus one side then break through||{rt1}Must interrupt: [Shadow Bolt Volley][Fear Ward]{rt1}||heroic [Soul Drain] drains souls for damage buff; in soul-split phase fight your own soul like Nalis",
            },
        },
        ["墓碑巡逻"] = {
            type = "MOB",
            tips = "{rt8}Gravestone & Graveyard Patrol{rt8}||stepping on gravestone purple mist summons mobs—go around; don't step on the purple rune near the first boss||{rt1}control: use single-CC on patrol{rt1}||before Ner'zhul the gravestone area—careful to avoid extra ADD",
        },
        ["莎达娜·血怒"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sadana Bloodfury{rt8}||[Dark Communion] summons corrupted souls—clear fast to prevent healing / damage buff; [Dark Eclipse] stand on blue rune to get [Lunar Purity]||{rt1}Must interrupt: [Shadow Blade] damage buff / dodge [Dagger Fall]{rt1}||purple rune steps = heavy damage; [Dark Star Whisper] raid DoT; heroic more daggers",
                ["normal"] = "{rt8}Sadana Bloodfury{rt8}||[Dark Communion] summons corrupted souls—clear fast to prevent healing / damage buff; [Dark Eclipse] stand on blue rune to get [Lunar Purity]||{rt1}Must interrupt: [Shadow Blade] damage buff / dodge [Dagger Fall]{rt1}||purple rune steps = heavy damage; [Dark Star Whisper] raid DoT; heroic more daggers",
                ["heroic"] = "{rt8}Sadana Bloodfury{rt8}||[Dark Communion] summons corrupted souls—clear fast to prevent healing / damage buff; [Dark Eclipse] stand on blue rune to get [Lunar Purity]||{rt1}Must interrupt: [Shadow Blade] damage buff / dodge [Dagger Fall]{rt1}||purple rune steps = heavy damage; [Dark Star Whisper] raid DoT; heroic more daggers",
                ["mythic"] = "{rt8}Sadana Bloodfury{rt8}||[Dark Communion] summons corrupted souls—clear fast to prevent healing / damage buff; [Dark Eclipse] stand on blue rune to get [Lunar Purity]||{rt1}Must interrupt: [Shadow Blade] damage buff / dodge [Dagger Fall]{rt1}||purple rune steps = heavy damage; [Dark Star Whisper] raid DoT; heroic more daggers",
                ["mythicplus"] = "{rt8}Sadana Bloodfury{rt8}||[Dark Communion] summons corrupted souls—clear fast to prevent healing / damage buff; [Dark Eclipse] stand on blue rune to get [Lunar Purity]||{rt1}Must interrupt: [Shadow Blade] damage buff / dodge [Dagger Fall]{rt1}||purple rune steps = heavy damage; [Dark Star Whisper] raid DoT; heroic more daggers",
            },
        },
    },
    ["黑石塔上层"] = {
        name = "Upper Blackrock Spire",
        ["黑铁守卫"] = {
            type = "MOB",
            tips = "{rt8}Dark Iron Guard & Iron Soldier{rt8}||need tanking as they keep entering during the Sabetha fight; [Iron Axe] bleed high damage||{rt1}control: pull in batches{rt1}||[Iron Annihilator] charge dodge sideways; group and AoE but watch [Iron Fury] damage buff",
        },
        ["狂野的怒翼"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ragewing the Untamed{rt8}||stand center of bridge to dodge [Devouring Flame]; spread to avoid [Lava Breath]; at 70% summons [Wyrmlings]—clear fast||{rt1}clear: [Wyrmlings]{rt1}||[Rend Claw] bleed; [Flame Storm] flies high spits fireballs—dodge; on landing [Burning Wrath] stacks damage buff—clear",
                ["normal"] = "{rt8}Ragewing the Untamed{rt8}||stand center of bridge to dodge [Devouring Flame]; spread to avoid [Lava Breath]; at 70% summons [Wyrmlings]—clear fast||{rt1}clear: [Wyrmlings]{rt1}||[Rend Claw] bleed; [Flame Storm] flies high spits fireballs—dodge; on landing [Burning Wrath] stacks damage buff—clear",
                ["heroic"] = "{rt8}Ragewing the Untamed{rt8}||stand center of bridge to dodge [Devouring Flame]; spread to avoid [Lava Breath]; at 70% summons [Wyrmlings]—clear fast||{rt1}clear: [Wyrmlings]{rt1}||[Rend Claw] bleed; [Flame Storm] flies high spits fireballs—dodge; on landing [Burning Wrath] stacks damage buff—clear",
                ["mythic"] = "{rt8}Ragewing the Untamed{rt8}||stand center of bridge to dodge [Devouring Flame]; spread to avoid [Lava Breath]; at 70% summons [Wyrmlings]—clear fast||{rt1}clear: [Wyrmlings]{rt1}||[Rend Claw] bleed; [Flame Storm] flies high spits fireballs—dodge; on landing [Burning Wrath] stacks damage buff—clear",
                ["mythicplus"] = "{rt8}Ragewing the Untamed{rt8}||stand center of bridge to dodge [Devouring Flame]; spread to avoid [Lava Breath]; at 70% summons [Wyrmlings]—clear fast||{rt1}clear: [Wyrmlings]{rt1}||[Rend Claw] bleed; [Flame Storm] flies high spits fireballs—dodge; on landing [Burning Wrath] stacks damage buff—clear",
            },
        },
        ["奇拉克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kil'rak{rt8}||[Crippling Lockdown] tank break; spread to dodge [Virulent Blood] poison circles; drakonid [Eruption] frontal dodge||{rt1}Must interrupt: [Crippling Lockdown]{rt1}||[Rejuvenation Potion] self-heal; [Venom Potion] poison cloud raid damage; drakonid [Gronn Smash] cleave",
                ["normal"] = "{rt8}Kil'rak{rt8}||[Crippling Lockdown] tank break; spread to dodge [Virulent Blood] poison circles; drakonid [Eruption] frontal dodge||{rt1}Must interrupt: [Crippling Lockdown]{rt1}||[Rejuvenation Potion] self-heal; [Venom Potion] poison cloud raid damage; drakonid [Gronn Smash] cleave",
                ["heroic"] = "{rt8}Kil'rak{rt8}||[Crippling Lockdown] tank break; spread to dodge [Virulent Blood] poison circles; drakonid [Eruption] frontal dodge||{rt1}Must interrupt: [Crippling Lockdown]{rt1}||[Rejuvenation Potion] self-heal; [Venom Potion] poison cloud raid damage; drakonid [Gronn Smash] cleave",
                ["mythic"] = "{rt8}Kil'rak{rt8}||[Crippling Lockdown] tank break; spread to dodge [Virulent Blood] poison circles; drakonid [Eruption] frontal dodge||{rt1}Must interrupt: [Crippling Lockdown]{rt1}||[Rejuvenation Potion] self-heal; [Venom Potion] poison cloud raid damage; drakonid [Gronn Smash] cleave",
                ["mythicplus"] = "{rt8}Kil'rak{rt8}||[Crippling Lockdown] tank break; spread to dodge [Virulent Blood] poison circles; drakonid [Eruption] frontal dodge||{rt1}Must interrupt: [Crippling Lockdown]{rt1}||[Rejuvenation Potion] self-heal; [Venom Potion] poison cloud raid damage; drakonid [Gronn Smash] cleave",
            },
        },
        ["指挥官萨贝克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Commander Sabetha{rt8}||[Iron Axe] bleed tank; [Iron Annihilator] charge dodge; [Iron Fury] damage buff; [Infernal Breath] frontal||{rt1}tank: [Iron Fury] swap tank / clear Dark Iron Guards fast{rt1}||ride [Ironbomb Skyterror]; Dark Iron Guards enter—tank holds; [Venom Breath] acid pool dodge",
                ["normal"] = "{rt8}Commander Sabetha{rt8}||[Iron Axe] bleed tank; [Iron Annihilator] charge dodge; [Iron Fury] damage buff; [Infernal Breath] frontal||{rt1}tank: [Iron Fury] swap tank / clear Dark Iron Guards fast{rt1}||ride [Ironbomb Skyterror]; Dark Iron Guards enter—tank holds; [Venom Breath] acid pool dodge",
                ["heroic"] = "{rt8}Commander Sabetha{rt8}||[Iron Axe] bleed tank; [Iron Annihilator] charge dodge; [Iron Fury] damage buff; [Infernal Breath] frontal||{rt1}tank: [Iron Fury] swap tank / clear Dark Iron Guards fast{rt1}||ride [Ironbomb Skyterror]; Dark Iron Guards enter—tank holds; [Venom Breath] acid pool dodge",
                ["mythic"] = "{rt8}Commander Sabetha{rt8}||[Iron Axe] bleed tank; [Iron Annihilator] charge dodge; [Iron Fury] damage buff; [Infernal Breath] frontal||{rt1}tank: [Iron Fury] swap tank / clear Dark Iron Guards fast{rt1}||ride [Ironbomb Skyterror]; Dark Iron Guards enter—tank holds; [Venom Breath] acid pool dodge",
                ["mythicplus"] = "{rt8}Commander Sabetha{rt8}||[Iron Axe] bleed tank; [Iron Annihilator] charge dodge; [Iron Fury] damage buff; [Infernal Breath] frontal||{rt1}tank: [Iron Fury] swap tank / clear Dark Iron Guards fast{rt1}||ride [Ironbomb Skyterror]; Dark Iron Guards enter—tank holds; [Venom Breath] acid pool dodge",
            },
        },
        ["折铁者高尔山"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gug'rokk{rt8}||[Electric Charge] when linked, move away from the marked; dodge [Shockwave]; priority kill [Living Anvil]||{rt1}Must interrupt: [Lava Burst][Charge]{rt1}||[Anvil Smash] raid damage; Living Anvil [Cleave] high damage—focus",
                ["normal"] = "{rt8}Gug'rokk{rt8}||[Electric Charge] when linked, move away from the marked; dodge [Shockwave]; priority kill [Living Anvil]||{rt1}Must interrupt: [Lava Burst][Charge]{rt1}||[Anvil Smash] raid damage; Living Anvil [Cleave] high damage—focus",
                ["heroic"] = "{rt8}Gug'rokk{rt8}||[Electric Charge] when linked, move away from the marked; dodge [Shockwave]; priority kill [Living Anvil]||{rt1}Must interrupt: [Lava Burst][Charge]{rt1}||[Anvil Smash] raid damage; Living Anvil [Cleave] high damage—focus",
                ["mythic"] = "{rt8}Gug'rokk{rt8}||[Electric Charge] when linked, move away from the marked; dodge [Shockwave]; priority kill [Living Anvil]||{rt1}Must interrupt: [Lava Burst][Charge]{rt1}||[Anvil Smash] raid damage; Living Anvil [Cleave] high damage—focus",
                ["mythicplus"] = "{rt8}Gug'rokk{rt8}||[Electric Charge] when linked, move away from the marked; dodge [Shockwave]; priority kill [Living Anvil]||{rt1}Must interrupt: [Lava Burst][Charge]{rt1}||[Anvil Smash] raid damage; Living Anvil [Cleave] high damage—focus",
            },
        },
        ["督军扎伊拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warlord Zaela{rt8}||[Dark Iron Whirlwind] the marked pulls away from group; [Ricochet Blade] spread to avoid bounce; at 60% ride dragon summons 3 adds—clear fast||{rt1}dodge: [Destructive Smash] knockback / [Dark Iron Whirlwind]{rt1}||dragon [Burning Breath] covers 1/3 platform—get out fast; ~40s later return, must clear adds; don't get blown off the edge",
                ["normal"] = "{rt8}Warlord Zaela{rt8}||[Dark Iron Whirlwind] the marked pulls away from group; [Ricochet Blade] spread to avoid bounce; at 60% ride dragon summons 3 adds—clear fast||{rt1}dodge: [Destructive Smash] knockback / [Dark Iron Whirlwind]{rt1}||dragon [Burning Breath] covers 1/3 platform—get out fast; ~40s later return, must clear adds; don't get blown off the edge",
                ["heroic"] = "{rt8}Warlord Zaela{rt8}||[Dark Iron Whirlwind] the marked pulls away from group; [Ricochet Blade] spread to avoid bounce; at 60% ride dragon summons 3 adds—clear fast||{rt1}dodge: [Destructive Smash] knockback / [Dark Iron Whirlwind]{rt1}||dragon [Burning Breath] covers 1/3 platform—get out fast; ~40s later return, must clear adds; don't get blown off the edge",
                ["mythic"] = "{rt8}Warlord Zaela{rt8}||[Dark Iron Whirlwind] the marked pulls away from group; [Ricochet Blade] spread to avoid bounce; at 60% ride dragon summons 3 adds—clear fast||{rt1}dodge: [Destructive Smash] knockback / [Dark Iron Whirlwind]{rt1}||dragon [Burning Breath] covers 1/3 platform—get out fast; ~40s later return, must clear adds; don't get blown off the edge",
                ["mythicplus"] = "{rt8}Warlord Zaela{rt8}||[Dark Iron Whirlwind] the marked pulls away from group; [Ricochet Blade] spread to avoid bounce; at 60% ride dragon summons 3 adds—clear fast||{rt1}dodge: [Destructive Smash] knockback / [Dark Iron Whirlwind]{rt1}||dragon [Burning Breath] covers 1/3 platform—get out fast; ~40s later return, must clear adds; don't get blown off the edge",
            },
        },
    },
    ["钢铁码头"] = {
        name = "Grimrail Depot",
        ["奥舍尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Oshir{rt8}||[Feed Time] mark needs quick 8% health burst to rescue; [Primal Assault] dodge sideways||{rt1}clear fast: caged [Starved Wolf / Skyterror]{rt1}||wolf packs near each other buff damage—kill in batches; acid [Spit] dodge circles immediately",
                ["normal"] = "{rt8}Oshir{rt8}||[Feed Time] mark needs quick 8% health burst to rescue; [Primal Assault] dodge sideways||{rt1}clear fast: caged [Starved Wolf / Skyterror]{rt1}||wolf packs near each other buff damage—kill in batches; acid [Spit] dodge circles immediately",
                ["heroic"] = "{rt8}Oshir{rt8}||[Feed Time] mark needs quick 8% health burst to rescue; [Primal Assault] dodge sideways||{rt1}clear fast: caged [Starved Wolf / Skyterror]{rt1}||wolf packs near each other buff damage—kill in batches; acid [Spit] dodge circles immediately",
                ["mythic"] = "{rt8}Oshir{rt8}||[Feed Time] mark needs quick 8% health burst to rescue; [Primal Assault] dodge sideways||{rt1}clear fast: caged [Starved Wolf / Skyterror]{rt1}||wolf packs near each other buff damage—kill in batches; acid [Spit] dodge circles immediately",
                ["mythicplus"] = "{rt8}Oshir{rt8}||[Feed Time] mark needs quick 8% health burst to rescue; [Primal Assault] dodge sideways||{rt1}clear fast: caged [Starved Wolf / Skyterror]{rt1}||wolf packs near each other buff damage—kill in batches; acid [Spit] dodge circles immediately",
            },
        },
        ["战歌传令官德鲁纳"] = {
            type = "MOB",
            tips = "{rt8}Warsong Herald Druna{rt8}||priority kill—summons wall riflemen casting [Bramble Arrow Rain][Burning Arrow] heavy raid heal pressure||{rt1}Priority kill: Druna{rt1}||[Burning Arrow] leaves fire pool continuous damage—keep moving and spread",
        },
        ["攻城大师奥鲁加"] = {
            type = "MOB",
            tips = "{rt8}Siege Master Oluga{rt8}||[Shattering Strike] melee on tank; [Gatecrusher] dodge when thrown||{rt1}dodge: [Gatecrusher] throw landing{rt1}||while disarmed can't use Shattering Strike; same area as Druna—careful of chain-pulling",
        },
        ["血肉撕裂者诺格加尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Flesh-Render Nokgar{rt8}||first kill the wolf [Dreadfang] then the boss; ground fire circles keep dodging||{rt1}don't touch: during [Reckless Provocation] red shield, attacking causes fear{rt1}||[Bramble Arrow Rain][Burning Arrow] landing reposition; wolf [Rending Swipe] charge dodge frontal",
                ["normal"] = "{rt8}Flesh-Render Nokgar{rt8}||first kill the wolf [Dreadfang] then the boss; ground fire circles keep dodging||{rt1}don't touch: during [Reckless Provocation] red shield, attacking causes fear{rt1}||[Bramble Arrow Rain][Burning Arrow] landing reposition; wolf [Rending Swipe] charge dodge frontal",
                ["heroic"] = "{rt8}Flesh-Render Nokgar{rt8}||first kill the wolf [Dreadfang] then the boss; ground fire circles keep dodging||{rt1}don't touch: during [Reckless Provocation] red shield, attacking causes fear{rt1}||[Bramble Arrow Rain][Burning Arrow] landing reposition; wolf [Rending Swipe] charge dodge frontal",
                ["mythic"] = "{rt8}Flesh-Render Nokgar{rt8}||first kill the wolf [Dreadfang] then the boss; ground fire circles keep dodging||{rt1}don't touch: during [Reckless Provocation] red shield, attacking causes fear{rt1}||[Bramble Arrow Rain][Burning Arrow] landing reposition; wolf [Rending Swipe] charge dodge frontal",
                ["mythicplus"] = "{rt8}Flesh-Render Nokgar{rt8}||first kill the wolf [Dreadfang] then the boss; ground fire circles keep dodging||{rt1}don't touch: during [Reckless Provocation] red shield, attacking causes fear{rt1}||[Bramble Arrow Rain][Burning Arrow] landing reposition; wolf [Rending Swipe] charge dodge frontal",
            },
        },
        ["斯古洛克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Skul'rok{rt8}||during bombardment hide behind box and push toward BOSS; don't stay at ship stern eating [Backfire]||{rt1}control: while Korama alive [Blade Storm] pull away from group{rt1}||kill Korama first then Skul'rok; [Rapid Fire] marked moves away from group; ignore Zoggosh",
                ["normal"] = "{rt8}Skul'rok{rt8}||during bombardment hide behind box and push toward BOSS; don't stay at ship stern eating [Backfire]||{rt1}control: while Korama alive [Blade Storm] pull away from group{rt1}||kill Korama first then Skul'rok; [Rapid Fire] marked moves away from group; ignore Zoggosh",
                ["heroic"] = "{rt8}Skul'rok{rt8}||during bombardment hide behind box and push toward BOSS; don't stay at ship stern eating [Backfire]||{rt1}control: while Korama alive [Blade Storm] pull away from group{rt1}||kill Korama first then Skul'rok; [Rapid Fire] marked moves away from group; ignore Zoggosh",
                ["mythic"] = "{rt8}Skul'rok{rt8}||during bombardment hide behind box and push toward BOSS; don't stay at ship stern eating [Backfire]||{rt1}control: while Korama alive [Blade Storm] pull away from group{rt1}||kill Korama first then Skul'rok; [Rapid Fire] marked moves away from group; ignore Zoggosh",
                ["mythicplus"] = "{rt8}Skul'rok{rt8}||during bombardment hide behind box and push toward BOSS; don't stay at ship stern eating [Backfire]||{rt1}control: while Korama alive [Blade Storm] pull away from group{rt1}||kill Korama first then Skul'rok; [Rapid Fire] marked moves away from group; ignore Zoggosh",
            },
        },
        ["恐轨押运员"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Fear-Rail Enforcer Trio{rt8}||priority kill Arekk—during [Crimson Orb] don't touch her; spread to dodge [Faulty Jumpers]||{rt1}control: [Faulty Jumpers 9000] chain lightning—spread{rt1}||Makgo [Flame Slash][Magma Sweep] melee dodge; mine [Bomber Squad] can be killed; Ogre trap slows",
                ["normal"] = "{rt8}Fear-Rail Enforcer Trio{rt8}||priority kill Arekk—during [Crimson Orb] don't touch her; spread to dodge [Faulty Jumpers]||{rt1}control: [Faulty Jumpers 9000] chain lightning—spread{rt1}||Makgo [Flame Slash][Magma Sweep] melee dodge; mine [Bomber Squad] can be killed; Ogre trap slows",
                ["heroic"] = "{rt8}Fear-Rail Enforcer Trio{rt8}||priority kill Arekk—during [Crimson Orb] don't touch her; spread to dodge [Faulty Jumpers]||{rt1}control: [Faulty Jumpers 9000] chain lightning—spread{rt1}||Makgo [Flame Slash][Magma Sweep] melee dodge; mine [Bomber Squad] can be killed; Ogre trap slows",
                ["mythic"] = "{rt8}Fear-Rail Enforcer Trio{rt8}||priority kill Arekk—during [Crimson Orb] don't touch her; spread to dodge [Faulty Jumpers]||{rt1}control: [Faulty Jumpers 9000] chain lightning—spread{rt1}||Makgo [Flame Slash][Magma Sweep] melee dodge; mine [Bomber Squad] can be killed; Ogre trap slows",
                ["mythicplus"] = "{rt8}Fear-Rail Enforcer Trio{rt8}||priority kill Arekk—during [Crimson Orb] don't touch her; spread to dodge [Faulty Jumpers]||{rt1}control: [Faulty Jumpers 9000] chain lightning—spread{rt1}||Makgo [Flame Slash][Magma Sweep] melee dodge; mine [Bomber Squad] can be killed; Ogre trap slows",
            },
        },
    },
}
