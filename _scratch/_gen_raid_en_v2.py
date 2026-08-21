# -*- coding: utf-8 -*-
"""Generate enUS raid translation files (Guides/Raids/vX.Y_enUS.lua) directly.

Strategy (robust against the broken positional pipeline):
  * Boss English NAME comes from RAID_BOSS_NAME_MAP[zh_key] (exact source key)
    merged with NAME_MAP (instances + native) from _enUS_data.
  * Boss English TIP:
      - header-type bosses (zh tip starts with {rt8}...{rt8}): joined from
        _new_en.txt by matching the {rt8} header string to RAID_BOSS_NAME_MAP
        value; the leading {rt8}Name{rt8}|| is stripped (name lives in `name`).
      - headless bosses (no {rt8} name): taken from HEADLESS_EN fresh dict.
  * Every difficulty (lfr/normal/heroic/mythic/mythicplus) gets the same en tip
    (mirrors gen_enUS.py's fill-from-base behaviour).
Output keyed by the CHINESE boss key with `name` = English, so the addon's
GetGuideText lookup chain keeps working.
"""
import os, lupa, re, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from _enUS_data import NAME_MAP
from _raid_boss_names import RAID_BOSS_NAME_MAP

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
RAID_VERS = ["%d.0" % i for i in range(1, 13)] + ["12.1"]

