#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
重写 M+ 翻译文件（zhTW / enUS）：
- 每个 BOSS 必须含 tipsByDifficulty = {lfr,normal,heroic,mythic,mythicplus} 五档，
  且五档均填“已翻译文本”，避免运行时回退简中源。
- MOB 保留单 tips。
- 译文取自现有翻译文件（tipsByDifficulty.mythicplus 优先，否则任意非空档，否则 tips）。
- zhTW 文本经 OpenCC s2t，保证繁体、无简中残留。
- 源 Current.lua 提供 type(BOSS/MOB) 与权威键。
"""
import re, os, glob
import lupa
from opencc import OpenCC

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
LANG = None  # set per run
cc = OpenCC('s2t')

DIFF_KEYS = ["lfr", "normal", "heroic", "mythic", "mythicplus"]


def escape_lua_long(s):
    """用 Lua 长字符串 [==[ ... ]==] 包裹，自动避开内容中出现的 ] 闭合符。
    关键点：若内容以 ] 结尾（如 ...[暴食]），低层级 ]] 闭合会与结尾 ] 拼接成过早闭合，
    必须升到 >=1 层级（使用 [=[ ]=]）。"""
    level = 0
    while True:
        close = ']' + ('=' * level) + ']'
        # 层级 0 时，内容以 ] 结尾会导致 内容] + ]] 出现 ]] 过早闭合
        safe = (close not in s) and not (level == 0 and s.endswith(']'))
        if safe:
            break
        level += 1
        if level > 10:
            break
    open_ = '[' + ('=' * level) + '['
    close = ']' + ('=' * level) + ']'
    return open_ + s + close


def extract_rt8_name(s):
    """从攻略文本首个 {rt8}XXX{rt8} 头提取首领显示名（权威英文名/繁中名）。"""
    if not s:
        return None
    m = re.search(r'\{rt8\}(.*?)\{rt8\}', s, re.DOTALL)
    return m.group(1).strip() if m else None


# ---------- 原生副本译文首领名映射（最权威，格式正确） ----------
# 原生 Guides/Dungeons/*_enUS.lua / *_zhTW.lua 的 boss tips 头 {rt8}Name{rt8}
# 覆盖全部原生 BOSS/MOB，远比 M+ 文件自身 tips 头完整（M+ 多数 BOSS tips 缺 {rt8} 头）。
def _build_native_map(suffix):
    m = {}
    for fp in glob.glob(os.path.join(BASE, f"Guides/Dungeons/*_{suffix}.lua")):
        try:
            txt = open(fp, encoding="utf-8").read()
        except Exception:
            continue
        for blk in re.finditer(
            r'\["(?P<key>(?:[^"\\]|\\.)+)"\]\s*=\s*\{\s*\n'
            r'\s*type\s*=\s*"(?:BOSS|MOB)"\s*,\s*\n'
            r'(?P<body>.*?)\n\s*\},',
            txt, re.DOTALL):
            key = blk.group("key")
            nm = extract_rt8_name(blk.group("body"))
            if key and nm and key not in m:
                m[key] = nm
    return m
NATIVE_ENUS_NAME = _build_native_map("enUS")
NATIVE_ZHTW_NAME = _build_native_map("zhTW")


def resolve_boss_name(lang, boss, t_entry):
    """解析 boss 显示名：原生译文权威名 > M+ 译文 tips 头 > 原键。"""
    native = NATIVE_ENUS_NAME if lang == "enUS" else NATIVE_ZHTW_NAME
    if boss in native:
        return native[boss]
    cand = None
    if t_entry:
        if 'tipsByDifficulty' in t_entry and t_entry['tipsByDifficulty']:
            tbd = t_entry['tipsByDifficulty']
            for d in DIFF_KEYS:
                if d in tbd and tbd[d]:
                    cand = extract_rt8_name(tbd[d])
                    if cand:
                        break
        if not cand and 'tips' in t_entry and t_entry['tips']:
            cand = extract_rt8_name(t_entry['tips'])
    name = cand or boss
    if lang == "zhTW":
        name = cc.convert(name)
    return name


def load_lua_module(path, varname):
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute(r'''
_G = _G or {}
function GetLocale() return "zhCN" end
function print() end
''')
    lua.execute(f'_G.{varname} = {{}}')
    code = open(path, encoding="utf-8").read().replace("local _, addon = ...", f"local addon = _G.{varname}")
    lua.execute(code)
    return lua.globals()['_G'][varname]


def run(lang):
    src_path = os.path.join(BASE, f"Guides/MPlus/Current.lua")
    trans_path = os.path.join(BASE, f"Guides/MPlus/Current_{lang}.lua")

    src = load_lua_module(src_path, "SRC")['GuideData']['mplus']['Current']
    trans = load_lua_module(trans_path, "BT")['GuideData']['translations'][lang]['mplus']['Current']

    lines = [
        "-- ============================================================================",
        f"-- BossTips M+ 攻略翻译 —— {lang}（BOSS 五难度 + MOB 单 tips；五难度均填译文，杜绝回退简中）",
        "-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。",
        "-- ============================================================================",
        "local _, addon = ...",
        "addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }",
        "addon.GuideData.translations = addon.GuideData.translations or {}",
        f"addon.GuideData.translations.{lang} = addon.GuideData.translations.{lang} or {{}}",
        f"addon.GuideData.translations.{lang}.mplus = addon.GuideData.translations.{lang}.mplus or {{}}",
        f'addon.GuideData.translations.{lang}.mplus["Current"] = {{',
    ]

    boss_count = 0
    mob_count = 0
    for inst in sorted(src.keys()):
        s_inst = src[inst]
        t_inst = trans[inst] if inst in trans else None
        # 实例级显示名：保留已有译文（enUS 为英文实例名、zhTW 为繁中），缺失则回退原键
        inst_name = inst
        if t_inst and 'name' in t_inst and t_inst['name'] and 'Lua table' not in str(t_inst['name']):
            inst_name = t_inst['name']
        if lang == "zhTW":
            inst_name = cc.convert(inst_name)
        lines.append(f'    ["{inst}"] = {{')
        lines.append(f'        name = "{inst_name}",')
        for boss in sorted(s_inst.keys()):
            entry = s_inst[boss]
            typ = entry['type'] if 'type' in entry else "BOSS"
            t_entry = t_inst[boss] if (t_inst and boss in t_inst) else None

            # name：优先原生译文权威名，回退 M+ tips 头或原键
            # （绝不复制可能已损坏的 t_entry['name']，旧版因此把 <Lua table at 0x...> 永久传播）
            name = resolve_boss_name(lang, boss, t_entry)

            # base translated text
            base = None
            if t_entry:
                if 'tipsByDifficulty' in t_entry:
                    tbd = t_entry['tipsByDifficulty']
                    for d in DIFF_KEYS:
                        if d in tbd and tbd[d]:
                            base = tbd[d]
                            break
                if not base and 'tips' in t_entry and t_entry['tips']:
                    base = t_entry['tips']
            if not base:
                # 最后兜底：用简中源（理论上不会发生，因为翻译文件已含全部首领）
                if 'tipsByDifficulty' in entry and 'mythicplus' in entry['tipsByDifficulty']:
                    base = entry['tipsByDifficulty']['mythicplus']
                elif 'tips' in entry:
                    base = entry['tips']
                else:
                    base = ""

            if lang == "zhTW":
                name = cc.convert(name)
                base = cc.convert(base)

            if typ == "MOB":
                mob_count += 1
                lines.append(f'        ["{boss}"] = {{')
                lines.append(f'            type = "MOB",')
                lines.append(f'            name = "{name.replace(chr(34), chr(92)+chr(34))}",')
                lines.append(f'            tips = {escape_lua_long(base)},')
                lines.append('        },')
            else:
                boss_count += 1
                lines.append(f'        ["{boss}"] = {{')
                lines.append(f'            type = "BOSS",')
                lines.append(f'            name = "{name.replace(chr(34), chr(92)+chr(34))}",')
                lines.append('            tipsByDifficulty = {')
                for d in DIFF_KEYS:
                    lines.append(f'                ["{d}"] = {escape_lua_long(base)},')
                lines.append('            },')
                lines.append('        },')
        lines.append('    },')
    lines.append('}')

    text = '\n'.join(lines) + '\n'
    with open(trans_path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"[{lang}] rebuilt: {boss_count} BOSS (x5 diff) + {mob_count} MOB")


if __name__ == "__main__":
    run("zhTW")
    run("enUS")
