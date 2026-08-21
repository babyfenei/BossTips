# -*- coding: utf-8 -*-
import os, lupa, re, json
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
out=[]
for v in RAID_VERS:
    src=g(GD["raids"],v)
    if not src: continue
    for inst,bosses in src.items():
        if not hasattr(bosses,"items"): continue
        for bk,b in bosses.items():
            if not hasattr(b,"items"): continue
            t=g(b,"type")
            if t=="MOB":
                zh=g(b,"tips"); td=None
            else:
                td=g(b,"tipsByDifficulty"); zh=g(td,"normal") if td else g(b,"normal")
            if zh is None: 
                out.append((v,inst,bk,None,0)); continue
            hh=1 if re.match(r'^\{rt8\}.*?\{rt8\}',zh) else 0
            out.append((v,inst,bk,zh,hh))
with open("_raid_keys.json","w",encoding="utf-8") as f:
    json.dump(out,f,ensure_ascii=False)
print("total raid boss entries:",len(out))
hdr=sum(1 for o in out if o[4]==1)
print("header-type:",hdr,"headless-type:",len(out)-hdr)
# print headless ones for naming
print("\n=== HEADLESS bosses (need display name + fresh translate) ===")
for v,inst,bk,zh,hh in out:
    if hh==0:
        print("%s | %s | %s"%(v,inst,bk))
