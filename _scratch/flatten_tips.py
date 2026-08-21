# -*- coding: utf-8 -*-
"""
flatten_tips.py — 把 Guides 下所有 BOSS 条目的外层 tips 迁移进 tipsByDifficulty 同级。

规则（与用户需求一致）：
  - BOSS：删除外层 tips；把外层 tips 内容并入 tipsByDifficulty 的某个难度键
      * Dungeons / MPlus  -> 目标键 lfr
      * Raids             -> 目标键 normal
      * 若 tipsByDifficulty[target] 已有非空内容，则保留它（不覆盖），外层 tips 仅作兜底丢弃
      * 若 tipsByDifficulty 完全没有内容，则把外层 tips 写入 target 键
  - MOB ：保留外层 tips（无难度区分），不生成 tipsByDifficulty

通过 lupa 加载每个文件到一个 stub addon，读取 addon.GuideData，再重新导出干净文件。
保留每个文件的：文件头注释、命名空间初始化、versionInfo/mplusInfo、meta 表（含嵌套 encounterIds）。
仅重写实例 -> 首领 的数据体。
"""
import os
import re
import sys
from lupa import LuaRuntime

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GUIDES = os.path.join(ROOT, "Guides")

DIFF_KEYS = ["lfr", "normal", "heroic", "mythic", "mythicplus"]

lua = LuaRuntime(unpack_returned_tuples=True)


def lua_to_py(obj):
    """Recursively convert a lupa Lua table to python dict/list; scalars pass through."""
    tn = type(obj).__name__
    if tn in ("LuaTable", "_LuaTable"):
        # list-like?
        keys = list(obj.keys())
        is_list = keys and all(isinstance(k, int) for k in keys) and sorted(keys) == list(range(1, len(keys) + 1))
        if is_list:
            return [lua_to_py(obj[i]) for i in range(1, len(keys) + 1)]
        return {k: lua_to_py(obj[k]) for k in keys}
    return obj


def is_lua_identifier(s):
    return isinstance(s, str) and re.match(r"^[A-Za-z_][A-Za-z0-9_]*$", s) is not None


def choose_brackets(s):
    """Pick a long-bracket level whose closer does not appear in s, and s doesn't end
    with ']'+'='*level (which would merge with the closing bracket)."""
    level = 0
    while True:
        closer = "]" + ("=" * level) + "]"
        if closer not in s and not s.endswith("]" + ("=" * level)):
            return "[" + ("=" * level) + "[", closer
        level += 1


def fmt_lua_string(s):
    """Emit a Lua string. Use long brackets to preserve content verbatim."""
    if s is None:
        return '""'
    if not isinstance(s, str):
        s = str(s)
    # if short and simple, could use quotes, but long brackets are safest for CJK/||/{rt}
    if "\n" not in s and '"' not in s and "\\" not in s and len(s) < 200:
        # still must avoid embedding close-bracket sequences; long bracket is fine too
        pass
    o, c = choose_brackets(s)
    return o + s + c


def quote_key(s):
    """Short double-quoted key string; CJK and most chars are safe. Escape \\ and \"."""
    s = str(s).replace("\\", "\\\\").replace('"', '\\"')
    return '"' + s + '"'


def fmt_lua_key(k):
    """Table-constructor key: identifier, [int], or ["str"]."""
    if isinstance(k, int):
        return "[%d]" % k
    if is_lua_identifier(k):
        return k
    return "[" + quote_key(k) + "]"


def fmt_index_key(k):
    """Index expression appended after a table: `tbl` .. this. Always ["str"] / [int]."""
    if isinstance(k, int):
        return "[%d]" % k
    return "[" + quote_key(k) + "]"


def fmt_lua_value(v, indent):
    """indent: current indentation string (for nested tables)."""
    if isinstance(v, str):
        return fmt_lua_string(v)
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return repr(v)
    if isinstance(v, list):
        inner = ", ".join(fmt_lua_value(x, indent) for x in v)
        return "{ " + inner + " }"
    if isinstance(v, dict):
        return fmt_table(v, indent)
    return "nil"


def fmt_table(d, indent):
    """Format a dict as a Lua table. indent = leading whitespace of the line where '{' starts.
    Nested entries are indented one level deeper."""
    pad_inner = indent + "    "
    pad_close = indent
    parts = []
    for k, v in d.items():
        parts.append(pad_inner + fmt_lua_key(k) + " = " + fmt_lua_value(v, pad_inner) + ",")
    if not parts:
        return "{ }"
    return "{\n" + "\n".join(parts) + "\n" + pad_close + "}"


