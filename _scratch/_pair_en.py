# -*- coding: utf-8 -*-
"""Pair _unique_tips.txt (zh) with _en_translations.txt (en, same order) into the
MT cache JSON the enUS generator consumes: zh tip -> en tip.
"""
import os, json
BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
zh = [l.rstrip("\n") for l in open(os.path.join(BASE, "_scratch", "_unique_tips.txt"), encoding="utf-8") if l.strip() != ""]
en = [l.rstrip("\n") for l in open(os.path.join(BASE, "_scratch", "_en_translations.txt"), encoding="utf-8") if l.strip() != ""]
assert len(zh) == len(en), "MISMATCH zh=%d en=%d" % (len(zh), len(en))
cache = {}
for z, e in zip(zh, en):
    if z:
        cache[z] = e
out = os.path.join(BASE, "_scratch", "_enUS_mt_cache.json")
json.dump(cache, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=0)
print("Wrote %d zh->en pairs to %s" % (len(cache), out))