# Fresh English tips for the 33 headless raid bosses (no {rt8} name header).
HEADLESS_EN = {
"铬武大王加里维克斯": "P1 Chrome-War King mech: Scatter Canisters front (heal absorb, swap tank ~5 stacks); Bomb Rain burning DoT with delayed explosion; Blasting Backpack keep away; 1500-lb Dud led by designated person to detonate. P2 Electric Ring pulse + Gigabomb throw + Welding Canister absorb. Intermittently break the fly-head shield to prevent total annihilation. P3 full mobility all mechanics.",
"穆格·兹伊安保头子": "Red/Blue split sides, swap sides every minute (missing it wipes); Red side: Prison/Slide/Ice Spike shot toward cover, Blue side: Detonate Mine/Stack/Clear adds. At 40% the two heads spin concentric bullets with all skills stacked — hard enrage.",
"独臂盗匪": "Slot machine: scroll helpers drop symbols, store into designated combos to avoid wipe; Energy Tower click self-damage needs assignment. Heavy hit leaves electric field, swap tank. P2 (30%) cheat hard enrage, dodge beam pipeline.",
"链齿狂人洛肯斯多": "Conveyor + holes + inventions (rocket/lightning/magnet/laser) rotating; charged zone two-phase alternating, drill from below to dodge. Heavy hit with gravity goo layer, swap tank, fireworks pack keep away. Intermittently cross field to Boss, one invention taints black-blood empower.",
"维克茜和磨轮": "Before breaking armor plates (4 stacks normal) Boss at full energy wipes; kill racers to steal car to ram Boss off plates. Oil slick slip, bomb fire ignites oil, tank heavy-hit stack swap tank. P2 repairman interrupt, backfire heals.",
"里克·混响": "Amplifier charges, players channel to drain (with DoT) prevent full-energy wipe; dodge sound waves. When Boss retreats into sound cloud use amplifier blue circle to jump blast fall ring.",
"斯提克斯·堆渣": "One tank + four roll trash stick small trash into big ball, ram abandoned doomsday bomb (safe) or Boss (deal damage); run over waste tech / coyotes to increase damage. Incinerate ignites trash into hot trash keep low, swap tank after heavy hit.",
"血腥大熔炉": "Flame Fury (fire) and Tok (lightning) pull apart avoid overload fusion; close stacks burning/shock grudge, after each charge swap sides. Devour Stomp and Thunder Drum barrage dodge, two kings must die together.",
"苏雷吉队长席克兰": "Positioning-dependent. Spider-line marked stay away from group to drop line; Annihilate clears shadow clones and leaves DoT, clear clones timely. Sweep full-raid damage swap tank eat heavy hit.",
"流丝之庭": "Anub'arath and Webweaver same field. P1 poison rain, P2 web vortex pulls people, sting swarm gives long DoT need dispel, P3 frenzy swarm 8s worsens. Two kings share heavy-hit swap tank.",
"安苏雷克女王": "P1 use reactive toxin to bomb up bubbles jump poison nova, dodge spider mound and spider blade; liquefy swap tank. Intermittently break shield prevent devour. P2 two groups each climb 3 platforms clear adds; P3 use abyssal portal dodge devour greed and break silk.",
"节点女亲王凯维扎": "Dodge phantom-blade lines, avoid void rift (every 30s for 6s). During Starless Night intermittent full-raid high damage need heal through, those marked by Regicide break line to evade. Pace speeds up over time.",
"拉夏南": "Roll acid fling acid wave away from team, spider web line rely on pulling apart to break, hatch adds gather and kill. After 100 energy fly away follow and interrupt acid eruption. After maul swap tank.",
"噬灭者乌格拉克斯": "Two-phase cycle. Crawat Pit binds pull people toward Boss, need >=5 participants to avoid enrage; after Hunger Roar juggernaut charges full raid, stay away from path. Feed worm meat to Boss. Swap tank handle maul.",
"虫巢扭曲者欧维纳克斯": "Boss cycles in three zones, swallow black blood full-raid absorb need share, sticky web need dispel. Those marked by Experiment Dose stay away from group leave poison pool, tumor group-break then focus fire.",
"血缚恐魔": "Team split left/right halves. Crimson Rain periodic full-raid absorb, Filth Vomit sends people into Phaseless Realm, those inside kill their own avatar. Outside handle bloodbound adds and Boss.",
"集能哨兵": "Purge Volley group 3-4 to take damage, Annihilate Arcane Cannon gives tank vulnerability swap tank away drop pool, Manifest Matrix trap push to edge. At 100 energy enter purge intermission, use cape extra button to cross energy wall chase Boss.",
"节点之王萨哈达尔": "P1 whole raid 3 stacks oath, baptist removes 1 stack else mind-controlled; tank combo cone damage face out, behead run far. P2 portal laser face out. Intermittently split platforms clear adds, P3 starburst spawns dark star, star-kill missile shoots toward dark star destroy.",
"狩魂猎手": "Three demon hunters. Don't stand in eye beam/hunt path/void zone; those marked by Devouring Wrath stand in purple void zone to absorb. When each hits 100 energy two fly away, one metamorphoses empowered, suck orb dodge line dodge cone. Even DPS.",
"弗兰克提鲁斯": "Six crystal walls stack toward Boss, any one reaching 6 stacks Boss damage amp near wipe. Boss throws people back to smash walls, don't smash too many at once let healer collapse. Tank guard own lane zone.",
"熔炉编织者阿拉兹": "Add flood: tank heavy-hit summons adds, marked summons adds walk toward three collectors. Three collectors activate will summon Dimensius, before intermission at its 100 break it. Final phase against black hole pull finish.",
"缚魂者娜欣达利": "Use soul-shatter orbs to bomb incubation pods reduce spawns; after adds spawn interrupt mage, phase-blade AoE, to assassin spread. Rely on center position prevent being knocked off platform.",
"诸界吞噬者迪门修斯": "P1 kill living mass group pick excess mass, stack gravity circle dodge devour; reverse gravity floaters masser stand under to pull back. Antimatter pool go absorb reduce damage, dark matter spread. Intermittently wing dodge obstacles. P2 two void lords split platforms, P3 eight void stars become black hole again dodge devour finish.",
"卢米萨尔": "P1 kill infused entangled adds break collapse silk circle, dodge nest sweep and roots. After half health Boss down wall damage amp, leave pus and spray cone need share, swap tank handle.",
"乌拉特克": "The direction of Venom Wave is controlled by the team; the commander arranges which side to push toward to reduce the hatched [Spawn of the Devourer]. When [Wrath of the Bound] exposes [Toxic Heart], use Heroism and burst it down in one go. In the final phase the arena is torn apart; gather early on safe ground, don't stay at the edge waiting to fall.",
"迷失的探险者": "Pre-assign three groups to each take one of [Colossal Smash]'s three landing points for raid-split; if no one takes it the whole raid is heavily injured. Interrupt [Scrollkeeper Iku]'s [Frostfire]; [Frostfire Barrage] spread out to prevent the two orbs merging. Pressure the three bosses' health in sync; leave [Scrollkeeper Iku] for last, don't kill any one early.",
"陵寝哨兵": "Two tanks each take one sentinel left/right, keep at least 40 yards between; DPS split into two teams each focus one, pressure health in sync, don't let [Caustic Stasis] heal back for nothing. Whole raid shares stepping [Deadly Venom Droplet] and focus [Venom Clot], healer watches [Withering Blood] dispel. Pre-pair two-person collision pairs for [Spiral Toxin], collide to 4 stacks.",
"斯索拉克": "[Sunder] needs enough people to share the damage; too few will directly kill the taker. After [Furious Crosswind] ends it blows you away and applies [Turbulent Gust], pre-find a partner to collide and remove it. [Burrow Bulwark]'s 25 seconds is the only +30% vulnerability window; put Heroism and bursts all there.",
"盘卷祭坛": "Assign [Guillotine] raid-split groups; insufficient numbers will directly kill the taker. Interrupt [Vicious Coilspeaker]'s [Terror Screech]; [Terror Manifest] targets someone who is responsible for kiting, others don't block. Final phase the two targets' health are linked; pre-calculate bursts to kill them simultaneously.",
"盘魂者内克扎莉": "Assign two groups to rotate slow and control to stop [Sleepless Amani], don't let any into [Coilspring Well]. Before [Coil Ignite]'s 4-second cast lay shields, during it dodge [Agony Echo]'s knockback small circles; after [Essence Tear] ends clear [Hidden Cultists]. At 50% focus [Javac's Echo], [Uncoil] is a soft enrage, save Heroism for this phase to finish in one push.",
"双子毒牙": "Two tanks each stick to one snake, [Shard Shatter] must have someone catch it within 3 yards. Assign fixed people to catch [Corrosion Flood]'s emitted droplets, avoid letting the whole raid eat stacks together. Sync the two heads' health, kill simultaneously at the end, don't leave a [Surge] window.",
"万毒邪祟者瓦什尼克": "Tank positions to fix [Quaff]'s fountain combos, avoid difficult-to-handle pairings. Assign melee and ranged each to block one soft-add route; control works on shadow and flame softs, blood soft is CC-immune must hard-kill. [Burning Venom] and other big softs kill on staggered timing, avoid [Corrosion Surge] and [Shadow Spray] stacking together.",
"尼姆瑞莎·唤波者": "Assign ranged and slow-having classes to specifically intercept the murlocs spawned by [Charmed Bubble], don't let them walk into the middle. After [Frostbind Frost] marks move as prompted, don't bring the ice orb into the crowd. Before [Abyssal Rain] lay shields early, tank always leads line skills toward open ground.",
"古尔姆": "Multi-form cycling: Guarm periodically swaps which two of its Frost/Fire/Shadow heads are active; players receive a matching elemental debuff and should stack with others of the same element to split the incoming damage. Breath: a frontal cone that must be faced away from the group. Enrage is on a timer. Must interrupt/burst: none — react to the active form. Tank: hold; DPS: burn down.",
# --- v12.0 (Midnight) bosses: fresh translations from zh source (no _new_en.txt entry) ---
"贝洛伦，奥之子嗣": "After [Voidlight Convergence] swaps the active attunement move to the safe zone. Focus-fire [Ember] adds and stomp [Dive] circles; [Feather Sting] marked players spread. [Keeper's Edict] swap tanks; pre-lay shields for [Eternal Burn] absorb; [Death Plunge] transitions to P2 rebirth.",
"午夜陨落": "P1 interrupt [Twin Blades]/[Quasar]/[Elegy]/[Rune]/[Prism]; [Spear of Heaven]; during transitions dodge [Star Rift] and [Quasar]. P2 [Galvanize] dodge the light beams, [Core Reap] avoid, [Dark Collapse] knockback. P3 [Archangel] explosion — mitig; [Constellation] spread; [Siphon] stomp circles.",
"奇美鲁斯，未梦之神": "P1 [Dust] stomp circles; focus-fire adds; [Miasma] dispel; [Phlegm] glob spawn; [Tear of Rend] avoid frontal; [Devour] finish adds. P2 after lift-off dodge [Dive] landing; avoid [Corrupting Doom] breath.",
"陨落之王萨哈达尔": "Arrange interrupts for [Shattered Projection]; [Entropic Collapse] group up and mitig; focus-fire [Void Convergence] orbs. Dodge [Shattered Twilight Spike] and [Filth Pool] with movement.",
"威厄高尔和艾佐拉克": "Vaelgor's [Void Beam]/[Forbidden Zone]/[Breath] alternate with Ezzorak's [Shadow]/[Roar]. [Midnight Flame] triggers phase change; [Radiant Bulwark] group up. [Dread Breath] marked spread; [Shadow] dispel promptly.",
"弗拉希乌斯": "[Breath] avoid frontal; [Shadow Claw] heavy hit swap tanks; [Primal Roar] group up and mitig. [Parasite Spit] spawns adds — focus-fire immediately; clear ground [Slime].",
"光盲先锋军": "[Execution Order] marked catch orb / stomp circle; [Holy Storm] tornado avoid; [Holy Bell] dodge shield. [Judgment] swap tanks; pre-lay mitig for [Tyr's Wrath].",
"宇宙之冠": "P1 [Silver Arrow] marked spread; [Obelisk] stand on points; interrupt [Tremor]; [Void Spit] mitig; during transition dodge [Barrage] lines. P2 handle [Mark]/[Venom Sting]/[Summon Add]/[Bulwark]; P3 [Platform Swap] and [Chain] spread.",
"元首阿福扎恩": "[Shadow Charge] summons adds — focus-fire immediately; [Void Rift] circle-dodge; [Shadow Collapse] stomp circles. [Annihilation Wrath] all dodge; after [Void Fall] knockback quickly regroup.",
"腐沼": "[Awakened Fungus] adds focus-fire; [Fungal Bloom] group up and mitig; handle [Vine] marked; [Bursting Pustule] spread. [Putrid Fist] swap tanks.",
}

