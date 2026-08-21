-- ============================================================================
-- BossTips 12.1 团本攻略翻译 —— enUS（按源每难度分别翻译/转换；四难度 + mythicplus=mythic）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["12.1"] = {
    ["潮缚石窟"] = {
        name = "Tidebound Grotto",
        ["尼姆瑞莎·唤波者"] = {
            type = "BOSS",
            name = "Nimrissa the Wavecaller",
            tipsByDifficulty = {
                ["lfr"] = [[LFR: very forgiving—just follow the group. Kill the murloc adds that spawn at the edges whenever you see them. Don't stand in the beam of the straight-line water current in front of the tank. During [Abyssal Rain] (raid-wide damage), hold position and don't wander; let healers top everyone off.]],
                ["normal"] = [[Assign ranged and slow-capable classes to specifically intercept the murlocs from [Charmed Bubble] so they never reach the middle. After [Frostbind Frost] marks you, move as prompted and don't drag the ice orb into the raid. Pre-lay shields before [Abyssal Rain]; the tank should always aim line attacks toward open ground.]],
                ["heroic"] = [[Abilities come roughly every 20s and overlap. When the [Charmed Bubble] add wave and [Abyssal Rain] arrive together, stabilize the raid's health before clearing adds. Clear the path for [Tidebreaker Charge] ahead of time—getting hit also pulls follow-up damage. Track [Endless Tide] the whole fight; stalling on adds too long lets the enrage catch up.]],
                ["mythic"] = [[Mythic replaces [Water Squall] with the deadlier [Water Jet]; the tank must precisely control beam direction and rotate who takes it on cue. Murloc adds are more numerous and spawn faster, needing two fixed groups covering left and right without eating the boss's DPS windows. Pre-plan raid mitigations for the [Frostbind Frost] + [Abyssal Rain] overlap; DPS slack before the enrage is minimal.]],
                ["mythicplus"] = [[Mythic replaces [Water Squall] with the deadlier [Water Jet]; the tank must precisely control beam direction and rotate who takes it on cue. Murloc adds are more numerous and spawn faster, needing two fixed groups covering left and right without eating the boss's DPS windows. Pre-plan raid mitigations for the [Frostbind Frost] + [Abyssal Rain] overlap; DPS slack before the enrage is minimal.]],
            },
        },
    },
    ["烈毒之渊"] = {
        name = "The Venomous Abyss",
        ["万毒邪祟者瓦什尼克"] = {
            type = "BOSS",
            name = "Vashnik the Malignant",
            tipsByDifficulty = {
                ["lfr"] = [[Focus the big slimes that crawl out of the fountains; never let them reach the pit in the middle of the room. When [Plague Foam] appears on you, run outside the raid and wait for the venom to finish before returning. If you're marked by [Explosive Infection], run far away; the other two infections just stay put and let healers heal through.]],
                ["normal"] = [[The tank uses positioning to lock in [Quaff]'s fountain combinations, avoiding the awkward pairings. Assign melee and ranged each to block one slime route; CC works on shadow and flame slimes, but blood slimes are CC-immune and must be hard-killed. Kill [Burning Venom] and the other big slimes on staggered timers to avoid [Corrosion Surge] and [Shadow Spray] stacking.]],
                ["heroic"] = [[Heroic adds [Vicious Catalyst]: venom orbs condense above the venom pit—the whole raid takes one big poison hit first, then the scattered [Catalytic Bile] must be caught by someone; if it drops unsoaked it instead damages the whole raid. Fountains drain faster; once [Infusion] stacks up, slime HP and spray damage double, so the clear tempo must speed up. During [Venomfang]'s physical-vulnerability window the healer must watch the tank and pair external damage reduction.]],
                ["mythic"] = [[Mythic adds a pairing and positioning layer for the prototypical venom, with near-zero tolerance—any slime reaching the pit is a wipe. The three [Adaptive Infections] overlap, requiring a pre-arranged rotation table for dispels, absorb shields, and outdoor-explosion spots. Stay on [Quaff]'s rhythm the whole fight; line up burst windows in the early rounds while [Toxic Vapor] stacks are still low.]],
                ["mythicplus"] = [[Mythic adds a pairing and positioning layer for the prototypical venom, with near-zero tolerance—any slime reaching the pit is a wipe. The three [Adaptive Infections] overlap, requiring a pre-arranged rotation table for dispels, absorb shields, and outdoor-explosion spots. Stay on [Quaff]'s rhythm the whole fight; line up burst windows in the early rounds while [Toxic Vapor] stacks are still low.]],
            },
        },
        ["乌拉特克"] = {
            type = "BOSS",
            name = "Urathek",
            tipsByDifficulty = {
                ["lfr"] = [[Stay tight with the group; dodge the venom waves spreading across the ground and don't step on the packs of snake-egg hatches. If someone gets wrapped in a membrane, prioritize breaking them out. When the boss exposes its heart is the time to focus damage—dump your cooldowns.]],
                ["normal"] = [[The direction of the Venom Wave is team-controlled; the commander assigns which side to push toward to reduce the hatched [Spawn of the Devourer]. When [Wrath of the Bound] exposes [Toxic Heart], use Heroism and burst it down in one go. In the final phase the arena is torn apart; gather early on safe ground and don't wait at the edge to fall.]],
                ["heroic"] = [[There's almost no breathing room between phase transitions; [Falling Debris] and environmental damage keep stacking, so healing CDs must be timed precisely on the two amplification windows. Hatch control is stricter—one wrong wave route spawns multiple [Spawn of the Devourer] at once and you'll be short-handed. In P3 [Ghostly Coil] the whole raid must stack into the impact zone on time; spreading is a wipe.]],
                ["mythic"] = [[Mythic adds mechanics and turns the soft enrage into a hard check—the fight must end before [Raging Liberation]. Venom-wave routes, snake-egg hatch order, and collapse zones must be written into a full rotation executed round by round. Melee and ranged rotate by zone to keep DPS up during the [Toxic Heart] window; any positioning mistake chains into the next phase.]],
                ["mythicplus"] = [[Mythic adds mechanics and turns the soft enrage into a hard check—the fight must end before [Raging Liberation]. Venom-wave routes, snake-egg hatch order, and collapse zones must be written into a full rotation executed round by round. Melee and ranged rotate by zone to keep DPS up during the [Toxic Heart] window; any positioning mistake chains into the next phase.]],
            },
        },
        ["双子毒牙"] = {
            type = "BOSS",
            name = "The Twin Fangs",
            tipsByDifficulty = {
                ["lfr"] = [[Your stack of [Eternal Venom] is the lifeline—when it nears the cap, step into Yslaz's [Ravenous Feast] share circle to clear stacks. Don't step on the green slime or touch the floating venom orbs. The moment you see the little snake [Vexul's Spawn] appear, swap and burn it down—each of its saliva casts adds a stack to you.]],
                ["normal"] = [[Two tanks each stick to one snake; [Shard Shatter] must have someone catch it within 3 yards. Assign fixed people to catch the droplets from [Corrosion Flood] to avoid the whole raid eating stacks together. Sync the two heads' health and kill them simultaneously at the end—don't leave a [Surge] window.]],
                ["heroic"] = [[Heroic's [Ravenous Feast] turns the swallowed venom into [Bloodclot Mass], and [Effervescent Mixture] makes it grow thicker with stacks—must be focused immediately or [Bloody Gush] keeps stacking raid-wide damage amp. At full energy Vexul's [Surge] and Yslaz's [Flood] arrive together, so pre-hold raid mitigations and healing cooldowns. [Congealing Flesh]'s blood pool compresses the arena—leave retreat space in your positioning.]],
                ["mythic"] = [[Stack management is precise to the person: catching droplets, entering [Ravenous Feast], and eating [Churning Abyss] all rotate by table—any extra bite can hit the 10-stack cap and kill you. Feed [Bloodclot Mass] to Yslaz in the correct order; if handled sloppily you'll enter the next round with a full [Bloody Gush]. The finish must drop both snakes within seconds of each other.]],
                ["mythicplus"] = [[Stack management is precise to the person: catching droplets, entering [Ravenous Feast], and eating [Churning Abyss] all rotate by table—any extra bite can hit the 10-stack cap and kill you. Feed [Bloodclot Mass] to Yslaz in the correct order; if handled sloppily you'll enter the next round with a full [Bloody Gush]. The finish must drop both snakes within seconds of each other.]],
            },
        },
        ["斯索拉克"] = {
            type = "BOSS",
            name = "Sszorak",
            tipsByDifficulty = {
                ["lfr"] = [[Stand behind and to the side of the boss; don't eat the frontal cone. If you're marked with green venom, run to a low-traffic spot; don't touch the venom orb left after the explosion. When the big wind blows you up, collide with a similarly-blown teammate to land.]],
                ["normal"] = [[[Sunder] needs enough people to share the damage; too few will directly kill the taker. After [Furious Crosswind] ends it blows you away and applies [Turbulent Gust]—pre-find a partner to collide and remove it. [Burrow Bulwark]'s 25 seconds is the only +30% vulnerability window; put Heroism and bursts all there.]],
                ["heroic"] = [[[Viscous Cyst] keeps piling up on the field; plan placement routes in advance, and during [Howling Vortex] with no footing you're a free kill. The tank's [Plunder] stacks multiply incoming damage, needing external DR plus a fixed tank-swap point. [Eroding Venom] and [Storm]'s poison-slow stacking makes movement painful—save mobility tools.]],
                ["mythic"] = [[Mythic adds [Serpent's Wrath]: a marked player needs at least 14 people within 8 yards to trigger [Kill Frenzy]; short on people, the boss fills rage and enters [Unstoppable] for an instant wipe. [Kill Frenzy] leaves [Deadly Venom] that explodes when removed and leaves [Corrosive Residue] (+30% damage taken in zone)—dispel timing and positioning must be unified. The whole fight switches between 'gather to share' and 'spread to dodge wind'; one missed beat can't be recovered.]],
                ["mythicplus"] = [[Mythic adds [Serpent's Wrath]: a marked player needs at least 14 people within 8 yards to trigger [Kill Frenzy]; short on people, the boss fills rage and enters [Unstoppable] for an instant wipe. [Kill Frenzy] leaves [Deadly Venom] that explodes when removed and leaves [Corrosive Residue] (+30% damage taken in zone)—dispel timing and positioning must be unified. The whole fight switches between 'gather to share' and 'spread to dodge wind'; one missed beat can't be recovered.]],
            },
        },
        ["盘卷祭坛"] = {
            type = "BOSS",
            name = "The Coiled Altar",
            tipsByDifficulty = {
                ["lfr"] = [[First half, follow the group: step into [Guillotine] to share; dodge the venom on the ground and the flying axes. After Maracas appears, little mobs chase you—kite and fight, don't stand and eat. When [Tomb Bind] appears on you, pick up the [Soul Fragment] on the ground to clear it.]],
                ["normal"] = [[Assign [Guillotine] share groups; insufficient numbers will directly kill the taker. Interrupt [Vicious Coilspeaker]'s [Terror Screech]; [Terror Manifest] targets someone who is responsible for kiting, others don't block. Final phase the two targets' health are linked; pre-calculate bursts to kill them simultaneously.]],
                ["heroic"] = [[[Condensing Venom] keeps accumulating on the field; share and kite routes must both avoid venom, and save mobility tools. During the possession phase [Terror March] and [Soul Rending] overlap with add waves, so split interrupt and swap targets into two teams. Final phase double-target simultaneous DPS is very demanding—save raid mitigations and healing CDs for here.]],
                ["mythic"] = [[Near-zero tolerance: axe lines, [Guillotine] landing spots, [Condensing Venom] and [Terror Manifest] movement routes must all be pre-planned into fixed runs. [Gloomy Bomb] and [Tomb Bind] rotate by person to pick up fragments; miss one and they drop next wave. Final phase must bring both targets down almost simultaneously, or the survivor's damage amp instantly breaks the healers.]],
                ["mythicplus"] = [[Near-zero tolerance: axe lines, [Guillotine] landing spots, [Condensing Venom] and [Terror Manifest] movement routes must all be pre-planned into fixed runs. [Gloomy Bomb] and [Tomb Bind] rotate by person to pick up fragments; miss one and they drop next wave. Final phase must bring both targets down almost simultaneously, or the survivor's damage amp instantly breaks the healers.]],
            },
        },
        ["盘魂者内克扎莉"] = {
            type = "BOSS",
            name = "Nek'zali the Soulcoiler",
            tipsByDifficulty = {
                ["lfr"] = [[Just remember three things: don't stand in the black water in the well at the center; don't let adds into the well; when [Coil] pulls you along, stand still and wait for an interrupt or dispel. When the boss retreats at half health, focus the [Javac's Echo] on the field to pull her back. Final phase raid-wide damage speeds up—use personal DR and stay close to healers.]],
                ["normal"] = [[Two groups rotate slow and control to stop [Sleepless Amani], not letting any into [Coilspring Well]. Before [Coil Ignite]'s 4-second cast, lay shields; during it dodge [Agony Echo]'s knockback circles; after [Essence Tear] ends, clear [Hidden Cultists]. At 50%, focus [Javac's Echo]; [Uncoil] is a soft enrage, so save Heroism for this phase to finish in one push.]],
                ["heroic"] = [[Heroic adds [Ritual Burn]: each stack raises [Coil Ritual] damage by another 15% for 1 minute, so one missed add snowballs the rest—the control chain must be flawless. [Coil Ignite] must be covered by a fixed raid mitigation plus extra healing CD; don't hard-take the DoT and vulnerability stacks when high. Push phases before the vulnerability stacks build up, avoiding entering [Uncoil] at full stacks.]],
                ["mythic"] = [[Phase transitions add [Tight Grasp of the Abyss]: [Drowned Echo] periodically pulls the whole raid toward the well mouth and deals ongoing damage—must be killed fast; those who go in to DPS leave with [Soul Fatigue] (+300% damage from well and [Undying Entangle]), so rotate an in/out roster. During [Supplication] you must interrupt every [Hidden Cultist]'s cast; an interrupted caster silences the interrupter for 3s, so the kick table must be assigned per person. Near-zero tolerance throughout—one well entry or missed interrupt is basically a reset.]],
                ["mythicplus"] = [[Phase transitions add [Tight Grasp of the Abyss]: [Drowned Echo] periodically pulls the whole raid toward the well mouth and deals ongoing damage—must be killed fast; those who go in to DPS leave with [Soul Fatigue] (+300% damage from well and [Undying Entangle]), so rotate an in/out roster. During [Supplication] you must interrupt every [Hidden Cultist]'s cast; an interrupted caster silences the interrupter for 3s, so the kick table must be assigned per person. Near-zero tolerance throughout—one well entry or missed interrupt is basically a reset.]],
            },
        },
        ["迷失的探险者"] = {
            type = "BOSS",
            name = "The Lost Explorers",
            tipsByDifficulty = {
                ["lfr"] = [[Spread the three turtles as far apart as possible; bunched up they get 99% damage reduction and become unkillable. Crates, bouncing mushrooms, and shock bombs drop on the ground—walk away from them, and watch your landing after being knocked away. When you pick up [Nasty Fish], throw it at a controlled turtle to free it.]],
                ["normal"] = [[Pre-assign three groups to each take one of [Colossal Smash]'s three landing points for raid-split; if no one takes it the whole raid is heavily injured. Interrupt [Scrollkeeper Iku]'s [Frostfire]; [Frostfire Barrage] spread out to prevent the two orbs merging. Pressure the three bosses' health in sync; leave [Scrollkeeper Iku] for last, don't kill any one early.]],
                ["heroic"] = [[[Fungal Explosion] and [Shockwave] touching is a million-plus hit; after [Explosive Surprise] knocks you back, control your landing so you don't land in mushrooms. [Morzahi] at full energy enrages; [Nasty Fish] must be thrown the moment [Dark Whisper] is applied, prioritizing targets not yet hit. A wrong kill order triggering [Relentless Intensify] is basically a wipe—unify commands in the execute phase.]],
                ["mythic"] = [[Add HP and timers tighten across the board; the share, interrupt, and fish-throw chains must all stay online together. Keep the three health differences tiny, near-simultaneous execute, leaving no [Relentless Intensify] window. Melee must juggle [Shatter Shovel]'s knockback and [Evil Eye]'s 2-yard sweep; positioning must shift in real time with the statues.]],
                ["mythicplus"] = [[Add HP and timers tighten across the board; the share, interrupt, and fish-throw chains must all stay online together. Keep the three health differences tiny, near-simultaneous execute, leaving no [Relentless Intensify] window. Melee must juggle [Shatter Shovel]'s knockback and [Evil Eye]'s 2-yard sweep; positioning must shift in real time with the statues.]],
            },
        },
        ["陵寝哨兵"] = {
            type = "BOSS",
            name = "The Entombed Sentinels",
            tipsByDifficulty = {
                ["lfr"] = [[One rule: keep the two sentinels apart always; don't pull them together or they get 99% damage reduction. Actively run onto and stomp the [Deadly Venom Droplet] the green one sprays; once all are stomped they won't explode. When [Spiral Toxin] is on you, find another poisoned person and collide—at 4 stacks it clears automatically.]],
                ["normal"] = [[Two tanks each take one sentinel left/right, keep at least 40 yards between; DPS split into two teams each focus one, pressure health in sync, don't let [Caustic Stasis] heal back for nothing. Whole raid shares stepping [Deadly Venom Droplet] and focus [Venom Clot], healer watches [Withering Blood] dispel. Pre-pair two-person collision pairs for [Spiral Toxin], collide to 4 stacks.]],
                ["heroic"] = [[Heroic's [Living Venom] flies back to its source 4 seconds after spawning—move off the return path and don't stand on the line. [Spiral Toxin] must be exactly 4 stacks; over or under leaves a lingering DoT, so fix the pairing table to people. The tank rotates by [Empowered Smash] stacks at a fixed point; during the swap don't let the two touch.]],
                ["mythic"] = [[Separation tolerance tightens further; when the two charge together for a big move, the raid splits into two teams and periodically swaps sides, completing the tank swap in the process. Health must be strictly synced, or [Caustic Stasis] healing back eats a whole burst round. Any [Spiral Toxin] mis-collision carries the DoT into the next round; once the rhythm breaks it's hard to recover.]],
                ["mythicplus"] = [[Separation tolerance tightens further; when the two charge together for a big move, the raid splits into two teams and periodically swaps sides, completing the tank swap in the process. Health must be strictly synced, or [Caustic Stasis] healing back eats a whole burst round. Any [Spiral Toxin] mis-collision carries the DoT into the next round; once the rhythm breaks it's hard to recover.]],
            },
        },
    },
}
