# -*- coding: utf-8 -*-
"""Verify flatten result: every BOSS has tipsByDifficulty (no outer tips),
every MOB keeps outer tips (no tipsByDifficulty). Counts and reports violations."""
import os
import re
from lupa import LuaRuntime

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GUIDES = os.path.join(ROOT, "Guides")
lua = LuaRuntime(unpack_returned_tuples=True)


def check_file_order(path):
    """Verify within each instance, BOSS entries appear before MOB entries."""
    text = open(path, "r", encoding="utf-8").read()
    issues = []
    # split by instance opening lines
    # match:  namespace["X"]["instance"] = {
    parts = re.split(r'\n(addon\.GuideData\.(?:versions|mplus|raids)\[[^\]]+\]\[[^\]]+\] = \{)', text)
    # parts[0]=before, [1]=header1, [2]=body1, [3]=header2, [4]=body2, ...
    for i in range(1, len(parts), 2):
        header = parts[i]
        body = parts[i + 1] if i + 1 < len(parts) else ""
        # find the matching top-level } for the instance (the first unindented })
        m = re.search(r'\n\}(?=\n|$)', body)
        inst_body = body[:m.start()] if m else body
        types = re.findall(r'\ntype = "(BOSS|MOB)"', inst_body)
        seen_mob = False
        for t in types:
            if t == "MOB":
                seen_mob = True
            elif t == "BOSS" and seen_mob:
                inst_name = re.search(r'\[([^\]]+)\] = \{', header)
                issues.append("%s: BOSS after MOB in %s" % (os.path.basename(path), inst_name.group(1) if inst_name else "?"))
                break
    return issues


def lua_to_py(o):
    tn = type(o).__name__
    if tn in ("LuaTable", "_LuaTable"):
        keys = list(o.keys())
        if keys and all(isinstance(k, int) for k in keys) and sorted(keys) == list(range(1, len(keys) + 1)):
            return [lua_to_py(o[i]) for i in range(1, len(keys) + 1)]
        return {k: lua_to_py(o[k]) for k in keys}
    return o


def load(path):
    with open(path, "r", encoding="utf-8") as f:
        src = f.read()
    runner = lua.eval("function(src, addon) local f = load(src, 'g'); f('BossTips', addon); return addon end")
    a = lua.table()
    a["GuideData"] = lua.table()
    gd = a["GuideData"]
    for k in ("versions", "mplus", "raids", "meta", "versionInfo", "mplusInfo"):
        gd[k] = lua.table()
    runner(src, a)
    return lua_to_py(a)["GuideData"]


total_boss = total_mob = 0
viol = []
order_issues = []
for sub in ("MPlus", "Dungeons", "Raids"):
    d = os.path.join(GUIDES, sub)
    if not os.path.isdir(d):
        continue
    for fn in sorted(os.listdir(d)):
        if not fn.endswith(".lua") or fn.endswith(("_zhTW.lua", "_enUS.lua")):
            continue
        p = os.path.join(d, fn)
        gd = load(p)
        for ns in ("versions", "mplus", "raids"):
            for ver, insts in (gd.get(ns) or {}).items():
                if not isinstance(insts, dict):
                    continue
                for inst, bosses in insts.items():
                    if not isinstance(bosses, dict):
                        continue
                    for bn, bd in bosses.items():
                        if not isinstance(bd, dict):
                            continue
                        et = bd.get("type")
                        has_tips = isinstance(bd.get("tips"), str) and bd.get("tips") != ""
                        tbd = bd.get("tipsByDifficulty")
                        has_tbd = isinstance(tbd, dict) and any(
                            isinstance(tbd.get(k), str) and tbd.get(k) != "" for k in tbd)
                        if et == "BOSS":
                            total_boss += 1
                            if has_tips:
                                viol.append("%s/%s [%s] BOSS %s: outer tips remains" % (sub, fn, inst, bn))
                            if not has_tbd:
                                viol.append("%s/%s [%s] BOSS %s: NO tipsByDifficulty content" % (sub, fn, inst, bn))
                        elif et == "MOB":
                            total_mob += 1
                            if not has_tips:
                                viol.append("%s/%s [%s] MOB %s: missing tips" % (sub, fn, inst, bn))
                    order_issues.extend(check_file_order(p))

print("BOSS total: %d" % total_boss)
print("MOB  total: %d" % total_mob)
print("order issues: %d" % len(order_issues))
print("violations: %d" % len(viol))
for v in order_issues[:60]:
    print("  " + v)
for v in viol[:60]:
    print("  " + v)
