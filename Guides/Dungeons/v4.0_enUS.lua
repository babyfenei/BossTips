-- ============================================================================
-- BossTips 4.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["4.0"] = {
    ["巨石之核"] = {
        name = "The Stonecore",
        ["克伯鲁斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Cerberus{rt8}||dodge pink / purple [Crystal Shard] explosions and dispel the damage buff debuff||{rt1}while burrowing stay away from [Burrow Charge] dust cloud{rt1}||P1 [Crystal Barrage] stand far; P2 burrow summons small elementals—clear fast; heroic shards chase players",
                ["normal"] = "{rt8}Cerberus{rt8}||dodge pink / purple [Crystal Shard] explosions and dispel the damage buff debuff||{rt1}while burrowing stay away from [Burrow Charge] dust cloud{rt1}||P1 [Crystal Barrage] stand far; P2 burrow summons small elementals—clear fast; heroic shards chase players",
                ["heroic"] = "{rt8}Cerberus{rt8}||dodge pink / purple [Crystal Shard] explosions and dispel the damage buff debuff||{rt1}while burrowing stay away from [Burrow Charge] dust cloud{rt1}||P1 [Crystal Barrage] stand far; P2 burrow summons small elementals—clear fast; heroic shards chase players",
                ["mythic"] = "{rt8}Cerberus{rt8}||dodge pink / purple [Crystal Shard] explosions and dispel the damage buff debuff||{rt1}while burrowing stay away from [Burrow Charge] dust cloud{rt1}||P1 [Crystal Barrage] stand far; P2 burrow summons small elementals—clear fast; heroic shards chase players",
                ["mythicplus"] = "{rt8}Cerberus{rt8}||dodge pink / purple [Crystal Shard] explosions and dispel the damage buff debuff||{rt1}while burrowing stay away from [Burrow Charge] dust cloud{rt1}||P1 [Crystal Barrage] stand far; P2 burrow summons small elementals—clear fast; heroic shards chase players",
            },
        },
        ["重点怪：水晶巨人"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Crystal Giant{rt8}||during [Earthquake] cast, jump to avoid damage||{rt1}Must interrupt: [Earthquake]{rt1}||giant [Crystal Shield] needs breaking; assign CC before pulling",
        },
        ["岩皮"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Slabhide{rt8}||dodge frontal [Sandstorm] and ground [Lava Pool]; don't stand in shadow above (falling rock one-shots)||{rt1}in air [Crystal Storm] hide behind stone pillars{rt1}||tank solo frontal; heroic [Crystal Storm] hide behind pillar to avoid damage",
                ["normal"] = "{rt8}Slabhide{rt8}||dodge frontal [Sandstorm] and ground [Lava Pool]; don't stand in shadow above (falling rock one-shots)||{rt1}in air [Crystal Storm] hide behind stone pillars{rt1}||tank solo frontal; heroic [Crystal Storm] hide behind pillar to avoid damage",
                ["heroic"] = "{rt8}Slabhide{rt8}||dodge frontal [Sandstorm] and ground [Lava Pool]; don't stand in shadow above (falling rock one-shots)||{rt1}in air [Crystal Storm] hide behind stone pillars{rt1}||tank solo frontal; heroic [Crystal Storm] hide behind pillar to avoid damage",
                ["mythic"] = "{rt8}Slabhide{rt8}||dodge frontal [Sandstorm] and ground [Lava Pool]; don't stand in shadow above (falling rock one-shots)||{rt1}in air [Crystal Storm] hide behind stone pillars{rt1}||tank solo frontal; heroic [Crystal Storm] hide behind pillar to avoid damage",
                ["mythicplus"] = "{rt8}Slabhide{rt8}||dodge frontal [Sandstorm] and ground [Lava Pool]; don't stand in shadow above (falling rock one-shots)||{rt1}in air [Crystal Storm] hide behind stone pillars{rt1}||tank solo frontal; heroic [Crystal Storm] hide behind pillar to avoid damage",
            },
        },
        ["高阶女祭司艾苏尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Priestess Arlokk{rt8}||lure trash across [Gravity Well] to insta-kill; dodge ground dust [Boulder] drops||{rt1}interrupt [Force Grip]{rt1}||[Energy Shield] phase damage reduction + knockback; trash pours in from the right—engage on the right and lead left",
                ["normal"] = "{rt8}High Priestess Arlokk{rt8}||lure trash across [Gravity Well] to insta-kill; dodge ground dust [Boulder] drops||{rt1}interrupt [Force Grip]{rt1}||[Energy Shield] phase damage reduction + knockback; trash pours in from the right—engage on the right and lead left",
                ["heroic"] = "{rt8}High Priestess Arlokk{rt8}||lure trash across [Gravity Well] to insta-kill; dodge ground dust [Boulder] drops||{rt1}interrupt [Force Grip]{rt1}||[Energy Shield] phase damage reduction + knockback; trash pours in from the right—engage on the right and lead left",
                ["mythic"] = "{rt8}High Priestess Arlokk{rt8}||lure trash across [Gravity Well] to insta-kill; dodge ground dust [Boulder] drops||{rt1}interrupt [Force Grip]{rt1}||[Energy Shield] phase damage reduction + knockback; trash pours in from the right—engage on the right and lead left",
                ["mythicplus"] = "{rt8}High Priestess Arlokk{rt8}||lure trash across [Gravity Well] to insta-kill; dodge ground dust [Boulder] drops||{rt1}interrupt [Force Grip]{rt1}||[Energy Shield] phase damage reduction + knockback; trash pours in from the right—engage on the right and lead left",
            },
        },
        ["欧泽鲁克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ozruk{rt8}||tank hugs the wall; during [Shattering Smash] cone cast, pass through the boss or sidestep||{rt1}[Shatter] melee back off; [Paralyzed] break with damage{rt1}||[Elemental Spike Shield] melee stacks DoT; [Elemental Barrier] mage stop to avoid reflect",
                ["normal"] = "{rt8}Ozruk{rt8}||tank hugs the wall; during [Shattering Smash] cone cast, pass through the boss or sidestep||{rt1}[Shatter] melee back off; [Paralyzed] break with damage{rt1}||[Elemental Spike Shield] melee stacks DoT; [Elemental Barrier] mage stop to avoid reflect",
                ["heroic"] = "{rt8}Ozruk{rt8}||tank hugs the wall; during [Shattering Smash] cone cast, pass through the boss or sidestep||{rt1}[Shatter] melee back off; [Paralyzed] break with damage{rt1}||[Elemental Spike Shield] melee stacks DoT; [Elemental Barrier] mage stop to avoid reflect",
                ["mythic"] = "{rt8}Ozruk{rt8}||tank hugs the wall; during [Shattering Smash] cone cast, pass through the boss or sidestep||{rt1}[Shatter] melee back off; [Paralyzed] break with damage{rt1}||[Elemental Spike Shield] melee stacks DoT; [Elemental Barrier] mage stop to avoid reflect",
                ["mythicplus"] = "{rt8}Ozruk{rt8}||tank hugs the wall; during [Shattering Smash] cone cast, pass through the boss or sidestep||{rt1}[Shatter] melee back off; [Paralyzed] break with damage{rt1}||[Elemental Spike Shield] melee stacks DoT; [Elemental Barrier] mage stop to avoid reflect",
            },
        },
    },
    ["祖阿曼"] = {
        name = "Zul'Aman",
        ["加亚莱"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gyalak{rt8}||dodge [Fire Breath] / [Fire Bomb]; each time eggs hatch summon [Whelps]—CC / kill one to control count||{rt1}control the [Wyvern Egg] hatch rhythm{rt1}||fire-pool movement; heroic single hatcher controls adds",
                ["normal"] = "{rt8}Gyalak{rt8}||dodge [Fire Breath] / [Fire Bomb]; each time eggs hatch summon [Whelps]—CC / kill one to control count||{rt1}control the [Wyvern Egg] hatch rhythm{rt1}||fire-pool movement; heroic single hatcher controls adds",
                ["heroic"] = "{rt8}Gyalak{rt8}||dodge [Fire Breath] / [Fire Bomb]; each time eggs hatch summon [Whelps]—CC / kill one to control count||{rt1}control the [Wyvern Egg] hatch rhythm{rt1}||fire-pool movement; heroic single hatcher controls adds",
                ["mythic"] = "{rt8}Gyalak{rt8}||dodge [Fire Breath] / [Fire Bomb]; each time eggs hatch summon [Whelps]—CC / kill one to control count||{rt1}control the [Wyvern Egg] hatch rhythm{rt1}||fire-pool movement; heroic single hatcher controls adds",
                ["mythicplus"] = "{rt8}Gyalak{rt8}||dodge [Fire Breath] / [Fire Bomb]; each time eggs hatch summon [Whelps]—CC / kill one to control count||{rt1}control the [Wyvern Egg] hatch rhythm{rt1}||fire-pool movement; heroic single hatcher controls adds",
            },
        },
        ["妖术领主玛拉卡斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hex Lord Malacrass{rt8}||[Soul Drain] steals abilities and counterattacks—prioritize CC / killing the 2 attendants||{rt1}interrupt his spells; ogre attendants break CC—kill first{rt1}||randomly gains player class skills to counter",
                ["normal"] = "{rt8}Hex Lord Malacrass{rt8}||[Soul Drain] steals abilities and counterattacks—prioritize CC / killing the 2 attendants||{rt1}interrupt his spells; ogre attendants break CC—kill first{rt1}||randomly gains player class skills to counter",
                ["heroic"] = "{rt8}Hex Lord Malacrass{rt8}||[Soul Drain] steals abilities and counterattacks—prioritize CC / killing the 2 attendants||{rt1}interrupt his spells; ogre attendants break CC—kill first{rt1}||randomly gains player class skills to counter",
                ["mythic"] = "{rt8}Hex Lord Malacrass{rt8}||[Soul Drain] steals abilities and counterattacks—prioritize CC / killing the 2 attendants||{rt1}interrupt his spells; ogre attendants break CC—kill first{rt1}||randomly gains player class skills to counter",
                ["mythicplus"] = "{rt8}Hex Lord Malacrass{rt8}||[Soul Drain] steals abilities and counterattacks—prioritize CC / killing the 2 attendants||{rt1}interrupt his spells; ogre attendants break CC—kill first{rt1}||randomly gains player class skills to counter",
            },
        },
        ["达卡拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Daakara{rt8}||randomly transforms into [Wyvern / Eagle / Bear / Lynx] form—correspondingly dodge fire / whirlwind / none / high damage||{rt1}Lynx [stacking debuff] paladin can dispel{rt1}||each form's mechanics resemble the previous 4 bosses; bear phase is harmless",
                ["normal"] = "{rt8}Daakara{rt8}||randomly transforms into [Wyvern / Eagle / Bear / Lynx] form—correspondingly dodge fire / whirlwind / none / high damage||{rt1}Lynx [stacking debuff] paladin can dispel{rt1}||each form's mechanics resemble the previous 4 bosses; bear phase is harmless",
                ["heroic"] = "{rt8}Daakara{rt8}||randomly transforms into [Wyvern / Eagle / Bear / Lynx] form—correspondingly dodge fire / whirlwind / none / high damage||{rt1}Lynx [stacking debuff] paladin can dispel{rt1}||each form's mechanics resemble the previous 4 bosses; bear phase is harmless",
                ["mythic"] = "{rt8}Daakara{rt8}||randomly transforms into [Wyvern / Eagle / Bear / Lynx] form—correspondingly dodge fire / whirlwind / none / high damage||{rt1}Lynx [stacking debuff] paladin can dispel{rt1}||each form's mechanics resemble the previous 4 bosses; bear phase is harmless",
                ["mythicplus"] = "{rt8}Daakara{rt8}||randomly transforms into [Wyvern / Eagle / Bear / Lynx] form—correspondingly dodge fire / whirlwind / none / high damage||{rt1}Lynx [stacking debuff] paladin can dispel{rt1}||each form's mechanics resemble the previous 4 bosses; bear phase is harmless",
            },
        },
        ["纳洛拉克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Nalorakk{rt8}||every ~20s [Charge] the furthest person—rotate positioning to share damage||{rt1}Bear / Troll form switch to adapt{rt1}||dodge [Sweep]; troll form speeds up—watch out",
                ["normal"] = "{rt8}Nalorakk{rt8}||every ~20s [Charge] the furthest person—rotate positioning to share damage||{rt1}Bear / Troll form switch to adapt{rt1}||dodge [Sweep]; troll form speeds up—watch out",
                ["heroic"] = "{rt8}Nalorakk{rt8}||every ~20s [Charge] the furthest person—rotate positioning to share damage||{rt1}Bear / Troll form switch to adapt{rt1}||dodge [Sweep]; troll form speeds up—watch out",
                ["mythic"] = "{rt8}Nalorakk{rt8}||every ~20s [Charge] the furthest person—rotate positioning to share damage||{rt1}Bear / Troll form switch to adapt{rt1}||dodge [Sweep]; troll form speeds up—watch out",
                ["mythicplus"] = "{rt8}Nalorakk{rt8}||every ~20s [Charge] the furthest person—rotate positioning to share damage||{rt1}Bear / Troll form switch to adapt{rt1}||dodge [Sweep]; troll form speeds up—watch out",
            },
        },
        ["哈尔拉兹"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Halazzi{rt8}||[Lynx Spirit] splits—switch targets; kill the [Lynx Spirit]||{rt1}dodge [Totem] heals and [Whirlwind]{rt1}||focus during spirit phase; the twin lynx adds have no threat table—burst them",
                ["normal"] = "{rt8}Halazzi{rt8}||[Lynx Spirit] splits—switch targets; kill the [Lynx Spirit]||{rt1}dodge [Totem] heals and [Whirlwind]{rt1}||focus during spirit phase; the twin lynx adds have no threat table—burst them",
                ["heroic"] = "{rt8}Halazzi{rt8}||[Lynx Spirit] splits—switch targets; kill the [Lynx Spirit]||{rt1}dodge [Totem] heals and [Whirlwind]{rt1}||focus during spirit phase; the twin lynx adds have no threat table—burst them",
                ["mythic"] = "{rt8}Halazzi{rt8}||[Lynx Spirit] splits—switch targets; kill the [Lynx Spirit]||{rt1}dodge [Totem] heals and [Whirlwind]{rt1}||focus during spirit phase; the twin lynx adds have no threat table—burst them",
                ["mythicplus"] = "{rt8}Halazzi{rt8}||[Lynx Spirit] splits—switch targets; kill the [Lynx Spirit]||{rt1}dodge [Totem] heals and [Whirlwind]{rt1}||focus during spirit phase; the twin lynx adds have no threat table—burst them",
            },
        },
        ["重点怪：阿曼尼妖术师"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Amani Hexxer{rt8}||[Hex] turns you into a frog—must CC / interrupt||{rt1}Must CC / interrupt: [Hex]{rt1}||prioritize CC-killing the hexxer to stop allies being polymorphed",
        },
        ["埃基尔松"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Akil'zon{rt8}||during [Storm] dodge black circles and stand under the grabbed teammate to avoid lightning||{rt1}kill [Amani Abductor] to rescue{rt1}||spread to dodge [Lightning]; ignore the other birds",
                ["normal"] = "{rt8}Akil'zon{rt8}||during [Storm] dodge black circles and stand under the grabbed teammate to avoid lightning||{rt1}kill [Amani Abductor] to rescue{rt1}||spread to dodge [Lightning]; ignore the other birds",
                ["heroic"] = "{rt8}Akil'zon{rt8}||during [Storm] dodge black circles and stand under the grabbed teammate to avoid lightning||{rt1}kill [Amani Abductor] to rescue{rt1}||spread to dodge [Lightning]; ignore the other birds",
                ["mythic"] = "{rt8}Akil'zon{rt8}||during [Storm] dodge black circles and stand under the grabbed teammate to avoid lightning||{rt1}kill [Amani Abductor] to rescue{rt1}||spread to dodge [Lightning]; ignore the other birds",
                ["mythicplus"] = "{rt8}Akil'zon{rt8}||during [Storm] dodge black circles and stand under the grabbed teammate to avoid lightning||{rt1}kill [Amani Abductor] to rescue{rt1}||spread to dodge [Lightning]; ignore the other birds",
            },
        },
    },
    ["格瑞姆巴托"] = {
        name = "Grim Batol",
        ["乌比斯将军"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}General Umbris{rt8}||[Skullcrusher] tank uses cooldowns; [Rock Spikes] the marked moves to the edge||{rt1}[Commanding Shout] find a safe spot to avoid [Shadow Flame Breath]{rt1}||[Bleeding Wound] stacks—healer dispels",
                ["normal"] = "{rt8}General Umbris{rt8}||[Skullcrusher] tank uses cooldowns; [Rock Spikes] the marked moves to the edge||{rt1}[Commanding Shout] find a safe spot to avoid [Shadow Flame Breath]{rt1}||[Bleeding Wound] stacks—healer dispels",
                ["heroic"] = "{rt8}General Umbris{rt8}||[Skullcrusher] tank uses cooldowns; [Rock Spikes] the marked moves to the edge||{rt1}[Commanding Shout] find a safe spot to avoid [Shadow Flame Breath]{rt1}||[Bleeding Wound] stacks—healer dispels",
                ["mythic"] = "{rt8}General Umbris{rt8}||[Skullcrusher] tank uses cooldowns; [Rock Spikes] the marked moves to the edge||{rt1}[Commanding Shout] find a safe spot to avoid [Shadow Flame Breath]{rt1}||[Bleeding Wound] stacks—healer dispels",
                ["mythicplus"] = "{rt8}General Umbris{rt8}||[Skullcrusher] tank uses cooldowns; [Rock Spikes] the marked moves to the edge||{rt1}[Commanding Shout] find a safe spot to avoid [Shadow Flame Breath]{rt1}||[Bleeding Wound] stacks—healer dispels",
            },
        },
        ["重点怪：暮光唤地者"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Twilight Earthcaller{rt8}||[Mass Tremor] must be interrupted or the group is CC'd||{rt1}Must interrupt: [Mass Tremor], also [Earthquake Arrow]{rt1}||don't pull more than 1 [Twilight Overseer] at once (stacks [Grievous Wound] debuff)",
        },
        ["铸炉之主索朗格斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Forgemaster Throngus{rt8}||cycles weapons: hammer = kite the high damage / shield = damage reduction + fire pool / dual blades = fast slashes||{rt1}[Forge Weapon] whole-group damage—use cooldowns{rt1}||dodge [Flame Cleave] frontal; don't stand in [Lava Pool]",
                ["normal"] = "{rt8}Forgemaster Throngus{rt8}||cycles weapons: hammer = kite the high damage / shield = damage reduction + fire pool / dual blades = fast slashes||{rt1}[Forge Weapon] whole-group damage—use cooldowns{rt1}||dodge [Flame Cleave] frontal; don't stand in [Lava Pool]",
                ["heroic"] = "{rt8}Forgemaster Throngus{rt8}||cycles weapons: hammer = kite the high damage / shield = damage reduction + fire pool / dual blades = fast slashes||{rt1}[Forge Weapon] whole-group damage—use cooldowns{rt1}||dodge [Flame Cleave] frontal; don't stand in [Lava Pool]",
                ["mythic"] = "{rt8}Forgemaster Throngus{rt8}||cycles weapons: hammer = kite the high damage / shield = damage reduction + fire pool / dual blades = fast slashes||{rt1}[Forge Weapon] whole-group damage—use cooldowns{rt1}||dodge [Flame Cleave] frontal; don't stand in [Lava Pool]",
                ["mythicplus"] = "{rt8}Forgemaster Throngus{rt8}||cycles weapons: hammer = kite the high damage / shield = damage reduction + fire pool / dual blades = fast slashes||{rt1}[Forge Weapon] whole-group damage—use cooldowns{rt1}||dodge [Flame Cleave] frontal; don't stand in [Lava Pool]",
            },
        },
        ["达加·燃影者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Drahga Shadowburner{rt8}||P1 summons [Shadowflame Spirit] which roots players—kite / CC; P2 ride Valiona and dodge [Devouring Flame] frontal||{rt1}interrupt [Shadowflame Bolt]{rt1}||dispel [Curse of Entropy]; tank picks up adds",
                ["normal"] = "{rt8}Drahga Shadowburner{rt8}||P1 summons [Shadowflame Spirit] which roots players—kite / CC; P2 ride Valiona and dodge [Devouring Flame] frontal||{rt1}interrupt [Shadowflame Bolt]{rt1}||dispel [Curse of Entropy]; tank picks up adds",
                ["heroic"] = "{rt8}Drahga Shadowburner{rt8}||P1 summons [Shadowflame Spirit] which roots players—kite / CC; P2 ride Valiona and dodge [Devouring Flame] frontal||{rt1}interrupt [Shadowflame Bolt]{rt1}||dispel [Curse of Entropy]; tank picks up adds",
                ["mythic"] = "{rt8}Drahga Shadowburner{rt8}||P1 summons [Shadowflame Spirit] which roots players—kite / CC; P2 ride Valiona and dodge [Devouring Flame] frontal||{rt1}interrupt [Shadowflame Bolt]{rt1}||dispel [Curse of Entropy]; tank picks up adds",
                ["mythicplus"] = "{rt8}Drahga Shadowburner{rt8}||P1 summons [Shadowflame Spirit] which roots players—kite / CC; P2 ride Valiona and dodge [Devouring Flame] frontal||{rt1}interrupt [Shadowflame Bolt]{rt1}||dispel [Curse of Entropy]; tank picks up adds",
            },
        },
        ["埃鲁达克，地狱公爵"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Erudax, the Duke of Below{rt8}||[Shadow Gale] void circles—step out in time; [Faceless Corruptor] rush to the boss and kill||{rt1}purple circle [Binding Shadows] dispellable but don't hit others{rt1}||stand in safe circle to dodge [Abyssal Energy] raid-wide; [Void Blast] raid damage—use cooldowns",
                ["normal"] = "{rt8}Erudax, the Duke of Below{rt8}||[Shadow Gale] void circles—step out in time; [Faceless Corruptor] rush to the boss and kill||{rt1}purple circle [Binding Shadows] dispellable but don't hit others{rt1}||stand in safe circle to dodge [Abyssal Energy] raid-wide; [Void Blast] raid damage—use cooldowns",
                ["heroic"] = "{rt8}Erudax, the Duke of Below{rt8}||[Shadow Gale] void circles—step out in time; [Faceless Corruptor] rush to the boss and kill||{rt1}purple circle [Binding Shadows] dispellable but don't hit others{rt1}||stand in safe circle to dodge [Abyssal Energy] raid-wide; [Void Blast] raid damage—use cooldowns",
                ["mythic"] = "{rt8}Erudax, the Duke of Below{rt8}||[Shadow Gale] void circles—step out in time; [Faceless Corruptor] rush to the boss and kill||{rt1}purple circle [Binding Shadows] dispellable but don't hit others{rt1}||stand in safe circle to dodge [Abyssal Energy] raid-wide; [Void Blast] raid damage—use cooldowns",
                ["mythicplus"] = "{rt8}Erudax, the Duke of Below{rt8}||[Shadow Gale] void circles—step out in time; [Faceless Corruptor] rush to the boss and kill||{rt1}purple circle [Binding Shadows] dispellable but don't hit others{rt1}||stand in safe circle to dodge [Abyssal Energy] raid-wide; [Void Blast] raid damage—use cooldowns",
            },
        },
    },
    ["时光之末"] = {
        name = "End Time",
        ["贝恩的残影"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Echo of Baine{rt8}||shard-platform positioning; dodge [Lava Burst] and [Stomp]||{rt1}tank faces front, reposition after knockback{rt1}||P2 [Lava] covers the field—watch positioning",
                ["normal"] = "{rt8}Echo of Baine{rt8}||shard-platform positioning; dodge [Lava Burst] and [Stomp]||{rt1}tank faces front, reposition after knockback{rt1}||P2 [Lava] covers the field—watch positioning",
                ["heroic"] = "{rt8}Echo of Baine{rt8}||shard-platform positioning; dodge [Lava Burst] and [Stomp]||{rt1}tank faces front, reposition after knockback{rt1}||P2 [Lava] covers the field—watch positioning",
                ["mythic"] = "{rt8}Echo of Baine{rt8}||shard-platform positioning; dodge [Lava Burst] and [Stomp]||{rt1}tank faces front, reposition after knockback{rt1}||P2 [Lava] covers the field—watch positioning",
                ["mythicplus"] = "{rt8}Echo of Baine{rt8}||shard-platform positioning; dodge [Lava Burst] and [Stomp]||{rt1}tank faces front, reposition after knockback{rt1}||P2 [Lava] covers the field—watch positioning",
            },
        },
        ["泰兰德的残影"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Echo of Tyrande{rt8}||[Moonwell] spells—dodge [Moonlance] / [Moonbolt] and [Stardust]||{rt1}silence circle [Eye of Elune] don't approach; 30% [Tears of Elune] rain—dodge{rt1}||at 80% / 55% casts faster and more often",
                ["normal"] = "{rt8}Echo of Tyrande{rt8}||[Moonwell] spells—dodge [Moonlance] / [Moonbolt] and [Stardust]||{rt1}silence circle [Eye of Elune] don't approach; 30% [Tears of Elune] rain—dodge{rt1}||at 80% / 55% casts faster and more often",
                ["heroic"] = "{rt8}Echo of Tyrande{rt8}||[Moonwell] spells—dodge [Moonlance] / [Moonbolt] and [Stardust]||{rt1}silence circle [Eye of Elune] don't approach; 30% [Tears of Elune] rain—dodge{rt1}||at 80% / 55% casts faster and more often",
                ["mythic"] = "{rt8}Echo of Tyrande{rt8}||[Moonwell] spells—dodge [Moonlance] / [Moonbolt] and [Stardust]||{rt1}silence circle [Eye of Elune] don't approach; 30% [Tears of Elune] rain—dodge{rt1}||at 80% / 55% casts faster and more often",
                ["mythicplus"] = "{rt8}Echo of Tyrande{rt8}||[Moonwell] spells—dodge [Moonlance] / [Moonbolt] and [Stardust]||{rt1}silence circle [Eye of Elune] don't approach; 30% [Tears of Elune] rain—dodge{rt1}||at 80% / 55% casts faster and more often",
            },
        },
        ["吉安娜的残影"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Echo of Jaina{rt8}||[Frost] spells—dodge [Frost Ring] / [Blizzard]; dispel before [Frozen]||{rt1}position to dodge [Frostbolt] and [Frost Nova]{rt1}||heroic: if frozen, the fight wipes unless health is topped",
                ["normal"] = "{rt8}Echo of Jaina{rt8}||[Frost] spells—dodge [Frost Ring] / [Blizzard]; dispel before [Frozen]||{rt1}position to dodge [Frostbolt] and [Frost Nova]{rt1}||heroic: if frozen, the fight wipes unless health is topped",
                ["heroic"] = "{rt8}Echo of Jaina{rt8}||[Frost] spells—dodge [Frost Ring] / [Blizzard]; dispel before [Frozen]||{rt1}position to dodge [Frostbolt] and [Frost Nova]{rt1}||heroic: if frozen, the fight wipes unless health is topped",
                ["mythic"] = "{rt8}Echo of Jaina{rt8}||[Frost] spells—dodge [Frost Ring] / [Blizzard]; dispel before [Frozen]||{rt1}position to dodge [Frostbolt] and [Frost Nova]{rt1}||heroic: if frozen, the fight wipes unless health is topped",
                ["mythicplus"] = "{rt8}Echo of Jaina{rt8}||[Frost] spells—dodge [Frost Ring] / [Blizzard]; dispel before [Frozen]||{rt1}position to dodge [Frostbolt] and [Frost Nova]{rt1}||heroic: if frozen, the fight wipes unless health is topped",
            },
        },
        ["姆诺兹多"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Murozond{rt8}||first clear the [Infinite Dragonkin] by the hourglass to activate; dodge [Temporal Anomaly] sludge and [Time Stop]||{rt1}use [Hourglass of Time] to reset CDs / revive—follow call{rt1}||when [Time Warp] buffs damage, burst; limited uses",
                ["normal"] = "{rt8}Murozond{rt8}||first clear the [Infinite Dragonkin] by the hourglass to activate; dodge [Temporal Anomaly] sludge and [Time Stop]||{rt1}use [Hourglass of Time] to reset CDs / revive—follow call{rt1}||when [Time Warp] buffs damage, burst; limited uses",
                ["heroic"] = "{rt8}Murozond{rt8}||first clear the [Infinite Dragonkin] by the hourglass to activate; dodge [Temporal Anomaly] sludge and [Time Stop]||{rt1}use [Hourglass of Time] to reset CDs / revive—follow call{rt1}||when [Time Warp] buffs damage, burst; limited uses",
                ["mythic"] = "{rt8}Murozond{rt8}||first clear the [Infinite Dragonkin] by the hourglass to activate; dodge [Temporal Anomaly] sludge and [Time Stop]||{rt1}use [Hourglass of Time] to reset CDs / revive—follow call{rt1}||when [Time Warp] buffs damage, burst; limited uses",
                ["mythicplus"] = "{rt8}Murozond{rt8}||first clear the [Infinite Dragonkin] by the hourglass to activate; dodge [Temporal Anomaly] sludge and [Time Stop]||{rt1}use [Hourglass of Time] to reset CDs / revive—follow call{rt1}||when [Time Warp] buffs damage, burst; limited uses",
            },
        },
        ["重点怪：永恒龙人"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Infinite Dragonkin{rt8}||must clear the dragonkin by the hourglass before activating Murozond||{rt1}Priority kill: [Infinite Dragonkin]{rt1}||otherwise the boss won't land and the fight can't start",
        },
        ["希尔瓦娜斯的残影"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Echo of Sylvanas{rt8}||[Shadow] attacks; she will [Resurrect] the dead—clear the ghosts fast||{rt1}dodge [Dark Arrow] and [Wail]{rt1}||clear resurrected adds first to prevent stacking damage",
                ["normal"] = "{rt8}Echo of Sylvanas{rt8}||[Shadow] attacks; she will [Resurrect] the dead—clear the ghosts fast||{rt1}dodge [Dark Arrow] and [Wail]{rt1}||clear resurrected adds first to prevent stacking damage",
                ["heroic"] = "{rt8}Echo of Sylvanas{rt8}||[Shadow] attacks; she will [Resurrect] the dead—clear the ghosts fast||{rt1}dodge [Dark Arrow] and [Wail]{rt1}||clear resurrected adds first to prevent stacking damage",
                ["mythic"] = "{rt8}Echo of Sylvanas{rt8}||[Shadow] attacks; she will [Resurrect] the dead—clear the ghosts fast||{rt1}dodge [Dark Arrow] and [Wail]{rt1}||clear resurrected adds first to prevent stacking damage",
                ["mythicplus"] = "{rt8}Echo of Sylvanas{rt8}||[Shadow] attacks; she will [Resurrect] the dead—clear the ghosts fast||{rt1}dodge [Dark Arrow] and [Wail]{rt1}||clear resurrected adds first to prevent stacking damage",
            },
        },
    },
    ["潮汐王座"] = {
        name = "Throne of the Tides",
        ["蛊心魔古厄夏"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mindbender Ghur'sha{rt8}||[Mind Capture] controls a player—hit the controlled player / kill the parasite to release||{rt1}don't AoE the controlled teammate and accidentally hurt them{rt1}||focus [Soulstealer Gur'sha] interrupt [Mind Flay]; tank holds Erunak",
                ["normal"] = "{rt8}Mindbender Ghur'sha{rt8}||[Mind Capture] controls a player—hit the controlled player / kill the parasite to release||{rt1}don't AoE the controlled teammate and accidentally hurt them{rt1}||focus [Soulstealer Gur'sha] interrupt [Mind Flay]; tank holds Erunak",
                ["heroic"] = "{rt8}Mindbender Ghur'sha{rt8}||[Mind Capture] controls a player—hit the controlled player / kill the parasite to release||{rt1}don't AoE the controlled teammate and accidentally hurt them{rt1}||focus [Soulstealer Gur'sha] interrupt [Mind Flay]; tank holds Erunak",
                ["mythic"] = "{rt8}Mindbender Ghur'sha{rt8}||[Mind Capture] controls a player—hit the controlled player / kill the parasite to release||{rt1}don't AoE the controlled teammate and accidentally hurt them{rt1}||focus [Soulstealer Gur'sha] interrupt [Mind Flay]; tank holds Erunak",
                ["mythicplus"] = "{rt8}Mindbender Ghur'sha{rt8}||[Mind Capture] controls a player—hit the controlled player / kill the parasite to release||{rt1}don't AoE the controlled teammate and accidentally hurt them{rt1}||focus [Soulstealer Gur'sha] interrupt [Mind Flay]; tank holds Erunak",
            },
        },
        ["纳兹夏尔女士"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lady Naz'jar{rt8}||dodge [High-Pressure Water] and [Tidal Surge]; during [Surge] phase avoid the jets||{rt1}interrupt [Frostbolt]{rt1}||at 60% / 30% summons [Naz'jar Frost Witch / Honor Guard]—priority kill",
                ["normal"] = "{rt8}Lady Naz'jar{rt8}||dodge [High-Pressure Water] and [Tidal Surge]; during [Surge] phase avoid the jets||{rt1}interrupt [Frostbolt]{rt1}||at 60% / 30% summons [Naz'jar Frost Witch / Honor Guard]—priority kill",
                ["heroic"] = "{rt8}Lady Naz'jar{rt8}||dodge [High-Pressure Water] and [Tidal Surge]; during [Surge] phase avoid the jets||{rt1}interrupt [Frostbolt]{rt1}||at 60% / 30% summons [Naz'jar Frost Witch / Honor Guard]—priority kill",
                ["mythic"] = "{rt8}Lady Naz'jar{rt8}||dodge [High-Pressure Water] and [Tidal Surge]; during [Surge] phase avoid the jets||{rt1}interrupt [Frostbolt]{rt1}||at 60% / 30% summons [Naz'jar Frost Witch / Honor Guard]—priority kill",
                ["mythicplus"] = "{rt8}Lady Naz'jar{rt8}||dodge [High-Pressure Water] and [Tidal Surge]; during [Surge] phase avoid the jets||{rt1}interrupt [Frostbolt]{rt1}||at 60% / 30% summons [Naz'jar Frost Witch / Honor Guard]—priority kill",
            },
        },
        ["重点怪：纳迦海巫"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Naga Sea Witch{rt8}||[Frost Arrow] and [healing] must be interrupted||{rt1}Must interrupt: [Frost Arrow][Healing Wave]{rt1}||prioritize killing the caster sea witch before the melee",
        },
        ["指挥官乌尔索克，腐烂王子"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Commander Ulthok, the Rotten Prince{rt8}||tank faces away from the group; dodge frontal [Corrosive Spit]||{rt1}interrupt [Shadow Bolt]{rt1}||[Strangling Grip] after grabbing, healer catches; [Abyssal Touch] slow—dispel",
                ["normal"] = "{rt8}Commander Ulthok, the Rotten Prince{rt8}||tank faces away from the group; dodge frontal [Corrosive Spit]||{rt1}interrupt [Shadow Bolt]{rt1}||[Strangling Grip] after grabbing, healer catches; [Abyssal Touch] slow—dispel",
                ["heroic"] = "{rt8}Commander Ulthok, the Rotten Prince{rt8}||tank faces away from the group; dodge frontal [Corrosive Spit]||{rt1}interrupt [Shadow Bolt]{rt1}||[Strangling Grip] after grabbing, healer catches; [Abyssal Touch] slow—dispel",
                ["mythic"] = "{rt8}Commander Ulthok, the Rotten Prince{rt8}||tank faces away from the group; dodge frontal [Corrosive Spit]||{rt1}interrupt [Shadow Bolt]{rt1}||[Strangling Grip] after grabbing, healer catches; [Abyssal Touch] slow—dispel",
                ["mythicplus"] = "{rt8}Commander Ulthok, the Rotten Prince{rt8}||tank faces away from the group; dodge frontal [Corrosive Spit]||{rt1}interrupt [Shadow Bolt]{rt1}||[Strangling Grip] after grabbing, healer catches; [Abyssal Touch] slow—dispel",
            },
        },
        ["厄祖玛特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ozumat{rt8}||dodge [Ozumat's Ink] sludge; stand at the platform edge to avoid being knocked into the water||{rt1}kill the spawned [Inkling / Deepscale Murloc]{rt1}||Neptulon aids with buffs; during P2 when ink covers everything, hug the edge to DPS",
                ["normal"] = "{rt8}Ozumat{rt8}||dodge [Ozumat's Ink] sludge; stand at the platform edge to avoid being knocked into the water||{rt1}kill the spawned [Inkling / Deepscale Murloc]{rt1}||Neptulon aids with buffs; during P2 when ink covers everything, hug the edge to DPS",
                ["heroic"] = "{rt8}Ozumat{rt8}||dodge [Ozumat's Ink] sludge; stand at the platform edge to avoid being knocked into the water||{rt1}kill the spawned [Inkling / Deepscale Murloc]{rt1}||Neptulon aids with buffs; during P2 when ink covers everything, hug the edge to DPS",
                ["mythic"] = "{rt8}Ozumat{rt8}||dodge [Ozumat's Ink] sludge; stand at the platform edge to avoid being knocked into the water||{rt1}kill the spawned [Inkling / Deepscale Murloc]{rt1}||Neptulon aids with buffs; during P2 when ink covers everything, hug the edge to DPS",
                ["mythicplus"] = "{rt8}Ozumat{rt8}||dodge [Ozumat's Ink] sludge; stand at the platform edge to avoid being knocked into the water||{rt1}kill the spawned [Inkling / Deepscale Murloc]{rt1}||Neptulon aids with buffs; during P2 when ink covers everything, hug the edge to DPS",
            },
        },
    },
    ["永恒之井"] = {
        name = "Well of Eternity",
        ["佩罗萨恩"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Peroth'arn{rt8}||at 70% [Vanish] summons [Eye of Searching]—kill the eye / avoid its line of sight||{rt1}face away from [Shadow Nova]; dodge [Fel Arrow]{rt1}||if the eye spots you, you take heavy damage—position to avoid its sightline",
                ["normal"] = "{rt8}Peroth'arn{rt8}||at 70% [Vanish] summons [Eye of Searching]—kill the eye / avoid its line of sight||{rt1}face away from [Shadow Nova]; dodge [Fel Arrow]{rt1}||if the eye spots you, you take heavy damage—position to avoid its sightline",
                ["heroic"] = "{rt8}Peroth'arn{rt8}||at 70% [Vanish] summons [Eye of Searching]—kill the eye / avoid its line of sight||{rt1}face away from [Shadow Nova]; dodge [Fel Arrow]{rt1}||if the eye spots you, you take heavy damage—position to avoid its sightline",
                ["mythic"] = "{rt8}Peroth'arn{rt8}||at 70% [Vanish] summons [Eye of Searching]—kill the eye / avoid its line of sight||{rt1}face away from [Shadow Nova]; dodge [Fel Arrow]{rt1}||if the eye spots you, you take heavy damage—position to avoid its sightline",
                ["mythicplus"] = "{rt8}Peroth'arn{rt8}||at 70% [Vanish] summons [Eye of Searching]—kill the eye / avoid its line of sight||{rt1}face away from [Shadow Nova]; dodge [Fel Arrow]{rt1}||if the eye spots you, you take heavy damage—position to avoid its sightline",
            },
        },
        ["重点怪：上层精灵法师"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Highborne Mage{rt8}||key add during the Azshara fight—spells must be interrupted||{rt1}Must interrupt: [spells] / [healing]{rt1}||assign interrupt rotations; two un-interrupted casts usually wipe",
        },
        ["玛诺洛斯与瓦罗森"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mannoroth and Varosen{rt8}||kill Varosen first [Blade Technique] then Mannoroth [Abyssal Stomp] / [Chaos Wave]; rescue [Tyrande] to weaken Mannoroth||{rt1}dodge fire and [Knockback]{rt1}||when Mannoroth's health is high, pop cooldowns; assign interrupts",
                ["normal"] = "{rt8}Mannoroth and Varosen{rt8}||kill Varosen first [Blade Technique] then Mannoroth [Abyssal Stomp] / [Chaos Wave]; rescue [Tyrande] to weaken Mannoroth||{rt1}dodge fire and [Knockback]{rt1}||when Mannoroth's health is high, pop cooldowns; assign interrupts",
                ["heroic"] = "{rt8}Mannoroth and Varosen{rt8}||kill Varosen first [Blade Technique] then Mannoroth [Abyssal Stomp] / [Chaos Wave]; rescue [Tyrande] to weaken Mannoroth||{rt1}dodge fire and [Knockback]{rt1}||when Mannoroth's health is high, pop cooldowns; assign interrupts",
                ["mythic"] = "{rt8}Mannoroth and Varosen{rt8}||kill Varosen first [Blade Technique] then Mannoroth [Abyssal Stomp] / [Chaos Wave]; rescue [Tyrande] to weaken Mannoroth||{rt1}dodge fire and [Knockback]{rt1}||when Mannoroth's health is high, pop cooldowns; assign interrupts",
                ["mythicplus"] = "{rt8}Mannoroth and Varosen{rt8}||kill Varosen first [Blade Technique] then Mannoroth [Abyssal Stomp] / [Chaos Wave]; rescue [Tyrande] to weaken Mannoroth||{rt1}dodge fire and [Knockback]{rt1}||when Mannoroth's health is high, pop cooldowns; assign interrupts",
            },
        },
        ["艾萨拉女王"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Queen Azshara{rt8}||don't directly attack the queen; control adds and close the 3 [Portal Crystals] to open the door||{rt1}interrupt her [Highborne Mage] spells, two passes = wipe{rt1}||assign interrupt rotations; the queen herself can't be killed",
                ["normal"] = "{rt8}Queen Azshara{rt8}||don't directly attack the queen; control adds and close the 3 [Portal Crystals] to open the door||{rt1}interrupt her [Highborne Mage] spells, two passes = wipe{rt1}||assign interrupt rotations; the queen herself can't be killed",
                ["heroic"] = "{rt8}Queen Azshara{rt8}||don't directly attack the queen; control adds and close the 3 [Portal Crystals] to open the door||{rt1}interrupt her [Highborne Mage] spells, two passes = wipe{rt1}||assign interrupt rotations; the queen herself can't be killed",
                ["mythic"] = "{rt8}Queen Azshara{rt8}||don't directly attack the queen; control adds and close the 3 [Portal Crystals] to open the door||{rt1}interrupt her [Highborne Mage] spells, two passes = wipe{rt1}||assign interrupt rotations; the queen herself can't be killed",
                ["mythicplus"] = "{rt8}Queen Azshara{rt8}||don't directly attack the queen; control adds and close the 3 [Portal Crystals] to open the door||{rt1}interrupt her [Highborne Mage] spells, two passes = wipe{rt1}||assign interrupt rotations; the queen herself can't be killed",
            },
        },
    },
    ["旋云之巅"] = {
        name = "Vortex Pinnacle",
        ["西风君王阿萨德"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Asaad{rt8}||[Supreme Storm] while casting the whole team enters the [Unstable Grounding Field] triangle||{rt1}dispel / jump away from [Static Cling] root{rt1}||spread to dodge [Chain Lightning]; priority kill [Falling Star]; heroic root needs fast dispel",
                ["normal"] = "{rt8}Asaad{rt8}||[Supreme Storm] while casting the whole team enters the [Unstable Grounding Field] triangle||{rt1}dispel / jump away from [Static Cling] root{rt1}||spread to dodge [Chain Lightning]; priority kill [Falling Star]; heroic root needs fast dispel",
                ["heroic"] = "{rt8}Asaad{rt8}||[Supreme Storm] while casting the whole team enters the [Unstable Grounding Field] triangle||{rt1}dispel / jump away from [Static Cling] root{rt1}||spread to dodge [Chain Lightning]; priority kill [Falling Star]; heroic root needs fast dispel",
                ["mythic"] = "{rt8}Asaad{rt8}||[Supreme Storm] while casting the whole team enters the [Unstable Grounding Field] triangle||{rt1}dispel / jump away from [Static Cling] root{rt1}||spread to dodge [Chain Lightning]; priority kill [Falling Star]; heroic root needs fast dispel",
                ["mythicplus"] = "{rt8}Asaad{rt8}||[Supreme Storm] while casting the whole team enters the [Unstable Grounding Field] triangle||{rt1}dispel / jump away from [Static Cling] root{rt1}||spread to dodge [Chain Lightning]; priority kill [Falling Star]; heroic root needs fast dispel",
            },
        },
        ["重点怪：潜伏风暴"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Lurking Storm{rt8}||someone must keep facing it the whole time or it casts [Deadly Current]||{rt1}turn your back and you die—keep facing it{rt1}||just aim your camera at it as you pass to put it to sleep",
        },
        ["大宰相埃尔坦"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Grand Vizier Ertan{rt8}||[Hurricane Shield] when expanding stand inside the ring, when shrinking stand outside||{rt1}interrupt [Lightning Arrow]{rt1}||[Lurking Storm] facing it disables it; when it summons [Hidden Wind] keep facing",
                ["normal"] = "{rt8}Grand Vizier Ertan{rt8}||[Hurricane Shield] when expanding stand inside the ring, when shrinking stand outside||{rt1}interrupt [Lightning Arrow]{rt1}||[Lurking Storm] facing it disables it; when it summons [Hidden Wind] keep facing",
                ["heroic"] = "{rt8}Grand Vizier Ertan{rt8}||[Hurricane Shield] when expanding stand inside the ring, when shrinking stand outside||{rt1}interrupt [Lightning Arrow]{rt1}||[Lurking Storm] facing it disables it; when it summons [Hidden Wind] keep facing",
                ["mythic"] = "{rt8}Grand Vizier Ertan{rt8}||[Hurricane Shield] when expanding stand inside the ring, when shrinking stand outside||{rt1}interrupt [Lightning Arrow]{rt1}||[Lurking Storm] facing it disables it; when it summons [Hidden Wind] keep facing",
                ["mythicplus"] = "{rt8}Grand Vizier Ertan{rt8}||[Hurricane Shield] when expanding stand inside the ring, when shrinking stand outside||{rt1}interrupt [Lightning Arrow]{rt1}||[Lurking Storm] facing it disables it; when it summons [Hidden Wind] keep facing",
            },
        },
        ["阿尔泰鲁斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Altairus{rt8}||stand in [Updraft] for a speed buff, avoid [Downdraft] slow debuff||{rt1}dodge frontal [Frost Breath]{rt1}||[Gathering Winds] after a shift adjust positioning; tank stays center for easy turning",
                ["normal"] = "{rt8}Altairus{rt8}||stand in [Updraft] for a speed buff, avoid [Downdraft] slow debuff||{rt1}dodge frontal [Frost Breath]{rt1}||[Gathering Winds] after a shift adjust positioning; tank stays center for easy turning",
                ["heroic"] = "{rt8}Altairus{rt8}||stand in [Updraft] for a speed buff, avoid [Downdraft] slow debuff||{rt1}dodge frontal [Frost Breath]{rt1}||[Gathering Winds] after a shift adjust positioning; tank stays center for easy turning",
                ["mythic"] = "{rt8}Altairus{rt8}||stand in [Updraft] for a speed buff, avoid [Downdraft] slow debuff||{rt1}dodge frontal [Frost Breath]{rt1}||[Gathering Winds] after a shift adjust positioning; tank stays center for easy turning",
                ["mythicplus"] = "{rt8}Altairus{rt8}||stand in [Updraft] for a speed buff, avoid [Downdraft] slow debuff||{rt1}dodge frontal [Frost Breath]{rt1}||[Gathering Winds] after a shift adjust positioning; tank stays center for easy turning",
            },
        },
    },
    ["祖尔格拉布"] = {
        name = "Zul'Gurub",
        ["高阶祭司温诺希斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Priest Venoxis{rt8}||[poison] and [Poison Cloud] positioning; when green light links two players, move apart||{rt1}interrupt [Venom Bolt]{rt1}||snake form [Poison Breath] dodge sideways; heroic [Toxic Vines] interrupt fast",
                ["normal"] = "{rt8}High Priest Venoxis{rt8}||[poison] and [Poison Cloud] positioning; when green light links two players, move apart||{rt1}interrupt [Venom Bolt]{rt1}||snake form [Poison Breath] dodge sideways; heroic [Toxic Vines] interrupt fast",
                ["heroic"] = "{rt8}High Priest Venoxis{rt8}||[poison] and [Poison Cloud] positioning; when green light links two players, move apart||{rt1}interrupt [Venom Bolt]{rt1}||snake form [Poison Breath] dodge sideways; heroic [Toxic Vines] interrupt fast",
                ["mythic"] = "{rt8}High Priest Venoxis{rt8}||[poison] and [Poison Cloud] positioning; when green light links two players, move apart||{rt1}interrupt [Venom Bolt]{rt1}||snake form [Poison Breath] dodge sideways; heroic [Toxic Vines] interrupt fast",
                ["mythicplus"] = "{rt8}High Priest Venoxis{rt8}||[poison] and [Poison Cloud] positioning; when green light links two players, move apart||{rt1}interrupt [Venom Bolt]{rt1}||snake form [Poison Breath] dodge sideways; heroic [Toxic Vines] interrupt fast",
            },
        },
        ["疯狂之缘----哈扎拉尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Edge of Madness—Hazahala{rt8}||hunter Viper Sting / warlock mana drain to empty his mana, prevent [Mana Burn]||{rt1}Priority kill [Nightmare Illusion] adds; tank pre-casts HoT before sleep{rt1}||[Sleep] whole group 6s, wakes on hit; kill the low-health illusion first",
                ["normal"] = "{rt8}Edge of Madness—Hazahala{rt8}||hunter Viper Sting / warlock mana drain to empty his mana, prevent [Mana Burn]||{rt1}Priority kill [Nightmare Illusion] adds; tank pre-casts HoT before sleep{rt1}||[Sleep] whole group 6s, wakes on hit; kill the low-health illusion first",
                ["heroic"] = "{rt8}Edge of Madness—Hazahala{rt8}||hunter Viper Sting / warlock mana drain to empty his mana, prevent [Mana Burn]||{rt1}Priority kill [Nightmare Illusion] adds; tank pre-casts HoT before sleep{rt1}||[Sleep] whole group 6s, wakes on hit; kill the low-health illusion first",
                ["mythic"] = "{rt8}Edge of Madness—Hazahala{rt8}||hunter Viper Sting / warlock mana drain to empty his mana, prevent [Mana Burn]||{rt1}Priority kill [Nightmare Illusion] adds; tank pre-casts HoT before sleep{rt1}||[Sleep] whole group 6s, wakes on hit; kill the low-health illusion first",
                ["mythicplus"] = "{rt8}Edge of Madness—Hazahala{rt8}||hunter Viper Sting / warlock mana drain to empty his mana, prevent [Mana Burn]||{rt1}Priority kill [Nightmare Illusion] adds; tank pre-casts HoT before sleep{rt1}||[Sleep] whole group 6s, wakes on hit; kill the low-health illusion first",
            },
        },
        ["碎神者金度"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Spiritbreaker Jin'do{rt8}||phase one pull the boss out of [Anti-Magic Shield]; during big cast stand under [Bubble] for immunity||{rt1}phase two pull each [Troll] to one of 4 [Chains] to break the chain{rt1}||dodge [Purple Fire] and gather trash; breaking chains weakens Hakkar",
                ["normal"] = "{rt8}Spiritbreaker Jin'do{rt8}||phase one pull the boss out of [Anti-Magic Shield]; during big cast stand under [Bubble] for immunity||{rt1}phase two pull each [Troll] to one of 4 [Chains] to break the chain{rt1}||dodge [Purple Fire] and gather trash; breaking chains weakens Hakkar",
                ["heroic"] = "{rt8}Spiritbreaker Jin'do{rt8}||phase one pull the boss out of [Anti-Magic Shield]; during big cast stand under [Bubble] for immunity||{rt1}phase two pull each [Troll] to one of 4 [Chains] to break the chain{rt1}||dodge [Purple Fire] and gather trash; breaking chains weakens Hakkar",
                ["mythic"] = "{rt8}Spiritbreaker Jin'do{rt8}||phase one pull the boss out of [Anti-Magic Shield]; during big cast stand under [Bubble] for immunity||{rt1}phase two pull each [Troll] to one of 4 [Chains] to break the chain{rt1}||dodge [Purple Fire] and gather trash; breaking chains weakens Hakkar",
                ["mythicplus"] = "{rt8}Spiritbreaker Jin'do{rt8}||phase one pull the boss out of [Anti-Magic Shield]; during big cast stand under [Bubble] for immunity||{rt1}phase two pull each [Troll] to one of 4 [Chains] to break the chain{rt1}||dodge [Purple Fire] and gather trash; breaking chains weakens Hakkar",
            },
        },
        ["赞吉尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Zanzil{rt8}||[Voodoo Bolt] interrupt and dodge [Purple Fire]; drink the matching [Cauldron] by color to cure the corresponding poison||{rt1}blue = burn-death berserker / red = infernal friendly-fire / green = drink cauldron{rt1}||handle the matching-color arrow; don't drink the wrong cauldron",
                ["normal"] = "{rt8}Zanzil{rt8}||[Voodoo Bolt] interrupt and dodge [Purple Fire]; drink the matching [Cauldron] by color to cure the corresponding poison||{rt1}blue = burn-death berserker / red = infernal friendly-fire / green = drink cauldron{rt1}||handle the matching-color arrow; don't drink the wrong cauldron",
                ["heroic"] = "{rt8}Zanzil{rt8}||[Voodoo Bolt] interrupt and dodge [Purple Fire]; drink the matching [Cauldron] by color to cure the corresponding poison||{rt1}blue = burn-death berserker / red = infernal friendly-fire / green = drink cauldron{rt1}||handle the matching-color arrow; don't drink the wrong cauldron",
                ["mythic"] = "{rt8}Zanzil{rt8}||[Voodoo Bolt] interrupt and dodge [Purple Fire]; drink the matching [Cauldron] by color to cure the corresponding poison||{rt1}blue = burn-death berserker / red = infernal friendly-fire / green = drink cauldron{rt1}||handle the matching-color arrow; don't drink the wrong cauldron",
                ["mythicplus"] = "{rt8}Zanzil{rt8}||[Voodoo Bolt] interrupt and dodge [Purple Fire]; drink the matching [Cauldron] by color to cure the corresponding poison||{rt1}blue = burn-death berserker / red = infernal friendly-fire / green = drink cauldron{rt1}||handle the matching-color arrow; don't drink the wrong cauldron",
            },
        },
        ["重点怪：祖尔格拉布祭司"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Zul'Gurub Priest{rt8}||[healing] and [poison] must be interrupted||{rt1}Must interrupt: [Healing Wave]{rt1}||prioritize CC-killing priests to stop mobs being healed",
        },
        ["疯狂之缘----格里雷克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Edge of Madness—Grilek{rt8}||[Avatar] grows large and marks a random player to chase (taunt-immune), whole group kites away||{rt1}dispel the mark's [Entangling Roots] to prevent one-shot{rt1}||[Earthrend] random spikes knock back; after avatar ends, turn back and burst, stay spread",
                ["normal"] = "{rt8}Edge of Madness—Grilek{rt8}||[Avatar] grows large and marks a random player to chase (taunt-immune), whole group kites away||{rt1}dispel the mark's [Entangling Roots] to prevent one-shot{rt1}||[Earthrend] random spikes knock back; after avatar ends, turn back and burst, stay spread",
                ["heroic"] = "{rt8}Edge of Madness—Grilek{rt8}||[Avatar] grows large and marks a random player to chase (taunt-immune), whole group kites away||{rt1}dispel the mark's [Entangling Roots] to prevent one-shot{rt1}||[Earthrend] random spikes knock back; after avatar ends, turn back and burst, stay spread",
                ["mythic"] = "{rt8}Edge of Madness—Grilek{rt8}||[Avatar] grows large and marks a random player to chase (taunt-immune), whole group kites away||{rt1}dispel the mark's [Entangling Roots] to prevent one-shot{rt1}||[Earthrend] random spikes knock back; after avatar ends, turn back and burst, stay spread",
                ["mythicplus"] = "{rt8}Edge of Madness—Grilek{rt8}||[Avatar] grows large and marks a random player to chase (taunt-immune), whole group kites away||{rt1}dispel the mark's [Entangling Roots] to prevent one-shot{rt1}||[Earthrend] random spikes knock back; after avatar ends, turn back and burst, stay spread",
            },
        },
        ["疯狂之缘----雷纳塔基"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Edge of Madness—Renataki{rt8}||rogue-type—[Vanish] then random [Ambush] one-shots; ranged group up for low-AoE / hunter flare to break stealth||{rt1}[Thousand Blades] while spinning stay away and use cooldowns; dispel [Deadly Poison]{rt1}||hunter / warlock pets can track his position; at 30% [Frenzy] speeds up—pop cooldowns and burst",
                ["normal"] = "{rt8}Edge of Madness—Renataki{rt8}||rogue-type—[Vanish] then random [Ambush] one-shots; ranged group up for low-AoE / hunter flare to break stealth||{rt1}[Thousand Blades] while spinning stay away and use cooldowns; dispel [Deadly Poison]{rt1}||hunter / warlock pets can track his position; at 30% [Frenzy] speeds up—pop cooldowns and burst",
                ["heroic"] = "{rt8}Edge of Madness—Renataki{rt8}||rogue-type—[Vanish] then random [Ambush] one-shots; ranged group up for low-AoE / hunter flare to break stealth||{rt1}[Thousand Blades] while spinning stay away and use cooldowns; dispel [Deadly Poison]{rt1}||hunter / warlock pets can track his position; at 30% [Frenzy] speeds up—pop cooldowns and burst",
                ["mythic"] = "{rt8}Edge of Madness—Renataki{rt8}||rogue-type—[Vanish] then random [Ambush] one-shots; ranged group up for low-AoE / hunter flare to break stealth||{rt1}[Thousand Blades] while spinning stay away and use cooldowns; dispel [Deadly Poison]{rt1}||hunter / warlock pets can track his position; at 30% [Frenzy] speeds up—pop cooldowns and burst",
                ["mythicplus"] = "{rt8}Edge of Madness—Renataki{rt8}||rogue-type—[Vanish] then random [Ambush] one-shots; ranged group up for low-AoE / hunter flare to break stealth||{rt1}[Thousand Blades] while spinning stay away and use cooldowns; dispel [Deadly Poison]{rt1}||hunter / warlock pets can track his position; at 30% [Frenzy] speeds up—pop cooldowns and burst",
            },
        },
        ["疯狂之缘----乌苏雷"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Edge of Madness—Wushoolay{rt8}||archaeology trigger optional; in 4.3 only need to kill 2/4 council bosses, then Jin'do appears||{rt1}each boss different mechanics—burst{rt1}||[Renataki] vanish phase beware; [Hazahala] illusion stuns",
                ["normal"] = "{rt8}Edge of Madness—Wushoolay{rt8}||archaeology trigger optional; in 4.3 only need to kill 2/4 council bosses, then Jin'do appears||{rt1}each boss different mechanics—burst{rt1}||[Renataki] vanish phase beware; [Hazahala] illusion stuns",
                ["heroic"] = "{rt8}Edge of Madness—Wushoolay{rt8}||archaeology trigger optional; in 4.3 only need to kill 2/4 council bosses, then Jin'do appears||{rt1}each boss different mechanics—burst{rt1}||[Renataki] vanish phase beware; [Hazahala] illusion stuns",
                ["mythic"] = "{rt8}Edge of Madness—Wushoolay{rt8}||archaeology trigger optional; in 4.3 only need to kill 2/4 council bosses, then Jin'do appears||{rt1}each boss different mechanics—burst{rt1}||[Renataki] vanish phase beware; [Hazahala] illusion stuns",
                ["mythicplus"] = "{rt8}Edge of Madness—Wushoolay{rt8}||archaeology trigger optional; in 4.3 only need to kill 2/4 council bosses, then Jin'do appears||{rt1}each boss different mechanics—burst{rt1}||[Renataki] vanish phase beware; [Hazahala] illusion stuns",
            },
        },
        ["血领主曼多基尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Bloodlord Mandokir{rt8}||rides the bird [Ohgan]; random [Gaze] mark—after death auto battle-resurrects||{rt1}at 20% [Enrage] save cooldowns; kill the bird{rt1}||dodge fire; each kill makes him level up and hit harder",
                ["normal"] = "{rt8}Bloodlord Mandokir{rt8}||rides the bird [Ohgan]; random [Gaze] mark—after death auto battle-resurrects||{rt1}at 20% [Enrage] save cooldowns; kill the bird{rt1}||dodge fire; each kill makes him level up and hit harder",
                ["heroic"] = "{rt8}Bloodlord Mandokir{rt8}||rides the bird [Ohgan]; random [Gaze] mark—after death auto battle-resurrects||{rt1}at 20% [Enrage] save cooldowns; kill the bird{rt1}||dodge fire; each kill makes him level up and hit harder",
                ["mythic"] = "{rt8}Bloodlord Mandokir{rt8}||rides the bird [Ohgan]; random [Gaze] mark—after death auto battle-resurrects||{rt1}at 20% [Enrage] save cooldowns; kill the bird{rt1}||dodge fire; each kill makes him level up and hit harder",
                ["mythicplus"] = "{rt8}Bloodlord Mandokir{rt8}||rides the bird [Ohgan]; random [Gaze] mark—after death auto battle-resurrects||{rt1}at 20% [Enrage] save cooldowns; kill the bird{rt1}||dodge fire; each kill makes him level up and hit harder",
            },
        },
        ["高阶祭司基尔娜拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Priestess Kilnara{rt8}||before 50% clear [Panther] trash (don't over-pull to avoid bleed); dodge [Blood Tears] purple wave knockback||{rt1}interrupt her casts{rt1}||after 50% [Haste] buff—pop cooldowns and burst",
                ["normal"] = "{rt8}High Priestess Kilnara{rt8}||before 50% clear [Panther] trash (don't over-pull to avoid bleed); dodge [Blood Tears] purple wave knockback||{rt1}interrupt her casts{rt1}||after 50% [Haste] buff—pop cooldowns and burst",
                ["heroic"] = "{rt8}High Priestess Kilnara{rt8}||before 50% clear [Panther] trash (don't over-pull to avoid bleed); dodge [Blood Tears] purple wave knockback||{rt1}interrupt her casts{rt1}||after 50% [Haste] buff—pop cooldowns and burst",
                ["mythic"] = "{rt8}High Priestess Kilnara{rt8}||before 50% clear [Panther] trash (don't over-pull to avoid bleed); dodge [Blood Tears] purple wave knockback||{rt1}interrupt her casts{rt1}||after 50% [Haste] buff—pop cooldowns and burst",
                ["mythicplus"] = "{rt8}High Priestess Kilnara{rt8}||before 50% clear [Panther] trash (don't over-pull to avoid bleed); dodge [Blood Tears] purple wave knockback||{rt1}interrupt her casts{rt1}||after 50% [Haste] buff—pop cooldowns and burst",
            },
        },
    },
    ["起源大厅"] = {
        name = "Halls of Origination",
        ["地怒者塔赫"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Earthrager Ptah{rt8}||[Fire Arrow] marked—dodge; dodge [Earth Spike] and [Lava]; at 50% [Earthrage] summons adds / sandstorm||{rt1}heroic dodge the moving [Sand Vortex]{rt1}||tank pulls the adds; don't step in the sand pool",
                ["normal"] = "{rt8}Earthrager Ptah{rt8}||[Fire Arrow] marked—dodge; dodge [Earth Spike] and [Lava]; at 50% [Earthrage] summons adds / sandstorm||{rt1}heroic dodge the moving [Sand Vortex]{rt1}||tank pulls the adds; don't step in the sand pool",
                ["heroic"] = "{rt8}Earthrager Ptah{rt8}||[Fire Arrow] marked—dodge; dodge [Earth Spike] and [Lava]; at 50% [Earthrage] summons adds / sandstorm||{rt1}heroic dodge the moving [Sand Vortex]{rt1}||tank pulls the adds; don't step in the sand pool",
                ["mythic"] = "{rt8}Earthrager Ptah{rt8}||[Fire Arrow] marked—dodge; dodge [Earth Spike] and [Lava]; at 50% [Earthrage] summons adds / sandstorm||{rt1}heroic dodge the moving [Sand Vortex]{rt1}||tank pulls the adds; don't step in the sand pool",
                ["mythicplus"] = "{rt8}Earthrager Ptah{rt8}||[Fire Arrow] marked—dodge; dodge [Earth Spike] and [Lava]; at 50% [Earthrage] summons adds / sandstorm||{rt1}heroic dodge the moving [Sand Vortex]{rt1}||tank pulls the adds; don't step in the sand pool",
            },
        },
        ["伊希斯特，魔法的造物"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Isiset{rt8}||face away from [Supernova]; dodge [Meteor Shower]; kill [Astral Youngling]s||{rt1}at 60%/30% split—priority kill the matching image{rt1}||[Sky Mist] mana shield drains mana for damage reduction; ranged hit the body",
                ["normal"] = "{rt8}Isiset{rt8}||face away from [Supernova]; dodge [Meteor Shower]; kill [Astral Youngling]s||{rt1}at 60%/30% split—priority kill the matching image{rt1}||[Sky Mist] mana shield drains mana for damage reduction; ranged hit the body",
                ["heroic"] = "{rt8}Isiset{rt8}||face away from [Supernova]; dodge [Meteor Shower]; kill [Astral Youngling]s||{rt1}at 60%/30% split—priority kill the matching image{rt1}||[Sky Mist] mana shield drains mana for damage reduction; ranged hit the body",
                ["mythic"] = "{rt8}Isiset{rt8}||face away from [Supernova]; dodge [Meteor Shower]; kill [Astral Youngling]s||{rt1}at 60%/30% split—priority kill the matching image{rt1}||[Sky Mist] mana shield drains mana for damage reduction; ranged hit the body",
                ["mythicplus"] = "{rt8}Isiset{rt8}||face away from [Supernova]; dodge [Meteor Shower]; kill [Astral Youngling]s||{rt1}at 60%/30% split—priority kill the matching image{rt1}||[Sky Mist] mana shield drains mana for damage reduction; ranged hit the body",
            },
        },
        ["塞特斯，毁灭的造物"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Setesh{rt8}||dodge [Void Bubble] and [Chaos Bolt]; stand away from [Void Seed] explosion||{rt1}when [Portal] opens kill it to stop adds{rt1}||heroic portal must be broken or endless void adds",
                ["normal"] = "{rt8}Setesh{rt8}||dodge [Void Bubble] and [Chaos Bolt]; stand away from [Void Seed] explosion||{rt1}when [Portal] opens kill it to stop adds{rt1}||heroic portal must be broken or endless void adds",
                ["heroic"] = "{rt8}Setesh{rt8}||dodge [Void Bubble] and [Chaos Bolt]; stand away from [Void Seed] explosion||{rt1}when [Portal] opens kill it to stop adds{rt1}||heroic portal must be broken or endless void adds",
                ["mythic"] = "{rt8}Setesh{rt8}||dodge [Void Bubble] and [Chaos Bolt]; stand away from [Void Seed] explosion||{rt1}when [Portal] opens kill it to stop adds{rt1}||heroic portal must be broken or endless void adds",
                ["mythicplus"] = "{rt8}Setesh{rt8}||dodge [Void Bubble] and [Chaos Bolt]; stand away from [Void Seed] explosion||{rt1}when [Portal] opens kill it to stop adds{rt1}||heroic portal must be broken or endless void adds",
            },
        },
        ["拉夏，太阳的造物"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rajh{rt8}||dodge [Solar Cyclone] and [Inferno]; below 10 energy return to center [Charging] when damage +100% burst||{rt1}interrupt [Sun Orb][Inferno Leap]{rt1}||[Sun Strike] whole-group fire damage + DoT; heroic more fire circles",
                ["normal"] = "{rt8}Rajh{rt8}||dodge [Solar Cyclone] and [Inferno]; below 10 energy return to center [Charging] when damage +100% burst||{rt1}interrupt [Sun Orb][Inferno Leap]{rt1}||[Sun Strike] whole-group fire damage + DoT; heroic more fire circles",
                ["heroic"] = "{rt8}Rajh{rt8}||dodge [Solar Cyclone] and [Inferno]; below 10 energy return to center [Charging] when damage +100% burst||{rt1}interrupt [Sun Orb][Inferno Leap]{rt1}||[Sun Strike] whole-group fire damage + DoT; heroic more fire circles",
                ["mythic"] = "{rt8}Rajh{rt8}||dodge [Solar Cyclone] and [Inferno]; below 10 energy return to center [Charging] when damage +100% burst||{rt1}interrupt [Sun Orb][Inferno Leap]{rt1}||[Sun Strike] whole-group fire damage + DoT; heroic more fire circles",
                ["mythicplus"] = "{rt8}Rajh{rt8}||dodge [Solar Cyclone] and [Inferno]; below 10 energy return to center [Charging] when damage +100% burst||{rt1}interrupt [Sun Orb][Inferno Leap]{rt1}||[Sun Strike] whole-group fire damage + DoT; heroic more fire circles",
            },
        },
        ["重点怪：起源神谕者"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Origin Seer{rt8}||[Healing Wave] and [Flame] must be interrupted||{rt1}Must interrupt: [Healing Wave]{rt1}||prioritize killing the seer to stop mobs being healed",
        },
        ["阿穆纳伊，生命的造物"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ammunae{rt8}||[Seedling Pod] priority kill or it heals the boss; dodge [Spore Cloud]||{rt1}interrupt [Wither]{rt1}||[Life Drain] pulls and roots; at 100 stacks [Burst] whole-group nature damage",
                ["normal"] = "{rt8}Ammunae{rt8}||[Seedling Pod] priority kill or it heals the boss; dodge [Spore Cloud]||{rt1}interrupt [Wither]{rt1}||[Life Drain] pulls and roots; at 100 stacks [Burst] whole-group nature damage",
                ["heroic"] = "{rt8}Ammunae{rt8}||[Seedling Pod] priority kill or it heals the boss; dodge [Spore Cloud]||{rt1}interrupt [Wither]{rt1}||[Life Drain] pulls and roots; at 100 stacks [Burst] whole-group nature damage",
                ["mythic"] = "{rt8}Ammunae{rt8}||[Seedling Pod] priority kill or it heals the boss; dodge [Spore Cloud]||{rt1}interrupt [Wither]{rt1}||[Life Drain] pulls and roots; at 100 stacks [Burst] whole-group nature damage",
                ["mythicplus"] = "{rt8}Ammunae{rt8}||[Seedling Pod] priority kill or it heals the boss; dodge [Spore Cloud]||{rt1}interrupt [Wither]{rt1}||[Life Drain] pulls and roots; at 100 stacks [Burst] whole-group nature damage",
            },
        },
        ["安拉斐特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Anraphet{rt8}||[Alpha Beam] run from the black water; [Omega Stance] slow||{rt1}[Collapse] stacking lowers max health—priority kill{rt1}||heroic black water stays permanently, plan your route around it",
                ["normal"] = "{rt8}Anraphet{rt8}||[Alpha Beam] run from the black water; [Omega Stance] slow||{rt1}[Collapse] stacking lowers max health—priority kill{rt1}||heroic black water stays permanently, plan your route around it",
                ["heroic"] = "{rt8}Anraphet{rt8}||[Alpha Beam] run from the black water; [Omega Stance] slow||{rt1}[Collapse] stacking lowers max health—priority kill{rt1}||heroic black water stays permanently, plan your route around it",
                ["mythic"] = "{rt8}Anraphet{rt8}||[Alpha Beam] run from the black water; [Omega Stance] slow||{rt1}[Collapse] stacking lowers max health—priority kill{rt1}||heroic black water stays permanently, plan your route around it",
                ["mythicplus"] = "{rt8}Anraphet{rt8}||[Alpha Beam] run from the black water; [Omega Stance] slow||{rt1}[Collapse] stacking lowers max health—priority kill{rt1}||heroic black water stays permanently, plan your route around it",
            },
        },
        ["神殿守护者安努尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Temple Guardian Anhuur{rt8}||dodge [Blazing Light]; dispel [Holy Judgment]; interrupt [Resonating Hymn]||{rt1}at 66%/33% [Shield of Light] activate 2 [Light Beacons] to break the shield{rt1}||watch [Pit Serpents] in the pit; heroic shield break needs a 10s cast",
                ["normal"] = "{rt8}Temple Guardian Anhuur{rt8}||dodge [Blazing Light]; dispel [Holy Judgment]; interrupt [Resonating Hymn]||{rt1}at 66%/33% [Shield of Light] activate 2 [Light Beacons] to break the shield{rt1}||watch [Pit Serpents] in the pit; heroic shield break needs a 10s cast",
                ["heroic"] = "{rt8}Temple Guardian Anhuur{rt8}||dodge [Blazing Light]; dispel [Holy Judgment]; interrupt [Resonating Hymn]||{rt1}at 66%/33% [Shield of Light] activate 2 [Light Beacons] to break the shield{rt1}||watch [Pit Serpents] in the pit; heroic shield break needs a 10s cast",
                ["mythic"] = "{rt8}Temple Guardian Anhuur{rt8}||dodge [Blazing Light]; dispel [Holy Judgment]; interrupt [Resonating Hymn]||{rt1}at 66%/33% [Shield of Light] activate 2 [Light Beacons] to break the shield{rt1}||watch [Pit Serpents] in the pit; heroic shield break needs a 10s cast",
                ["mythicplus"] = "{rt8}Temple Guardian Anhuur{rt8}||dodge [Blazing Light]; dispel [Holy Judgment]; interrupt [Resonating Hymn]||{rt1}at 66%/33% [Shield of Light] activate 2 [Light Beacons] to break the shield{rt1}||watch [Pit Serpents] in the pit; heroic shield break needs a 10s cast",
            },
        },
    },
    ["黑石岩窟"] = {
        name = "Blackrock Caverns",
        ["柯尔拉，暮光之兆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Corla{rt8}||three players rotate standing in the [Evolution] purple light to control stacks and prevent cultists mutating||{rt1}interrupt [Dark Command]{rt1}||when the purple light stacks full the cultist turns into a drakonid and enrages; each evolution summons [Twilight Zealot] clear fast",
                ["normal"] = "{rt8}Corla{rt8}||three players rotate standing in the [Evolution] purple light to control stacks and prevent cultists mutating||{rt1}interrupt [Dark Command]{rt1}||when the purple light stacks full the cultist turns into a drakonid and enrages; each evolution summons [Twilight Zealot] clear fast",
                ["heroic"] = "{rt8}Corla{rt8}||three players rotate standing in the [Evolution] purple light to control stacks and prevent cultists mutating||{rt1}interrupt [Dark Command]{rt1}||when the purple light stacks full the cultist turns into a drakonid and enrages; each evolution summons [Twilight Zealot] clear fast",
                ["mythic"] = "{rt8}Corla{rt8}||three players rotate standing in the [Evolution] purple light to control stacks and prevent cultists mutating||{rt1}interrupt [Dark Command]{rt1}||when the purple light stacks full the cultist turns into a drakonid and enrages; each evolution summons [Twilight Zealot] clear fast",
                ["mythicplus"] = "{rt8}Corla{rt8}||three players rotate standing in the [Evolution] purple light to control stacks and prevent cultists mutating||{rt1}interrupt [Dark Command]{rt1}||when the purple light stacks full the cultist turns into a drakonid and enrages; each evolution summons [Twilight Zealot] clear fast",
            },
        },
        ["摧骨者罗姆欧格"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rom'ogg Bonecrusher{rt8}||tank faces away from the group; [Earthquake] cast—everyone move away||{rt1}quickly interrupt [Agonizing Pain] and DPS the chain to free captives{rt1}||[Skullcracker] AoE cast—spread; heroic summons [Enraged Earth] clear fast",
                ["normal"] = "{rt8}Rom'ogg Bonecrusher{rt8}||tank faces away from the group; [Earthquake] cast—everyone move away||{rt1}quickly interrupt [Agonizing Pain] and DPS the chain to free captives{rt1}||[Skullcracker] AoE cast—spread; heroic summons [Enraged Earth] clear fast",
                ["heroic"] = "{rt8}Rom'ogg Bonecrusher{rt8}||tank faces away from the group; [Earthquake] cast—everyone move away||{rt1}quickly interrupt [Agonizing Pain] and DPS the chain to free captives{rt1}||[Skullcracker] AoE cast—spread; heroic summons [Enraged Earth] clear fast",
                ["mythic"] = "{rt8}Rom'ogg Bonecrusher{rt8}||tank faces away from the group; [Earthquake] cast—everyone move away||{rt1}quickly interrupt [Agonizing Pain] and DPS the chain to free captives{rt1}||[Skullcracker] AoE cast—spread; heroic summons [Enraged Earth] clear fast",
                ["mythicplus"] = "{rt8}Rom'ogg Bonecrusher{rt8}||tank faces away from the group; [Earthquake] cast—everyone move away||{rt1}quickly interrupt [Agonizing Pain] and DPS the chain to free captives{rt1}||[Skullcracker] AoE cast—spread; heroic summons [Enraged Earth] clear fast",
            },
        },
        ["升腾者领主奥西迪斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ascendant Lord Obsidius{rt8}||[Twilight Shadow] images pulled apart by DPS and killed; clear adds to prevent swaps||{rt1}dispel [Twilight Corruption]{rt1}||dodge [Shatter] and [Thunderclap] slow; [Shadow Bolt] adds can be interrupted",
                ["normal"] = "{rt8}Ascendant Lord Obsidius{rt8}||[Twilight Shadow] images pulled apart by DPS and killed; clear adds to prevent swaps||{rt1}dispel [Twilight Corruption]{rt1}||dodge [Shatter] and [Thunderclap] slow; [Shadow Bolt] adds can be interrupted",
                ["heroic"] = "{rt8}Ascendant Lord Obsidius{rt8}||[Twilight Shadow] images pulled apart by DPS and killed; clear adds to prevent swaps||{rt1}dispel [Twilight Corruption]{rt1}||dodge [Shatter] and [Thunderclap] slow; [Shadow Bolt] adds can be interrupted",
                ["mythic"] = "{rt8}Ascendant Lord Obsidius{rt8}||[Twilight Shadow] images pulled apart by DPS and killed; clear adds to prevent swaps||{rt1}dispel [Twilight Corruption]{rt1}||dodge [Shatter] and [Thunderclap] slow; [Shadow Bolt] adds can be interrupted",
                ["mythicplus"] = "{rt8}Ascendant Lord Obsidius{rt8}||[Twilight Shadow] images pulled apart by DPS and killed; clear adds to prevent swaps||{rt1}dispel [Twilight Corruption]{rt1}||dodge [Shatter] and [Thunderclap] slow; [Shadow Bolt] adds can be interrupted",
            },
        },
        ["如花"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Beauty{rt8}||two-headed lava hound mainly hits the tank; random [Frenzied Charge] slams people, [Flame Eruption] sweeps around||{rt1}the [Magma Spit] target moves away from the group (lands and explodes); do NOT kill the pup Lucky or it enrages permanently{rt1}||[Terrifying Roar] fears those nearby; heroic four hounds together, CC the pups and focus the big one",
                ["normal"] = "{rt8}Beauty{rt8}||two-headed lava hound mainly hits the tank; random [Frenzied Charge] slams people, [Flame Eruption] sweeps around||{rt1}the [Magma Spit] target moves away from the group (lands and explodes); do NOT kill the pup Lucky or it enrages permanently{rt1}||[Terrifying Roar] fears those nearby; heroic four hounds together, CC the pups and focus the big one",
                ["heroic"] = "{rt8}Beauty{rt8}||two-headed lava hound mainly hits the tank; random [Frenzied Charge] slams people, [Flame Eruption] sweeps around||{rt1}the [Magma Spit] target moves away from the group (lands and explodes); do NOT kill the pup Lucky or it enrages permanently{rt1}||[Terrifying Roar] fears those nearby; heroic four hounds together, CC the pups and focus the big one",
                ["mythic"] = "{rt8}Beauty{rt8}||two-headed lava hound mainly hits the tank; random [Frenzied Charge] slams people, [Flame Eruption] sweeps around||{rt1}the [Magma Spit] target moves away from the group (lands and explodes); do NOT kill the pup Lucky or it enrages permanently{rt1}||[Terrifying Roar] fears those nearby; heroic four hounds together, CC the pups and focus the big one",
                ["mythicplus"] = "{rt8}Beauty{rt8}||two-headed lava hound mainly hits the tank; random [Frenzied Charge] slams people, [Flame Eruption] sweeps around||{rt1}the [Magma Spit] target moves away from the group (lands and explodes); do NOT kill the pup Lucky or it enrages permanently{rt1}||[Terrifying Roar] fears those nearby; heroic four hounds together, CC the pups and focus the big one",
            },
        },
        ["重点怪：暮光召唤师"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Twilight Summoner{rt8}||[Shadow Storm / Flame Storm] casts must be interrupted||{rt1}Must interrupt: [Shadow Storm][Lava Burst]{rt1}||don't pull multiple casters at once; prioritize killing ranged casters",
        },
        ["卡尔什·断钢"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Karsh Steelbreaker{rt8}||tank pulls him across the central furnace to trigger [Overheated Mercenary Armor] bonus damage; dodge [Molten Strike] fire circles||{rt1}no hard interrupt, rely on positioning{rt1}||[Molten Shield] phase stop and dodge frontal; fire elementals appear—clear first",
                ["normal"] = "{rt8}Karsh Steelbreaker{rt8}||tank pulls him across the central furnace to trigger [Overheated Mercenary Armor] bonus damage; dodge [Molten Strike] fire circles||{rt1}no hard interrupt, rely on positioning{rt1}||[Molten Shield] phase stop and dodge frontal; fire elementals appear—clear first",
                ["heroic"] = "{rt8}Karsh Steelbreaker{rt8}||tank pulls him across the central furnace to trigger [Overheated Mercenary Armor] bonus damage; dodge [Molten Strike] fire circles||{rt1}no hard interrupt, rely on positioning{rt1}||[Molten Shield] phase stop and dodge frontal; fire elementals appear—clear first",
                ["mythic"] = "{rt8}Karsh Steelbreaker{rt8}||tank pulls him across the central furnace to trigger [Overheated Mercenary Armor] bonus damage; dodge [Molten Strike] fire circles||{rt1}no hard interrupt, rely on positioning{rt1}||[Molten Shield] phase stop and dodge frontal; fire elementals appear—clear first",
                ["mythicplus"] = "{rt8}Karsh Steelbreaker{rt8}||tank pulls him across the central furnace to trigger [Overheated Mercenary Armor] bonus damage; dodge [Molten Strike] fire circles||{rt1}no hard interrupt, rely on positioning{rt1}||[Molten Shield] phase stop and dodge frontal; fire elementals appear—clear first",
            },
        },
    },
    ["暮光审判"] = {
        name = "Hour of Twilight",
        ["阿奎里恩"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Aquilion{rt8}||dodge [Ice Boulder] blue circles; protect Thrall||{rt1}Interrupt [Frost Hand]{rt1}||free Thrall sealed in [Ice Tomb]; below 30% [Frost Torrent] rush",
                ["normal"] = "{rt8}Aquilion{rt8}||dodge [Ice Boulder] blue circles; protect Thrall||{rt1}Interrupt [Frost Hand]{rt1}||free Thrall sealed in [Ice Tomb]; below 30% [Frost Torrent] rush",
                ["heroic"] = "{rt8}Aquilion{rt8}||dodge [Ice Boulder] blue circles; protect Thrall||{rt1}Interrupt [Frost Hand]{rt1}||free Thrall sealed in [Ice Tomb]; below 30% [Frost Torrent] rush",
                ["mythic"] = "{rt8}Aquilion{rt8}||dodge [Ice Boulder] blue circles; protect Thrall||{rt1}Interrupt [Frost Hand]{rt1}||free Thrall sealed in [Ice Tomb]; below 30% [Frost Torrent] rush",
                ["mythicplus"] = "{rt8}Aquilion{rt8}||dodge [Ice Boulder] blue circles; protect Thrall||{rt1}Interrupt [Frost Hand]{rt1}||free Thrall sealed in [Ice Tomb]; below 30% [Frost Torrent] rush",
            },
        },
        ["大主教本尼迪塔斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Priest Benedictus{rt8}||holy / shadow two-phase switch—[Consecrating Fire]/[Corrupting Twilight]||{rt1}stand in [Light Wave] safe zone; dodge [Twilight Barrage]{rt1}||tank calls the switch; standing long in one phase stacks damage and wipes",
                ["normal"] = "{rt8}High Priest Benedictus{rt8}||holy / shadow two-phase switch—[Consecrating Fire]/[Corrupting Twilight]||{rt1}stand in [Light Wave] safe zone; dodge [Twilight Barrage]{rt1}||tank calls the switch; standing long in one phase stacks damage and wipes",
                ["heroic"] = "{rt8}High Priest Benedictus{rt8}||holy / shadow two-phase switch—[Consecrating Fire]/[Corrupting Twilight]||{rt1}stand in [Light Wave] safe zone; dodge [Twilight Barrage]{rt1}||tank calls the switch; standing long in one phase stacks damage and wipes",
                ["mythic"] = "{rt8}High Priest Benedictus{rt8}||holy / shadow two-phase switch—[Consecrating Fire]/[Corrupting Twilight]||{rt1}stand in [Light Wave] safe zone; dodge [Twilight Barrage]{rt1}||tank calls the switch; standing long in one phase stacks damage and wipes",
                ["mythicplus"] = "{rt8}High Priest Benedictus{rt8}||holy / shadow two-phase switch—[Consecrating Fire]/[Corrupting Twilight]||{rt1}stand in [Light Wave] safe zone; dodge [Twilight Barrage]{rt1}||tank calls the switch; standing long in one phase stacks damage and wipes",
            },
        },
        ["重点怪：暮光锤狂热者"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Twilight's Hammer Zealot{rt8}||[Shadow Bolt] and [healing] must be interrupted||{rt1}Must interrupt: [Shadow Bolt]{rt1}||prioritize CC-killing the caster while escorting Thrall",
        },
        ["埃希拉·黎明克星"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Aeshara Dawnbreaker{rt8}||dodge [Light Blade]/[Suffocating Smoke Bomb]; mobile positioning||{rt1}Interrupt [Silence]-type spells{rt1}||single-target heavy hits—tank uses cooldowns; vision lost inside the smoke",
                ["normal"] = "{rt8}Aeshara Dawnbreaker{rt8}||dodge [Light Blade]/[Suffocating Smoke Bomb]; mobile positioning||{rt1}Interrupt [Silence]-type spells{rt1}||single-target heavy hits—tank uses cooldowns; vision lost inside the smoke",
                ["heroic"] = "{rt8}Aeshara Dawnbreaker{rt8}||dodge [Light Blade]/[Suffocating Smoke Bomb]; mobile positioning||{rt1}Interrupt [Silence]-type spells{rt1}||single-target heavy hits—tank uses cooldowns; vision lost inside the smoke",
                ["mythic"] = "{rt8}Aeshara Dawnbreaker{rt8}||dodge [Light Blade]/[Suffocating Smoke Bomb]; mobile positioning||{rt1}Interrupt [Silence]-type spells{rt1}||single-target heavy hits—tank uses cooldowns; vision lost inside the smoke",
                ["mythicplus"] = "{rt8}Aeshara Dawnbreaker{rt8}||dodge [Light Blade]/[Suffocating Smoke Bomb]; mobile positioning||{rt1}Interrupt [Silence]-type spells{rt1}||single-target heavy hits—tank uses cooldowns; vision lost inside the smoke",
            },
        },
    },
    ["托维尔失落之城"] = {
        name = "Lost City of the Tol'vir",
        ["高阶预言者巴林姆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Prophet Barim{rt8}||light phase dodge [Wrath of Heaven] fire pillars, dispel [Plague of Ages]; at 50% [Soul Sever] enter the shadow realm||{rt1}in shadow realm kill [Dark Phoenix] and [Soul Shards]{rt1}||phoenix dies return to light; heroic phoenix turns to egg—priority kill",
                ["normal"] = "{rt8}High Prophet Barim{rt8}||light phase dodge [Wrath of Heaven] fire pillars, dispel [Plague of Ages]; at 50% [Soul Sever] enter the shadow realm||{rt1}in shadow realm kill [Dark Phoenix] and [Soul Shards]{rt1}||phoenix dies return to light; heroic phoenix turns to egg—priority kill",
                ["heroic"] = "{rt8}High Prophet Barim{rt8}||light phase dodge [Wrath of Heaven] fire pillars, dispel [Plague of Ages]; at 50% [Soul Sever] enter the shadow realm||{rt1}in shadow realm kill [Dark Phoenix] and [Soul Shards]{rt1}||phoenix dies return to light; heroic phoenix turns to egg—priority kill",
                ["mythic"] = "{rt8}High Prophet Barim{rt8}||light phase dodge [Wrath of Heaven] fire pillars, dispel [Plague of Ages]; at 50% [Soul Sever] enter the shadow realm||{rt1}in shadow realm kill [Dark Phoenix] and [Soul Shards]{rt1}||phoenix dies return to light; heroic phoenix turns to egg—priority kill",
                ["mythicplus"] = "{rt8}High Prophet Barim{rt8}||light phase dodge [Wrath of Heaven] fire pillars, dispel [Plague of Ages]; at 50% [Soul Sever] enter the shadow realm||{rt1}in shadow realm kill [Dark Phoenix] and [Soul Shards]{rt1}||phoenix dies return to light; heroic phoenix turns to egg—priority kill",
            },
        },
        ["胡辛姆将军"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}General Husam{rt8}||dodge [Shockwave] X-shaped spikes and [Arcane Traps]; after [Malice] knockback, reposition back||{rt1}tank faces front, healer heals{rt1}||[Heavy Punch] instant heavy hit; focus fire while he's casting stationary",
                ["normal"] = "{rt8}General Husam{rt8}||dodge [Shockwave] X-shaped spikes and [Arcane Traps]; after [Malice] knockback, reposition back||{rt1}tank faces front, healer heals{rt1}||[Heavy Punch] instant heavy hit; focus fire while he's casting stationary",
                ["heroic"] = "{rt8}General Husam{rt8}||dodge [Shockwave] X-shaped spikes and [Arcane Traps]; after [Malice] knockback, reposition back||{rt1}tank faces front, healer heals{rt1}||[Heavy Punch] instant heavy hit; focus fire while he's casting stationary",
                ["mythic"] = "{rt8}General Husam{rt8}||dodge [Shockwave] X-shaped spikes and [Arcane Traps]; after [Malice] knockback, reposition back||{rt1}tank faces front, healer heals{rt1}||[Heavy Punch] instant heavy hit; focus fire while he's casting stationary",
                ["mythicplus"] = "{rt8}General Husam{rt8}||dodge [Shockwave] X-shaped spikes and [Arcane Traps]; after [Malice] knockback, reposition back||{rt1}tank faces front, healer heals{rt1}||[Heavy Punch] instant heavy hit; focus fire while he's casting stationary",
            },
        },
        ["重点怪：托维尔占卜师"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Tol'vir Diviner{rt8}||[healing] and [Shadow Bolt] must be interrupted||{rt1}Must interrupt: [Healing Wave][Shadow Bolt]{rt1}||prioritize CC-killing the diviner before the melee",
        },
        ["希亚玛特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Siamat{rt8}||phase one [Storm Shield] reduces damage—kill the [Servants] and [Guards]; killing the 3rd guard breaks the shield||{rt1}move away before death to avoid [Thunder Crush] stacking{rt1}||after shield break [Gale] knockback—stand center; phase two ignore mobs and rush, dodge [Storm Arrow]",
                ["normal"] = "{rt8}Siamat{rt8}||phase one [Storm Shield] reduces damage—kill the [Servants] and [Guards]; killing the 3rd guard breaks the shield||{rt1}move away before death to avoid [Thunder Crush] stacking{rt1}||after shield break [Gale] knockback—stand center; phase two ignore mobs and rush, dodge [Storm Arrow]",
                ["heroic"] = "{rt8}Siamat{rt8}||phase one [Storm Shield] reduces damage—kill the [Servants] and [Guards]; killing the 3rd guard breaks the shield||{rt1}move away before death to avoid [Thunder Crush] stacking{rt1}||after shield break [Gale] knockback—stand center; phase two ignore mobs and rush, dodge [Storm Arrow]",
                ["mythic"] = "{rt8}Siamat{rt8}||phase one [Storm Shield] reduces damage—kill the [Servants] and [Guards]; killing the 3rd guard breaks the shield||{rt1}move away before death to avoid [Thunder Crush] stacking{rt1}||after shield break [Gale] knockback—stand center; phase two ignore mobs and rush, dodge [Storm Arrow]",
                ["mythicplus"] = "{rt8}Siamat{rt8}||phase one [Storm Shield] reduces damage—kill the [Servants] and [Guards]; killing the 3rd guard breaks the shield||{rt1}move away before death to avoid [Thunder Crush] stacking{rt1}||after shield break [Gale] knockback—stand center; phase two ignore mobs and rush, dodge [Storm Arrow]",
            },
        },
        ["锁喉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lockmaw{rt8}||in Lostmaw dodge the [Dust Tail] tail sweep and [Poison Pool]; at 30% [Enrage] dispel; [Bloody Scent] draws crocolisks—focus them||{rt1}Aufer [Whirlwind]/[Smoke] kite{rt1}||Aufer [Dragon's Breath] disorients the tank—switch to second threat; Aufer's enrage can't be dispelled",
                ["normal"] = "{rt8}Lockmaw{rt8}||in Lostmaw dodge the [Dust Tail] tail sweep and [Poison Pool]; at 30% [Enrage] dispel; [Bloody Scent] draws crocolisks—focus them||{rt1}Aufer [Whirlwind]/[Smoke] kite{rt1}||Aufer [Dragon's Breath] disorients the tank—switch to second threat; Aufer's enrage can't be dispelled",
                ["heroic"] = "{rt8}Lockmaw{rt8}||in Lostmaw dodge the [Dust Tail] tail sweep and [Poison Pool]; at 30% [Enrage] dispel; [Bloody Scent] draws crocolisks—focus them||{rt1}Aufer [Whirlwind]/[Smoke] kite{rt1}||Aufer [Dragon's Breath] disorients the tank—switch to second threat; Aufer's enrage can't be dispelled",
                ["mythic"] = "{rt8}Lockmaw{rt8}||in Lostmaw dodge the [Dust Tail] tail sweep and [Poison Pool]; at 30% [Enrage] dispel; [Bloody Scent] draws crocolisks—focus them||{rt1}Aufer [Whirlwind]/[Smoke] kite{rt1}||Aufer [Dragon's Breath] disorients the tank—switch to second threat; Aufer's enrage can't be dispelled",
                ["mythicplus"] = "{rt8}Lockmaw{rt8}||in Lostmaw dodge the [Dust Tail] tail sweep and [Poison Pool]; at 30% [Enrage] dispel; [Bloody Scent] draws crocolisks—focus them||{rt1}Aufer [Whirlwind]/[Smoke] kite{rt1}||Aufer [Dragon's Breath] disorients the tank—switch to second threat; Aufer's enrage can't be dispelled",
            },
        },
    },
}
