# -*- coding: utf-8 -*-
"""Fuse M+ mythicplus = normal + heroic + mythic, deduplicating segments."""
import os
import sys
import re
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from flatten_tips import load_file, emit_file

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATH = os.path.join(ROOT, "Guides", "MPlus", "Current.lua")


def normalize_seg(s):
    """Crude dedup key: remove {rtN}, spaces, brackets, punctuation."""
    s = re.sub(r"\{rt\d\}", "", s)
    s = re.sub(r"[\[\]\s。，；：！？、\(\)/\\|]+", "", s)
    return s.lower()


def is_duplicate(new_k, existing_ks):
    """Check if new_k is equal to or a substring/contains any existing normalized segment."""
    for ek in existing_ks:
        if new_k == ek or new_k in ek or ek in new_k:
            return True
    return False


def fuse_three(normal, heroic, mythic):
    """Return combined ||-separated string with deduped segments.
    Order: keep mythic first (most authoritative), then append heroic/normal unique segments."""
    segs_m = [s.strip() for s in mythic.split("||") if s.strip()]
    segs_h = [s.strip() for s in heroic.split("||") if s.strip()]
    segs_n = [s.strip() for s in normal.split("||") if s.strip()]

    seen_ks = []
    out = []

    def try_add(s):
        k = normalize_seg(s)
        if not k:
            return
        if is_duplicate(k, seen_ks):
            return
        seen_ks.append(k)
        out.append(s)

    for s in segs_m:
        try_add(s)
    for s in segs_h:
        try_add(s)
    for s in segs_n:
        try_add(s)
    return "||".join(out)


def main():
    data, _ = load_file(PATH)
    mplus = data["GuideData"]["mplus"]["Current"]
    changed = 0
    for inst, bosses in mplus.items():
        for bn, bd in bosses.items():
            if not isinstance(bd, dict) or bd.get("type") != "BOSS":
                continue
            tbd = bd.get("tipsByDifficulty", {})
            n = tbd.get("normal", "")
            h = tbd.get("heroic", "")
            m = tbd.get("mythic", "")
            if not (n and h and m):
                continue
            fused = fuse_three(n, h, m)
            # strip any redundant leading {rt8}name{rt8} duplicate if normal/heroic carry it too
            tbd["mythicplus"] = fused
            changed += 1

    out = emit_file(PATH, data, "mplus")
    with open(PATH, "w", encoding="utf-8") as f:
        f.write(out)
    print("Fused mythicplus for %d bosses" % changed)


if __name__ == "__main__":
    main()
