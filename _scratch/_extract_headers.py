# -*- coding: utf-8 -*-
import re, json
# en headers from _new_en.txt
en_headers=[]  # (lineno, en_name)
en_headless=[] # (lineno, text_start)
for i,l in enumerate(open("_new_en.txt",encoding="utf-8"),1):
    l=l.rstrip("\n")
    m=re.match(r'^\{rt8\}(.*?)\{rt8\}',l)
    if m: en_headers.append((i,m.group(1)))
    else: en_headless.append((i,l[:40]))
print("=== _new_en.txt EN headers: %d ==="%len(en_headers))
for i,n in en_headers: print("%d\t%s"%(i,n))
print("\n=== _new_en.txt headless lines: %d ==="%len(en_headless))
for i,s in en_headless: print("%d\t%s"%(i,s))
