# -*- coding: utf-8 -*-
import os, lupa, re
BASE="E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
NATIVE_VERS=["%d.0"%i for i in range(1,13)]
RAID_VERS=NATIVE_VERS[:-1]+["12.1"]
def g(t,k):
    try: return t[k]
    except Exception: return None
lua=lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute("BossTipsAddon={}")
for v in RAID_VERS:
    p=os.path.join(BASE,"Guides/Raids/v%s.lua"%v)
    if os.path.exists(p):
        c=open(p,encoding="utf-8").read().replace("local _, addon = ...","local addon = BossTipsAddon")
        lua.execute(c)
GD=lua.globals()["BossTipsAddon"]["GuideData"]
canon=[]  # (ver, inst_zh, boss_zh, normal_tip_zh, has_header)
for v in RAID_VERS:
    src=g(GD["raids"],v)
    if not src: continue
    for inst,bosses in src.items():
        if not hasattr(bosses,"items"): continue
        for bk,b in bosses.items():
            if not hasattr(b,"items"): continue
            t=g(b,"type")
            if t=="MOB":
                zh=g(b,"tips")
            else:
                td=g(b,"tipsByDifficulty")
                zh=g(td,"normal") if td else g(b,"normal")
            if zh is None: continue
            has_hdr=bool(re.match(r'^\{rt8\}.*?\{rt8\}',zh))
            canon.append((v,inst,bk,zh,has_hdr))
# compare to _missing_tips.txt
mt=[l.rstrip("\n") for l in open("_missing_tips.txt",encoding="utf-8") if l.strip()!=""]
print("canonical raid tips:",len(canon),"| _missing_tips lines:",len(mt))
match=all(c[3]==m for c,m in zip(canon,mt))
print("canonical == _missing_tips.txt (incl order):",match)
if not match:
    for i,(c,m) in enumerate(zip(canon,mt)):
        if c[3]!=m:
            print("FIRST DIFF at idx",i)
            print("  canon:",c[3][:60])
            print("  miss :",m[:60])
            break
nh=sum(1 for c in canon if c[4])
print("canonical: header tips=%d, headless=%d"%(nh,len(canon)-nh))
# dump canonical boss keys + has_header for crosswalk build
with open("_canon_raid.txt","w",encoding="utf-8") as f:
    for v,inst,bk,zh,hh in canon:
        f.write("%s\t%s\t%s\t%d\n"%(v,inst,bk,1 if hh else 0))
print("wrote _canon_raid.txt with",len(canon),"entries")