def fmt_inline_table(d):
    """Format a small dict (meta inner) on a single line."""
    parts = []
    for k, v in d.items():
        parts.append(fmt_lua_key(k) + " = " + fmt_lua_value(v, ""))
    return "{ " + ", ".join(parts) + " }"


def fmt_boss_entry(boss, indent):
    """Return the *body* lines (no outer braces) for a boss/mob entry.
    Caller wraps with { ... } so the opening brace can sit on the key line."""
    order = boss.get("order", 999)
    etype = boss.get("type", "BOSS")
    tbd = boss.get("tipsByDifficulty")
    tips = boss.get("tips")
    pad = indent + "    "
    pad2 = pad + "    "

    if etype == "MOB":
        return [
            pad + "order = %s," % repr(order),
            pad + 'type = "MOB",',
            pad + "tips = %s," % fmt_lua_string(tips or ""),
        ]

    # BOSS: build peer difficulty table
    out_td = {}
    if isinstance(tbd, dict):
        for k in DIFF_KEYS:
            v = tbd.get(k)
            if isinstance(v, str) and v != "":
                out_td[k] = v
    # migrate outer tips into the canonical target key (Dungeons/MPlus->lfr, Raids->normal)
    # as long as that target key is still empty; if target already has content, discard outer tips.
    if isinstance(tips, str) and tips != "":
        tk = boss.get("_target_key", "lfr")
        if out_td.get(tk, "") == "":
            out_td[tk] = tips

    if not out_td:
        return [
            pad + "order = %s," % repr(order),
            pad + 'type = "BOSS",',
            pad + "tipsByDifficulty = {",
            pad2 + "lfr = %s," % fmt_lua_string(""),
            pad + "}",
        ]

    lines = [
        pad + "order = %s," % repr(order),
        pad + 'type = "BOSS",',
        pad + "tipsByDifficulty = {",
    ]
    for k in DIFF_KEYS:
        if k in out_td:
            lines.append(pad2 + "%s = %s," % (k, fmt_lua_string(out_td[k])))
    lines.append(pad + "}")
    return lines


def load_file(path):
    """Run a guide file against a stub addon; return (addon_table_as_py, raw_text)."""
    with open(path, "r", encoding="utf-8") as f:
        src = f.read()
    stub = lua.table()
    g = lua.globals()
    # expose a fresh addon via vararg `...`
    lua.execute("local _, addon = ... " if False else "return 0")  # noop warmup
    runner = lua.eval("function(src, addon) local f = load(src, 'guide'); f('BossTips', addon); return addon end")
    addon_tbl = lua.table()
    # build GuideData skeleton the files expect
    addon_tbl["GuideData"] = lua.table()
    gd = addon_tbl["GuideData"]
    gd["versions"] = lua.table()
    gd["mplus"] = lua.table()
    gd["raids"] = lua.table()
    gd["meta"] = lua.table()
    gd["versionInfo"] = lua.table()
    gd["mplusInfo"] = lua.table()
    runner(src, addon_tbl)
    return lua_to_py(addon_tbl), src


def detect_kind(path, data):
    rel = os.path.relpath(path, GUIDES).replace("\\", "/")
    if rel.startswith("MPlus/"):
        return "mplus"
    if rel.startswith("Raids/"):
        return "raids"
    return "dungeons"


def target_key_for(kind):
    return "normal" if kind == "raids" else "lfr"


