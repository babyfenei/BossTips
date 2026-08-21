# -*- coding: utf-8 -*-
"""Inject lfr difficulty into Guides/MPlus/Current.lua from Guides_bak/MPlus/Current.lua.

The bak file holds the previously AI-generated, skill-tagged boss guides (outer `tips`).
Per user request, those become the 随机(lfr) difficulty. MOB entries have no lfr (only tips).
"""
import os
import sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from flatten_tips import load_file, emit_file

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CUR_PATH = os.path.join(ROOT, "Guides", "MPlus", "Current.lua")
BAK_PATH = os.path.join(ROOT, "Guides_bak", "MPlus", "Current.lua")


def main():
    bak, _ = load_file(BAK_PATH)
    cur, _ = load_file(CUR_PATH)

    bakm = bak["GuideData"]["mplus"]["Current"]
    curm = cur["GuideData"]["mplus"]["Current"]

    injected = 0
    missing = []
    for inst, bosses in curm.items():
        bak_bosses = bakm.get(inst, {})
        for bn, bd in bosses.items():
            if not isinstance(bd, dict) or bd.get("type") != "BOSS":
                continue
            bak_e = bak_bosses.get(bn)
            bak_tips = bak_e.get("tips") if isinstance(bak_e, dict) else None
            if not isinstance(bak_tips, str) or bak_tips == "":
                missing.append("%s/%s" % (inst, bn))
                continue
            tbd = bd.setdefault("tipsByDifficulty", {})
            tbd["lfr"] = bak_tips
            injected += 1

    out = emit_file(CUR_PATH, cur, "mplus")
    with open(CUR_PATH, "w", encoding="utf-8") as f:
        f.write(out)

    print("Injected bak tips into lfr for %d bosses; missing: %d" % (injected, len(missing)))
    for m in missing[:20]:
        print("  missing:", m)


if __name__ == "__main__":
    main()