def g(t, k):
    try:
        return t[k]
    except Exception:
        return None

def qstr(s):
    s = s if isinstance(s, str) else str(s)
    s = s.replace("\\", "\\\\").replace('"', '\\"')
    return '"%s"' % s

def esc_key(k):
    k = k.replace("\\", "\\\\").replace('"', '\\"')
    return '["%s"]' % k

# Build _new_en.txt header -> [line indices]
HEADER_RE = re.compile(r'^\{rt8\}(.*?)\{rt8\}')
en_by_header = {}
for i, line in enumerate(open(os.path.join(BASE, "_scratch", "_new_en.txt"), encoding="utf-8"), 1):
    m = HEADER_RE.match(line.rstrip("\n"))
    if m:
        en_by_header.setdefault(m.group(1).strip(), []).append(i)

def strip_header(line):
    return re.sub(r'^\{rt8\}.*?\{rt8\}\|\|', '', line.rstrip("\n"), count=1)

def load_guidedata():
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BossTipsAddon = {}")
    def load(rel):
        p = os.path.join(BASE, rel)
        if not os.path.exists(p): return
        c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
        lua.execute(c)
    for v in RAID_VERS:
        load("Guides/Raids/v%s.lua" % v)
    return lua.globals()["BossTipsAddon"]["GuideData"]

