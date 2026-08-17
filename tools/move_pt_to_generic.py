#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
将 Guides/MPlus/Current.lua 中 BOSS 条目的 tipsByDifficulty.normal
挪到通用 tips 字段，并删除冗余的 tipsByDifficulty 行。
效果：所有难度（含普通/英雄/史诗/M+）默认显示同一份攻略。

只匹配同时含 tips 与 tipsByDifficulty = { normal = ... } 的 BOSS 条目；
MOB 条目及其它无 tipsByDifficulty 的条目保持不变。
"""
import re
import sys

PATH = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/Guides/MPlus/Current.lua"

# 字符串值：允许转义引号 \"，否则到第一个未转义 " 结束
STRVAL = r'(?:[^"\\]|\\.)*'

# g1=缩进+"tips = "  g2=旧tips值  g3=连接段  g4=normal值  g5=行尾
PAT = re.compile(
    r'([ \t]*tips = ")'              # g1
    + r'(' + STRVAL + r')'           # g2 旧 generic tips
    + r'(",\s*\n[ \t]*tipsByDifficulty = \{ normal = ")'  # g3
    + r'(' + STRVAL + r')'           # g4 normal 值
    + r'("\s*\},?\s*\n)'             # g5  " }, 换行
)


def repl(m):
    # 把 normal 值写入通用 tips，删除 tipsByDifficulty 行
    return m.group(1) + m.group(4) + '",\n'


def main():
    with open(PATH, encoding="utf-8") as f:
        text = f.read()

    new_text, n = PAT.subn(repl, text)
    if n == 0:
        print("WARN: 未匹配到任何 tipsByDifficulty.normal 条目，未改动。")
        sys.exit(0)

    with open(PATH, "w", encoding="utf-8") as f:
        f.write(new_text)

    print(f"已将 {n} 个 BOSS 的 PT 攻略挪入通用 tips，并移除 tipsByDifficulty 行。")


if __name__ == "__main__":
    main()