def emit_file(path, data, kind):
    """Rewrite the file: preserve header by regenerating from parsed meta/versionInfo,
    then emit instance bodies. Version key is discovered from the loaded data itself."""
    gd = data["GuideData"]
    meta = gd.get("meta", {}) or {}
    vinfo = gd.get("versionInfo", {}) or {}
    minfo = gd.get("mplusInfo", {}) or {}

    # choose the namespace dict; discover the actual registered version key
    if kind == "mplus":
        ns = gd.get("mplus", {}) or {}
        infod = minfo
    elif kind == "raids":
        ns = gd.get("raids", {}) or {}
        infod = {}
    else:
        ns = gd.get("versions", {}) or {}
        infod = vinfo

    # the version key = the single key of ns that maps to a non-empty table of instances
    verkey = None
    for k, v in ns.items():
        if isinstance(v, dict) and v:
            verkey = k
            break
    if verkey is None:
        # fall back to any key
        for k in ns.keys():
            verkey = k
            break
    if verkey is None:
        raise RuntimeError("no version key found in namespace")

    instances = ns.get(verkey, {}) or {}
    info = infod.get(verkey)

    lines = []
    # header
    lines.append("-- BossTips Guide Data")
    lines.append("-- BOSS guides live in tipsByDifficulty (peer keys lfr/normal/heroic/mythic/mythicplus).")
    lines.append("-- MOB keeps outer tips. Edit in-game via Settings -> 攻略编辑.")
    lines.append("local _, addon = ...")
    lines.append("addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }")
    if kind == "mplus":
        lines.append("addon.GuideData.mplus = addon.GuideData.mplus or {}")
        lines.append('addon.GuideData.mplus["%s"] = addon.GuideData.mplus["%s"] or {}' % (verkey, verkey))
        lines.append("addon.GuideData.mplusInfo = addon.GuideData.mplusInfo or {}")
        if info:
            lines.append('addon.GuideData.mplusInfo["%s"] = %s' % (verkey, fmt_inline_table(info)))
    elif kind == "raids":
        lines.append("addon.GuideData.raids = addon.GuideData.raids or {}")
        lines.append('addon.GuideData.raids["%s"] = addon.GuideData.raids["%s"] or {}' % (verkey, verkey))
    else:
        lines.append("addon.GuideData.versions = addon.GuideData.versions or {}")
        lines.append('addon.GuideData.versions["%s"] = addon.GuideData.versions["%s"] or {}' % (verkey, verkey))
        lines.append("addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}")
        if info:
            lines.append('addon.GuideData.versionInfo["%s"] = %s' % (verkey, fmt_inline_table(info)))
    lines.append("addon.GuideData.meta = addon.GuideData.meta or {}")
    lines.append("")

    # namespace path string
    if kind == "mplus":
        nspath = 'addon.GuideData.mplus["%s"]' % verkey
    elif kind == "raids":
        nspath = 'addon.GuideData.raids["%s"]' % verkey
    else:
        nspath = 'addon.GuideData.versions["%s"]' % verkey

    tk = target_key_for(kind)

    # instance order: keep original file order is lost in dict; sort by min boss order then name
    def inst_sort(item):
        name, bosses = item
        orders = [b.get("order", 999) for b in bosses.values() if isinstance(b, dict)]
        return (min(orders) if orders else 999, name)

    for inst, bosses in sorted(instances.items(), key=inst_sort):
        lines.append('%s%s = {' % (nspath, fmt_index_key(inst)))
        # boss order: BOSS first, then MOB; within same type sort by order then name
        def boss_sort(item):
            bn, bd = item
            if not isinstance(bd, dict):
                return (9, 999, bn)
            type_rank = 0 if bd.get("type") == "BOSS" else 1
            return (type_rank, bd.get("order", 999), bn)
        for bn, bd in sorted(bosses.items(), key=boss_sort):
            if not isinstance(bd, dict):
                continue
            bd = dict(bd)
            bd["_target_key"] = tk
            key = fmt_lua_key(bn)
            body = fmt_boss_entry(bd, "    ")
            lines.append("    %s = {" % key)
            lines.extend(body)
            lines.append("    },")
        lines.append("}")
        # meta for this instance (if any)
        if inst in meta:
            lines.append('addon.GuideData.meta%s = %s' % (fmt_index_key(inst), fmt_table(meta[inst], "")))
        lines.append("")

    return "\n".join(lines) + "\n"


def process(path):
    data, _ = load_file(path)
    kind = detect_kind(path, data)
    out = emit_file(path, data, kind)
    with open(path, "w", encoding="utf-8") as f:
        f.write(out)
    return kind


def main():
    only = sys.argv[1:] or None
    files = []
    for sub in ("MPlus", "Dungeons", "Raids"):
        d = os.path.join(GUIDES, sub)
        if not os.path.isdir(d):
            continue
        for fn in sorted(os.listdir(d)):
            if fn.endswith(".lua") and not fn.endswith(("_zhTW.lua", "_enUS.lua")):
                p = os.path.join(d, fn)
                if only and os.path.basename(p) not in only and p not in only:
                    continue
                files.append(p)
    for p in files:
        try:
            k = process(p)
            print("OK   [%s] %s" % (k, os.path.relpath(p, GUIDES)))
        except Exception as e:
            print("FAIL %s -> %s" % (os.path.relpath(p, GUIDES), e))


if __name__ == "__main__":
    main()