def boss_block(bk, b):
    en_name = RAID_BOSS_NAME_MAP.get(bk) or NAME_MAP.get(bk)
    t = g(b, "type")
    if t == "MOB":
        zh = g(b, "tips")
        keys = ["mob"]
    else:
        td = g(b, "tipsByDifficulty")
        zh = g(td, "normal") if td else g(b, "normal")
        keys = ["lfr", "normal", "heroic", "mythic", "mythicplus"]
    if zh is None:
        return None
    # resolve en tip
    en_tip = None
    if HEADER_RE.match(zh):
        # header-type: join from _new_en.txt by en name
        hdr = en_name
        idxs = en_by_header.get(hdr) if hdr else None
        if idxs:
            raw = open(os.path.join(BASE, "_scratch", "_new_en.txt"), encoding="utf-8").readlines()[idxs[0]-1].rstrip("\n")
            en_tip = strip_header(raw)
    if not en_tip:
        en_tip = HEADLESS_EN.get(bk)
    if not en_tip:
        en_tip = zh  # ultimate fallback -> zhCN at runtime
    btype = t or "BOSS"
    parts = ["        %s = {" % esc_key(bk)]
    parts.append('            type = "%s",' % btype)
    if en_name:
        parts.append("            name = %s," % qstr(en_name))
    if t == "MOB":
        parts.append("            tips = %s," % qstr(en_tip))
    else:
        inner = "\n".join("                %s = %s," % (esc_key(dk), qstr(en_tip)) for dk in keys)
        parts.append("            tipsByDifficulty = {")
        parts.append(inner)
        parts.append("            },")
    parts.append("        },")
    return "\n".join(parts)

