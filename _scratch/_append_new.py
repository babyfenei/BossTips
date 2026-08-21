# -*- coding: utf-8 -*-
"""Append current _en_chunk.txt (new missing translations) to _new_en.txt,
preserving order (same order as _missing_tips.txt)."""
import os
BASE = os.path.join("E:/World of Warcraft/_retail_/Interface/AddOns/BossTips", "_scratch")
chunk = os.path.join(BASE, "_en_chunk.txt")
out = os.path.join(BASE, "_new_en.txt")
lines = [l.rstrip("\n") for l in open(chunk, encoding="utf-8") if l.strip() != ""]
with open(out, "a", encoding="utf-8") as f:
    for l in lines:
        f.write(l + "\n")
print("Appended %d lines; %s now %d lines" % (len(lines), os.path.basename(out), sum(1 for _ in open(out, encoding="utf-8"))))
