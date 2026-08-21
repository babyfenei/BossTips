-- ============================================================================
-- BossTips 2.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["2.0"] = {
    ["地狱火堡垒：城墙"] = {
        name = "Hellfire Citadel: The Ramparts",
        ["地狱火新兵"] = {
            type = "MOB",
            tips = "{rt8}Priority: Fel Orc Grunt / Sentinel{rt8}||[Heal]/[Shadow Word: Pain] prioritize killing the healer||{rt1}Must interrupt: Heal{rt1}||At the entrance, kill the wolf riders' wolves first",
        },
        ["巡视者加戈玛"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warden Gargolmar{rt8}||With 2 [Hellfire Watcher] followers—control/kill the followers to prevent heal||{rt1}Must interrupt: follower [Heal]{rt1}||Tank holds steady",
                ["normal"] = "{rt8}Warden Gargolmar{rt8}||With 2 [Hellfire Watcher] followers—control/kill the followers to prevent heal||{rt1}Must interrupt: follower [Heal]{rt1}||Tank holds steady",
                ["heroic"] = "{rt8}Warden Gargolmar{rt8}||With 2 [Hellfire Watcher] followers—control/kill the followers to prevent heal||{rt1}Must interrupt: follower [Heal]{rt1}||Tank holds steady",
                ["mythic"] = "{rt8}Warden Gargolmar{rt8}||With 2 [Hellfire Watcher] followers—control/kill the followers to prevent heal||{rt1}Must interrupt: follower [Heal]{rt1}||Tank holds steady",
                ["mythicplus"] = "{rt8}Warden Gargolmar{rt8}||With 2 [Hellfire Watcher] followers—control/kill the followers to prevent heal||{rt1}Must interrupt: follower [Heal]{rt1}||Tank holds steady",
            },
        },
        ["传令官瓦兹德"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Vazruden the Herald{rt8}||Kill the 2 sentinels first to draw out Vazruden; Nazan [Fireball] leaves fire / [Cone of Fire] front||{rt1}None{rt1}||Tank faces away from the group to dodge fire",
                ["normal"] = "{rt8}Vazruden the Herald{rt8}||Kill the 2 sentinels first to draw out Vazruden; Nazan [Fireball] leaves fire / [Cone of Fire] front||{rt1}None{rt1}||Tank faces away from the group to dodge fire",
                ["heroic"] = "{rt8}Vazruden the Herald{rt8}||Kill the 2 sentinels first to draw out Vazruden; Nazan [Fireball] leaves fire / [Cone of Fire] front||{rt1}None{rt1}||Tank faces away from the group to dodge fire",
                ["mythic"] = "{rt8}Vazruden the Herald{rt8}||Kill the 2 sentinels first to draw out Vazruden; Nazan [Fireball] leaves fire / [Cone of Fire] front||{rt1}None{rt1}||Tank faces away from the group to dodge fire",
                ["mythicplus"] = "{rt8}Vazruden the Herald{rt8}||Kill the 2 sentinels first to draw out Vazruden; Nazan [Fireball] leaves fire / [Cone of Fire] front||{rt1}None{rt1}||Tank faces away from the group to dodge fire",
            },
        },
        ["无疤者奥摩尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Omor the Unscarred{rt8}||[Betrayal Aura] 15-yard Shadow DoT—dispel; [Spell Reflection] raises a shield||{rt1}Dispel the curse{rt1}||When the shield is up, casters stop to avoid reflect",
                ["normal"] = "{rt8}Omor the Unscarred{rt8}||[Betrayal Aura] 15-yard Shadow DoT—dispel; [Spell Reflection] raises a shield||{rt1}Dispel the curse{rt1}||When the shield is up, casters stop to avoid reflect",
                ["heroic"] = "{rt8}Omor the Unscarred{rt8}||[Betrayal Aura] 15-yard Shadow DoT—dispel; [Spell Reflection] raises a shield||{rt1}Dispel the curse{rt1}||When the shield is up, casters stop to avoid reflect",
                ["mythic"] = "{rt8}Omor the Unscarred{rt8}||[Betrayal Aura] 15-yard Shadow DoT—dispel; [Spell Reflection] raises a shield||{rt1}Dispel the curse{rt1}||When the shield is up, casters stop to avoid reflect",
                ["mythicplus"] = "{rt8}Omor the Unscarred{rt8}||[Betrayal Aura] 15-yard Shadow DoT—dispel; [Spell Reflection] raises a shield||{rt1}Dispel the curse{rt1}||When the shield is up, casters stop to avoid reflect",
            },
        },
    },
    ["地狱火堡垒：破碎大厅"] = {
        name = "Hellfire Citadel: Shattered Halls",
        ["高阶术士奈瑟库斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Warlock Nethekurse{rt8}||[Shadow Cleave] front cone—must dodge; [Death Coil] shadow cloud at feet deals damage over time||{rt1}Must interrupt: [Shadow Bolt Volley]; at 25% [Dark Vortex] spinning AoE—everyone spread{rt1}||Tank faces away from the group; melee dodge the front",
                ["normal"] = "{rt8}High Warlock Nethekurse{rt8}||[Shadow Cleave] front cone—must dodge; [Death Coil] shadow cloud at feet deals damage over time||{rt1}Must interrupt: [Shadow Bolt Volley]; at 25% [Dark Vortex] spinning AoE—everyone spread{rt1}||Tank faces away from the group; melee dodge the front",
                ["heroic"] = "{rt8}High Warlock Nethekurse{rt8}||[Shadow Cleave] front cone—must dodge; [Death Coil] shadow cloud at feet deals damage over time||{rt1}Must interrupt: [Shadow Bolt Volley]; at 25% [Dark Vortex] spinning AoE—everyone spread{rt1}||Tank faces away from the group; melee dodge the front",
                ["mythic"] = "{rt8}High Warlock Nethekurse{rt8}||[Shadow Cleave] front cone—must dodge; [Death Coil] shadow cloud at feet deals damage over time||{rt1}Must interrupt: [Shadow Bolt Volley]; at 25% [Dark Vortex] spinning AoE—everyone spread{rt1}||Tank faces away from the group; melee dodge the front",
                ["mythicplus"] = "{rt8}High Warlock Nethekurse{rt8}||[Shadow Cleave] front cone—must dodge; [Death Coil] shadow cloud at feet deals damage over time||{rt1}Must interrupt: [Shadow Bolt Volley]; at 25% [Dark Vortex] spinning AoE—everyone spread{rt1}||Tank faces away from the group; melee dodge the front",
            },
        },
        ["血卫士伯鲁恩"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Blood Guard Porung{rt8}||[Whirlwind]/[Cleave] with 2 followers—kill fast to reduce pressure||{rt1}None{rt1}||Tank holds steady",
                ["normal"] = "{rt8}Blood Guard Porung{rt8}||[Whirlwind]/[Cleave] with 2 followers—kill fast to reduce pressure||{rt1}None{rt1}||Tank holds steady",
                ["heroic"] = "{rt8}Blood Guard Porung{rt8}||[Whirlwind]/[Cleave] with 2 followers—kill fast to reduce pressure||{rt1}None{rt1}||Tank holds steady",
                ["mythic"] = "{rt8}Blood Guard Porung{rt8}||[Whirlwind]/[Cleave] with 2 followers—kill fast to reduce pressure||{rt1}None{rt1}||Tank holds steady",
                ["mythicplus"] = "{rt8}Blood Guard Porung{rt8}||[Whirlwind]/[Cleave] with 2 followers—kill fast to reduce pressure||{rt1}None{rt1}||Tank holds steady",
            },
        },
        ["战争使者沃姆罗格"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warbringer Wormrogg{rt8}||[Fireball]/[Healing Rain]/[Fear] the two heads argue and interrupt each other||{rt1}Must interrupt: [Healing Rain]{rt1}||Spread out to dodge fire",
                ["normal"] = "{rt8}Warbringer Wormrogg{rt8}||[Fireball]/[Healing Rain]/[Fear] the two heads argue and interrupt each other||{rt1}Must interrupt: [Healing Rain]{rt1}||Spread out to dodge fire",
                ["heroic"] = "{rt8}Warbringer Wormrogg{rt8}||[Fireball]/[Healing Rain]/[Fear] the two heads argue and interrupt each other||{rt1}Must interrupt: [Healing Rain]{rt1}||Spread out to dodge fire",
                ["mythic"] = "{rt8}Warbringer Wormrogg{rt8}||[Fireball]/[Healing Rain]/[Fear] the two heads argue and interrupt each other||{rt1}Must interrupt: [Healing Rain]{rt1}||Spread out to dodge fire",
                ["mythicplus"] = "{rt8}Warbringer Wormrogg{rt8}||[Fireball]/[Healing Rain]/[Fear] the two heads argue and interrupt each other||{rt1}Must interrupt: [Healing Rain]{rt1}||Spread out to dodge fire",
            },
        },
        ["破碎者萨满"] = {
            type = "MOB",
            tips = "{rt8}Priority: Broken Shaman{rt8}||[Healing Rain] control / prioritize killing||{rt1}Must interrupt: Heal{rt1}||Channel patrol—control and pull wave by wave",
        },
        ["酋长卡加斯·刃拳"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Chieftain Kargath Bladefist{rt8}||[Blade Dance] random charge group damage / [Sweep] / [Charge] stun||{rt1}None{rt1}||Pull near the wall; during Blade Dance the group spreads; kill summoned guards instantly",
                ["normal"] = "{rt8}Chieftain Kargath Bladefist{rt8}||[Blade Dance] random charge group damage / [Sweep] / [Charge] stun||{rt1}None{rt1}||Pull near the wall; during Blade Dance the group spreads; kill summoned guards instantly",
                ["heroic"] = "{rt8}Chieftain Kargath Bladefist{rt8}||[Blade Dance] random charge group damage / [Sweep] / [Charge] stun||{rt1}None{rt1}||Pull near the wall; during Blade Dance the group spreads; kill summoned guards instantly",
                ["mythic"] = "{rt8}Chieftain Kargath Bladefist{rt8}||[Blade Dance] random charge group damage / [Sweep] / [Charge] stun||{rt1}None{rt1}||Pull near the wall; during Blade Dance the group spreads; kill summoned guards instantly",
                ["mythicplus"] = "{rt8}Chieftain Kargath Bladefist{rt8}||[Blade Dance] random charge group damage / [Sweep] / [Charge] stun||{rt1}None{rt1}||Pull near the wall; during Blade Dance the group spreads; kill summoned guards instantly",
            },
        },
    },
    ["魔导师平台"] = {
        name = "Magister's Terrace",
        ["吉美尔鲁斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}G'imeluros{rt8}||[Neural Link] heal-absorb shield + player damage increase—touch your own jellyfish to break; [Cosmic Stab] marks a target + DoT, ends with water at feet||{rt1}Must dodge: [Astral Bind] pulls players with a per-second DoT—run opposite, watch the floor{rt1}||Find the red-arrow jellyfish to break the link",
                ["normal"] = "{rt8}G'imeluros{rt8}||[Neural Link] heal-absorb shield + player damage increase—touch your own jellyfish to break; [Cosmic Stab] marks a target + DoT, ends with water at feet||{rt1}Must dodge: [Astral Bind] pulls players with a per-second DoT—run opposite, watch the floor{rt1}||Find the red-arrow jellyfish to break the link",
                ["heroic"] = "{rt8}G'imeluros{rt8}||[Neural Link] heal-absorb shield + player damage increase—touch your own jellyfish to break; [Cosmic Stab] marks a target + DoT, ends with water at feet||{rt1}Must dodge: [Astral Bind] pulls players with a per-second DoT—run opposite, watch the floor{rt1}||Find the red-arrow jellyfish to break the link",
                ["mythic"] = "{rt8}G'imeluros{rt8}||[Neural Link] heal-absorb shield + player damage increase—touch your own jellyfish to break; [Cosmic Stab] marks a target + DoT, ends with water at feet||{rt1}Must dodge: [Astral Bind] pulls players with a per-second DoT—run opposite, watch the floor{rt1}||Find the red-arrow jellyfish to break the link",
                ["mythicplus"] = "{rt8}G'imeluros{rt8}||[Neural Link] heal-absorb shield + player damage increase—touch your own jellyfish to break; [Cosmic Stab] marks a target + DoT, ends with water at feet||{rt1}Must dodge: [Astral Bind] pulls players with a per-second DoT—run opposite, watch the floor{rt1}||Find the red-arrow jellyfish to break the link",
            },
        },
        ["瑟拉奈尔·日鞭"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Seranael Sunwhipper{rt8}||[Rune Brand] marks a target—move away from the group; [Suppression Field] a shield appears—the marked player enters it to clear the DoT||{rt1}Must dodge: [Silent Wave] a cast—move forward into the shield to avoid (outside = silenced 8s){rt1}||[Haste Ward] tank pre-warning: +100% attack speed Arcane damage—pop damage reduction",
                ["normal"] = "{rt8}Seranael Sunwhipper{rt8}||[Rune Brand] marks a target—move away from the group; [Suppression Field] a shield appears—the marked player enters it to clear the DoT||{rt1}Must dodge: [Silent Wave] a cast—move forward into the shield to avoid (outside = silenced 8s){rt1}||[Haste Ward] tank pre-warning: +100% attack speed Arcane damage—pop damage reduction",
                ["heroic"] = "{rt8}Seranael Sunwhipper{rt8}||[Rune Brand] marks a target—move away from the group; [Suppression Field] a shield appears—the marked player enters it to clear the DoT||{rt1}Must dodge: [Silent Wave] a cast—move forward into the shield to avoid (outside = silenced 8s){rt1}||[Haste Ward] tank pre-warning: +100% attack speed Arcane damage—pop damage reduction",
                ["mythic"] = "{rt8}Seranael Sunwhipper{rt8}||[Rune Brand] marks a target—move away from the group; [Suppression Field] a shield appears—the marked player enters it to clear the DoT||{rt1}Must dodge: [Silent Wave] a cast—move forward into the shield to avoid (outside = silenced 8s){rt1}||[Haste Ward] tank pre-warning: +100% attack speed Arcane damage—pop damage reduction",
                ["mythicplus"] = "{rt8}Seranael Sunwhipper{rt8}||[Rune Brand] marks a target—move away from the group; [Suppression Field] a shield appears—the marked player enters it to clear the DoT||{rt1}Must dodge: [Silent Wave] a cast—move forward into the shield to avoid (outside = silenced 8s){rt1}||[Haste Ward] tank pre-warning: +100% attack speed Arcane damage—pop damage reduction",
            },
        },
        ["辛多雷魔导师"] = {
            type = "MOB",
            tips = "{rt8}Priority: Sin'dorei Spellbreaker / Arcane Sentinel / Rune Defender / Searing Firecaller / Mana Wyrm{rt8}||[Arcane Beam] a correctly-timed green shield prevents it; [Immolate] pre-cast green shield; [Rune Defender Warblade] marks target—green shield immunes||{rt1}Wyrm buff is the Ironbark mechanic—prioritize killing the caster{rt1}||Clear the Sin'dorei followers before the room",
        },
        ["奥能金刚库斯托斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Arcane Colossus Custos{rt8}||[Arcane Residue] ground poison circle—must dodge; [Resupply Protocol] summons energy orbs—whole group runs into them; if the boss absorbs the orb, group AoE + self 20% damage increase||{rt1}Handle: [Ethereal Shackle] marks a target with root (warhorse/hearse can break)—interruptible{rt1}||Tank pulls to the platform edge, avoiding poison circles; don't eat too many orbs (each jump a 5-digit debuff)",
                ["normal"] = "{rt8}Arcane Colossus Custos{rt8}||[Arcane Residue] ground poison circle—must dodge; [Resupply Protocol] summons energy orbs—whole group runs into them; if the boss absorbs the orb, group AoE + self 20% damage increase||{rt1}Handle: [Ethereal Shackle] marks a target with root (warhorse/hearse can break)—interruptible{rt1}||Tank pulls to the platform edge, avoiding poison circles; don't eat too many orbs (each jump a 5-digit debuff)",
                ["heroic"] = "{rt8}Arcane Colossus Custos{rt8}||[Arcane Residue] ground poison circle—must dodge; [Resupply Protocol] summons energy orbs—whole group runs into them; if the boss absorbs the orb, group AoE + self 20% damage increase||{rt1}Handle: [Ethereal Shackle] marks a target with root (warhorse/hearse can break)—interruptible{rt1}||Tank pulls to the platform edge, avoiding poison circles; don't eat too many orbs (each jump a 5-digit debuff)",
                ["mythic"] = "{rt8}Arcane Colossus Custos{rt8}||[Arcane Residue] ground poison circle—must dodge; [Resupply Protocol] summons energy orbs—whole group runs into them; if the boss absorbs the orb, group AoE + self 20% damage increase||{rt1}Handle: [Ethereal Shackle] marks a target with root (warhorse/hearse can break)—interruptible{rt1}||Tank pulls to the platform edge, avoiding poison circles; don't eat too many orbs (each jump a 5-digit debuff)",
                ["mythicplus"] = "{rt8}Arcane Colossus Custos{rt8}||[Arcane Residue] ground poison circle—must dodge; [Resupply Protocol] summons energy orbs—whole group runs into them; if the boss absorbs the orb, group AoE + self 20% damage increase||{rt1}Handle: [Ethereal Shackle] marks a target with root (warhorse/hearse can break)—interruptible{rt1}||Tank pulls to the platform edge, avoiding poison circles; don't eat too many orbs (each jump a 5-digit debuff)",
            },
        },
        ["迪詹崔乌斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Dijahntrius{rt8}||[Entropic Devour] marks a target with a DoT (purple projectile) that drops a ring of orbs at the end; [Unstable Void Essence] circles appear on the floor—go stand in them to catch the orb, or the whole group takes AoE||{rt1}Handle: [Colossal Shard] tank takes AoE within 8 yards + knockback + water at feet{rt1}||A pre-cast green shield immunes the projectile mark",
                ["normal"] = "{rt8}Dijahntrius{rt8}||[Entropic Devour] marks a target with a DoT (purple projectile) that drops a ring of orbs at the end; [Unstable Void Essence] circles appear on the floor—go stand in them to catch the orb, or the whole group takes AoE||{rt1}Handle: [Colossal Shard] tank takes AoE within 8 yards + knockback + water at feet{rt1}||A pre-cast green shield immunes the projectile mark",
                ["heroic"] = "{rt8}Dijahntrius{rt8}||[Entropic Devour] marks a target with a DoT (purple projectile) that drops a ring of orbs at the end; [Unstable Void Essence] circles appear on the floor—go stand in them to catch the orb, or the whole group takes AoE||{rt1}Handle: [Colossal Shard] tank takes AoE within 8 yards + knockback + water at feet{rt1}||A pre-cast green shield immunes the projectile mark",
                ["mythic"] = "{rt8}Dijahntrius{rt8}||[Entropic Devour] marks a target with a DoT (purple projectile) that drops a ring of orbs at the end; [Unstable Void Essence] circles appear on the floor—go stand in them to catch the orb, or the whole group takes AoE||{rt1}Handle: [Colossal Shard] tank takes AoE within 8 yards + knockback + water at feet{rt1}||A pre-cast green shield immunes the projectile mark",
                ["mythicplus"] = "{rt8}Dijahntrius{rt8}||[Entropic Devour] marks a target with a DoT (purple projectile) that drops a ring of orbs at the end; [Unstable Void Essence] circles appear on the floor—go stand in them to catch the orb, or the whole group takes AoE||{rt1}Handle: [Colossal Shard] tank takes AoE within 8 yards + knockback + water at feet{rt1}||A pre-cast green shield immunes the projectile mark",
            },
        },
    },
    ["地狱火堡垒：鲜血熔炉"] = {
        name = "Hellfire Citadel: The Blood Furnace",
        ["制造者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The Maker{rt8}||[Dominate] mind control (undispellable) / [Explosion Ring] knockback||{rt1}None{rt1}||Polymorph/Fear the controlled player; everyone dodge the circle",
                ["normal"] = "{rt8}The Maker{rt8}||[Dominate] mind control (undispellable) / [Explosion Ring] knockback||{rt1}None{rt1}||Polymorph/Fear the controlled player; everyone dodge the circle",
                ["heroic"] = "{rt8}The Maker{rt8}||[Dominate] mind control (undispellable) / [Explosion Ring] knockback||{rt1}None{rt1}||Polymorph/Fear the controlled player; everyone dodge the circle",
                ["mythic"] = "{rt8}The Maker{rt8}||[Dominate] mind control (undispellable) / [Explosion Ring] knockback||{rt1}None{rt1}||Polymorph/Fear the controlled player; everyone dodge the circle",
                ["mythicplus"] = "{rt8}The Maker{rt8}||[Dominate] mind control (undispellable) / [Explosion Ring] knockback||{rt1}None{rt1}||Polymorph/Fear the controlled player; everyone dodge the circle",
            },
        },
        ["布洛戈克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Broggok{rt8}||[Poison Cloud]/[Venom Bolt] Nature DoT / [Slime Spray] front||{rt1}Dispel poison{rt1}||Clear the 4 waves of orcs first",
                ["normal"] = "{rt8}Broggok{rt8}||[Poison Cloud]/[Venom Bolt] Nature DoT / [Slime Spray] front||{rt1}Dispel poison{rt1}||Clear the 4 waves of orcs first",
                ["heroic"] = "{rt8}Broggok{rt8}||[Poison Cloud]/[Venom Bolt] Nature DoT / [Slime Spray] front||{rt1}Dispel poison{rt1}||Clear the 4 waves of orcs first",
                ["mythic"] = "{rt8}Broggok{rt8}||[Poison Cloud]/[Venom Bolt] Nature DoT / [Slime Spray] front||{rt1}Dispel poison{rt1}||Clear the 4 waves of orcs first",
                ["mythicplus"] = "{rt8}Broggok{rt8}||[Poison Cloud]/[Venom Bolt] Nature DoT / [Slime Spray] front||{rt1}Dispel poison{rt1}||Clear the 4 waves of orcs first",
            },
        },
        ["击碎者克里丹"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Crusher Kridan{rt8}||[Shadow Bolt Volley]/[Corruption]/cone [Shadow Bolt] front||{rt1}Must interrupt: Shadow Bolt{rt1}||Kill the 5 [Shadowmoon Converters] first, dispel [Shadow Brand]",
                ["normal"] = "{rt8}Crusher Kridan{rt8}||[Shadow Bolt Volley]/[Corruption]/cone [Shadow Bolt] front||{rt1}Must interrupt: Shadow Bolt{rt1}||Kill the 5 [Shadowmoon Converters] first, dispel [Shadow Brand]",
                ["heroic"] = "{rt8}Crusher Kridan{rt8}||[Shadow Bolt Volley]/[Corruption]/cone [Shadow Bolt] front||{rt1}Must interrupt: Shadow Bolt{rt1}||Kill the 5 [Shadowmoon Converters] first, dispel [Shadow Brand]",
                ["mythic"] = "{rt8}Crusher Kridan{rt8}||[Shadow Bolt Volley]/[Corruption]/cone [Shadow Bolt] front||{rt1}Must interrupt: Shadow Bolt{rt1}||Kill the 5 [Shadowmoon Converters] first, dispel [Shadow Brand]",
                ["mythicplus"] = "{rt8}Crusher Kridan{rt8}||[Shadow Bolt Volley]/[Corruption]/cone [Shadow Bolt] front||{rt1}Must interrupt: Shadow Bolt{rt1}||Kill the 5 [Shadowmoon Converters] first, dispel [Shadow Brand]",
            },
        },
        ["新生邪兽人"] = {
            type = "MOB",
            tips = "{rt8}Priority: Renegade Fel Orc{rt8}||Goes into Frenzy after combat starts—controllers prioritize CC||{rt1}None{rt1}||",
        },
    },
    ["盘牙湖泊：奴隶围栏"] = {
        name = "Coilfang Reservoir: The Slave Pens",
        ["夸格米拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Quagmirran{rt8}||[Acid Spray] front / [Poison] DoT / [Shrink] reduces stats||{rt1}Dispel poison{rt1}||Healer keep group HP up",
                ["normal"] = "{rt8}Quagmirran{rt8}||[Acid Spray] front / [Poison] DoT / [Shrink] reduces stats||{rt1}Dispel poison{rt1}||Healer keep group HP up",
                ["heroic"] = "{rt8}Quagmirran{rt8}||[Acid Spray] front / [Poison] DoT / [Shrink] reduces stats||{rt1}Dispel poison{rt1}||Healer keep group HP up",
                ["mythic"] = "{rt8}Quagmirran{rt8}||[Acid Spray] front / [Poison] DoT / [Shrink] reduces stats||{rt1}Dispel poison{rt1}||Healer keep group HP up",
                ["mythicplus"] = "{rt8}Quagmirran{rt8}||[Acid Spray] front / [Poison] DoT / [Shrink] reduces stats||{rt1}Dispel poison{rt1}||Healer keep group HP up",
            },
        },
        ["巨钳鲁克玛尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rukhmar the Greatclaw{rt8}||[Rend] bleed / [Expose Agony] increases damage / [Summon] tank faces away and clears adds||{rt1}None{rt1}||",
                ["normal"] = "{rt8}Rukhmar the Greatclaw{rt8}||[Rend] bleed / [Expose Agony] increases damage / [Summon] tank faces away and clears adds||{rt1}None{rt1}||",
                ["heroic"] = "{rt8}Rukhmar the Greatclaw{rt8}||[Rend] bleed / [Expose Agony] increases damage / [Summon] tank faces away and clears adds||{rt1}None{rt1}||",
                ["mythic"] = "{rt8}Rukhmar the Greatclaw{rt8}||[Rend] bleed / [Expose Agony] increases damage / [Summon] tank faces away and clears adds||{rt1}None{rt1}||",
                ["mythicplus"] = "{rt8}Rukhmar the Greatclaw{rt8}||[Rend] bleed / [Expose Agony] increases damage / [Summon] tank faces away and clears adds||{rt1}None{rt1}||",
            },
        },
        ["盘牙先知"] = {
            type = "MOB",
            tips = "{rt8}Priority: Coilfang Prophet (Naga){rt8}||[Healing Wave] must interrupt||{rt1}Must interrupt: [Healing Wave]{rt1}||",
        },
        ["背叛者门努"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mennu the Betrayer{rt8}||[Healing Totem]/[Flametongue Totem]/[Poison Arrow] prioritize killing the totems||{rt1}Dispel poison{rt1}||",
                ["normal"] = "{rt8}Mennu the Betrayer{rt8}||[Healing Totem]/[Flametongue Totem]/[Poison Arrow] prioritize killing the totems||{rt1}Dispel poison{rt1}||",
                ["heroic"] = "{rt8}Mennu the Betrayer{rt8}||[Healing Totem]/[Flametongue Totem]/[Poison Arrow] prioritize killing the totems||{rt1}Dispel poison{rt1}||",
                ["mythic"] = "{rt8}Mennu the Betrayer{rt8}||[Healing Totem]/[Flametongue Totem]/[Poison Arrow] prioritize killing the totems||{rt1}Dispel poison{rt1}||",
                ["mythicplus"] = "{rt8}Mennu the Betrayer{rt8}||[Healing Totem]/[Flametongue Totem]/[Poison Arrow] prioritize killing the totems||{rt1}Dispel poison{rt1}||",
            },
        },
    },
    ["风暴要塞：能源舰"] = {
        name = "Tempest Keep: The Mechanar",
        ["灵术师塞比瑟蕾"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warlock Sepithrene{rt8}||Summons fire/shadow [Elemental] / [Fire Blast] / [Shadow Bolt]—kill the elemental first||{rt1}Must interrupt: Shadow Bolt{rt1}||",
                ["normal"] = "{rt8}Warlock Sepithrene{rt8}||Summons fire/shadow [Elemental] / [Fire Blast] / [Shadow Bolt]—kill the elemental first||{rt1}Must interrupt: Shadow Bolt{rt1}||",
                ["heroic"] = "{rt8}Warlock Sepithrene{rt8}||Summons fire/shadow [Elemental] / [Fire Blast] / [Shadow Bolt]—kill the elemental first||{rt1}Must interrupt: Shadow Bolt{rt1}||",
                ["mythic"] = "{rt8}Warlock Sepithrene{rt8}||Summons fire/shadow [Elemental] / [Fire Blast] / [Shadow Bolt]—kill the elemental first||{rt1}Must interrupt: Shadow Bolt{rt1}||",
                ["mythicplus"] = "{rt8}Warlock Sepithrene{rt8}||Summons fire/shadow [Elemental] / [Fire Blast] / [Shadow Bolt]—kill the elemental first||{rt1}Must interrupt: Shadow Bolt{rt1}||",
            },
        },
        ["机械领主卡帕西图斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mechano-Lord Capacitus{rt8}||[Magnetic Flux] swaps Arcane/Fire damage / [Mana Disruption] / [Critical Shield]||{rt1}None{rt1}||Spread out to dodge elements; break shield and focus",
                ["normal"] = "{rt8}Mechano-Lord Capacitus{rt8}||[Magnetic Flux] swaps Arcane/Fire damage / [Mana Disruption] / [Critical Shield]||{rt1}None{rt1}||Spread out to dodge elements; break shield and focus",
                ["heroic"] = "{rt8}Mechano-Lord Capacitus{rt8}||[Magnetic Flux] swaps Arcane/Fire damage / [Mana Disruption] / [Critical Shield]||{rt1}None{rt1}||Spread out to dodge elements; break shield and focus",
                ["mythic"] = "{rt8}Mechano-Lord Capacitus{rt8}||[Magnetic Flux] swaps Arcane/Fire damage / [Mana Disruption] / [Critical Shield]||{rt1}None{rt1}||Spread out to dodge elements; break shield and focus",
                ["mythicplus"] = "{rt8}Mechano-Lord Capacitus{rt8}||[Magnetic Flux] swaps Arcane/Fire damage / [Mana Disruption] / [Critical Shield]||{rt1}None{rt1}||Spread out to dodge elements; break shield and focus",
            },
        },
        ["看守者盖罗基尔"] = {
            type = "MOB",
            tips = "{rt8}Warden Gerokil{rt8}||[Magnetic Flux]/[Overload]/[Shock Lightning] interrupt and spread||{rt1}Must interrupt: casting{rt1}||",
        },
        ["计算者帕萨雷恩"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Calculator Pasareen{rt8}||[Dominate] mind control / [Arcane Torrent] silence / summons [Void Wraith] / [Arcane Explosion]||{rt1}Dispel control / Polymorph{rt1}||Kill the wraith",
                ["normal"] = "{rt8}Calculator Pasareen{rt8}||[Dominate] mind control / [Arcane Torrent] silence / summons [Void Wraith] / [Arcane Explosion]||{rt1}Dispel control / Polymorph{rt1}||Kill the wraith",
                ["heroic"] = "{rt8}Calculator Pasareen{rt8}||[Dominate] mind control / [Arcane Torrent] silence / summons [Void Wraith] / [Arcane Explosion]||{rt1}Dispel control / Polymorph{rt1}||Kill the wraith",
                ["mythic"] = "{rt8}Calculator Pasareen{rt8}||[Dominate] mind control / [Arcane Torrent] silence / summons [Void Wraith] / [Arcane Explosion]||{rt1}Dispel control / Polymorph{rt1}||Kill the wraith",
                ["mythicplus"] = "{rt8}Calculator Pasareen{rt8}||[Dominate] mind control / [Arcane Torrent] silence / summons [Void Wraith] / [Arcane Explosion]||{rt1}Dispel control / Polymorph{rt1}||Kill the wraith",
            },
        },
        ["看守者埃隆汉"] = {
            type = "MOB",
            tips = "{rt8}Warden Elom{rt8}||[Cleave]/[Sunder]/[Throw] tank faces away to dodge Cleave||{rt1}None{rt1}||",
        },
        ["血精灵卫兵"] = {
            type = "MOB",
            tips = "{rt8}Priority: Blood Elf Guard{rt8}||[Arcane Polymorph]—control priority||{rt1}None{rt1}||Mechanical Construct [Force Field]—clear first",
        },
    },
    ["奥金顿：法力墓穴"] = {
        name = "Auchindoun: Mana-Tombs",
        ["虚灵缚法者"] = {
            type = "MOB",
            tips = "{rt8}Priority: Ethereal Bindkeeper{rt8}||[Shadow Bolt Volley] and heals the mobs—kill instantly||{rt1}Must interrupt: Shadow Bolt{rt1}||",
        },
        ["尤尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Yor{rt8}||[Double Breath] front fire—must dodge; [Stomp] 10-yard physical + knockback||{rt1}None{rt1}||Heroic-only (Illidan's void hound gift); tank faces away from group, melee stay 10+ yards out",
                ["normal"] = "{rt8}Yor{rt8}||[Double Breath] front fire—must dodge; [Stomp] 10-yard physical + knockback||{rt1}None{rt1}||Heroic-only (Illidan's void hound gift); tank faces away from group, melee stay 10+ yards out",
                ["heroic"] = "{rt8}Yor{rt8}||[Double Breath] front fire—must dodge; [Stomp] 10-yard physical + knockback||{rt1}None{rt1}||Heroic-only (Illidan's void hound gift); tank faces away from group, melee stay 10+ yards out",
                ["mythic"] = "{rt8}Yor{rt8}||[Double Breath] front fire—must dodge; [Stomp] 10-yard physical + knockback||{rt1}None{rt1}||Heroic-only (Illidan's void hound gift); tank faces away from group, melee stay 10+ yards out",
                ["mythicplus"] = "{rt8}Yor{rt8}||[Double Breath] front fire—must dodge; [Stomp] 10-yard physical + knockback||{rt1}None{rt1}||Heroic-only (Illidan's void hound gift); tank faces away from group, melee stay 10+ yards out",
            },
        },
        ["节点亲王沙法尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Node Prince Shaffar{rt8}||[Fireball]/[Frostbolt]/[Frost Nova]/[Blink] summons [Ethereal Beacon]||{rt1}Must interrupt: Frost{rt1}||Kill the beacon fast to prevent merging",
                ["normal"] = "{rt8}Node Prince Shaffar{rt8}||[Fireball]/[Frostbolt]/[Frost Nova]/[Blink] summons [Ethereal Beacon]||{rt1}Must interrupt: Frost{rt1}||Kill the beacon fast to prevent merging",
                ["heroic"] = "{rt8}Node Prince Shaffar{rt8}||[Fireball]/[Frostbolt]/[Frost Nova]/[Blink] summons [Ethereal Beacon]||{rt1}Must interrupt: Frost{rt1}||Kill the beacon fast to prevent merging",
                ["mythic"] = "{rt8}Node Prince Shaffar{rt8}||[Fireball]/[Frostbolt]/[Frost Nova]/[Blink] summons [Ethereal Beacon]||{rt1}Must interrupt: Frost{rt1}||Kill the beacon fast to prevent merging",
                ["mythicplus"] = "{rt8}Node Prince Shaffar{rt8}||[Fireball]/[Frostbolt]/[Frost Nova]/[Blink] summons [Ethereal Beacon]||{rt1}Must interrupt: Frost{rt1}||Kill the beacon fast to prevent merging",
            },
        },
        ["塔瓦洛克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Tavarok{rt8}||[Earthquake] 40-yard stun / [Crystal Prison] imprisons / [Cleave] interrupt Earthquake||{rt1}Must interrupt: [Earthquake]{rt1}||If imprisoned, run away",
                ["normal"] = "{rt8}Tavarok{rt8}||[Earthquake] 40-yard stun / [Crystal Prison] imprisons / [Cleave] interrupt Earthquake||{rt1}Must interrupt: [Earthquake]{rt1}||If imprisoned, run away",
                ["heroic"] = "{rt8}Tavarok{rt8}||[Earthquake] 40-yard stun / [Crystal Prison] imprisons / [Cleave] interrupt Earthquake||{rt1}Must interrupt: [Earthquake]{rt1}||If imprisoned, run away",
                ["mythic"] = "{rt8}Tavarok{rt8}||[Earthquake] 40-yard stun / [Crystal Prison] imprisons / [Cleave] interrupt Earthquake||{rt1}Must interrupt: [Earthquake]{rt1}||If imprisoned, run away",
                ["mythicplus"] = "{rt8}Tavarok{rt8}||[Earthquake] 40-yard stun / [Crystal Prison] imprisons / [Cleave] interrupt Earthquake||{rt1}Must interrupt: [Earthquake]{rt1}||If imprisoned, run away",
            },
        },
        ["潘德莫努斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Pandemonius{rt8}||[Shadow Shield] reflects magic (stop casting) / [Void Blast] knockback||{rt1}None{rt1}||When the shield is up, whole group stops; pull to a corner, face away",
                ["normal"] = "{rt8}Pandemonius{rt8}||[Shadow Shield] reflects magic (stop casting) / [Void Blast] knockback||{rt1}None{rt1}||When the shield is up, whole group stops; pull to a corner, face away",
                ["heroic"] = "{rt8}Pandemonius{rt8}||[Shadow Shield] reflects magic (stop casting) / [Void Blast] knockback||{rt1}None{rt1}||When the shield is up, whole group stops; pull to a corner, face away",
                ["mythic"] = "{rt8}Pandemonius{rt8}||[Shadow Shield] reflects magic (stop casting) / [Void Blast] knockback||{rt1}None{rt1}||When the shield is up, whole group stops; pull to a corner, face away",
                ["mythicplus"] = "{rt8}Pandemonius{rt8}||[Shadow Shield] reflects magic (stop casting) / [Void Blast] knockback||{rt1}None{rt1}||When the shield is up, whole group stops; pull to a corner, face away",
            },
        },
    },
    ["奥金顿：奥金尼地穴"] = {
        name = "Auchindoun: Auchenai Crypts",
        ["奥金尼侍僧"] = {
            type = "MOB",
            tips = "{rt8}Priority: Auchenai Monk{rt8}||[Shadow Bolt] can be controlled||{rt1}Must interrupt: Shadow Bolt{rt1}||Stay away at the Bridge of Silence",
        },
        ["大主教玛拉达尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Exarch Maladaar{rt8}||[Soul Screech] group Fear / [Stolen Soul] reduces healing / [Summon Avatar]||{rt1}Must interrupt: Fear{rt1}||Kill the stolen soul fast; RUSH before 25%",
                ["normal"] = "{rt8}Exarch Maladaar{rt8}||[Soul Screech] group Fear / [Stolen Soul] reduces healing / [Summon Avatar]||{rt1}Must interrupt: Fear{rt1}||Kill the stolen soul fast; RUSH before 25%",
                ["heroic"] = "{rt8}Exarch Maladaar{rt8}||[Soul Screech] group Fear / [Stolen Soul] reduces healing / [Summon Avatar]||{rt1}Must interrupt: Fear{rt1}||Kill the stolen soul fast; RUSH before 25%",
                ["mythic"] = "{rt8}Exarch Maladaar{rt8}||[Soul Screech] group Fear / [Stolen Soul] reduces healing / [Summon Avatar]||{rt1}Must interrupt: Fear{rt1}||Kill the stolen soul fast; RUSH before 25%",
                ["mythicplus"] = "{rt8}Exarch Maladaar{rt8}||[Soul Screech] group Fear / [Stolen Soul] reduces healing / [Summon Avatar]||{rt1}Must interrupt: Fear{rt1}||Kill the stolen soul fast; RUSH before 25%",
            },
        },
        ["死亡观察者希尔拉克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Shirrak the Dead Watcher{rt8}||[Focus Fire] random high damage / [Corrosion] DoT / [Soul Link] increases damage||{rt1}Must interrupt: [Focus Fire]{rt1}||Dispel Corrosion",
                ["normal"] = "{rt8}Shirrak the Dead Watcher{rt8}||[Focus Fire] random high damage / [Corrosion] DoT / [Soul Link] increases damage||{rt1}Must interrupt: [Focus Fire]{rt1}||Dispel Corrosion",
                ["heroic"] = "{rt8}Shirrak the Dead Watcher{rt8}||[Focus Fire] random high damage / [Corrosion] DoT / [Soul Link] increases damage||{rt1}Must interrupt: [Focus Fire]{rt1}||Dispel Corrosion",
                ["mythic"] = "{rt8}Shirrak the Dead Watcher{rt8}||[Focus Fire] random high damage / [Corrosion] DoT / [Soul Link] increases damage||{rt1}Must interrupt: [Focus Fire]{rt1}||Dispel Corrosion",
                ["mythicplus"] = "{rt8}Shirrak the Dead Watcher{rt8}||[Focus Fire] random high damage / [Corrosion] DoT / [Soul Link] increases damage||{rt1}Must interrupt: [Focus Fire]{rt1}||Dispel Corrosion",
            },
        },
    },
    ["风暴要塞：禁魔监狱"] = {
        name = "Tempest Keep: The Arcatraz",
        ["自由的瑟雷凯斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Cyrukh the Freed{rt8}||[Void Zone] black circle / [Corruption Seed] move away / [Shadow Nova] knockback||{rt1}None{rt1}||If seeded, move away from allies, hug the wall",
                ["normal"] = "{rt8}Cyrukh the Freed{rt8}||[Void Zone] black circle / [Corruption Seed] move away / [Shadow Nova] knockback||{rt1}None{rt1}||If seeded, move away from allies, hug the wall",
                ["heroic"] = "{rt8}Cyrukh the Freed{rt8}||[Void Zone] black circle / [Corruption Seed] move away / [Shadow Nova] knockback||{rt1}None{rt1}||If seeded, move away from allies, hug the wall",
                ["mythic"] = "{rt8}Cyrukh the Freed{rt8}||[Void Zone] black circle / [Corruption Seed] move away / [Shadow Nova] knockback||{rt1}None{rt1}||If seeded, move away from allies, hug the wall",
                ["mythicplus"] = "{rt8}Cyrukh the Freed{rt8}||[Void Zone] black circle / [Corruption Seed] move away / [Shadow Nova] knockback||{rt1}None{rt1}||If seeded, move away from allies, hug the wall",
            },
        },
        ["预言者斯克瑞斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Prophet Skreis{rt8}||Open 4 cells releases adds (including [Mind Flayer] Fear) / [Mind Control]||{rt1}Must interrupt: Fear{rt1}||Clear cell by cell, one at a time",
                ["normal"] = "{rt8}Prophet Skreis{rt8}||Open 4 cells releases adds (including [Mind Flayer] Fear) / [Mind Control]||{rt1}Must interrupt: Fear{rt1}||Clear cell by cell, one at a time",
                ["heroic"] = "{rt8}Prophet Skreis{rt8}||Open 4 cells releases adds (including [Mind Flayer] Fear) / [Mind Control]||{rt1}Must interrupt: Fear{rt1}||Clear cell by cell, one at a time",
                ["mythic"] = "{rt8}Prophet Skreis{rt8}||Open 4 cells releases adds (including [Mind Flayer] Fear) / [Mind Control]||{rt1}Must interrupt: Fear{rt1}||Clear cell by cell, one at a time",
                ["mythicplus"] = "{rt8}Prophet Skreis{rt8}||Open 4 cells releases adds (including [Mind Flayer] Fear) / [Mind Control]||{rt1}Must interrupt: Fear{rt1}||Clear cell by cell, one at a time",
            },
        },
        ["末日预言者达尔莉安"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Doom Prophet Darian{rt8}||[Doom Prophet's Gift] curse (if you heal, you heal the boss) / [Whirlwind] / [Shadow Bolt]||{rt1}None{rt1}||Don't heal through the curse; dodge Whirlwind",
                ["normal"] = "{rt8}Doom Prophet Darian{rt8}||[Doom Prophet's Gift] curse (if you heal, you heal the boss) / [Whirlwind] / [Shadow Bolt]||{rt1}None{rt1}||Don't heal through the curse; dodge Whirlwind",
                ["heroic"] = "{rt8}Doom Prophet Darian{rt8}||[Doom Prophet's Gift] curse (if you heal, you heal the boss) / [Whirlwind] / [Shadow Bolt]||{rt1}None{rt1}||Don't heal through the curse; dodge Whirlwind",
                ["mythic"] = "{rt8}Doom Prophet Darian{rt8}||[Doom Prophet's Gift] curse (if you heal, you heal the boss) / [Whirlwind] / [Shadow Bolt]||{rt1}None{rt1}||Don't heal through the curse; dodge Whirlwind",
                ["mythicplus"] = "{rt8}Doom Prophet Darian{rt8}||[Doom Prophet's Gift] curse (if you heal, you heal the boss) / [Whirlwind] / [Shadow Bolt]||{rt1}None{rt1}||Don't heal through the curse; dodge Whirlwind",
            },
        },
        ["虚灵"] = {
            type = "MOB",
            tips = "{rt8}Priority: Ethereal{rt8}||[Mana Burn] priority||{rt1}None{rt1}||Before the boss, clear the stealth Banshees",
        },
        ["天怒预言者苏克拉底"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Prophet Sokrates{rt8}||[Fel Consecration] 15-yard fire ring / [Fel Shock] DoT / [Charge] fire wall||{rt1}Dispel the DoT{rt1}||Guide the fire wall off to the side",
                ["normal"] = "{rt8}Prophet Sokrates{rt8}||[Fel Consecration] 15-yard fire ring / [Fel Shock] DoT / [Charge] fire wall||{rt1}Dispel the DoT{rt1}||Guide the fire wall off to the side",
                ["heroic"] = "{rt8}Prophet Sokrates{rt8}||[Fel Consecration] 15-yard fire ring / [Fel Shock] DoT / [Charge] fire wall||{rt1}Dispel the DoT{rt1}||Guide the fire wall off to the side",
                ["mythic"] = "{rt8}Prophet Sokrates{rt8}||[Fel Consecration] 15-yard fire ring / [Fel Shock] DoT / [Charge] fire wall||{rt1}Dispel the DoT{rt1}||Guide the fire wall off to the side",
                ["mythicplus"] = "{rt8}Prophet Sokrates{rt8}||[Fel Consecration] 15-yard fire ring / [Fel Shock] DoT / [Charge] fire wall||{rt1}Dispel the DoT{rt1}||Guide the fire wall off to the side",
            },
        },
    },
    ["奥金顿：暗影迷宫"] = {
        name = "Auchindoun: Shadow Labyrinth",
        ["煽动者布莱卡特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Blackheart the Inciter{rt8}||[Incite Chaos] mind controls players to fight each other / [War Stomp] / [Charge]||{rt1}None{rt1}||Spread out, RUSH and kill fast",
                ["normal"] = "{rt8}Blackheart the Inciter{rt8}||[Incite Chaos] mind controls players to fight each other / [War Stomp] / [Charge]||{rt1}None{rt1}||Spread out, RUSH and kill fast",
                ["heroic"] = "{rt8}Blackheart the Inciter{rt8}||[Incite Chaos] mind controls players to fight each other / [War Stomp] / [Charge]||{rt1}None{rt1}||Spread out, RUSH and kill fast",
                ["mythic"] = "{rt8}Blackheart the Inciter{rt8}||[Incite Chaos] mind controls players to fight each other / [War Stomp] / [Charge]||{rt1}None{rt1}||Spread out, RUSH and kill fast",
                ["mythicplus"] = "{rt8}Blackheart the Inciter{rt8}||[Incite Chaos] mind controls players to fight each other / [War Stomp] / [Charge]||{rt1}None{rt1}||Spread out, RUSH and kill fast",
            },
        },
        ["摩摩尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Murmur{rt8}||[Sonic Boom] close-range high Nature damage / [Magnetic Pull] + [Murmur's Touch] silence||{rt1}None{rt1}||After being pulled, run away and stay 6+ yards out",
                ["normal"] = "{rt8}Murmur{rt8}||[Sonic Boom] close-range high Nature damage / [Magnetic Pull] + [Murmur's Touch] silence||{rt1}None{rt1}||After being pulled, run away and stay 6+ yards out",
                ["heroic"] = "{rt8}Murmur{rt8}||[Sonic Boom] close-range high Nature damage / [Magnetic Pull] + [Murmur's Touch] silence||{rt1}None{rt1}||After being pulled, run away and stay 6+ yards out",
                ["mythic"] = "{rt8}Murmur{rt8}||[Sonic Boom] close-range high Nature damage / [Magnetic Pull] + [Murmur's Touch] silence||{rt1}None{rt1}||After being pulled, run away and stay 6+ yards out",
                ["mythicplus"] = "{rt8}Murmur{rt8}||[Sonic Boom] close-range high Nature damage / [Magnetic Pull] + [Murmur's Touch] silence||{rt1}None{rt1}||After being pulled, run away and stay 6+ yards out",
            },
        },
        ["沃匹尔大师"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Master Wopil{rt8}||[Shadow Bolt Volley]/[Teleport] + [Rain of Fire] / summons [Voidwalker] to heal||{rt1}Must interrupt: Shadow Bolt{rt1}||After teleport, run away and kill the add fast",
                ["normal"] = "{rt8}Master Wopil{rt8}||[Shadow Bolt Volley]/[Teleport] + [Rain of Fire] / summons [Voidwalker] to heal||{rt1}Must interrupt: Shadow Bolt{rt1}||After teleport, run away and kill the add fast",
                ["heroic"] = "{rt8}Master Wopil{rt8}||[Shadow Bolt Volley]/[Teleport] + [Rain of Fire] / summons [Voidwalker] to heal||{rt1}Must interrupt: Shadow Bolt{rt1}||After teleport, run away and kill the add fast",
                ["mythic"] = "{rt8}Master Wopil{rt8}||[Shadow Bolt Volley]/[Teleport] + [Rain of Fire] / summons [Voidwalker] to heal||{rt1}Must interrupt: Shadow Bolt{rt1}||After teleport, run away and kill the add fast",
                ["mythicplus"] = "{rt8}Master Wopil{rt8}||[Shadow Bolt Volley]/[Teleport] + [Rain of Fire] / summons [Voidwalker] to heal||{rt1}Must interrupt: Shadow Bolt{rt1}||After teleport, run away and kill the add fast",
            },
        },
        ["邪兽人"] = {
            type = "MOB",
            tips = "{rt8}Priority: Fel Orc{rt8}||[Shadow Priest] casts [Fear]—heavy crowd control||{rt1}Must interrupt: Fear{rt1}||",
        },
        ["赫尔默大使"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ambassador Hellmaw{rt8}||[Corrosive Acid] front cone armor reduction / [Fear] tank faces away||{rt1}Must interrupt: Fear{rt1}||Whole group eats the Fear to protect the MT",
                ["normal"] = "{rt8}Ambassador Hellmaw{rt8}||[Corrosive Acid] front cone armor reduction / [Fear] tank faces away||{rt1}Must interrupt: Fear{rt1}||Whole group eats the Fear to protect the MT",
                ["heroic"] = "{rt8}Ambassador Hellmaw{rt8}||[Corrosive Acid] front cone armor reduction / [Fear] tank faces away||{rt1}Must interrupt: Fear{rt1}||Whole group eats the Fear to protect the MT",
                ["mythic"] = "{rt8}Ambassador Hellmaw{rt8}||[Corrosive Acid] front cone armor reduction / [Fear] tank faces away||{rt1}Must interrupt: Fear{rt1}||Whole group eats the Fear to protect the MT",
                ["mythicplus"] = "{rt8}Ambassador Hellmaw{rt8}||[Corrosive Acid] front cone armor reduction / [Fear] tank faces away||{rt1}Must interrupt: Fear{rt1}||Whole group eats the Fear to protect the MT",
            },
        },
    },
    ["盘牙湖泊：幽暗沼泽"] = {
        name = "Coilfang Reservoir: The Underbog",
        ["孢子潜伏者"] = {
            type = "MOB",
            tips = "{rt8}Priority: Spore Stalker / Stalker{rt8}||Nature AoE damage—clear fast||{rt1}None{rt1}||",
        },
        ["黑色阔步者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Black Stalker{rt8}||[Chain Lightning]/[Toxic Nova]/[Enrage] interrupt and spread||{rt1}Must interrupt: casting{rt1}||",
                ["normal"] = "{rt8}Black Stalker{rt8}||[Chain Lightning]/[Toxic Nova]/[Enrage] interrupt and spread||{rt1}Must interrupt: casting{rt1}||",
                ["heroic"] = "{rt8}Black Stalker{rt8}||[Chain Lightning]/[Toxic Nova]/[Enrage] interrupt and spread||{rt1}Must interrupt: casting{rt1}||",
                ["mythic"] = "{rt8}Black Stalker{rt8}||[Chain Lightning]/[Toxic Nova]/[Enrage] interrupt and spread||{rt1}Must interrupt: casting{rt1}||",
                ["mythicplus"] = "{rt8}Black Stalker{rt8}||[Chain Lightning]/[Toxic Nova]/[Enrage] interrupt and spread||{rt1}Must interrupt: casting{rt1}||",
            },
        },
        ["霍加尔芬"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Horgalen{rt8}||[Spore Cloud] area Nature damage / [Summon Spore Stalker] spread out||{rt1}None{rt1}||Clear adds fast to reduce damage",
                ["normal"] = "{rt8}Horgalen{rt8}||[Spore Cloud] area Nature damage / [Summon Spore Stalker] spread out||{rt1}None{rt1}||Clear adds fast to reduce damage",
                ["heroic"] = "{rt8}Horgalen{rt8}||[Spore Cloud] area Nature damage / [Summon Spore Stalker] spread out||{rt1}None{rt1}||Clear adds fast to reduce damage",
                ["mythic"] = "{rt8}Horgalen{rt8}||[Spore Cloud] area Nature damage / [Summon Spore Stalker] spread out||{rt1}None{rt1}||Clear adds fast to reduce damage",
                ["mythicplus"] = "{rt8}Horgalen{rt8}||[Spore Cloud] area Nature damage / [Summon Spore Stalker] spread out||{rt1}None{rt1}||Clear adds fast to reduce damage",
            },
        },
        ["沼地领主穆塞雷克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Marsh Lord Musel'ek{rt8}||[Multishot]/[Viper Sting] mana drain / [Summon] dispel the sting||{rt1}Dispel the sting{rt1}||Clear the summoned adds",
                ["normal"] = "{rt8}Marsh Lord Musel'ek{rt8}||[Multishot]/[Viper Sting] mana drain / [Summon] dispel the sting||{rt1}Dispel the sting{rt1}||Clear the summoned adds",
                ["heroic"] = "{rt8}Marsh Lord Musel'ek{rt8}||[Multishot]/[Viper Sting] mana drain / [Summon] dispel the sting||{rt1}Dispel the sting{rt1}||Clear the summoned adds",
                ["mythic"] = "{rt8}Marsh Lord Musel'ek{rt8}||[Multishot]/[Viper Sting] mana drain / [Summon] dispel the sting||{rt1}Dispel the sting{rt1}||Clear the summoned adds",
                ["mythicplus"] = "{rt8}Marsh Lord Musel'ek{rt8}||[Multishot]/[Viper Sting] mana drain / [Summon] dispel the sting||{rt1}Dispel the sting{rt1}||Clear the summoned adds",
            },
        },
        ["加兹安"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gaz'an{rt8}||[Acid Spray] front / [Tail Sweep] knockback / [Underwater Vision] reduced hit||{rt1}None{rt1}||Melee dodge the tail",
                ["normal"] = "{rt8}Gaz'an{rt8}||[Acid Spray] front / [Tail Sweep] knockback / [Underwater Vision] reduced hit||{rt1}None{rt1}||Melee dodge the tail",
                ["heroic"] = "{rt8}Gaz'an{rt8}||[Acid Spray] front / [Tail Sweep] knockback / [Underwater Vision] reduced hit||{rt1}None{rt1}||Melee dodge the tail",
                ["mythic"] = "{rt8}Gaz'an{rt8}||[Acid Spray] front / [Tail Sweep] knockback / [Underwater Vision] reduced hit||{rt1}None{rt1}||Melee dodge the tail",
                ["mythicplus"] = "{rt8}Gaz'an{rt8}||[Acid Spray] front / [Tail Sweep] knockback / [Underwater Vision] reduced hit||{rt1}None{rt1}||Melee dodge the tail",
            },
        },
    },
    ["奥金顿：塞泰克大厅"] = {
        name = "Auchindoun: Sethekk Halls",
        ["塞泰克卫兵"] = {
            type = "MOB",
            tips = "{rt8}Priority: Sethekk Sentinel{rt8}||[Thunder Clap] high damage—priority; recruits have [Reflective Shield]—physical hits||{rt1}None{rt1}||",
        },
        ["利爪之王艾吉斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}King of Talons Aegis{rt8}||[Arcane Explosion]/[Arcane Rain]/[Polymorph] blink behind a pillar to dodge, dispel||{rt1}Must interrupt: Polymorph{rt1}||",
                ["normal"] = "{rt8}King of Talons Aegis{rt8}||[Arcane Explosion]/[Arcane Rain]/[Polymorph] blink behind a pillar to dodge, dispel||{rt1}Must interrupt: Polymorph{rt1}||",
                ["heroic"] = "{rt8}King of Talons Aegis{rt8}||[Arcane Explosion]/[Arcane Rain]/[Polymorph] blink behind a pillar to dodge, dispel||{rt1}Must interrupt: Polymorph{rt1}||",
                ["mythic"] = "{rt8}King of Talons Aegis{rt8}||[Arcane Explosion]/[Arcane Rain]/[Polymorph] blink behind a pillar to dodge, dispel||{rt1}Must interrupt: Polymorph{rt1}||",
                ["mythicplus"] = "{rt8}King of Talons Aegis{rt8}||[Arcane Explosion]/[Arcane Rain]/[Polymorph] blink behind a pillar to dodge, dispel||{rt1}Must interrupt: Polymorph{rt1}||",
            },
        },
        ["安苏"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Anzu{rt8}||[Terrifying Screech] group-wide 6s stun (uninterruptible—pre-shield); [Spell Bomb] curse + mana drain, affected players stop casting||{rt1}Must interrupt: [Feather Hurricane] interruptible; kill [Anzu's Brood] fast{rt1}||At 75%/35% [Banish] summons chick AoE; [Dive] knockback; [Rend Flesh] DoT",
                ["normal"] = "{rt8}Anzu{rt8}||[Terrifying Screech] group-wide 6s stun (uninterruptible—pre-shield); [Spell Bomb] curse + mana drain, affected players stop casting||{rt1}Must interrupt: [Feather Hurricane] interruptible; kill [Anzu's Brood] fast{rt1}||At 75%/35% [Banish] summons chick AoE; [Dive] knockback; [Rend Flesh] DoT",
                ["heroic"] = "{rt8}Anzu{rt8}||[Terrifying Screech] group-wide 6s stun (uninterruptible—pre-shield); [Spell Bomb] curse + mana drain, affected players stop casting||{rt1}Must interrupt: [Feather Hurricane] interruptible; kill [Anzu's Brood] fast{rt1}||At 75%/35% [Banish] summons chick AoE; [Dive] knockback; [Rend Flesh] DoT",
                ["mythic"] = "{rt8}Anzu{rt8}||[Terrifying Screech] group-wide 6s stun (uninterruptible—pre-shield); [Spell Bomb] curse + mana drain, affected players stop casting||{rt1}Must interrupt: [Feather Hurricane] interruptible; kill [Anzu's Brood] fast{rt1}||At 75%/35% [Banish] summons chick AoE; [Dive] knockback; [Rend Flesh] DoT",
                ["mythicplus"] = "{rt8}Anzu{rt8}||[Terrifying Screech] group-wide 6s stun (uninterruptible—pre-shield); [Spell Bomb] curse + mana drain, affected players stop casting||{rt1}Must interrupt: [Feather Hurricane] interruptible; kill [Anzu's Brood] fast{rt1}||At 75%/35% [Banish] summons chick AoE; [Dive] knockback; [Rend Flesh] DoT",
            },
        },
        ["黑暗编织者塞斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Darkweaver Syth{rt8}||[Arcane Explosion] after blink, area Arcane damage / summons fire, frost, arcane, shadow 4 elements||{rt1}None{rt1}||After blink, hide behind a pillar, prioritize killing the fire element",
                ["normal"] = "{rt8}Darkweaver Syth{rt8}||[Arcane Explosion] after blink, area Arcane damage / summons fire, frost, arcane, shadow 4 elements||{rt1}None{rt1}||After blink, hide behind a pillar, prioritize killing the fire element",
                ["heroic"] = "{rt8}Darkweaver Syth{rt8}||[Arcane Explosion] after blink, area Arcane damage / summons fire, frost, arcane, shadow 4 elements||{rt1}None{rt1}||After blink, hide behind a pillar, prioritize killing the fire element",
                ["mythic"] = "{rt8}Darkweaver Syth{rt8}||[Arcane Explosion] after blink, area Arcane damage / summons fire, frost, arcane, shadow 4 elements||{rt1}None{rt1}||After blink, hide behind a pillar, prioritize killing the fire element",
                ["mythicplus"] = "{rt8}Darkweaver Syth{rt8}||[Arcane Explosion] after blink, area Arcane damage / summons fire, frost, arcane, shadow 4 elements||{rt1}None{rt1}||After blink, hide behind a pillar, prioritize killing the fire element",
            },
        },
    },
    ["盘牙湖泊：蒸汽地窟"] = {
        name = "Coilfang Reservoir: The Steamvault",
        ["机械师斯蒂里格"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mechanist Stelrig{rt8}||[Summon Mechanical Shark]/[Trap] clear sharks fast, dodge traps||{rt1}None{rt1}||",
                ["normal"] = "{rt8}Mechanist Stelrig{rt8}||[Summon Mechanical Shark]/[Trap] clear sharks fast, dodge traps||{rt1}None{rt1}||",
                ["heroic"] = "{rt8}Mechanist Stelrig{rt8}||[Summon Mechanical Shark]/[Trap] clear sharks fast, dodge traps||{rt1}None{rt1}||",
                ["mythic"] = "{rt8}Mechanist Stelrig{rt8}||[Summon Mechanical Shark]/[Trap] clear sharks fast, dodge traps||{rt1}None{rt1}||",
                ["mythicplus"] = "{rt8}Mechanist Stelrig{rt8}||[Summon Mechanical Shark]/[Trap] clear sharks fast, dodge traps||{rt1}None{rt1}||",
            },
        },
        ["水术师瑟丝比娅"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hydromancer Thespia{rt8}||[Chain Lightning]/[Healing Wave]/[Mana Shield] interrupt heal, break shield||{rt1}Must interrupt: [Healing Wave]{rt1}||",
                ["normal"] = "{rt8}Hydromancer Thespia{rt8}||[Chain Lightning]/[Healing Wave]/[Mana Shield] interrupt heal, break shield||{rt1}Must interrupt: [Healing Wave]{rt1}||",
                ["heroic"] = "{rt8}Hydromancer Thespia{rt8}||[Chain Lightning]/[Healing Wave]/[Mana Shield] interrupt heal, break shield||{rt1}Must interrupt: [Healing Wave]{rt1}||",
                ["mythic"] = "{rt8}Hydromancer Thespia{rt8}||[Chain Lightning]/[Healing Wave]/[Mana Shield] interrupt heal, break shield||{rt1}Must interrupt: [Healing Wave]{rt1}||",
                ["mythicplus"] = "{rt8}Hydromancer Thespia{rt8}||[Chain Lightning]/[Healing Wave]/[Mana Shield] interrupt heal, break shield||{rt1}Must interrupt: [Healing Wave]{rt1}||",
            },
        },
        ["督军卡利瑟里斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warlord Kalithresh{rt8}||[Enrage] damage scales with energy / [Mana Drain] / [Heal]||{rt1}Must interrupt: Heal{rt1}||Control energy, don't let it max",
                ["normal"] = "{rt8}Warlord Kalithresh{rt8}||[Enrage] damage scales with energy / [Mana Drain] / [Heal]||{rt1}Must interrupt: Heal{rt1}||Control energy, don't let it max",
                ["heroic"] = "{rt8}Warlord Kalithresh{rt8}||[Enrage] damage scales with energy / [Mana Drain] / [Heal]||{rt1}Must interrupt: Heal{rt1}||Control energy, don't let it max",
                ["mythic"] = "{rt8}Warlord Kalithresh{rt8}||[Enrage] damage scales with energy / [Mana Drain] / [Heal]||{rt1}Must interrupt: Heal{rt1}||Control energy, don't let it max",
                ["mythicplus"] = "{rt8}Warlord Kalithresh{rt8}||[Enrage] damage scales with energy / [Mana Drain] / [Heal]||{rt1}Must interrupt: Heal{rt1}||Control energy, don't let it max",
            },
        },
        ["盘牙水占师"] = {
            type = "MOB",
            tips = "{rt8}Priority: Coilfang Diviner{rt8}||[Healing Wave]/[Purify] prioritize interrupting||{rt1}Must interrupt: [Healing Wave]{rt1}||",
        },
    },
    ["逃离敦霍尔德"] = {
        name = "Old Hillsbrad Foothills",
        ["德拉克中尉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lieutenant Drake{rt8}||[Whirlwind]/[Mortal Strike]/[Intimidating Shout] tank faces away||{rt1}Must interrupt: Fear{rt1}||Healer keep fear ward / trinket ready",
                ["normal"] = "{rt8}Lieutenant Drake{rt8}||[Whirlwind]/[Mortal Strike]/[Intimidating Shout] tank faces away||{rt1}Must interrupt: Fear{rt1}||Healer keep fear ward / trinket ready",
                ["heroic"] = "{rt8}Lieutenant Drake{rt8}||[Whirlwind]/[Mortal Strike]/[Intimidating Shout] tank faces away||{rt1}Must interrupt: Fear{rt1}||Healer keep fear ward / trinket ready",
                ["mythic"] = "{rt8}Lieutenant Drake{rt8}||[Whirlwind]/[Mortal Strike]/[Intimidating Shout] tank faces away||{rt1}Must interrupt: Fear{rt1}||Healer keep fear ward / trinket ready",
                ["mythicplus"] = "{rt8}Lieutenant Drake{rt8}||[Whirlwind]/[Mortal Strike]/[Intimidating Shout] tank faces away||{rt1}Must interrupt: Fear{rt1}||Healer keep fear ward / trinket ready",
            },
        },
        ["敦霍尔德法师"] = {
            type = "MOB",
            tips = "{rt8}Priority: Durnholde Mage{rt8}||[Fireball]/[Polymorph] must interrupt||{rt1}Must interrupt: Polymorph{rt1}||Scout [Dispel Shot] clears threat—kill first",
        },
        ["时空猎手"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Temporus{rt8}||[Sand Breath] front / [Imminent Death] marks a target / [Magic Dispelling Aura] dispel||{rt1}Dispel the mark{rt1}||Clear the three waves of whelps",
                ["normal"] = "{rt8}Temporus{rt8}||[Sand Breath] front / [Imminent Death] marks a target / [Magic Dispelling Aura] dispel||{rt1}Dispel the mark{rt1}||Clear the three waves of whelps",
                ["heroic"] = "{rt8}Temporus{rt8}||[Sand Breath] front / [Imminent Death] marks a target / [Magic Dispelling Aura] dispel||{rt1}Dispel the mark{rt1}||Clear the three waves of whelps",
                ["mythic"] = "{rt8}Temporus{rt8}||[Sand Breath] front / [Imminent Death] marks a target / [Magic Dispelling Aura] dispel||{rt1}Dispel the mark{rt1}||Clear the three waves of whelps",
                ["mythicplus"] = "{rt8}Temporus{rt8}||[Sand Breath] front / [Imminent Death] marks a target / [Magic Dispelling Aura] dispel||{rt1}Dispel the mark{rt1}||Clear the three waves of whelps",
            },
        },
        ["斯卡洛克上尉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Captain Skarloc{rt8}||[Holy Light] self-heal / [Hammer of Justice] stun / with [Durnholde Watcher] healer||{rt1}Must interrupt: Holy Light{rt1}||Kill the priest first to stop heals",
                ["normal"] = "{rt8}Captain Skarloc{rt8}||[Holy Light] self-heal / [Hammer of Justice] stun / with [Durnholde Watcher] healer||{rt1}Must interrupt: Holy Light{rt1}||Kill the priest first to stop heals",
                ["heroic"] = "{rt8}Captain Skarloc{rt8}||[Holy Light] self-heal / [Hammer of Justice] stun / with [Durnholde Watcher] healer||{rt1}Must interrupt: Holy Light{rt1}||Kill the priest first to stop heals",
                ["mythic"] = "{rt8}Captain Skarloc{rt8}||[Holy Light] self-heal / [Hammer of Justice] stun / with [Durnholde Watcher] healer||{rt1}Must interrupt: Holy Light{rt1}||Kill the priest first to stop heals",
                ["mythicplus"] = "{rt8}Captain Skarloc{rt8}||[Holy Light] self-heal / [Hammer of Justice] stun / with [Durnholde Watcher] healer||{rt1}Must interrupt: Holy Light{rt1}||Kill the priest first to stop heals",
            },
        },
    },
    ["风暴要塞：生态船"] = {
        name = "Tempest Keep: The Botanica",
        ["拉伊"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Laj{rt8}||[Elemental Shift] swaps resistances / [Thornslash] DoT / summons [Thorns]—assign someone to kill the flowers||{rt1}Dispel the disease{rt1}||",
                ["normal"] = "{rt8}Laj{rt8}||[Elemental Shift] swaps resistances / [Thornslash] DoT / summons [Thorns]—assign someone to kill the flowers||{rt1}Dispel the disease{rt1}||",
                ["heroic"] = "{rt8}Laj{rt8}||[Elemental Shift] swaps resistances / [Thornslash] DoT / summons [Thorns]—assign someone to kill the flowers||{rt1}Dispel the disease{rt1}||",
                ["mythic"] = "{rt8}Laj{rt8}||[Elemental Shift] swaps resistances / [Thornslash] DoT / summons [Thorns]—assign someone to kill the flowers||{rt1}Dispel the disease{rt1}||",
                ["mythicplus"] = "{rt8}Laj{rt8}||[Elemental Shift] swaps resistances / [Thornslash] DoT / summons [Thorns]—assign someone to kill the flowers||{rt1}Dispel the disease{rt1}||",
            },
        },
        ["萨特"] = {
            type = "MOB",
            tips = "{rt8}Priority: Satyr / Blood Elf{rt8}||[Hellfire] buff—kill the blood elves before starting the boss||{rt1}None{rt1}||Clear the fel flowers on the way",
        },
        ["指挥官萨拉妮丝"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Commander Sarannis{rt8}||[Arcane Echo] increases Arcane damage (dispel) / [Summon Reinforcements] repair drone||{rt1}Dispel the echo{rt1}||Focus the repair drone",
                ["normal"] = "{rt8}Commander Sarannis{rt8}||[Arcane Echo] increases Arcane damage (dispel) / [Summon Reinforcements] repair drone||{rt1}Dispel the echo{rt1}||Focus the repair drone",
                ["heroic"] = "{rt8}Commander Sarannis{rt8}||[Arcane Echo] increases Arcane damage (dispel) / [Summon Reinforcements] repair drone||{rt1}Dispel the echo{rt1}||Focus the repair drone",
                ["mythic"] = "{rt8}Commander Sarannis{rt8}||[Arcane Echo] increases Arcane damage (dispel) / [Summon Reinforcements] repair drone||{rt1}Dispel the echo{rt1}||Focus the repair drone",
                ["mythicplus"] = "{rt8}Commander Sarannis{rt8}||[Arcane Echo] increases Arcane damage (dispel) / [Summon Reinforcements] repair drone||{rt1}Dispel the echo{rt1}||Focus the repair drone",
            },
        },
        ["看管者索恩格林"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warden Thorngrin{rt8}||[Hellfire] 15-yard fire / [Sacrifice] teleports and drains, stun||{rt1}None{rt1}||Dodge fire; run away when marked",
                ["normal"] = "{rt8}Warden Thorngrin{rt8}||[Hellfire] 15-yard fire / [Sacrifice] teleports and drains, stun||{rt1}None{rt1}||Dodge fire; run away when marked",
                ["heroic"] = "{rt8}Warden Thorngrin{rt8}||[Hellfire] 15-yard fire / [Sacrifice] teleports and drains, stun||{rt1}None{rt1}||Dodge fire; run away when marked",
                ["mythic"] = "{rt8}Warden Thorngrin{rt8}||[Hellfire] 15-yard fire / [Sacrifice] teleports and drains, stun||{rt1}None{rt1}||Dodge fire; run away when marked",
                ["mythicplus"] = "{rt8}Warden Thorngrin{rt8}||[Hellfire] 15-yard fire / [Sacrifice] teleports and drains, stun||{rt1}None{rt1}||Dodge fire; run away when marked",
            },
        },
        ["高级植物学家弗雷温"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Botanist Freywinn{rt8}||Turns into a tree casting [Tranquility] to heal + summons [Fel Flower Protector]—kill the flowers fast||{rt1}None{rt1}||Pull away from boss to prevent healing",
                ["normal"] = "{rt8}High Botanist Freywinn{rt8}||Turns into a tree casting [Tranquility] to heal + summons [Fel Flower Protector]—kill the flowers fast||{rt1}None{rt1}||Pull away from boss to prevent healing",
                ["heroic"] = "{rt8}High Botanist Freywinn{rt8}||Turns into a tree casting [Tranquility] to heal + summons [Fel Flower Protector]—kill the flowers fast||{rt1}None{rt1}||Pull away from boss to prevent healing",
                ["mythic"] = "{rt8}High Botanist Freywinn{rt8}||Turns into a tree casting [Tranquility] to heal + summons [Fel Flower Protector]—kill the flowers fast||{rt1}None{rt1}||Pull away from boss to prevent healing",
                ["mythicplus"] = "{rt8}High Botanist Freywinn{rt8}||Turns into a tree casting [Tranquility] to heal + summons [Fel Flower Protector]—kill the flowers fast||{rt1}None{rt1}||Pull away from boss to prevent healing",
            },
        },
        ["迁跃扭木"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warpwood Twister{rt8}||[AoE Stun] 25 yards / summons [Sapling] to heal / [Spatial Rift] AoE||{rt1}None{rt1}||Kill the saplings, ranged stay farthest",
                ["normal"] = "{rt8}Warpwood Twister{rt8}||[AoE Stun] 25 yards / summons [Sapling] to heal / [Spatial Rift] AoE||{rt1}None{rt1}||Kill the saplings, ranged stay farthest",
                ["heroic"] = "{rt8}Warpwood Twister{rt8}||[AoE Stun] 25 yards / summons [Sapling] to heal / [Spatial Rift] AoE||{rt1}None{rt1}||Kill the saplings, ranged stay farthest",
                ["mythic"] = "{rt8}Warpwood Twister{rt8}||[AoE Stun] 25 yards / summons [Sapling] to heal / [Spatial Rift] AoE||{rt1}None{rt1}||Kill the saplings, ranged stay farthest",
                ["mythicplus"] = "{rt8}Warpwood Twister{rt8}||[AoE Stun] 25 yards / summons [Sapling] to heal / [Spatial Rift] AoE||{rt1}None{rt1}||Kill the saplings, ranged stay farthest",
            },
        },
    },
    ["开启黑暗之门"] = {
        name = "Black Morass",
        ["时空领主德亚"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Chrono Lord Deja{rt8}||[Arcane Redemption] area Arcane damage / [Time Lapse] slow / [Attract] pulls players||{rt1}None{rt1}||Spread out; when pulled, run away",
                ["normal"] = "{rt8}Chrono Lord Deja{rt8}||[Arcane Redemption] area Arcane damage / [Time Lapse] slow / [Attract] pulls players||{rt1}None{rt1}||Spread out; when pulled, run away",
                ["heroic"] = "{rt8}Chrono Lord Deja{rt8}||[Arcane Redemption] area Arcane damage / [Time Lapse] slow / [Attract] pulls players||{rt1}None{rt1}||Spread out; when pulled, run away",
                ["mythic"] = "{rt8}Chrono Lord Deja{rt8}||[Arcane Redemption] area Arcane damage / [Time Lapse] slow / [Attract] pulls players||{rt1}None{rt1}||Spread out; when pulled, run away",
                ["mythicplus"] = "{rt8}Chrono Lord Deja{rt8}||[Arcane Redemption] area Arcane damage / [Time Lapse] slow / [Attract] pulls players||{rt1}None{rt1}||Spread out; when pulled, run away",
            },
        },
        ["埃欧努斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Aeonus{rt8}||[Time Stop] area root 4s / [Sand Breath] / [Enrage]||{rt1}None{rt1}||Spread out; before Time Stop keep tank HP up",
                ["normal"] = "{rt8}Aeonus{rt8}||[Time Stop] area root 4s / [Sand Breath] / [Enrage]||{rt1}None{rt1}||Spread out; before Time Stop keep tank HP up",
                ["heroic"] = "{rt8}Aeonus{rt8}||[Time Stop] area root 4s / [Sand Breath] / [Enrage]||{rt1}None{rt1}||Spread out; before Time Stop keep tank HP up",
                ["mythic"] = "{rt8}Aeonus{rt8}||[Time Stop] area root 4s / [Sand Breath] / [Enrage]||{rt1}None{rt1}||Spread out; before Time Stop keep tank HP up",
                ["mythicplus"] = "{rt8}Aeonus{rt8}||[Time Stop] area root 4s / [Sand Breath] / [Enrage]||{rt1}None{rt1}||Spread out; before Time Stop keep tank HP up",
            },
        },
        ["裂隙守卫者"] = {
            type = "MOB",
            tips = "{rt8}Priority: Rift Guardian / Lord{rt8}||Kill fast to close the rift; don't hit Medivh's shield||{rt1}None{rt1}||The 3 Eternal Whelps attack in sync—focus fire",
        },
        ["坦普卢斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Epoch Hunter{rt8}||[Mortal Wound] stacks reduce healing / [Wing Buffet] knockback, clears threat, immune to taunt||{rt1}None{rt1}||Tank pops damage reduction to avoid knockback",
                ["normal"] = "{rt8}Epoch Hunter{rt8}||[Mortal Wound] stacks reduce healing / [Wing Buffet] knockback, clears threat, immune to taunt||{rt1}None{rt1}||Tank pops damage reduction to avoid knockback",
                ["heroic"] = "{rt8}Epoch Hunter{rt8}||[Mortal Wound] stacks reduce healing / [Wing Buffet] knockback, clears threat, immune to taunt||{rt1}None{rt1}||Tank pops damage reduction to avoid knockback",
                ["mythic"] = "{rt8}Epoch Hunter{rt8}||[Mortal Wound] stacks reduce healing / [Wing Buffet] knockback, clears threat, immune to taunt||{rt1}None{rt1}||Tank pops damage reduction to avoid knockback",
                ["mythicplus"] = "{rt8}Epoch Hunter{rt8}||[Mortal Wound] stacks reduce healing / [Wing Buffet] knockback, clears threat, immune to taunt||{rt1}None{rt1}||Tank pops damage reduction to avoid knockback",
            },
        },
    },
}