def main():
    GD = load_guidedata()
    rout = os.path.join(BASE, "Guides", "Raids")
    written = []
    for ver in RAID_VERS:
        src = g(GD["raids"], ver)
        if not src:
            continue
        lines = []
        lines.append("-- ============================================================================")
        lines.append("-- BossTips Raid 攻略翻译 —— enUS")
        lines.append("-- ============================================================================")
        lines.append("local _, addon = ...")
        lines.append("addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }")
        lines.append("addon.GuideData.translations = addon.GuideData.translations or {}")
        lines.append("addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}")
        lines.append("addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}")
        lines.append("addon.GuideData.translations.enUS.raids%s = {" % esc_key(ver))
        inst_count = 0; boss_count = 0; unmatched = []
        for inst_key, bosses in src.items():
            if not hasattr(bosses, "items"):
                continue
            en_inst = NAME_MAP.get(inst_key)
            blocks = []
            for bk, b in bosses.items():
                if not hasattr(b, "items"):
                    continue
                blk = boss_block(bk, b)
                if blk:
                    blocks.append(blk)
                    boss_count += 1
                else:
                    unmatched.append(bk)
            if not blocks and not en_inst:
                continue
            inst_count += 1
            lines.append("    %s = {" % esc_key(inst_key))
            if en_inst:
                lines.append("        name = %s," % qstr(en_inst))
            lines.extend(blocks)
            lines.append("    },")
        lines.append("}")
        fn = os.path.join(rout, "v%s_enUS.lua" % ver)
        with open(fn, "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")
        written.append((ver, fn, inst_count, boss_count))
        if unmatched:
            print("  [unmatched bosses in v%s] %s" % (ver, ", ".join(unmatched)))
    print("=== enUS raids regenerated ===")
    for ver, fn, i, b in written:
        print("  v%s : %d instances, %d bosses -> %s" % (ver, i, b, os.path.basename(fn)))
    # report header bosses whose NAME_MAP value had no _new_en.txt match
    missing = []
    for zh, en in RAID_BOSS_NAME_MAP.items():
        if en not in en_by_header:
            missing.append("%s->%s" % (zh, en))
    if missing:
        print("\n[WARN] RAID_BOSS_NAME_MAP values with NO matching _new_en.txt header (will fall back to HEADLESS_EN/zh):")
        print("  " + "; ".join(missing))

if __name__ == "__main__":
    main()
