# -*- coding: utf-8 -*-
"""Build enUS tip translation cache (zh->en) for ALL unique BossTips guide bodies.
Uses MyMemory free API (reachable in this env; Google is blocked).
Preserves {rtN} markers and [brackets]; splits long tips on '||'.
Saves incrementally to _enUS_mt_cache.json. Stops cleanly on quota.
"""
import os, lupa, urllib.request, urllib.parse, json, time, sys

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
CACHE = os.path.join(BASE, "_scratch", "_enUS_mt_cache.json")
NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]
RAID_VERS = NATIVE_VERS[:-1] + ["12.1"]

def g(t, k):
    try:
        v = t[k]
        return v
    except Exception:
        return None

def collect_unique():
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BossTipsAddon={}")
    for v in NATIVE_VERS:
        p = "Guides/Dungeons/v%s.lua" % v
        if os.path.exists(p):
            c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
            lua.execute(c)
    for v in RAID_VERS:
        p = "Guides/Raids/v%s.lua" % v
        if os.path.exists(p):
            c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
            lua.execute(c)
    GD = lua.globals()["BossTipsAddon"]["GuideData"]
    tips = set()
    for v in NATIVE_VERS:
        src = GD["versions"][v]
        for inst, bosses in src.items():
            if not hasattr(bosses, "items"): continue
            for bk, b in bosses.items():
                if not hasattr(b, "items"): continue
                t = g(b, "type")
                if t == "MOB":
                    tt = g(b, "tips")
                    if tt: tips.add(tt)
                else:
                    td = g(b, "tipsByDifficulty")
                    if td:
                        lf = g(td, "lfr")
                        if lf: tips.add(lf)
    for v in RAID_VERS:
        src = GD["raids"][v]
        for inst, bosses in src.items():
            if not hasattr(bosses, "items"): continue
            for bk, b in bosses.items():
                if not hasattr(b, "items"): continue
                t = g(b, "type")
                if t == "MOB":
                    tt = g(b, "tips")
                    if tt: tips.add(tt)
                else:
                    for d in ("lfr", "normal", "heroic", "mythic"):
                        tt = g(b, d)
                        if tt: tips.add(tt)
    return tips

class QuotaExceeded(Exception):
    pass

def translate_one(text):
    if not text or not text.strip():
        return text
    chunks = [c for c in text.split("||")]
    out = []
    for c in chunks:
        if c == "":
            out.append("")
            continue
        q = urllib.parse.quote(c)
        url = "https://api.mymemory.translated.net/get?q=%s&langpair=zh-CN|en" % q
        req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
        data = json.loads(urllib.request.urlopen(req, timeout=20).read())
        if data.get("quotaFinished"):
            raise QuotaExceeded()
        t = data.get("responseData", {}).get("translatedText", "")
        if not t:
            t = c
        out.append(t)
    return "||".join(out)

def main():
    tips = collect_unique()
    print("Unique tips to translate: %d" % len(tips))
    cache = {}
    if os.path.exists(CACHE):
        try:
            cache = json.load(open(CACHE, encoding="utf-8"))
            print("Loaded %d cached entries." % len(cache))
        except Exception:
            cache = {}
    todo = [t for t in tips if t not in cache]
    print("Remaining: %d" % len(todo))
    done = 0
    quota_hit = False
    for i, t in enumerate(todo):
        try:
            tr = translate_one(t)
        except QuotaExceeded:
            quota_hit = True
            print("QUOTA EXCEEDED after %d translations." % done)
            break
        except Exception as e:
            tr = t  # fallback to source on error
            sys.stderr.write("err: %s\n" % str(e)[:80])
        cache[t] = tr
        done += 1
        if done % 50 == 0:
            json.dump(cache, open(CACHE, "w", encoding="utf-8"), ensure_ascii=False, indent=0)
            print("  %d/%d translated" % (done, len(todo)))
    json.dump(cache, open(CACHE, "w", encoding="utf-8"), ensure_ascii=False, indent=0)
    print("DONE. cache size=%d quota_hit=%s" % (len(cache), quota_hit))

if __name__ == "__main__":
    main()
