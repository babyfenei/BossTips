import re, glob, os, sys

BASE = r"F:\game\World of Warcraft\_retail_\Interface\AddOns\BossTips\Guides"
files = glob.glob(os.path.join(BASE, "*.lua")) + glob.glob(os.path.join(BASE, "MPlus", "*.lua"))

inst_re = re.compile(r'addon\.GuideData\.\w+(\["[^"]+"\])+\s*=\s*\{')
entry_re = re.compile(r'^\s*\["([^"]+)"\]\s*=\s*\{')
tips_re = re.compile(r'\btips\s*=\s*')
comment_re = re.compile(r'--')
ismob_line_re = re.compile(r'^\s*isMob\s*=')
mobcomment_re = re.compile(r'大怪|重点怪')
bosscomment_re = re.compile(r'BOSS|首领')
name_paren_re = re.compile(r'\{rt8\}[^}]*\((重点怪?|重点)\)')
name_paren_fw_re = re.compile(r'\{rt8\}[^}]*（重点怪?）')
name_colon_re = re.compile(r'\{rt8\}[^}]*重点怪：')


def process(path):
    with open(path, encoding="utf-8") as f:
        lines = f.read().split("\n")
    in_count = sum(1 for ln in lines if entry_re.match(ln))

    out = []
    mobMode = False
    currentKey = None
    entryHasIsMob = False
    added = 0

    for line in lines:
        if inst_re.search(line):
            mobMode = False
            currentKey = None
            out.append(line)
            continue
        if comment_re.search(line):
            if mobcomment_re.search(line):
                mobMode = True
            elif bosscomment_re.search(line):
                mobMode = False
            out.append(line)
            continue
        m = entry_re.match(line)
        if m:
            currentKey = m.group(1)
            entryHasIsMob = False
            # Do NOT append/continue here: for single-line entries the tips
            # lives on this same line, so fall through to the tips handler.
        if ismob_line_re.match(line):
            entryHasIsMob = True
            out.append(line)
            continue
        if tips_re.search(line) and currentKey is not None:
            isMob = mobMode or currentKey.startswith("重点")
            if not isMob and (name_paren_re.search(line) or name_paren_fw_re.search(line)
                              or name_colon_re.search(line)):
                isMob = True
            if isMob and not entryHasIsMob and "isMob" not in line:
                if entry_re.match(line):
                    # single-line entry: tips on the same line as the key
                    out.append(re.sub(r'\{', '{ isMob = true, ', line, count=1))
                else:
                    indent = re.match(r'^(\s*)', line).group(1)
                    out.append(indent + "isMob = true,")
                    out.append(line)
                added += 1
            else:
                out.append(line)
            currentKey = None
            continue
        out.append(line)

    out_count = sum(1 for ln in out if entry_re.match(ln))
    if out_count != in_count:
        raise RuntimeError(
            f"SAFETY ABORT: entry count changed {in_count} -> {out_count} in {os.path.basename(path)}")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(out))
    return added


total = 0
for p in files:
    try:
        a = process(p)
    except RuntimeError as e:
        print("ERROR:", e)
        sys.exit(1)
    total += a
    print(f"{os.path.basename(p)}: +{a} isMob")
print("TOTAL added:", total)
