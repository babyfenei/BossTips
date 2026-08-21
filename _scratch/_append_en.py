# -*- coding: utf-8 -*-
"""Append a translated chunk (one English tip per line, same order as the
corresponding zh lines) to _en_translations.txt. Run after each translation batch.
"""
import os
BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
chunk = os.path.join(BASE, "_scratch", "_en_chunk.txt")
out = os.path.join(BASE, "_scratch", "_en_translations.txt")
lines = [l.rstrip("\n") for l in open(chunk, encoding="utf-8") if l.strip() != ""]
with open(out, "a", encoding="utf-8") as f:
    for l in lines:
        f.write(l + "\n")
print("Appended %d lines; total now %d" % (len(lines), sum(1 for _ in open(out, encoding="utf-8"))))
