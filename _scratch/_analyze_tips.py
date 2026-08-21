# -*- coding: utf-8 -*-
"""Analyze source tip vocabulary: bracketed ability names + common phrases.
Helps build a high-coverage enUS translation dictionary."""
import os, lupa, re
from collections import Counter

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]
RAID_VERS = ["%d.0" % i for i in range(1, 13)] + ["12.1"]

lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute("BossTipsAddon = {}")
def load(rel):
    p = os.path.join(BASE, rel)
    if not os.path.exists(p): return
    c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
    lua.execute(c)
for v in NATIVE_VERS: load("Guides/Dungeons/v%s.lua" % v)
for v in RAID_VERS: load("Guides/Raids/v%s.lua" % v)
GD = lua.globals()["BossTipsAddon"]["GuideData"]

ability = Counter()
phrase_words = Counter()
ntips = 0
samples = []
def collect_tip(s):
    global ntips
    if not isinstance(s, str) or s == "": return
    ntips += 1
    if len(samples) < 40: samples.append(s)
    for m in re.findall(r"\[([^\[\]]+)\]", s):
        ability[m] += 1
    # crude phrase tokens
    for seg in s.replace("||", " ").split():
        seg = re.sub(r"\{rt\d+\}", "", seg)
        if seg: phrase_words[seg] += 1

for cat, vers in (("versions", NATIVE_VERS), ("raids", RAID_VERS)):
    sec = GD[cat]
    for ver in vers:
        src = sec[ver]
        if not src: continue
        for inst, bosses in src.items():
            if not hasattr(bosses, "items"): continue
            for bk, b in bosses.items():
                if not hasattr(b, "items"): continue
                if b["type"] == "MOB":
                    collect_tip(b["tips"])
                else:
                    tbd = b["tipsByDifficulty"]
                    if tbd:
                        for k in ("lfr","normal","heroic","mythic","mythicplus"):
                            if tbd[k]: collect_tip(tbd[k])
                    else:
                        for k in ("lfr","normal","heroic","mythic","mythicplus"):
                            if isinstance(b[k], str) and b[k] != "": collect_tip(b[k])

print("TOTAL tips:", ntips)
print("UNIQUE abilities (bracketed):", len(ability))
print("=== TOP 120 abilities ===")
for a, c in ability.most_common(120):
    print("%4d  %s" % (c, a))
print("=== sample tips ===")
for s in samples[:20]:
    print(" -", s[:120])
