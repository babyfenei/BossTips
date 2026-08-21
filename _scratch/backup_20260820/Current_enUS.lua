-- ============================================================================
-- BossTips M+ 攻略翻译 —— enUS（BOSS 五难度 + MOB 单 tips；五难度均填译文，杜绝回退简中）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.mplus = addon.GuideData.translations.enUS.mplus or {}
addon.GuideData.translations.enUS.mplus["Current"] = {
    ["塞塔里斯神庙"] = {
        name = "Temple of Sethraliss",
        ["剧毒蝰蛇"] = {
            type = "MOB",
            name = "Venomous Viper",
            tips = [[{rt8}Venomous Viper{rt8}||[Venom Spray] targets a random player—interrupt to avoid stacking poison; [Cell Poison] use poison cleanse or damage reduction.||{rt1}Must interrupt: Venom Spray.{rt1}||Keep poison pools away from the group; healer watch targeted poison damage.]],
        },
        ["加瓦兹特"] = {
            type = "BOSS",
            name = "Galvazzt",
            tipsByDifficulty = {
                ["lfr"] = [[[Lightning Spire] spawns 3 each time; non-tank DPS stand between the boss and the spire to block the beam and stop it charging; [Shock]—the tank kites the boss along the edge. || {rt1}Must interrupt/burst: at full energy [Charged Burst] is nearly a wipe—all 3 beams every wave must be blocked.{rt1} || [Shock Field] lands—whole raid out of the circle; rotate beam-blocking (you take [Shock] vulnerability, don't block consecutively).]],
                ["normal"] = [[[Lightning Spire] spawns 3 each time; non-tank DPS stand between the boss and the spire to block the beam and stop it charging; [Shock]—the tank kites the boss along the edge. || {rt1}Must interrupt/burst: at full energy [Charged Burst] is nearly a wipe—all 3 beams every wave must be blocked.{rt1} || [Shock Field] lands—whole raid out of the circle; rotate beam-blocking (you take [Shock] vulnerability, don't block consecutively).]],
                ["heroic"] = [[[Lightning Spire] spawns 3 each time; non-tank DPS stand between the boss and the spire to block the beam and stop it charging; [Shock]—the tank kites the boss along the edge. || {rt1}Must interrupt/burst: at full energy [Charged Burst] is nearly a wipe—all 3 beams every wave must be blocked.{rt1} || [Shock Field] lands—whole raid out of the circle; rotate beam-blocking (you take [Shock] vulnerability, don't block consecutively).]],
                ["mythic"] = [[[Lightning Spire] spawns 3 each time; non-tank DPS stand between the boss and the spire to block the beam and stop it charging; [Shock]—the tank kites the boss along the edge. || {rt1}Must interrupt/burst: at full energy [Charged Burst] is nearly a wipe—all 3 beams every wave must be blocked.{rt1} || [Shock Field] lands—whole raid out of the circle; rotate beam-blocking (you take [Shock] vulnerability, don't block consecutively).]],
                ["mythicplus"] = [[[Lightning Spire] spawns 3 each time; non-tank DPS stand between the boss and the spire to block the beam and stop it charging; [Shock]—the tank kites the boss along the edge. || {rt1}Must interrupt/burst: at full energy [Charged Burst] is nearly a wipe—all 3 beams every wave must be blocked.{rt1} || [Shock Field] lands—whole raid out of the circle; rotate beam-blocking (you take [Shock] vulnerability, don't block consecutively).]],
            },
        },
        ["堕落的守护者"] = {
            type = "MOB",
            name = "Fallen Guardian",
            tips = [[{rt8}Fallen Guardian{rt8}||Immune to CC; [Earthstomp] is a 30-yard AoE + knockback—spread or hug the wall; [Shatter] the main tank soaks with damage reduction and takes increased damage.||{rt1}Must kill fast: uninterruptible; [Shatter] tank must pop DR.{rt1}||Focus fire; avoid hard-soaking when stacked with other big hits.]],
        },
        ["塞塔里斯的化身"] = {
            type = "BOSS",
            name = "Avatar of Sethralis",
            tipsByDifficulty = {
                ["lfr"] = [[Two phases: first kill [Defiler] to lift the healing lock, then heal the Avatar's health to full to win; [Corrupted Life] orbs are soaked by DPS walking into them (drains healing/physical damage). || {rt1}Must interrupt/burst: [Twisted Hexxer] must interrupt [Flame Shock]; step on [Corruption Burst] orbs before they expire.{rt1} || [Fallen Guardian] [Corrupting Strike]—tank pops DR; [Faithless Tormenter] focus and keep away from healer; Tormenter <25% gets executed by the Avatar for a heal—keep it above 25% before finishing.]],
                ["normal"] = [[Two phases: first kill [Defiler] to lift the healing lock, then heal the Avatar's health to full to win; [Corrupted Life] orbs are soaked by DPS walking into them (drains healing/physical damage). || {rt1}Must interrupt/burst: [Twisted Hexxer] must interrupt [Flame Shock]; step on [Corruption Burst] orbs before they expire.{rt1} || [Fallen Guardian] [Corrupting Strike]—tank pops DR; [Faithless Tormenter] focus and keep away from healer; Tormenter <25% gets executed by the Avatar for a heal—keep it above 25% before finishing.]],
                ["heroic"] = [[Two phases: first kill [Defiler] to lift the healing lock, then heal the Avatar's health to full to win; [Corrupted Life] orbs are soaked by DPS walking into them (drains healing/physical damage). || {rt1}Must interrupt/burst: [Twisted Hexxer] must interrupt [Flame Shock]; step on [Corruption Burst] orbs before they expire.{rt1} || [Fallen Guardian] [Corrupting Strike]—tank pops DR; [Faithless Tormenter] focus and keep away from healer; Tormenter <25% gets executed by the Avatar for a heal—keep it above 25% before finishing.]],
                ["mythic"] = [[Two phases: first kill [Defiler] to lift the healing lock, then heal the Avatar's health to full to win; [Corrupted Life] orbs are soaked by DPS walking into them (drains healing/physical damage). || {rt1}Must interrupt/burst: [Twisted Hexxer] must interrupt [Flame Shock]; step on [Corruption Burst] orbs before they expire.{rt1} || [Fallen Guardian] [Corrupting Strike]—tank pops DR; [Faithless Tormenter] focus and keep away from healer; Tormenter <25% gets executed by the Avatar for a heal—keep it above 25% before finishing.]],
                ["mythicplus"] = [[Two phases: first kill [Defiler] to lift the healing lock, then heal the Avatar's health to full to win; [Corrupted Life] orbs are soaked by DPS walking into them (drains healing/physical damage). || {rt1}Must interrupt/burst: [Twisted Hexxer] must interrupt [Flame Shock]; step on [Corruption Burst] orbs before they expire.{rt1} || [Fallen Guardian] [Corrupting Strike]—tank pops DR; [Faithless Tormenter] focus and keep away from healer; Tormenter <25% gets executed by the Avatar for a heal—keep it above 25% before finishing.]],
            },
        },
        ["扭曲的妖术师"] = {
            type = "MOB",
            name = "Twisted Hexxer",
            tips = [[{rt8}Twisted Hexxer{rt8}||[Lurking Hex] marks a player, drops a circle then turns them into a frog—move out of the group and avoid [Hex Mud]; [Flame Shock] is interruptible.||{rt1}Must interrupt: Flame Shock.{rt1}||Immune to CC; dispel [Lurking Hex] before it expires to prevent the frog.]],
        },
        ["无信征服者"] = {
            type = "MOB",
            name = "Faithless Conqueror",
            tips = [[{rt8}Faithless Conqueror{rt8}||[Mind Disruption] randomly curses a player with confusion—interrupt or dispel to clear.||{rt1}Must interrupt: Mind Disruption.{rt1}||Watch healer pressure when stacked with [Shadow Lash].]],
        },
        ["无信折磨者"] = {
            type = "MOB",
            name = "Faithless Torturer",
            tips = [[{rt8}Faithless Torturer{rt8}||Focus fire; it locks onto a healer and stacks [Shadow Lash] to reduce healing—kill it fast and away from the healer.||{rt1}Must kill fast: burn the healer-locking torturer before the healing debuff stacks.{rt1}||Below 25% the avatar executes it for a heal—keep it above 25% before finishing.]],
        },
        ["流沙猎手"] = {
            type = "MOB",
            name = "Quicksand Hunter",
            tips = [[{rt8}Quicksand Hunter{rt8}||[Arrow Barrage] channels on a random target—use CC/interrupt to stop the damage; dodge [Sandblast Arrow] landing circles.||{rt1}Must interrupt/kill fast: stop [Arrow Barrage]'s channel with CC or interrupt.{rt1}||CC it before pulling to avoid barrage stacking with other damage.]],
        },
        ["米利克萨"] = {
            type = "BOSS",
            name = "Merektha",
            tipsByDifficulty = {
                ["lfr"] = [[[Lightning Bite]—tank pops DR; [Serpent's Coil] marks 2, group up and AoE-clear fast; [Thunder Breath] marked player drops circle outside; kill hatched [Venomous Viper]/[Storm Serpent] quickly. || {rt1}Must interrupt/burst: if someone is coiled, interrupt/stun to free them immediately; [Venom Spray] must be interrupted.{rt1} || [Viper Storm] knockback—dodge ground circles after; at full energy [Burrow] clears snakes and revives—tank drags [Storm Serpent] to the side into the [Storm Catalyst] pool.]],
                ["normal"] = [[[Lightning Bite]—tank pops DR; [Serpent's Coil] marks 2, group up and AoE-clear fast; [Thunder Breath] marked player drops circle outside; kill hatched [Venomous Viper]/[Storm Serpent] quickly. || {rt1}Must interrupt/burst: if someone is coiled, interrupt/stun to free them immediately; [Venom Spray] must be interrupted.{rt1} || [Viper Storm] knockback—dodge ground circles after; at full energy [Burrow] clears snakes and revives—tank drags [Storm Serpent] to the side into the [Storm Catalyst] pool.]],
                ["heroic"] = [[[Lightning Bite]—tank pops DR; [Serpent's Coil] marks 2, group up and AoE-clear fast; [Thunder Breath] marked player drops circle outside; kill hatched [Venomous Viper]/[Storm Serpent] quickly. || {rt1}Must interrupt/burst: if someone is coiled, interrupt/stun to free them immediately; [Venom Spray] must be interrupted.{rt1} || [Viper Storm] knockback—dodge ground circles after; at full energy [Burrow] clears snakes and revives—tank drags [Storm Serpent] to the side into the [Storm Catalyst] pool.]],
                ["mythic"] = [[[Lightning Bite]—tank pops DR; [Serpent's Coil] marks 2, group up and AoE-clear fast; [Thunder Breath] marked player drops circle outside; kill hatched [Venomous Viper]/[Storm Serpent] quickly. || {rt1}Must interrupt/burst: if someone is coiled, interrupt/stun to free them immediately; [Venom Spray] must be interrupted.{rt1} || [Viper Storm] knockback—dodge ground circles after; at full energy [Burrow] clears snakes and revives—tank drags [Storm Serpent] to the side into the [Storm Catalyst] pool.]],
                ["mythicplus"] = [[[Lightning Bite]—tank pops DR; [Serpent's Coil] marks 2, group up and AoE-clear fast; [Thunder Breath] marked player drops circle outside; kill hatched [Venomous Viper]/[Storm Serpent] quickly. || {rt1}Must interrupt/burst: if someone is coiled, interrupt/stun to free them immediately; [Venom Spray] must be interrupted.{rt1} || [Viper Storm] knockback—dodge ground circles after; at full energy [Burrow] clears snakes and revives—tank drags [Storm Serpent] to the side into the [Storm Catalyst] pool.]],
            },
        },
        ["精华污染者"] = {
            type = "MOB",
            name = "Essence Purifier",
            tips = [[{rt8}Essence Purifier{rt8}||[Essence Interference] channels on the Devouring Eye—interrupt to preserve the eye-energy and open the door.||{rt1}Must interrupt: Essence Interference.{rt1}||Prioritize CC-kill; protect the player channeling the eye.]],
        },
        ["阿德里斯和阿斯匹克斯"] = {
            type = "BOSS",
            name = "Adderis and Aspix",
            tipsByDifficulty = {
                ["lfr"] = [[[Storm Ward] rotates: only focus the unwarded one; after [Gale Force] knocks the whole raid back, quickly return to mid and share [Thunder and Lightning]; [Storm Breath] marks 2 to drop silence circles outside. || {rt1}Must interrupt/burst: after killing one, the other [Frenzy] speeds its cycle—need DR + burst.{rt1} || [Overload]—main tank pops DR; hug the wall so [Gale Force] doesn't fling you; don't stand in the silence pool.]],
                ["normal"] = [[[Storm Ward] rotates: only focus the unwarded one; after [Gale Force] knocks the whole raid back, quickly return to mid and share [Thunder and Lightning]; [Storm Breath] marks 2 to drop silence circles outside. || {rt1}Must interrupt/burst: after killing one, the other [Frenzy] speeds its cycle—need DR + burst.{rt1} || [Overload]—main tank pops DR; hug the wall so [Gale Force] doesn't fling you; don't stand in the silence pool.]],
                ["heroic"] = [[[Storm Ward] rotates: only focus the unwarded one; after [Gale Force] knocks the whole raid back, quickly return to mid and share [Thunder and Lightning]; [Storm Breath] marks 2 to drop silence circles outside. || {rt1}Must interrupt/burst: after killing one, the other [Frenzy] speeds its cycle—need DR + burst.{rt1} || [Overload]—main tank pops DR; hug the wall so [Gale Force] doesn't fling you; don't stand in the silence pool.]],
                ["mythic"] = [[[Storm Ward] rotates: only focus the unwarded one; after [Gale Force] knocks the whole raid back, quickly return to mid and share [Thunder and Lightning]; [Storm Breath] marks 2 to drop silence circles outside. || {rt1}Must interrupt/burst: after killing one, the other [Frenzy] speeds its cycle—need DR + burst.{rt1} || [Overload]—main tank pops DR; hug the wall so [Gale Force] doesn't fling you; don't stand in the silence pool.]],
                ["mythicplus"] = [[[Storm Ward] rotates: only focus the unwarded one; after [Gale Force] knocks the whole raid back, quickly return to mid and share [Thunder and Lightning]; [Storm Breath] marks 2 to drop silence circles outside. || {rt1}Must interrupt/burst: after killing one, the other [Frenzy] speeds its cycle—need DR + burst.{rt1} || [Overload]—main tank pops DR; hug the wall so [Gale Force] doesn't fling you; don't stand in the silence pool.]],
            },
        },
        ["风暴飞蛇"] = {
            type = "MOB",
            name = "Storm Viper",
            tips = [[{rt8}Storm Viper{rt8}||[Storm Catalyst] leaves a thunder pool—everyone get out; tank pops damage reduction during [Serpent's Storm Call] buff.||{rt1}Must interrupt: Storm Catalyst (leaves pool damage).{rt1}||Pull the snake to the edge or onto existing poison to reduce field clutter.]],
        },
    },
    ["夺目谷"] = {
        name = "The Blinding Vale",
        ["光明众花"] = {
            type = "BOSS",
            name = "Radiant Brood (Medik/Lexi/Kezkit)",
            tipsByDifficulty = {
                ["lfr"] = [[Three bodies share health; [Bedrock Slam] → spawns 3 [Fertile Soil] circles → [Light-sowing Dash] passes through to plant → [Radiant Flower Beam] matures them. || {rt1}Someone must stand in the beam/circle to block light, or the flowers stack [Light Devour] (+15% damage per stack).{rt1} [Radiant Arrow] must be interrupted. || [Thorn Blade] marks you then [Thorn Fan] hits 15yd around for 3/sec—marked player first run out of the group. || Tank + 2 rush into the circle to block light first; [Radiant Arrow] must be interrupted; when marked by [Thorn Blade], spread then pop DR.]],
                ["normal"] = [[Three bodies share health; [Bedrock Slam] → spawns 3 [Fertile Soil] circles → [Light-sowing Dash] passes through to plant → [Radiant Flower Beam] matures them. || {rt1}Someone must stand in the beam/circle to block light, or the flowers stack [Light Devour] (+15% damage per stack).{rt1} [Radiant Arrow] must be interrupted. || [Thorn Blade] marks you then [Thorn Fan] hits 15yd around for 3/sec—marked player first run out of the group. || Tank + 2 rush into the circle to block light first; [Radiant Arrow] must be interrupted; when marked by [Thorn Blade], spread then pop DR.]],
                ["heroic"] = [[Three bodies share health; [Bedrock Slam] → spawns 3 [Fertile Soil] circles → [Light-sowing Dash] passes through to plant → [Radiant Flower Beam] matures them. || {rt1}Someone must stand in the beam/circle to block light, or the flowers stack [Light Devour] (+15% damage per stack).{rt1} [Radiant Arrow] must be interrupted. || [Thorn Blade] marks you then [Thorn Fan] hits 15yd around for 3/sec—marked player first run out of the group. || Tank + 2 rush into the circle to block light first; [Radiant Arrow] must be interrupted; when marked by [Thorn Blade], spread then pop DR.]],
                ["mythic"] = [[Three bodies share health; [Bedrock Slam] → spawns 3 [Fertile Soil] circles → [Light-sowing Dash] passes through to plant → [Radiant Flower Beam] matures them. || {rt1}Someone must stand in the beam/circle to block light, or the flowers stack [Light Devour] (+15% damage per stack).{rt1} [Radiant Arrow] must be interrupted. || [Thorn Blade] marks you then [Thorn Fan] hits 15yd around for 3/sec—marked player first run out of the group. || Tank + 2 rush into the circle to block light first; [Radiant Arrow] must be interrupted; when marked by [Thorn Blade], spread then pop DR.]],
                ["mythicplus"] = [[Three bodies share health; [Bedrock Slam] → spawns 3 [Fertile Soil] circles → [Light-sowing Dash] passes through to plant → [Radiant Flower Beam] matures them. || {rt1}Someone must stand in the beam/circle to block light, or the flowers stack [Light Devour] (+15% damage per stack).{rt1} [Radiant Arrow] must be interrupted. || [Thorn Blade] marks you then [Thorn Fan] hits 15yd around for 3/sec—marked player first run out of the group. || Tank + 2 rush into the circle to block light first; [Radiant Arrow] must be interrupted; when marked by [Thorn Blade], spread then pop DR.]],
            },
        },
        ["光耀播法者"] = {
            type = "MOB",
            name = "Radiant Caster",
            tips = [[{rt8}Radiant Caster{rt8}||{rt1}[Light Arrow Volley]—interrupt every time; at low blood it [Awakens the Grove] summoning nearby dormant lashers.{rt1}||Top interrupt priority raid-wide; at low blood CC+focus so it can't awaken the grove.]],
        },
        ["兹欧凯特"] = {
            type = "BOSS",
            name = "Z'okket",
            tipsByDifficulty = {
                ["lfr"] = [[[Seeping Wood] raid-wide damage pulse throughout; [Awakened Bloom] summons [Lightborn Lashing]. || The lasher at 1% goes dormant and burrows—needs [Condensed Light] front beam to sweep the liquified [Radiant Resin] for permanent removal. || [Bloom Essence] orbs drift toward the boss: boss absorbs = [Fluorescent Burst] + shield (stacks); player catches = +damage/+heal. || {rt1}Orbs MUST all be caught, never let the boss eat them; press the lasher to dormant then finish with the beam.{rt1} || Catch all orbs and share evenly; after lasher dormant, beam finisher; drag the boss to the platform edge, don't smear resin in the center.]],
                ["normal"] = [[[Seeping Wood] raid-wide damage pulse throughout; [Awakened Bloom] summons [Lightborn Lashing]. || The lasher at 1% goes dormant and burrows—needs [Condensed Light] front beam to sweep the liquified [Radiant Resin] for permanent removal. || [Bloom Essence] orbs drift toward the boss: boss absorbs = [Fluorescent Burst] + shield (stacks); player catches = +damage/+heal. || {rt1}Orbs MUST all be caught, never let the boss eat them; press the lasher to dormant then finish with the beam.{rt1} || Catch all orbs and share evenly; after lasher dormant, beam finisher; drag the boss to the platform edge, don't smear resin in the center.]],
                ["heroic"] = [[[Seeping Wood] raid-wide damage pulse throughout; [Awakened Bloom] summons [Lightborn Lashing]. || The lasher at 1% goes dormant and burrows—needs [Condensed Light] front beam to sweep the liquified [Radiant Resin] for permanent removal. || [Bloom Essence] orbs drift toward the boss: boss absorbs = [Fluorescent Burst] + shield (stacks); player catches = +damage/+heal. || {rt1}Orbs MUST all be caught, never let the boss eat them; press the lasher to dormant then finish with the beam.{rt1} || Catch all orbs and share evenly; after lasher dormant, beam finisher; drag the boss to the platform edge, don't smear resin in the center.]],
                ["mythic"] = [[[Seeping Wood] raid-wide damage pulse throughout; [Awakened Bloom] summons [Lightborn Lashing]. || The lasher at 1% goes dormant and burrows—needs [Condensed Light] front beam to sweep the liquified [Radiant Resin] for permanent removal. || [Bloom Essence] orbs drift toward the boss: boss absorbs = [Fluorescent Burst] + shield (stacks); player catches = +damage/+heal. || {rt1}Orbs MUST all be caught, never let the boss eat them; press the lasher to dormant then finish with the beam.{rt1} || Catch all orbs and share evenly; after lasher dormant, beam finisher; drag the boss to the platform edge, don't smear resin in the center.]],
                ["mythicplus"] = [[[Seeping Wood] raid-wide damage pulse throughout; [Awakened Bloom] summons [Lightborn Lashing]. || The lasher at 1% goes dormant and burrows—needs [Condensed Light] front beam to sweep the liquified [Radiant Resin] for permanent removal. || [Bloom Essence] orbs drift toward the boss: boss absorbs = [Fluorescent Burst] + shield (stacks); player catches = +damage/+heal. || {rt1}Orbs MUST all be caught, never let the boss eat them; press the lasher to dormant then finish with the beam.{rt1} || Catch all orbs and share evenly; after lasher dormant, beam finisher; drag the boss to the platform edge, don't smear resin in the center.]],
            },
        },
        ["噬光鞭笞者"] = {
            type = "MOB",
            name = "Light-Devouring Lasher",
            tips = [[{rt8}Light-Devouring Lasher{rt8}||After gaining [Bloom Pollen] it gets a shield and is empowered.||Immediately switch to break the shield, then return to the main target.]],
        },
        ["圣光猎手伊库兹"] = {
            type = "BOSS",
            name = "Light Hunter Ikuz",
            tipsByDifficulty = {
                ["lfr"] = [[At full energy → [Bloodthirsty Gaze] locks 1 player and chases 10s; the chase crushes [Bloodthorn Roots] within 7yd. || [Verdant Stomp] knocks the whole raid back, roots sprout under everyone 4s later. || At 50% triggers [Lightfrenzy] (move speed +20%, holy pulse every 2s). || {rt1}Stepping on [Bloodthorn Roots] = rooted—kill them or use freedom effect; if caught = [Lacerate] + chewed stun 5s.{rt1} || The gazed player hugs the roots and runs, using the boss as a lawnmower; after stomp, cleave the roots underfoot; after 50% burst it down fast.]],
                ["normal"] = [[At full energy → [Bloodthirsty Gaze] locks 1 player and chases 10s; the chase crushes [Bloodthorn Roots] within 7yd. || [Verdant Stomp] knocks the whole raid back, roots sprout under everyone 4s later. || At 50% triggers [Lightfrenzy] (move speed +20%, holy pulse every 2s). || {rt1}Stepping on [Bloodthorn Roots] = rooted—kill them or use freedom effect; if caught = [Lacerate] + chewed stun 5s.{rt1} || The gazed player hugs the roots and runs, using the boss as a lawnmower; after stomp, cleave the roots underfoot; after 50% burst it down fast.]],
                ["heroic"] = [[At full energy → [Bloodthirsty Gaze] locks 1 player and chases 10s; the chase crushes [Bloodthorn Roots] within 7yd. || [Verdant Stomp] knocks the whole raid back, roots sprout under everyone 4s later. || At 50% triggers [Lightfrenzy] (move speed +20%, holy pulse every 2s). || {rt1}Stepping on [Bloodthorn Roots] = rooted—kill them or use freedom effect; if caught = [Lacerate] + chewed stun 5s.{rt1} || The gazed player hugs the roots and runs, using the boss as a lawnmower; after stomp, cleave the roots underfoot; after 50% burst it down fast.]],
                ["mythic"] = [[At full energy → [Bloodthirsty Gaze] locks 1 player and chases 10s; the chase crushes [Bloodthorn Roots] within 7yd. || [Verdant Stomp] knocks the whole raid back, roots sprout under everyone 4s later. || At 50% triggers [Lightfrenzy] (move speed +20%, holy pulse every 2s). || {rt1}Stepping on [Bloodthorn Roots] = rooted—kill them or use freedom effect; if caught = [Lacerate] + chewed stun 5s.{rt1} || The gazed player hugs the roots and runs, using the boss as a lawnmower; after stomp, cleave the roots underfoot; after 50% burst it down fast.]],
                ["mythicplus"] = [[At full energy → [Bloodthirsty Gaze] locks 1 player and chases 10s; the chase crushes [Bloodthorn Roots] within 7yd. || [Verdant Stomp] knocks the whole raid back, roots sprout under everyone 4s later. || At 50% triggers [Lightfrenzy] (move speed +20%, holy pulse every 2s). || {rt1}Stepping on [Bloodthorn Roots] = rooted—kill them or use freedom effect; if caught = [Lacerate] + chewed stun 5s.{rt1} || The gazed player hugs the roots and runs, using the boss as a lawnmower; after stomp, cleave the roots underfoot; after 50% burst it down fast.]],
            },
        },
        ["护光者鲁伊亚"] = {
            type = "BOSS",
            name = "Lightkeeper Ru'iya",
            tipsByDifficulty = {
                ["lfr"] = [[Three phases: Owlkin (100-70) → Bear (70-40) → Hala'nir (below 40). || Owlkin: [Guard's Wrath] interruptible + [Holy Fire] marks 3 for 6s burn, on expiry spawns [Holy Fire Beam] (6s silence). || Bear: [Rending Claw] + [Shatter Strike] cone stacking vulnerability + [Savage Maul] bleed (removed only at full health). || {rt1}[Guard's Wrath] must be interrupted; the [Holy Fire Beam] damages non-casters in the area the instant it forms—the 3 marked spread out early.{rt1} || 3 players with Holy Fire stack together and retreat same direction on expiry; Bear form spread to eat the cone; bleed must be healed to full; below 40% is a hard healing check.]],
                ["normal"] = [[Three phases: Owlkin (100-70) → Bear (70-40) → Hala'nir (below 40). || Owlkin: [Guard's Wrath] interruptible + [Holy Fire] marks 3 for 6s burn, on expiry spawns [Holy Fire Beam] (6s silence). || Bear: [Rending Claw] + [Shatter Strike] cone stacking vulnerability + [Savage Maul] bleed (removed only at full health). || {rt1}[Guard's Wrath] must be interrupted; the [Holy Fire Beam] damages non-casters in the area the instant it forms—the 3 marked spread out early.{rt1} || 3 players with Holy Fire stack together and retreat same direction on expiry; Bear form spread to eat the cone; bleed must be healed to full; below 40% is a hard healing check.]],
                ["heroic"] = [[Three phases: Owlkin (100-70) → Bear (70-40) → Hala'nir (below 40). || Owlkin: [Guard's Wrath] interruptible + [Holy Fire] marks 3 for 6s burn, on expiry spawns [Holy Fire Beam] (6s silence). || Bear: [Rending Claw] + [Shatter Strike] cone stacking vulnerability + [Savage Maul] bleed (removed only at full health). || {rt1}[Guard's Wrath] must be interrupted; the [Holy Fire Beam] damages non-casters in the area the instant it forms—the 3 marked spread out early.{rt1} || 3 players with Holy Fire stack together and retreat same direction on expiry; Bear form spread to eat the cone; bleed must be healed to full; below 40% is a hard healing check.]],
                ["mythic"] = [[Three phases: Owlkin (100-70) → Bear (70-40) → Hala'nir (below 40). || Owlkin: [Guard's Wrath] interruptible + [Holy Fire] marks 3 for 6s burn, on expiry spawns [Holy Fire Beam] (6s silence). || Bear: [Rending Claw] + [Shatter Strike] cone stacking vulnerability + [Savage Maul] bleed (removed only at full health). || {rt1}[Guard's Wrath] must be interrupted; the [Holy Fire Beam] damages non-casters in the area the instant it forms—the 3 marked spread out early.{rt1} || 3 players with Holy Fire stack together and retreat same direction on expiry; Bear form spread to eat the cone; bleed must be healed to full; below 40% is a hard healing check.]],
                ["mythicplus"] = [[Three phases: Owlkin (100-70) → Bear (70-40) → Hala'nir (below 40). || Owlkin: [Guard's Wrath] interruptible + [Holy Fire] marks 3 for 6s burn, on expiry spawns [Holy Fire Beam] (6s silence). || Bear: [Rending Claw] + [Shatter Strike] cone stacking vulnerability + [Savage Maul] bleed (removed only at full health). || {rt1}[Guard's Wrath] must be interrupted; the [Holy Fire Beam] damages non-casters in the area the instant it forms—the 3 marked spread out early.{rt1} || 3 players with Holy Fire stack together and retreat same direction on expiry; Bear form spread to eat the cone; bleed must be healed to full; below 40% is a hard healing check.]],
            },
        },
        ["灌木潜行者"] = {
            type = "MOB",
            name = "Bramble Stalker",
            tips = [[{rt8}Bramble Stalker{rt8}||[Thornblade] marks a random target with heavy bleed (8s).||Focus heal / clear bleed / personal damage reduction.]],
        },
        ["疯长多头蛇"] = {
            type = "MOB",
            name = "Rampant Hydra",
            tips = [[{rt8}Rampant Hydra{rt8}||Immune to CC.||[Lightjaw Beam] channels 3 random targets (line hurts allies); [Seed Volley] line marks.||Three spread outward so the beam doesn't cross allies; use vanish/shadowmeld to drop combat and avoid it; dodge lines.]],
        },
        ["翠绿林地守卫"] = {
            type = "MOB",
            name = "Verdant Grove Guardian",
            tips = [[{rt8}Verdant Grove Guardian{rt8}||Immune to CC.||[Earthrend] marks the tank leaving a puddle; [Uproot] AoE heavy hit + knockback.||Tank drops the puddle outside the group; don't stand near cliffs/roots before the knockback.]],
        },
        ["薯蛙母"] = {
            type = "MOB",
            name = "Taro Frogmother",
            tips = [[{rt8}Taro Frogmother{rt8}||Immune to CC.||[Tongue Toss] flings the tank (terrain-kill risk); [Venom Spit] raid poison DoT; [Lay Eggs] hatches [Newtlings] (knockback).||Tank stay away from platform edge when tossed; healer dispel poison; AoE the eggs instantly so they don't hatch.]],
        },
        ["迷乱尖啸者"] = {
            type = "MOB",
            name = "Maddening Shrieker",
            tips = [[{rt8}Maddening Shrieker{rt8}||{rt1}[Maddening Screech]—interrupt every time (group confuse).{rt1}||Assign a fixed interrupt, offset from Light Arrow Volley.]],
        },
    },
    ["密谋小径"] = {
        name = "Murder Row",
        ["亵渎魔像"] = {
            type = "MOB",
            name = "Defiled Golem",
            tips = [[{rt8}Defiled Golem{rt8}||Immune to CC.||{rt1}[Profane Smash] is a heavy channel—healer pre-cast.{rt1}||[Fel Beam] fires a line at each player leaving a puddle—dodge.||Found before the last boss; tank eats the smash with DR, raid dodges fel beams.]],
        },
        ["凯斯媞亚·魔力之心"] = {
            type = "BOSS",
            name = "Kestia Heartofmana",
            tipsByDifficulty = {
                ["lfr"] = [[Open by focusing the pet mana whelp [Chomp], push it below 20%—it then crowd-controls the boss and gives her 100% vulnerability; burn the boss hard. || {rt1}Must interrupt: the mirror's [Felstorm] and [Chaos Bolt] (top priority).{rt1} || [Fel Nova] step on it; the whelp's [Fel Spew] frontal cone—tank face it away from the group. || Tank: when the whelp is hostile, swap then return; watch the whelp's extra damage + bounce on entry. || Push the pet to trigger the vulnerability window, interrupt the mirror, face the whelp's cone away, step on Fel Nova.]],
                ["normal"] = [[Open by focusing the pet mana whelp [Chomp], push it below 20%—it then crowd-controls the boss and gives her 100% vulnerability; burn the boss hard. || {rt1}Must interrupt: the mirror's [Felstorm] and [Chaos Bolt] (top priority).{rt1} || [Fel Nova] step on it; the whelp's [Fel Spew] frontal cone—tank face it away from the group. || Tank: when the whelp is hostile, swap then return; watch the whelp's extra damage + bounce on entry. || Push the pet to trigger the vulnerability window, interrupt the mirror, face the whelp's cone away, step on Fel Nova.]],
                ["heroic"] = [[Open by focusing the pet mana whelp [Chomp], push it below 20%—it then crowd-controls the boss and gives her 100% vulnerability; burn the boss hard. || {rt1}Must interrupt: the mirror's [Felstorm] and [Chaos Bolt] (top priority).{rt1} || [Fel Nova] step on it; the whelp's [Fel Spew] frontal cone—tank face it away from the group. || Tank: when the whelp is hostile, swap then return; watch the whelp's extra damage + bounce on entry. || Push the pet to trigger the vulnerability window, interrupt the mirror, face the whelp's cone away, step on Fel Nova.]],
                ["mythic"] = [[Open by focusing the pet mana whelp [Chomp], push it below 20%—it then crowd-controls the boss and gives her 100% vulnerability; burn the boss hard. || {rt1}Must interrupt: the mirror's [Felstorm] and [Chaos Bolt] (top priority).{rt1} || [Fel Nova] step on it; the whelp's [Fel Spew] frontal cone—tank face it away from the group. || Tank: when the whelp is hostile, swap then return; watch the whelp's extra damage + bounce on entry. || Push the pet to trigger the vulnerability window, interrupt the mirror, face the whelp's cone away, step on Fel Nova.]],
                ["mythicplus"] = [[Open by focusing the pet mana whelp [Chomp], push it below 20%—it then crowd-controls the boss and gives her 100% vulnerability; burn the boss hard. || {rt1}Must interrupt: the mirror's [Felstorm] and [Chaos Bolt] (top priority).{rt1} || [Fel Nova] step on it; the whelp's [Fel Spew] frontal cone—tank face it away from the group. || Tank: when the whelp is hostile, swap then return; watch the whelp's extra damage + bounce on entry. || Push the pet to trigger the vulnerability window, interrupt the mirror, face the whelp's cone away, step on Fel Nova.]],
            },
        },
        ["利希尔·烬怒"] = {
            type = "BOSS",
            name = "Lish'ru Emberrage",
            tipsByDifficulty = {
                ["lfr"] = [[An unkillable [Infernal] at the start fixates the tank (has an aura—tank pulls it away from the boss). || {rt1}Must interrupt: [Chaos Bolt] (random target, top priority); [Fel Eruption] uses idle interrupts/CC.{rt1} || [Demon Portal] teleport away → after [Cataclysm Wave] finishes, take the safe side door; [Burning Felflame] sustained pulse. || Chaos Bolt must be interrupted, Infernal pulled off the boss, portal safe-side to pass Cataclysm Wave, clear all adds before the wave to avoid +100% haste.]],
                ["normal"] = [[An unkillable [Infernal] at the start fixates the tank (has an aura—tank pulls it away from the boss). || {rt1}Must interrupt: [Chaos Bolt] (random target, top priority); [Fel Eruption] uses idle interrupts/CC.{rt1} || [Demon Portal] teleport away → after [Cataclysm Wave] finishes, take the safe side door; [Burning Felflame] sustained pulse. || Chaos Bolt must be interrupted, Infernal pulled off the boss, portal safe-side to pass Cataclysm Wave, clear all adds before the wave to avoid +100% haste.]],
                ["heroic"] = [[An unkillable [Infernal] at the start fixates the tank (has an aura—tank pulls it away from the boss). || {rt1}Must interrupt: [Chaos Bolt] (random target, top priority); [Fel Eruption] uses idle interrupts/CC.{rt1} || [Demon Portal] teleport away → after [Cataclysm Wave] finishes, take the safe side door; [Burning Felflame] sustained pulse. || Chaos Bolt must be interrupted, Infernal pulled off the boss, portal safe-side to pass Cataclysm Wave, clear all adds before the wave to avoid +100% haste.]],
                ["mythic"] = [[An unkillable [Infernal] at the start fixates the tank (has an aura—tank pulls it away from the boss). || {rt1}Must interrupt: [Chaos Bolt] (random target, top priority); [Fel Eruption] uses idle interrupts/CC.{rt1} || [Demon Portal] teleport away → after [Cataclysm Wave] finishes, take the safe side door; [Burning Felflame] sustained pulse. || Chaos Bolt must be interrupted, Infernal pulled off the boss, portal safe-side to pass Cataclysm Wave, clear all adds before the wave to avoid +100% haste.]],
                ["mythicplus"] = [[An unkillable [Infernal] at the start fixates the tank (has an aura—tank pulls it away from the boss). || {rt1}Must interrupt: [Chaos Bolt] (random target, top priority); [Fel Eruption] uses idle interrupts/CC.{rt1} || [Demon Portal] teleport away → after [Cataclysm Wave] finishes, take the safe side door; [Burning Felflame] sustained pulse. || Chaos Bolt must be interrupted, Infernal pulled off the boss, portal safe-side to pass Cataclysm Wave, clear all adds before the wave to avoid +100% haste.]],
            },
        },
        ["希凡惩罚者"] = {
            type = "MOB",
            name = "Shivan Punisher",
            tips = [[{rt8}Shivan Punisher{rt8}||Immune to CC.||[Punishing Power] adds physical damage—tank beware; at 50% it triggers [Demoniac Frenzy] high pulse raid damage.||Dodge [Whirlwind] AoE; at 50% DPS burns it down before frenzy; tank pops DR.]],
        },
        ["歼灭者萨祖克斯"] = {
            type = "BOSS",
            name = "Annihilator Sazzox",
            tipsByDifficulty = {
                ["lfr"] = [[Circle the round arena along the edge; [Fel Strike] front—tank face outward. || {rt1}Must interrupt/burst: [Battle Axe Throw] marks, then [Legion Battleaxe] spawns at the edge—immediately swap or AoE ramps up.{rt1} || [Fel Frenzy] phase: raid-wide slams + continuous [Burning Footsteps] fel puddles. || Tank kites slowly outward along the edge, using less than half the arena each time, save CDs to eat the vulnerability.]],
                ["normal"] = [[Circle the round arena along the edge; [Fel Strike] front—tank face outward. || {rt1}Must interrupt/burst: [Battle Axe Throw] marks, then [Legion Battleaxe] spawns at the edge—immediately swap or AoE ramps up.{rt1} || [Fel Frenzy] phase: raid-wide slams + continuous [Burning Footsteps] fel puddles. || Tank kites slowly outward along the edge, using less than half the arena each time, save CDs to eat the vulnerability.]],
                ["heroic"] = [[Circle the round arena along the edge; [Fel Strike] front—tank face outward. || {rt1}Must interrupt/burst: [Battle Axe Throw] marks, then [Legion Battleaxe] spawns at the edge—immediately swap or AoE ramps up.{rt1} || [Fel Frenzy] phase: raid-wide slams + continuous [Burning Footsteps] fel puddles. || Tank kites slowly outward along the edge, using less than half the arena each time, save CDs to eat the vulnerability.]],
                ["mythic"] = [[Circle the round arena along the edge; [Fel Strike] front—tank face outward. || {rt1}Must interrupt/burst: [Battle Axe Throw] marks, then [Legion Battleaxe] spawns at the edge—immediately swap or AoE ramps up.{rt1} || [Fel Frenzy] phase: raid-wide slams + continuous [Burning Footsteps] fel puddles. || Tank kites slowly outward along the edge, using less than half the arena each time, save CDs to eat the vulnerability.]],
                ["mythicplus"] = [[Circle the round arena along the edge; [Fel Strike] front—tank face outward. || {rt1}Must interrupt/burst: [Battle Axe Throw] marks, then [Legion Battleaxe] spawns at the edge—immediately swap or AoE ramps up.{rt1} || [Fel Frenzy] phase: raid-wide slams + continuous [Burning Footsteps] fel puddles. || Tank kites slowly outward along the edge, using less than half the arena each time, save CDs to eat the vulnerability.]],
            },
        },
        ["腐化术士"] = {
            type = "MOB",
            name = "Corrupting Warlock",
            tips = [[{rt8}Corrupting Warlock{rt8}||Immune to CC.||{rt1}[Curse of Doom] random debuff (dispel or stack to share; a dead player summons a Doomguard).{rt1}||[Drain Life] marks a target—defend or drop combat.||Prioritize CC/interrupt on the doom bolt; dispel or share the curse promptly; before 50% it gains a Dark Pact shield—burn through it.]],
        },
        ["赞恩·刃悲"] = {
            type = "BOSS",
            name = "Zane Bladesorrow",
            tipsByDifficulty = {
                ["lfr"] = [[Use [Forbidden Crate] as cover, [Same-day Delivery] throws barrels, [Fel-infused Crate] must be clipped by AoE to clear raid damage. || {rt1}Must interrupt: [Heartbreak Salve] (tank poison—detox/dispel); [Fire Bomb] marked needs crate-clipping to clear raid damage.{rt1} || [Serial Killing] each finds their own barrel to hide from bleed; [Kill-crazed Carnage] raid-wide AoE channel. || Use barrels as cover from Serial Killing, dispel Heartbreak Salve, clip crates to clear Fire Bomb raid damage.]],
                ["normal"] = [[Use [Forbidden Crate] as cover, [Same-day Delivery] throws barrels, [Fel-infused Crate] must be clipped by AoE to clear raid damage. || {rt1}Must interrupt: [Heartbreak Salve] (tank poison—detox/dispel); [Fire Bomb] marked needs crate-clipping to clear raid damage.{rt1} || [Serial Killing] each finds their own barrel to hide from bleed; [Kill-crazed Carnage] raid-wide AoE channel. || Use barrels as cover from Serial Killing, dispel Heartbreak Salve, clip crates to clear Fire Bomb raid damage.]],
                ["heroic"] = [[Use [Forbidden Crate] as cover, [Same-day Delivery] throws barrels, [Fel-infused Crate] must be clipped by AoE to clear raid damage. || {rt1}Must interrupt: [Heartbreak Salve] (tank poison—detox/dispel); [Fire Bomb] marked needs crate-clipping to clear raid damage.{rt1} || [Serial Killing] each finds their own barrel to hide from bleed; [Kill-crazed Carnage] raid-wide AoE channel. || Use barrels as cover from Serial Killing, dispel Heartbreak Salve, clip crates to clear Fire Bomb raid damage.]],
                ["mythic"] = [[Use [Forbidden Crate] as cover, [Same-day Delivery] throws barrels, [Fel-infused Crate] must be clipped by AoE to clear raid damage. || {rt1}Must interrupt: [Heartbreak Salve] (tank poison—detox/dispel); [Fire Bomb] marked needs crate-clipping to clear raid damage.{rt1} || [Serial Killing] each finds their own barrel to hide from bleed; [Kill-crazed Carnage] raid-wide AoE channel. || Use barrels as cover from Serial Killing, dispel Heartbreak Salve, clip crates to clear Fire Bomb raid damage.]],
                ["mythicplus"] = [[Use [Forbidden Crate] as cover, [Same-day Delivery] throws barrels, [Fel-infused Crate] must be clipped by AoE to clear raid damage. || {rt1}Must interrupt: [Heartbreak Salve] (tank poison—detox/dispel); [Fire Bomb] marked needs crate-clipping to clear raid damage.{rt1} || [Serial Killing] each finds their own barrel to hide from bleed; [Kill-crazed Carnage] raid-wide AoE channel. || Use barrels as cover from Serial Killing, dispel Heartbreak Salve, clip crates to clear Fire Bomb raid damage.]],
            },
        },
        ["酒馆打卡(五星级好评)"] = {
            type = "MOB",
            name = "Tavern Check-in (Five-Star Review)",
            tips = [[{rt8}Tavern Check-in (Five-Star Review){rt8}||Forced event after boss 1: the 5-man disguises and climbs the spire; the whole group talks to Selenar to trigger it.||Each gets a random role (waiter/performer/cleaner/bodyguard); complete your role to fill the satisfaction meter to 5 stars.||The group gains [Five-Star Review] buff (+10% damage/healing ~4 min).||During it, [Harsh Review] casts spawn—any CC/interrupt makes them vanish; the route takes ~4 min.]],
        },
    },
    ["毒牙祭坛"] = {
        name = "Altar of Fangs",
        ["乌拉泰克的选民"] = {
            type = "MOB",
            name = "Chosen of Ulataq",
            tips = [[{rt8}Chosen of Ulataq{rt8}||When [Venom Surge] draws lines, dodge them and the healer covers the pulse damage; stay spread.||{rt1}Must interrupt/kill fast: [Mass Envenom]—interrupt every cast.{rt1}||Same-pack [Living Venom] explodes on death—stagger kills to give the healer breathing room.]],
        },
        ["仪式首领"] = {
            type = "MOB",
            name = "Ritual Leader",
            tips = [[{rt8}Ritual Leader{rt8}||Immune to CC; before engaging, destroy the Corrupted Mist totem to stop the [Unstable Totem] pulse; [Dissect] hits the tank—use a damage-reduction.||{rt1}Must interrupt/kill fast: [Blood Sacrifice] deals raid-wide damage and applies a heal absorb—pre-cast heals.{rt1}||Healer: watch the absorb shield; spell dispel is available.]],
        },
        ["原始毒蛇"] = {
            type = "MOB",
            name = "Primitive Serpent",
            tips = [[{rt8}Primitive Serpent{rt8}||Spread to avoid [Foul Spit] splash; keep range.||{rt1}Must interrupt/kill fast: [Piercing Shriek]—interrupt every cast.{rt1}||Watch the poison damage; melee stay out of the spit circle.]],
        },
        ["双牙掠夺者"] = {
            type = "MOB",
            name = "Twin-Fang Pillager",
            tips = [[{rt8}Twin-Fang Pillager{rt8}||Immune to CC; tank turns its front [Venom Breath] away from the group and soaks [Double Strike]'s heavy hit; [Deadly Shot] hits two players—magic dispel or freedom.||{rt1}Must interrupt/kill fast: no hard interrupt available.{rt1}||Stay spread to avoid breath hitting multiple; melee stand behind.]],
        },
        ["扭缠盘蛇"] = {
            type = "BOSS",
            name = "Coiling Serpent",
            tipsByDifficulty = {
                ["lfr"] = [[On [Death Rattle] everyone moves to snap the [Vine Binding] and trigger [Uncoil], then focus the [Uncoiled Serpent] mirror; dodge [Burrow Charge] lines on [Vengeful Onslaught], keep [Venom Spray] frontal away from the group. || {rt1}Must interrupt/burst: [Withering Toxify] three consecutive casts—must interrupt.{rt1} || Tank soaks [Tail Blade]; healer sustains [Synchronized Venom] uptime and [Death Rattle] stacks.]],
                ["normal"] = [[On [Death Rattle] everyone moves to snap the [Vine Binding] and trigger [Uncoil], then focus the [Uncoiled Serpent] mirror; dodge [Burrow Charge] lines on [Vengeful Onslaught], keep [Venom Spray] frontal away from the group. || {rt1}Must interrupt/burst: [Withering Toxify] three consecutive casts—must interrupt.{rt1} || Tank soaks [Tail Blade]; healer sustains [Synchronized Venom] uptime and [Death Rattle] stacks.]],
                ["heroic"] = [[On [Death Rattle] everyone moves to snap the [Vine Binding] and trigger [Uncoil], then focus the [Uncoiled Serpent] mirror; dodge [Burrow Charge] lines on [Vengeful Onslaught], keep [Venom Spray] frontal away from the group. || {rt1}Must interrupt/burst: [Withering Toxify] three consecutive casts—must interrupt.{rt1} || Tank soaks [Tail Blade]; healer sustains [Synchronized Venom] uptime and [Death Rattle] stacks.]],
                ["mythic"] = [[On [Death Rattle] everyone moves to snap the [Vine Binding] and trigger [Uncoil], then focus the [Uncoiled Serpent] mirror; dodge [Burrow Charge] lines on [Vengeful Onslaught], keep [Venom Spray] frontal away from the group. || {rt1}Must interrupt/burst: [Withering Toxify] three consecutive casts—must interrupt.{rt1} || Tank soaks [Tail Blade]; healer sustains [Synchronized Venom] uptime and [Death Rattle] stacks.]],
                ["mythicplus"] = [[On [Death Rattle] everyone moves to snap the [Vine Binding] and trigger [Uncoil], then focus the [Uncoiled Serpent] mirror; dodge [Burrow Charge] lines on [Vengeful Onslaught], keep [Venom Spray] frontal away from the group. || {rt1}Must interrupt/burst: [Withering Toxify] three consecutive casts—must interrupt.{rt1} || Tank soaks [Tail Blade]; healer sustains [Synchronized Venom] uptime and [Death Rattle] stacks.]],
            },
        },
        ["拉维"] = {
            type = "BOSS",
            name = "Ravi",
            tipsByDifficulty = {
                ["lfr"] = [[Pull the boss away from the carrion pile; during [Scavenge] everyone stand in [Filthy Feaster] circles to break the shield fast; [Triple Shot] spread, dodge [Regurgitate] acid lines. || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank eats [Water Blast] in melee; healer watches [Carrion Burst] stacking; [Regurgitate] hit clears disease; don't let the boss eat fresh meat to trigger [Gluttony].]],
                ["normal"] = [[Pull the boss away from the carrion pile; during [Scavenge] everyone stand in [Filthy Feaster] circles to break the shield fast; [Triple Shot] spread, dodge [Regurgitate] acid lines. || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank eats [Water Blast] in melee; healer watches [Carrion Burst] stacking; [Regurgitate] hit clears disease; don't let the boss eat fresh meat to trigger [Gluttony].]],
                ["heroic"] = [[Pull the boss away from the carrion pile; during [Scavenge] everyone stand in [Filthy Feaster] circles to break the shield fast; [Triple Shot] spread, dodge [Regurgitate] acid lines. || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank eats [Water Blast] in melee; healer watches [Carrion Burst] stacking; [Regurgitate] hit clears disease; don't let the boss eat fresh meat to trigger [Gluttony].]],
                ["mythic"] = [[Pull the boss away from the carrion pile; during [Scavenge] everyone stand in [Filthy Feaster] circles to break the shield fast; [Triple Shot] spread, dodge [Regurgitate] acid lines. || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank eats [Water Blast] in melee; healer watches [Carrion Burst] stacking; [Regurgitate] hit clears disease; don't let the boss eat fresh meat to trigger [Gluttony].]],
                ["mythicplus"] = [[Pull the boss away from the carrion pile; during [Scavenge] everyone stand in [Filthy Feaster] circles to break the shield fast; [Triple Shot] spread, dodge [Regurgitate] acid lines. || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank eats [Water Blast] in melee; healer watches [Carrion Burst] stacking; [Regurgitate] hit clears disease; don't let the boss eat fresh meat to trigger [Gluttony].]],
            },
        },
        ["晋升之蛇"] = {
            type = "MOB",
            name = "Ascendant Serpent (priority)",
            tips = [[{rt8}Ascended Serpent{rt8}||Immune to CC; [Infected]—spread, then group up for AoE after [Hatched Serpents] spawn; avoid the [Venom Vortex] wind ring and keep [Venom Spray]'s front cone away from the group.||{rt1}Must interrupt/kill fast: [Altar Edge]—random targeted, always dodge.{rt1}||Tank faces [Venom Spray]'s knockback outward; healer covers poison damage.]],
        },
        ["祖尔加"] = {
            type = "BOSS",
            name = "Zul'gath",
            tipsByDifficulty = {
                ["lfr"] = [[During [Fang Ritual] 4 players intercept the beams aimed at the boss to reduce damage; [Blood Sacrifice] clears [Ritual Venom] stacks via physical hits (stand in [Bone-cleaver] axe path to clear). || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank's [Sunder] with DR drops a blood pool; dodge [Bone-cleaver] axe path and [Axe-grinder]'s three returning axes; healer sustains [Fang Empower] stacks.]],
                ["normal"] = [[During [Fang Ritual] 4 players intercept the beams aimed at the boss to reduce damage; [Blood Sacrifice] clears [Ritual Venom] stacks via physical hits (stand in [Bone-cleaver] axe path to clear). || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank's [Sunder] with DR drops a blood pool; dodge [Bone-cleaver] axe path and [Axe-grinder]'s three returning axes; healer sustains [Fang Empower] stacks.]],
                ["heroic"] = [[During [Fang Ritual] 4 players intercept the beams aimed at the boss to reduce damage; [Blood Sacrifice] clears [Ritual Venom] stacks via physical hits (stand in [Bone-cleaver] axe path to clear). || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank's [Sunder] with DR drops a blood pool; dodge [Bone-cleaver] axe path and [Axe-grinder]'s three returning axes; healer sustains [Fang Empower] stacks.]],
                ["mythic"] = [[During [Fang Ritual] 4 players intercept the beams aimed at the boss to reduce damage; [Blood Sacrifice] clears [Ritual Venom] stacks via physical hits (stand in [Bone-cleaver] axe path to clear). || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank's [Sunder] with DR drops a blood pool; dodge [Bone-cleaver] axe path and [Axe-grinder]'s three returning axes; healer sustains [Fang Empower] stacks.]],
                ["mythicplus"] = [[During [Fang Ritual] 4 players intercept the beams aimed at the boss to reduce damage; [Blood Sacrifice] clears [Ritual Venom] stacks via physical hits (stand in [Bone-cleaver] axe path to clear). || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank's [Sunder] with DR drops a blood pool; dodge [Bone-cleaver] axe path and [Axe-grinder]'s three returning axes; healer sustains [Fang Empower] stacks.]],
            },
        },
        ["高阶进化者"] = {
            type = "MOB",
            name = "High Evolver (priority)",
            tips = [[{rt8}High Evolutionary{rt8}||Dispel poison damage with poison dispel; if focus pressure is low, prioritize control.||{rt1}Must interrupt/kill fast: [Evolve]—interrupt the cast with CC, else [Envenom] becomes [Mass Envenom].{rt1}||[Envenom] is random—prioritize interrupts; healer be ready to dispel.]],
        },
    },
    ["红玉新生法池"] = {
        name = "Ruby Life Pools",
        ["基拉卡与厄克哈特·风脉"] = {
            type = "BOSS",
            name = "Kilrak and Erkhart Windvein",
            tipsByDifficulty = {
                ["lfr"] = [[Open by focusing the dragon [Ky'laka] and burning her down fast; position upwind to avoid being blown into fire. || {rt1}Must handle: [Infernal Core] raid damage—pop a big mitigation; [Storm Slam] vulnerability—healer dispel; [Roaring Breath] dodge the line.{rt1} || Wind push is weaker but don't step in fire pools; tank rotate DR.]],
                ["normal"] = [[Open by focusing the dragon [Ky'laka] and burning her down fast; position upwind to avoid being blown into fire. || {rt1}Must handle: [Infernal Core] raid damage—pop a big mitigation; [Storm Slam] vulnerability—healer dispel; [Roaring Breath] dodge the line.{rt1} || Wind push is weaker but don't step in fire pools; tank rotate DR.]],
                ["heroic"] = [[Open by focusing the dragon [Ky'laka] and burning her down fast; position upwind to avoid being blown into fire. || {rt1}Must handle: [Infernal Core] raid damage—pop a big mitigation; [Storm Slam] vulnerability—healer dispel; [Roaring Breath] dodge the line.{rt1} || Wind push is weaker but don't step in fire pools; tank rotate DR.]],
                ["mythic"] = [[Open by focusing the dragon [Ky'laka] and burning her down fast; position upwind to avoid being blown into fire. || {rt1}Must handle: [Infernal Core] raid damage—pop a big mitigation; [Storm Slam] vulnerability—healer dispel; [Roaring Breath] dodge the line.{rt1} || Wind push is weaker but don't step in fire pools; tank rotate DR.]],
                ["mythicplus"] = [[Open by focusing the dragon [Ky'laka] and burning her down fast; position upwind to avoid being blown into fire. || {rt1}Must handle: [Infernal Core] raid damage—pop a big mitigation; [Storm Slam] vulnerability—healer dispel; [Roaring Breath] dodge the line.{rt1} || Wind push is weaker but don't step in fire pools; tank rotate DR.]],
            },
        },
        ["大引导者莱瓦迪"] = {
            type = "MOB",
            name = "Grand Conductor Rivazdi",
            tips = [[{rt8}Grand Conductor Rivazdi{rt8}||Door elite—must be killed to open the door; prioritize focus and interrupts.||{rt1}Must interrupt: high-threat casts (frost-channel type) don't miss.{rt1}||Raid-wide DR coverage; tank holds steady.]],
        },
        ["柯姬雅·焰蹄"] = {
            type = "BOSS",
            name = "Kokia Blazehoof",
            tipsByDifficulty = {
                ["lfr"] = [[At full energy casts [Rite Binding] summoning a fire elemental; circle the arena clockwise to control fire pools; when marked by [Lava Boulder] lead it away from the group. || {rt1}Must interrupt: the elemental's [Roaring Flame] or the whole raid wipes; must interrupt [Searing Impact].{rt1} || Tank pops DR on every [Searing Strike]; asteroids roll to open ground / stay 20yd from [Burning Out] before death.]],
                ["normal"] = [[At full energy casts [Rite Binding] summoning a fire elemental; circle the arena clockwise to control fire pools; when marked by [Lava Boulder] lead it away from the group. || {rt1}Must interrupt: the elemental's [Roaring Flame] or the whole raid wipes; must interrupt [Searing Impact].{rt1} || Tank pops DR on every [Searing Strike]; asteroids roll to open ground / stay 20yd from [Burning Out] before death.]],
                ["heroic"] = [[At full energy casts [Rite Binding] summoning a fire elemental; circle the arena clockwise to control fire pools; when marked by [Lava Boulder] lead it away from the group. || {rt1}Must interrupt: the elemental's [Roaring Flame] or the whole raid wipes; must interrupt [Searing Impact].{rt1} || Tank pops DR on every [Searing Strike]; asteroids roll to open ground / stay 20yd from [Burning Out] before death.]],
                ["mythic"] = [[At full energy casts [Rite Binding] summoning a fire elemental; circle the arena clockwise to control fire pools; when marked by [Lava Boulder] lead it away from the group. || {rt1}Must interrupt: the elemental's [Roaring Flame] or the whole raid wipes; must interrupt [Searing Impact].{rt1} || Tank pops DR on every [Searing Strike]; asteroids roll to open ground / stay 20yd from [Burning Out] before death.]],
                ["mythicplus"] = [[At full energy casts [Rite Binding] summoning a fire elemental; circle the arena clockwise to control fire pools; when marked by [Lava Boulder] lead it away from the group. || {rt1}Must interrupt: the elemental's [Roaring Flame] or the whole raid wipes; must interrupt [Searing Impact].{rt1} || Tank pops DR on every [Searing Strike]; asteroids roll to open ground / stay 20yd from [Burning Out] before death.]],
            },
        },
        ["梅莉杜莎·寒妆"] = {
            type = "BOSS",
            name = "Melidrussa Chillworn",
            tipsByDifficulty = {
                ["lfr"] = [[Stack to share [Frost Bolt] and rotate around the arena; when marked by [Biting Frostwind] move away from the group to open ground. || {rt1}Must interrupt: [Frost Shard] (now interruptible) to reduce tank damage; at 66%/33% break [Frost Bulwark] and burst the charged wyrmling to prevent [Frostbite Overload].{rt1} || Healer prioritize dispel [Primal Cold] stacks.]],
                ["normal"] = [[Stack to share [Frost Bolt] and rotate around the arena; when marked by [Biting Frostwind] move away from the group to open ground. || {rt1}Must interrupt: [Frost Shard] (now interruptible) to reduce tank damage; at 66%/33% break [Frost Bulwark] and burst the charged wyrmling to prevent [Frostbite Overload].{rt1} || Healer prioritize dispel [Primal Cold] stacks.]],
                ["heroic"] = [[Stack to share [Frost Bolt] and rotate around the arena; when marked by [Biting Frostwind] move away from the group to open ground. || {rt1}Must interrupt: [Frost Shard] (now interruptible) to reduce tank damage; at 66%/33% break [Frost Bulwark] and burst the charged wyrmling to prevent [Frostbite Overload].{rt1} || Healer prioritize dispel [Primal Cold] stacks.]],
                ["mythic"] = [[Stack to share [Frost Bolt] and rotate around the arena; when marked by [Biting Frostwind] move away from the group to open ground. || {rt1}Must interrupt: [Frost Shard] (now interruptible) to reduce tank damage; at 66%/33% break [Frost Bulwark] and burst the charged wyrmling to prevent [Frostbite Overload].{rt1} || Healer prioritize dispel [Primal Cold] stacks.]],
                ["mythicplus"] = [[Stack to share [Frost Bolt] and rotate around the arena; when marked by [Biting Frostwind] move away from the group to open ground. || {rt1}Must interrupt: [Frost Shard] (now interruptible) to reduce tank damage; at 66%/33% break [Frost Bulwark] and burst the charged wyrmling to prevent [Frostbite Overload].{rt1} || Healer prioritize dispel [Primal Cold] stacks.]],
            },
        },
        ["毁灭唤风者"] = {
            type = "MOB",
            name = "Destructive Windcaller",
            tips = [[{rt8}Destructive Windcaller{rt8}||[Lightning Storm] raid-wide AoE—pop DR; interrupt or spell-reflect fast casts.||{rt1}Must interrupt: lightning/thunder casts.{rt1}||Hold aggro on summoned adds.]],
        },
        ["深石塑地者"] = {
            type = "MOB",
            name = "Deep Earthshaper",
            tips = [[{rt8}Deep Earthshaper{rt8}||Uninterruptible-channel [Earthsplitter] is a raid-wide AoE—stun or control it.||{rt1}Must interrupt/control: [Earthsplitter] hits 40 yards or wipes the raid.{rt1}||[Terraform] passively stacks a debuff; tank watch dragon eggs behind to avoid adds.]],
        },
        ["灰烬先知烈焰鞭笞者"] = {
            type = "MOB",
            name = "Ashen Prophet",
            tips = [[{rt8}Ashen Prophet{rt8}||[Flame Volley] channels and locks the tank—use control to interrupt the damage.||{rt1}Must control/dispel: on death it triggers [Flame Glory] leaving a fire circle—dispel or move away.{rt1}||]],
        },
        ["炎缚毁灭者"] = {
            type = "MOB",
            name = "Flamebound Destroyer",
            tips = [[{rt8}Flamebound Destroyer{rt8}||Immune to CC; leave the [Burnout] 20-yard explosion circle before it dies.||{rt1}Must interrupt: [Searing Strike]; walk away before [Living Bomb]'s knockback.{rt1}||[Infernal] raid-wide damage—tank pops DR.]],
        },
        ["烈焰之咽"] = {
            type = "MOB",
            name = "Flame Gullet",
            tips = [[{rt8}Flame Gullet{rt8}||Dodge [Flame Breath]'s front; tank pops DR for the [Flame Maw] DoT.||{rt1}Kill fast: below half health [Lava Blood] stacks make raid damage explode.{rt1}||Save cooldowns/bloodlust for after half health.]],
        },
        ["缚地守护者"] = {
            type = "MOB",
            name = "Grounding Guardian",
            tips = [[{rt8}Grounding Guardian{rt8}||[Grounding Brand] marks a random target—focus heal and cover with damage reduction.||{rt1}Must interrupt: don't miss its buff/control casts.{rt1}||Kill fast to reduce stacks.]],
        },
        ["闪霜织寒者"] = {
            type = "MOB",
            name = "Flashfrost Weavess",
            tips = [[{rt8}Flashfrost Weaver{rt8}||Ranged interrupt [Frostbolt] to protect the tank; prioritize CC-kill.||{rt1}Must interrupt/dispel: [Ice Barrier]—else the target is CC-immune and shielded.{rt1}||With the barrier up, focus fire under damage-reduction coverage.]],
        },
        ["雷霆之颅"] = {
            type = "MOB",
            name = "Thunderous Skull",
            tips = [[{rt8}Thunderous Skull{rt8}||Dodge [Storm Breath]'s front; tank pops DR against [Thunderous Bite]'s knockback.||{rt1}Must dispel correctly: [Rolling Thunder]—dispel only one stack; dispelling two at once wipes.{rt1}||]],
        },
    },
    ["纳洛拉克的洞穴"] = {
        name = "Den of Nalorakk",
        ["决意化身"] = {
            type = "MOB",
            name = "Resolute Avatar",
            tips = [[{rt8}Resolute Avatar{rt8}||Immune to CC.||[Frozen Tomb] roots the whole group—break it or use freedom; [Shatter] is a high-damage AoE.||Stay spread to avoid chained freezes; step out of Shatter circles immediately; use freedom/icebreak to clear the root.]],
        },
        ["囤宝狂人"] = {
            type = "BOSS",
            name = "Hoarder Grimsar",
            tipsByDifficulty = {
                ["lfr"] = [[Tank stays center; [Resource Measures] empower skills at 90/70/40%. || {rt1}The mushroom pile [Rotting Mushroom] must be stomped within 12s or [Foul Eruption].{rt1} || Flesh pile → [Mighty Bellow] knockback + DoT raid heal; bone pile → [Bone Spike Smash] dodge circle; [Toxic Spores] dispel.]],
                ["normal"] = [[Tank stays center; [Resource Measures] empower skills at 90/70/40%. || {rt1}The mushroom pile [Rotting Mushroom] must be stomped within 12s or [Foul Eruption].{rt1} || Flesh pile → [Mighty Bellow] knockback + DoT raid heal; bone pile → [Bone Spike Smash] dodge circle; [Toxic Spores] dispel.]],
                ["heroic"] = [[Tank stays center; [Resource Measures] empower skills at 90/70/40%. || {rt1}The mushroom pile [Rotting Mushroom] must be stomped within 12s or [Foul Eruption].{rt1} || Flesh pile → [Mighty Bellow] knockback + DoT raid heal; bone pile → [Bone Spike Smash] dodge circle; [Toxic Spores] dispel.]],
                ["mythic"] = [[Tank stays center; [Resource Measures] empower skills at 90/70/40%. || {rt1}The mushroom pile [Rotting Mushroom] must be stomped within 12s or [Foul Eruption].{rt1} || Flesh pile → [Mighty Bellow] knockback + DoT raid heal; bone pile → [Bone Spike Smash] dodge circle; [Toxic Spores] dispel.]],
                ["mythicplus"] = [[Tank stays center; [Resource Measures] empower skills at 90/70/40%. || {rt1}The mushroom pile [Rotting Mushroom] must be stomped within 12s or [Foul Eruption].{rt1} || Flesh pile → [Mighty Bellow] knockback + DoT raid heal; bone pile → [Bone Spike Smash] dodge circle; [Toxic Spores] dispel.]],
            },
        },
        ["寒冬哨兵"] = {
            type = "BOSS",
            name = "Winter Sentinel",
            tipsByDifficulty = {
                ["lfr"] = [[The floor is frozen and movement slides; [Ice Storm] is a fixed 8s channel — a 10-yard safe zone around the boss, absorb shield removed. || Spawns add [Shattering Coldcore] (only 1 shard); [Frost Torment] DoT needs fast dispel. || {rt1}Keep the spawned add's [Winter's Shroud] interrupted; [Raging Blizzard] group up and lure to one point then circle around.{rt1} || On the ice, group to draw the tornado, interrupt Winter's Shroud, hug the boss's safe zone during the 8s channel, someone soaks the shard.]],
                ["normal"] = [[The floor is frozen and movement slides; [Ice Storm] is a fixed 8s channel — a 10-yard safe zone around the boss, absorb shield removed. || Spawns add [Shattering Coldcore] (only 1 shard); [Frost Torment] DoT needs fast dispel. || {rt1}Keep the spawned add's [Winter's Shroud] interrupted; [Raging Blizzard] group up and lure to one point then circle around.{rt1} || On the ice, group to draw the tornado, interrupt Winter's Shroud, hug the boss's safe zone during the 8s channel, someone soaks the shard.]],
                ["heroic"] = [[The floor is frozen and movement slides; [Ice Storm] is a fixed 8s channel — a 10-yard safe zone around the boss, absorb shield removed. || Spawns add [Shattering Coldcore] (only 1 shard); [Frost Torment] DoT needs fast dispel. || {rt1}Keep the spawned add's [Winter's Shroud] interrupted; [Raging Blizzard] group up and lure to one point then circle around.{rt1} || On the ice, group to draw the tornado, interrupt Winter's Shroud, hug the boss's safe zone during the 8s channel, someone soaks the shard.]],
                ["mythic"] = [[The floor is frozen and movement slides; [Ice Storm] is a fixed 8s channel — a 10-yard safe zone around the boss, absorb shield removed. || Spawns add [Shattering Coldcore] (only 1 shard); [Frost Torment] DoT needs fast dispel. || {rt1}Keep the spawned add's [Winter's Shroud] interrupted; [Raging Blizzard] group up and lure to one point then circle around.{rt1} || On the ice, group to draw the tornado, interrupt Winter's Shroud, hug the boss's safe zone during the 8s channel, someone soaks the shard.]],
                ["mythicplus"] = [[The floor is frozen and movement slides; [Ice Storm] is a fixed 8s channel — a 10-yard safe zone around the boss, absorb shield removed. || Spawns add [Shattering Coldcore] (only 1 shard); [Frost Torment] DoT needs fast dispel. || {rt1}Keep the spawned add's [Winter's Shroud] interrupted; [Raging Blizzard] group up and lure to one point then circle around.{rt1} || On the ice, group to draw the tornado, interrupt Winter's Shroud, hug the boss's safe zone during the 8s channel, someone soaks the shard.]],
            },
        },
        ["寒冬暴雪"] = {
            type = "MOB",
            name = "Winter Blizzard",
            tips = [[{rt8}Winter Blizzard{rt8}||Immune to CC.||[Biting Blizzard] pulses until killed; [Winter Hall] pushes players.||Prioritize killing it to stop the zone blizzard; use snow-free cover to dodge the wind; snow mounds no longer cause slipping.]],
        },
        ["洛阿祭司娜妮娅"] = {
            type = "MOB",
            name = "Loa Priestess Naniyah",
            tips = [[{rt8}Loa Priestess Naniyah{rt8}||Immune to CC.||{rt1}[Lightning Bolt] random target—rotate interrupts; [Earthquake] two players drop circles; [Unstable Totem] persistent AoE.{rt1}||Keep the lightning-bolt interrupt chain; move out of Earthquake; kill the totem fast.]],
        },
        ["纳洛拉克"] = {
            type = "BOSS",
            name = "Nalorakk",
            tipsByDifficulty = {
                ["lfr"] = [[Echoing Smash marks 3 players and after a delay spawns echoes (getting close gets you hit by ghost slashes). || [Overwhelming Assault] → Zul'garah jumps behind the tank and raises a shield; the whole raid stands behind it to take the 3-hit slam. || [Warlord's Wrath] → the whole raid forms a human wall around Zul'garah to block the echoes. || {rt1}Rotate-interrupt [Lightning Bolt], quickly kill [Unstable Totem]; interrupt [Chain Lightning].{rt1} || Drop echoes at the outer ring, whole raid behind the shield, human wall blocks the charge, tank faces away and doesn't step on the echo.]],
                ["normal"] = [[Echoing Smash marks 3 players and after a delay spawns echoes (getting close gets you hit by ghost slashes). || [Overwhelming Assault] → Zul'garah jumps behind the tank and raises a shield; the whole raid stands behind it to take the 3-hit slam. || [Warlord's Wrath] → the whole raid forms a human wall around Zul'garah to block the echoes. || {rt1}Rotate-interrupt [Lightning Bolt], quickly kill [Unstable Totem]; interrupt [Chain Lightning].{rt1} || Drop echoes at the outer ring, whole raid behind the shield, human wall blocks the charge, tank faces away and doesn't step on the echo.]],
                ["heroic"] = [[Echoing Smash marks 3 players and after a delay spawns echoes (getting close gets you hit by ghost slashes). || [Overwhelming Assault] → Zul'garah jumps behind the tank and raises a shield; the whole raid stands behind it to take the 3-hit slam. || [Warlord's Wrath] → the whole raid forms a human wall around Zul'garah to block the echoes. || {rt1}Rotate-interrupt [Lightning Bolt], quickly kill [Unstable Totem]; interrupt [Chain Lightning].{rt1} || Drop echoes at the outer ring, whole raid behind the shield, human wall blocks the charge, tank faces away and doesn't step on the echo.]],
                ["mythic"] = [[Echoing Smash marks 3 players and after a delay spawns echoes (getting close gets you hit by ghost slashes). || [Overwhelming Assault] → Zul'garah jumps behind the tank and raises a shield; the whole raid stands behind it to take the 3-hit slam. || [Warlord's Wrath] → the whole raid forms a human wall around Zul'garah to block the echoes. || {rt1}Rotate-interrupt [Lightning Bolt], quickly kill [Unstable Totem]; interrupt [Chain Lightning].{rt1} || Drop echoes at the outer ring, whole raid behind the shield, human wall blocks the charge, tank faces away and doesn't step on the echo.]],
                ["mythicplus"] = [[Echoing Smash marks 3 players and after a delay spawns echoes (getting close gets you hit by ghost slashes). || [Overwhelming Assault] → Zul'garah jumps behind the tank and raises a shield; the whole raid stands behind it to take the 3-hit slam. || [Warlord's Wrath] → the whole raid forms a human wall around Zul'garah to block the echoes. || {rt1}Rotate-interrupt [Lightning Bolt], quickly kill [Unstable Totem]; interrupt [Chain Lightning].{rt1} || Drop echoes at the outer ring, whole raid behind the shield, human wall blocks the charge, tank faces away and doesn't step on the echo.]],
            },
        },
        ["老练的战争使者"] = {
            type = "MOB",
            name = "Veteran Warbringer",
            tips = [[{rt8}Veteran Warbringer{rt8}||Immune to CC.||[Primordial Echo] raid-wide AoE; [Poison Spear Volley] ground circles (3s projectile).||Healer pop DR; dodge poison-spear circles; no hard CC.]],
        },
        ["饥荒雕像"] = {
            type = "MOB",
            name = "Famine Statue",
            tips = [[{rt8}Famine Statue{rt8}||Summoned by [Hungry Spirit], immune to CC.||Focus it on spawn or it repeatedly casts [Endless Hunger] (~5-6s cast applying a debuff).||Dispel the curse debuff; healer prepare for [Feast of Suffering] channel damage.]],
        },
    },
    ["虚空之痕竞技场"] = {
        name = "Voidscar Arena",
        ["吞噬暴虐者"] = {
            type = "MOB",
            name = "Devouring Tyrant",
            tips = [[{rt8}Devouring Tyrant{rt8}||[Devour] channels (longer cast time makes interrupting/saving easier); the devour mechanic instantly kills the swallowed target.||Must interrupt Devour or rescue the swallowed; grab the buff along the route.]],
        },
        ["塔兹拉尔"] = {
            type = "BOSS",
            name = "Tazral",
            tipsByDifficulty = {
                ["lfr"] = [[S2 rework: [Dark Rift] mine — dodge with movement; [Void Tear] marked circle; [Void Shade] clone casts [Shadow Charge] (line instant-kill). || [Dark Rift] pulls players (dragged in on entry); [Cosmic Spike] tank-swap spike. || {rt1}[Shadow Charge] line instant-kill must be dodged; prioritize interrupting [Void Tear] channel.{rt1} || Clone's charge line is instant-kill — dodge; rift mines reposition; rift pulls break formation; tank-swap on spikes.]],
                ["normal"] = [[S2 rework: [Dark Rift] mine — dodge with movement; [Void Tear] marked circle; [Void Shade] clone casts [Shadow Charge] (line instant-kill). || [Dark Rift] pulls players (dragged in on entry); [Cosmic Spike] tank-swap spike. || {rt1}[Shadow Charge] line instant-kill must be dodged; prioritize interrupting [Void Tear] channel.{rt1} || Clone's charge line is instant-kill — dodge; rift mines reposition; rift pulls break formation; tank-swap on spikes.]],
                ["heroic"] = [[S2 rework: [Dark Rift] mine — dodge with movement; [Void Tear] marked circle; [Void Shade] clone casts [Shadow Charge] (line instant-kill). || [Dark Rift] pulls players (dragged in on entry); [Cosmic Spike] tank-swap spike. || {rt1}[Shadow Charge] line instant-kill must be dodged; prioritize interrupting [Void Tear] channel.{rt1} || Clone's charge line is instant-kill — dodge; rift mines reposition; rift pulls break formation; tank-swap on spikes.]],
                ["mythic"] = [[S2 rework: [Dark Rift] mine — dodge with movement; [Void Tear] marked circle; [Void Shade] clone casts [Shadow Charge] (line instant-kill). || [Dark Rift] pulls players (dragged in on entry); [Cosmic Spike] tank-swap spike. || {rt1}[Shadow Charge] line instant-kill must be dodged; prioritize interrupting [Void Tear] channel.{rt1} || Clone's charge line is instant-kill — dodge; rift mines reposition; rift pulls break formation; tank-swap on spikes.]],
                ["mythicplus"] = [[S2 rework: [Dark Rift] mine — dodge with movement; [Void Tear] marked circle; [Void Shade] clone casts [Shadow Charge] (line instant-kill). || [Dark Rift] pulls players (dragged in on entry); [Cosmic Spike] tank-swap spike. || {rt1}[Shadow Charge] line instant-kill must be dodged; prioritize interrupting [Void Tear] channel.{rt1} || Clone's charge line is instant-kill — dodge; rift mines reposition; rift pulls break formation; tank-swap on spikes.]],
            },
        },
        ["法术风暴拉杰克斯"] = {
            type = "MOB",
            name = "Spellstorm Rajek (priority)",
            tips = [[{rt8}Spellstorm Rajaxx{rt8}||[Disruption Orb] marks a player with a silence orb for 15s—lead it away from the group.||Multi-hit AoE spellstorm; on death grants the matching buff; the orb carrier stays 15s away from the group.]],
        },
        ["焦躁的虚镰"] = {
            type = "MOB",
            name = "Restless Void Scythe",
            tips = [[{rt8}Restless Void Scythe{rt8}||[Corrosive Essence] now hits only 2 players (was 5), a 12s corruption DoT—must dispel or avoid overlap.||Those corrupted spread for 12s, healer pre-casts; grab the matching arena buff along the route.]],
        },
        ["煞戎努斯"] = {
            type = "BOSS",
            name = "Shar'ronnus",
            tipsByDifficulty = {
                ["lfr"] = [[[Unstable Singularity] gravity collapse sucks players in (don't get pulled to center = instant death); [Gravity Orb] + [Coalesced Mass]. || [Cosmic Smash] single-target mark; [Void Torrent] multi-hit; new [Dark Wave] dodge by repositioning. || {rt1}Interrupt [Cosmic Smash] marked cast and prioritize [Void Torrent] channel.{rt1} || Gravity collapse — don't get sucked to center, dodge Gravity Orb lines, reposition for the new Dark Wave, tank takes Coalesced Mass.]],
                ["normal"] = [[[Unstable Singularity] gravity collapse sucks players in (don't get pulled to center = instant death); [Gravity Orb] + [Coalesced Mass]. || [Cosmic Smash] single-target mark; [Void Torrent] multi-hit; new [Dark Wave] dodge by repositioning. || {rt1}Interrupt [Cosmic Smash] marked cast and prioritize [Void Torrent] channel.{rt1} || Gravity collapse — don't get sucked to center, dodge Gravity Orb lines, reposition for the new Dark Wave, tank takes Coalesced Mass.]],
                ["heroic"] = [[[Unstable Singularity] gravity collapse sucks players in (don't get pulled to center = instant death); [Gravity Orb] + [Coalesced Mass]. || [Cosmic Smash] single-target mark; [Void Torrent] multi-hit; new [Dark Wave] dodge by repositioning. || {rt1}Interrupt [Cosmic Smash] marked cast and prioritize [Void Torrent] channel.{rt1} || Gravity collapse — don't get sucked to center, dodge Gravity Orb lines, reposition for the new Dark Wave, tank takes Coalesced Mass.]],
                ["mythic"] = [[[Unstable Singularity] gravity collapse sucks players in (don't get pulled to center = instant death); [Gravity Orb] + [Coalesced Mass]. || [Cosmic Smash] single-target mark; [Void Torrent] multi-hit; new [Dark Wave] dodge by repositioning. || {rt1}Interrupt [Cosmic Smash] marked cast and prioritize [Void Torrent] channel.{rt1} || Gravity collapse — don't get sucked to center, dodge Gravity Orb lines, reposition for the new Dark Wave, tank takes Coalesced Mass.]],
                ["mythicplus"] = [[[Unstable Singularity] gravity collapse sucks players in (don't get pulled to center = instant death); [Gravity Orb] + [Coalesced Mass]. || [Cosmic Smash] single-target mark; [Void Torrent] multi-hit; new [Dark Wave] dodge by repositioning. || {rt1}Interrupt [Cosmic Smash] marked cast and prioritize [Void Torrent] channel.{rt1} || Gravity collapse — don't get sucked to center, dodge Gravity Orb lines, reposition for the new Dark Wave, tank takes Coalesced Mass.]],
            },
        },
        ["防护龟壳守卫"] = {
            type = "MOB",
            name = "Warding Turtle Guardian",
            tips = [[{rt8}Warding Turtle Guardian{rt8}||It channels a shield for a limited time; if the channel ends uninterrupted, it stuns itself and takes +10s increased damage (burn window).||Prioritize interrupting the channel to trigger the stun, then burst it down; one of the two new opening minibosses.]],
        },
        ["阿特洛苏斯"] = {
            type = "BOSS",
            name = "Atross",
            tipsByDifficulty = {
                ["lfr"] = [[[Venomous Breath] 4s frontal cast (tank faces it away from the group); [Toxic Aura] periodic -10% healing / periodic damage raid-wide. || [Bestial Roar] — the old stomp is now a roar with no knockback, summons [Venomous Crawler]. || [Massive Claw] knockback + DoT; [Venom Splatter] replaced by [Numbing Poison] (-30% haste, no damage). || Tank faces breath away; after the roar AoE down the crawlers fast; under Toxic Aura healing is reduced — pre-cast heals.]],
                ["normal"] = [[[Venomous Breath] 4s frontal cast (tank faces it away from the group); [Toxic Aura] periodic -10% healing / periodic damage raid-wide. || [Bestial Roar] — the old stomp is now a roar with no knockback, summons [Venomous Crawler]. || [Massive Claw] knockback + DoT; [Venom Splatter] replaced by [Numbing Poison] (-30% haste, no damage). || Tank faces breath away; after the roar AoE down the crawlers fast; under Toxic Aura healing is reduced — pre-cast heals.]],
                ["heroic"] = [[[Venomous Breath] 4s frontal cast (tank faces it away from the group); [Toxic Aura] periodic -10% healing / periodic damage raid-wide. || [Bestial Roar] — the old stomp is now a roar with no knockback, summons [Venomous Crawler]. || [Massive Claw] knockback + DoT; [Venom Splatter] replaced by [Numbing Poison] (-30% haste, no damage). || Tank faces breath away; after the roar AoE down the crawlers fast; under Toxic Aura healing is reduced — pre-cast heals.]],
                ["mythic"] = [[[Venomous Breath] 4s frontal cast (tank faces it away from the group); [Toxic Aura] periodic -10% healing / periodic damage raid-wide. || [Bestial Roar] — the old stomp is now a roar with no knockback, summons [Venomous Crawler]. || [Massive Claw] knockback + DoT; [Venom Splatter] replaced by [Numbing Poison] (-30% haste, no damage). || Tank faces breath away; after the roar AoE down the crawlers fast; under Toxic Aura healing is reduced — pre-cast heals.]],
                ["mythicplus"] = [[[Venomous Breath] 4s frontal cast (tank faces it away from the group); [Toxic Aura] periodic -10% healing / periodic damage raid-wide. || [Bestial Roar] — the old stomp is now a roar with no knockback, summons [Venomous Crawler]. || [Massive Claw] knockback + DoT; [Venom Splatter] replaced by [Numbing Poison] (-30% haste, no damage). || Tank faces breath away; after the roar AoE down the crawlers fast; under Toxic Aura healing is reduced — pre-cast heals.]],
            },
        },
        ["鲁莽监督者"] = {
            type = "MOB",
            name = "Reckless Overseer",
            tips = [[{rt8}Reckless Overseer{rt8}||[Brutal Smash] periodic damage -17% but still a heavy cleave/knockback.||Tank faces outward; raid DR during the smash; grab the matching buff.]],
        },
    },
    ["诸王之眠"] = {
        name = "Kings' Rest",
        ["始皇达萨"] = {
            type = "BOSS",
            name = "King Dazar",
            tipsByDifficulty = {
                ["lfr"] = [[[Earthshatter Leap] marks and leaps to a player — farther = less damage, so move away from the group when marked. || [Blade Combo] last two hits: tank pops DR; at 80% summons [Reban] — don't stand in front of the dragon; at 60% rides [Tizala] with [Eternal Guardian] damage redirect — must focus. || {rt1}Interrupt/dispel: [Deadly Roar] fear; [Impaling Spear] pins and stuns.{rt1} || At 40% [Spear Launcher] chases clockwise; move counterclockwise to jump the spears.]],
                ["normal"] = [[[Earthshatter Leap] marks and leaps to a player — farther = less damage, so move away from the group when marked. || [Blade Combo] last two hits: tank pops DR; at 80% summons [Reban] — don't stand in front of the dragon; at 60% rides [Tizala] with [Eternal Guardian] damage redirect — must focus. || {rt1}Interrupt/dispel: [Deadly Roar] fear; [Impaling Spear] pins and stuns.{rt1} || At 40% [Spear Launcher] chases clockwise; move counterclockwise to jump the spears.]],
                ["heroic"] = [[[Earthshatter Leap] marks and leaps to a player — farther = less damage, so move away from the group when marked. || [Blade Combo] last two hits: tank pops DR; at 80% summons [Reban] — don't stand in front of the dragon; at 60% rides [Tizala] with [Eternal Guardian] damage redirect — must focus. || {rt1}Interrupt/dispel: [Deadly Roar] fear; [Impaling Spear] pins and stuns.{rt1} || At 40% [Spear Launcher] chases clockwise; move counterclockwise to jump the spears.]],
                ["mythic"] = [[[Earthshatter Leap] marks and leaps to a player — farther = less damage, so move away from the group when marked. || [Blade Combo] last two hits: tank pops DR; at 80% summons [Reban] — don't stand in front of the dragon; at 60% rides [Tizala] with [Eternal Guardian] damage redirect — must focus. || {rt1}Interrupt/dispel: [Deadly Roar] fear; [Impaling Spear] pins and stuns.{rt1} || At 40% [Spear Launcher] chases clockwise; move counterclockwise to jump the spears.]],
                ["mythicplus"] = [[[Earthshatter Leap] marks and leaps to a player — farther = less damage, so move away from the group when marked. || [Blade Combo] last two hits: tank pops DR; at 80% summons [Reban] — don't stand in front of the dragon; at 60% rides [Tizala] with [Eternal Guardian] damage redirect — must focus. || {rt1}Interrupt/dispel: [Deadly Roar] fear; [Impaling Spear] pins and stuns.{rt1} || At 40% [Spear Launcher] chases clockwise; move counterclockwise to jump the spears.]],
            },
        },
        ["幻影萨满祭司"] = {
            type = "MOB",
            name = "Phantom Shaman",
            tips = [[{rt8}Phantom Shaman{rt8}||Prioritize interrupting casts; spread to avoid chain CC; mages don't steal its buff.||{rt1}Must interrupt: [Hex] (sheep)—dispel the target immediately after it lands.{rt1}||Melee watch controlled targets and cleanse them together with Zul's minions.]],
        },
        ["木乃伊"] = {
            type = "MOB",
            name = "Mummy",
            tips = [[{rt8}Mummy{rt8}||Both half-done and finished mummies cast [Wretched Eruption] (nature raid sickness); kill fast to reduce burden.||{rt1}Must interrupt: [Wretched Eruption] (12s party disease).{rt1}||Prioritize the finished mummies Mchimba summons from wrong coffins to avoid snowballing.]],
        },
        ["殓尸者姆沁巴"] = {
            type = "BOSS",
            name = "Mchimba the Embalmer",
            tipsByDifficulty = {
                ["lfr"] = [[Healer keeps the [Drained Fluids] target topped; above 90% HP clears [Withered]; avoid the [Burning Decay] fire ground. || {rt1}Must interrupt: mummy [Wretched Eruption]; when [Buried], read the struggle hint and open the right coffin — rescue first, then clear mummies.{rt1} || Tank dodges fire ground; DPS quickly kills released mummies.]],
                ["normal"] = [[Healer keeps the [Drained Fluids] target topped; above 90% HP clears [Withered]; avoid the [Burning Decay] fire ground. || {rt1}Must interrupt: mummy [Wretched Eruption]; when [Buried], read the struggle hint and open the right coffin — rescue first, then clear mummies.{rt1} || Tank dodges fire ground; DPS quickly kills released mummies.]],
                ["heroic"] = [[Healer keeps the [Drained Fluids] target topped; above 90% HP clears [Withered]; avoid the [Burning Decay] fire ground. || {rt1}Must interrupt: mummy [Wretched Eruption]; when [Buried], read the struggle hint and open the right coffin — rescue first, then clear mummies.{rt1} || Tank dodges fire ground; DPS quickly kills released mummies.]],
                ["mythic"] = [[Healer keeps the [Drained Fluids] target topped; above 90% HP clears [Withered]; avoid the [Burning Decay] fire ground. || {rt1}Must interrupt: mummy [Wretched Eruption]; when [Buried], read the struggle hint and open the right coffin — rescue first, then clear mummies.{rt1} || Tank dodges fire ground; DPS quickly kills released mummies.]],
                ["mythicplus"] = [[Healer keeps the [Drained Fluids] target topped; above 90% HP clears [Withered]; avoid the [Burning Decay] fire ground. || {rt1}Must interrupt: mummy [Wretched Eruption]; when [Buried], read the struggle hint and open the right coffin — rescue first, then clear mummies.{rt1} || Tank dodges fire ground; DPS quickly kills released mummies.]],
            },
        },
        ["活化守卫"] = {
            type = "MOB",
            name = "Animated Guardian (key mob)",
            tips = [[{rt8}Animated Guardian{rt8}||Tank faces it away from the group; everyone attacks from the side/back to avoid the front [Suppressing Smash] cone stun.||{rt1}Watch: [Release Inhibitor] grants +75% attack speed—switch or stun during the cast.{rt1}||In 12.1 the entrance guards moved back; pull one at a time to avoid chained frontals.]],
        },
        ["祖尔的暗影"] = {
            type = "MOB",
            name = "Zul's Shadow",
            tips = [[{rt8}Zul's Shadow{rt8}||Tank eats [Shadow Barrage] (uninterruptible, non-stacking DoT); [Dark Revelation]—move away from allies and stand in a [Dark Pool] to avoid raid damage.||{rt1}Cleanse: the summoned Zul's minions' [Shadow Bind] must be dispelled/bubble broken instantly or it's fatal.{rt1}||In 12.1 there are 2 Dark Pools—two players permanently soak them.]],
        },
        ["祖尔的爪牙"] = {
            type = "MOB",
            name = "Zul's Minion",
            tips = [[{rt8}Zul's Minion{rt8}||[Shadow Bind] shield—cleanse/dispel magic kills it instantly, the fastest solution.||{rt1}Cleanse: [Shadow Bind]; on landing [Despairing Abyss] fears—dispel the healer.{rt1}||In 12.1 a new [Gaze] beam locks a target for 10s; the marked player creates distance.]],
        },
        ["部族议会"] = {
            type = "BOSS",
            name = "Council of Tribes (Kula / Akali / Zanazal)",
            tipsByDifficulty = {
                ["lfr"] = [[Spread out to avoid [Lightning Arc]/[Stampede]; tanks pop DR for [Enfeebling Backhand]; in the hallway kill the Healing Tide Totem first. || {rt1}Must interrupt: [Poison Nova]; quickly kill [Explosive Totem] (summoned by [Elemental Summoning], detonates whole raid on landing).{rt1} || [Whirling Axes] step out of melee; [Rending Axe] healer tops the blood.]],
                ["normal"] = [[Spread out to avoid [Lightning Arc]/[Stampede]; tanks pop DR for [Enfeebling Backhand]; in the hallway kill the Healing Tide Totem first. || {rt1}Must interrupt: [Poison Nova]; quickly kill [Explosive Totem] (summoned by [Elemental Summoning], detonates whole raid on landing).{rt1} || [Whirling Axes] step out of melee; [Rending Axe] healer tops the blood.]],
                ["heroic"] = [[Spread out to avoid [Lightning Arc]/[Stampede]; tanks pop DR for [Enfeebling Backhand]; in the hallway kill the Healing Tide Totem first. || {rt1}Must interrupt: [Poison Nova]; quickly kill [Explosive Totem] (summoned by [Elemental Summoning], detonates whole raid on landing).{rt1} || [Whirling Axes] step out of melee; [Rending Axe] healer tops the blood.]],
                ["mythic"] = [[Spread out to avoid [Lightning Arc]/[Stampede]; tanks pop DR for [Enfeebling Backhand]; in the hallway kill the Healing Tide Totem first. || {rt1}Must interrupt: [Poison Nova]; quickly kill [Explosive Totem] (summoned by [Elemental Summoning], detonates whole raid on landing).{rt1} || [Whirling Axes] step out of melee; [Rending Axe] healer tops the blood.]],
                ["mythicplus"] = [[Spread out to avoid [Lightning Arc]/[Stampede]; tanks pop DR for [Enfeebling Backhand]; in the hallway kill the Healing Tide Totem first. || {rt1}Must interrupt: [Poison Nova]; quickly kill [Explosive Totem] (summoned by [Elemental Summoning], detonates whole raid on landing).{rt1} || [Whirling Axes] step out of melee; [Rending Axe] healer tops the blood.]],
            },
        },
        ["黄金风蛇"] = {
            type = "BOSS",
            name = "Golden Wind Serpent",
            tipsByDifficulty = {
                ["lfr"] = [[Tank pulls away from the edge/gong; everyone avoid the [Spit Gold]/[Molten Gold] gold pools, walk around them as they crawl. || {rt1}Burst-kill: Living Gold ([Fortune's Summon] gold pool must be killed before it crawls back to the boss, else boss stacks shield + damage buff).{rt1} || [Serpent Tail Smash] tank pops DR; [Serpent Vortex] stay away from the cliff to avoid knockback.]],
                ["normal"] = [[Tank pulls away from the edge/gong; everyone avoid the [Spit Gold]/[Molten Gold] gold pools, walk around them as they crawl. || {rt1}Burst-kill: Living Gold ([Fortune's Summon] gold pool must be killed before it crawls back to the boss, else boss stacks shield + damage buff).{rt1} || [Serpent Tail Smash] tank pops DR; [Serpent Vortex] stay away from the cliff to avoid knockback.]],
                ["heroic"] = [[Tank pulls away from the edge/gong; everyone avoid the [Spit Gold]/[Molten Gold] gold pools, walk around them as they crawl. || {rt1}Burst-kill: Living Gold ([Fortune's Summon] gold pool must be killed before it crawls back to the boss, else boss stacks shield + damage buff).{rt1} || [Serpent Tail Smash] tank pops DR; [Serpent Vortex] stay away from the cliff to avoid knockback.]],
                ["mythic"] = [[Tank pulls away from the edge/gong; everyone avoid the [Spit Gold]/[Molten Gold] gold pools, walk around them as they crawl. || {rt1}Burst-kill: Living Gold ([Fortune's Summon] gold pool must be killed before it crawls back to the boss, else boss stacks shield + damage buff).{rt1} || [Serpent Tail Smash] tank pops DR; [Serpent Vortex] stay away from the cliff to avoid knockback.]],
                ["mythicplus"] = [[Tank pulls away from the edge/gong; everyone avoid the [Spit Gold]/[Molten Gold] gold pools, walk around them as they crawl. || {rt1}Burst-kill: Living Gold ([Fortune's Summon] gold pool must be killed before it crawls back to the boss, else boss stacks shield + damage buff).{rt1} || [Serpent Tail Smash] tank pops DR; [Serpent Vortex] stay away from the cliff to avoid knockback.]],
            },
        },
    },
}
