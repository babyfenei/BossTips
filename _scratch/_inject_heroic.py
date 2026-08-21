# -*- coding: utf-8 -*-
"""Inject heroic difficulty text (from link1) into Guides/MPlus/Current.lua.
Existing keys are preserved; only tipsByDifficulty.heroic is added."""
import os
import re
from lupa import LuaRuntime

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATH = os.path.join(ROOT, "Guides", "MPlus", "Current.lua")

# Map article 1号/2号/3号/尾王 to actual boss keys in Current.lua.
HEROIC = {
    "密谋小径": {
        "凯斯媞亚·魔力之心": "{rt8}凯斯媞亚·魔力之心{rt8}||1. 开场主打咬咬；Boss分身出来后打断分身读条。||2. 咬咬到20%会破Boss护盾，此时转Boss开爆发。",
        "赞恩·刃悲": "{rt8}赞恩·刃悲{rt8}||1. 酒桶出现后，用下一轮火圈炸掉绿色毒桶。||2. 红线点名时每人躲到不同酒桶后面，不要两人共用一个。",
        "歼灭者萨祖克斯": "{rt8}歼灭者萨祖克斯{rt8}||1. Boss把斧头丢到地上后，斧头会持续炸团，立刻转火打掉。||2. 其他技能正常躲避。",
        "利希尔·烬怒": "{rt8}利希尔·烬怒{rt8}||1. 混乱箭要打断；猎犬和小鬼出来就转火，小鬼尽量群控。||2. Boss闪到远处并开传送门后，扩散波过来时点传送门躲避。",
    },
    "纳洛拉克的洞穴": {
        "囤宝狂人": "{rt8}囤宝狂人{rt8}||1. Boss丢蘑菇时，每个蘑菇圈都要有人踩，漏一个会炸团。||2. 平时躲Boss前方扇形和地面尖刺。",
        "寒冬哨兵": "{rt8}寒冬哨兵{rt8}||1. 蓝圈落地后会出小怪，先转火并打断。||2. 小怪死后接旁边白圈，暴雨时靠近Boss并踩小怪留下的雪堆抗击退。",
        "纳洛拉克": "{rt8}纳洛拉克{rt8}||1. 三人被绿圈点名时把幻影集中放在同一角。||2. NPC开减伤圈时站进去；幻影变红并冲向NPC时主动撞掉。",
    },
    "夺目谷": {
        "光明众花": "{rt8}光明众花{rt8}||1. 三个Boss共享血量，直接一起A。||2. 光芒剑要打断；三朵花被光线连起来时站到光线上挡住，漏掉会炸团。",
        "圣光猎手伊库兹": "{rt8}圣光猎手伊库兹{rt8}||1. Boss连线追人时，被追的人把Boss引过场上的荆棘清掉。||2. 其他人躲荆棘；践踏时注意别被击退进去。",
        "护光者鲁伊亚": "{rt8}护光者鲁伊亚{rt8}||1. 咕咕阶段打断读条；3人被风点名时彼此分开。||2. 70%变熊后会点3人放扇形，三人分散别让扇形重叠；40%后分身会重复这些技能。",
        "兹欧凯特": "{rt8}兹欧凯特{rt8}||1. 小怪出来先转火并打断。||2. 场边光球飞向Boss时DPS去挡，别让Boss吃到；Boss对坦克放直线技能时其他人别站在线上。",
    },
    "虚空之痕竞技场": {
        "塔兹拉尔": "{rt8}塔兹拉尔{rt8}||1. 影子连线点名时全队尽量把连线朝同一侧摆，随后影子沿连线冲锋，几条冲锋路线别重叠。||2. 躲场上的永久紫圈和散射小球。",
        "阿特洛苏斯": "{rt8}阿特洛苏斯{rt8}||1. 毒蛇小怪出现后立刻转火。||2. Boss扇形喷吐点你时把方向带离人群；没被点的人躲开扇形；平时别踩毒池。",
        "煞戎努斯": "{rt8}煞戎努斯{rt8}||1. 黑洞出现后站3个黑洞中间抗吸；全员脚下出紫圈时互相分开。||2. 大球追你就引进黑洞；Boss连续射小球时一直移动。",
    },
    "毒牙祭坛": {
        "拉维": "{rt8}拉维{rt8}||1. Boss冲向食物堆时躲开冲锋路径；开始进食后接圈并尽快破盾。||2. 平时躲落石和Boss周身大圈。",
        "扭缠盘蛇": "{rt8}扭缠盘蛇{rt8}||1. P1连续3个毒素读条都要打断。||2. 全员被Boss连线拉扯时往外跑把线拉断；P2五只小怪一起A，小怪读条要断，被追的人一直跑别让它咬到。",
        "祖尔加": "{rt8}祖尔加{rt8}||1. Boss和蛇头连线时站到线上挡线拿毒层。||2. 之后切骨者点名直线时至少2人一起分摊来消层；消层产生的毒水尽量放场边；躲反弹斧头。",
    },
    "红玉新生法池": {
        "梅莉杜莎·寒妆": "{rt8}梅莉杜莎·寒妆{rt8}||1. 凛冽飞弹要打断；Boss到66%和33%会出护盾，优先破盾并顺带A小龙。||2. 平时躲冰刺；龙卷风结束击退时别被推到冰刺上。",
        "柯姬雅·焰蹄": "{rt8}柯姬雅·焰蹄{rt8}||1. 被大火圈点名后会出火元素，立刻转火；火元素死后马上离开它周围的大红圈。||2. Boss瞄准的方向会滚大火球，躲开路线并远离树木。",
        "基拉卡与厄克哈特·风脉": "{rt8}基拉卡与厄克哈特·风脉{rt8}||1. P1主打人形Boss；躲龙的扇形喷吐；火圈点名时分散放到空地；人形Boss读阻断暴雨时别继续施法。||2. 40%后人龙合体，继续处理这些机制。",
    },
    "诸王之眠": {
        "黄金风蛇": "{rt8}黄金风蛇{rt8}||1. 两人被点名时集合，把两滩地板尽量叠在一起。||2. 地板变成软泥后立刻转火，别让软泥碰到Boss。",
        "殓尸者姆沁巴": "{rt8}殓尸者姆沁巴{rt8}||1. 火圈点名时别放在棺材旁；木乃伊出来后的读条必须打断。||2. 自己被抓进棺材就敲棺材提示队友；队友被抓就找被敲的棺材右键救人。",
        "部族议会": "{rt8}部族议会{rt8}||1. 三个Boss会轮流上场，死掉的Boss之后还会以灵魂形态继续放技能。||2. 出现分摊就集合；旋转飞斧躲开；智者召唤图腾后先转火火图腾。",
        "始皇达萨": "{rt8}始皇达萨{rt8}||1. 80%前正常打Boss；场上的小龙咆哮要打断。||2. 80%后Boss骑上坐骑，两个目标共享伤害，继续打Boss本体；镀金毁灭后立刻离开Boss周围落下的土圈。",
    },
    "塞塔里斯神庙": {
        "阿德里斯和阿斯匹克斯": "{rt8}阿德里斯和阿斯匹克斯{rt8}||1. 护盾会在两个Boss之间来回切换，只打没盾的那个。||2. 风Boss击退前靠墙；击退后马上集合吃雷Boss分摊；雷Boss脚下出现大范围圈时离开这个圈；风圈点名时把风圈放到场边。",
        "米利克萨": "{rt8}米利克萨{rt8}||1. 队友被小蛇缠住时立刻转火救人。||2. Boss钻地后会孵化小蛇，先打小蛇并打断毒素喷吐；Boss从场边横穿时躲开它的路径。",
        "加瓦兹特": "{rt8}加瓦兹特{rt8}||1. 电塔和Boss连线时，DPS站到两者之间挡线；挡线会叠物理易伤，别让坦克挡。||2. 地上的水及时躲开。",
        "塞塔里斯的化身": "{rt8}塞塔里斯的化身{rt8}||1. 目标是让治疗把中间化身奶满；守护者死后先躲爆炸大圈，随后出现3个黑球时由3个DPS各撞1个。||2. 污染者出现就优先转火打掉；妖术师读条时及时打断；P2清掉追治疗的小怪。",
    },
}

lua = LuaRuntime(unpack_returned_tuples=True)


def lua_to_py(o):
    tn = type(o).__name__
    if tn in ("LuaTable", "_LuaTable"):
        keys = list(o.keys())
        if keys and all(isinstance(k, int) for k in keys) and sorted(keys) == list(range(1, len(keys) + 1)):
            return [lua_to_py(o[i]) for i in range(1, len(keys) + 1)]
        return {k: lua_to_py(o[k]) for k in keys}
    return o


def load(path):
    with open(path, "r", encoding="utf-8") as f:
        src = f.read()
    runner = lua.eval("function(src, addon) local f = load(src, 'g'); f('BossTips', addon); return addon end")
    a = lua.table()
    a["GuideData"] = lua.table()
    gd = a["GuideData"]
    for k in ("versions", "mplus", "raids", "meta", "versionInfo", "mplusInfo"):
        gd[k] = lua.table()
    runner(src, a)
    return src, lua_to_py(a)["GuideData"]


def choose_brackets(s):
    level = 0
    while True:
        closer = "]" + ("=" * level) + "]"
        if closer not in s and not s.endswith("]" + ("=" * level)):
            return "[" + ("=" * level) + "[", closer
        level += 1


def fmt_lua_string(s):
    if s is None:
        return '""'
    if not isinstance(s, str):
        s = str(s)
    o, c = choose_brackets(s)
    return o + s + c


def quote_key(s):
    return '"' + str(s).replace("\\", "\\\\").replace('"', '\\"') + '"'


def build_heroic_lines(inst, boss_name, text):
    """Return lines to insert into tipsByDifficulty block."""
    return [
        "            heroic = %s," % fmt_lua_string(text),
    ]


def inject(src, heroic_data):
    # Work on the raw text by finding each BOSS block and inserting heroic line
    # This is robust because we keep the file structurally identical.
    out_lines = []
    i = 0
    lines = src.splitlines()
    while i < len(lines):
        line = lines[i]
        out_lines.append(line)
        # Detect a BOSS entry start: any line with ["name"] = { followed by order/type
        m = re.match(r'^(\s+)\[([^\]]+)\] = \{\s*$', line)
        if m:
            indent = m.group(1)
            boss_name = m.group(2).strip('"')
            # find instance context: previous addon.GuideData.mplus["Current"]["instance"] = {
            # scan backward
            inst_name = None
            for j in range(len(out_lines) - 1, -1, -1):
                im = re.search(r'addon\.GuideData\.mplus\["Current"\]\[([^\]]+)\] = \{', out_lines[j])
                if im:
                    inst_name = im.group(1).strip('"')
                    break
            # collect next few lines to determine type
            body = []
            k = i + 1
            while k < len(lines) and not (lines[k].strip() == indent + "}," or lines[k].strip() == indent + "}"):
                body.append(lines[k])
                k += 1
            close_line = lines[k] if k < len(lines) else ""
            # determine if BOSS
            is_boss = any('type = "BOSS"' in b for b in body)
            if is_boss and inst_name and inst_name in heroic_data and boss_name in heroic_data[inst_name]:
                text = heroic_data[inst_name][boss_name]
                # insert heroic line before tipsByDifficulty closing brace
                # find the line with the closing } of tipsByDifficulty (indent + "        }")
                inserted = False
                for idx in range(len(body)):
                    # look for lines that are just closing tipsByDifficulty
                    if re.match(r'^%s\}\s*,?$' % re.escape(indent + "        "), body[idx].strip()):
                        # insert before this line
                        body.insert(idx, indent + "        heroic = %s," % fmt_lua_string(text))
                        inserted = True
                        break
                if not inserted:
                    # append before final }
                    body.append(indent + "        heroic = %s," % fmt_lua_string(text))
            # append body and close
            out_lines.extend(body)
            if k < len(lines):
                out_lines.append(close_line)
                i = k
        i += 1
    return "\n".join(out_lines) + "\n"


src, gd = load(PATH)
new_src = inject(src, HEROIC)
with open(PATH, "w", encoding="utf-8") as f:
    f.write(new_src)

# verify counts
runner = lua.eval("function(src, addon) local f = load(src, 'g'); f('BossTips', addon); return addon end")
a = lua.table(); a["GuideData"] = lua.table()
for k in ("versions", "mplus", "raids", "meta", "versionInfo", "mplusInfo"): a["GuideData"][k] = lua.table()
runner(new_src, a)
data = lua_to_py(a)["GuideData"]["mplus"]["Current"]
cnt = {k: 0 for k in ["lfr", "normal", "heroic", "mythic", "mythicplus"]}
for inst, bosses in data.items():
    for bn, bd in bosses.items():
        if bd.get("type") == "BOSS":
            t = bd.get("tipsByDifficulty", {})
            for k in cnt:
                if t.get(k, "").strip():
                    cnt[k] += 1
print("Injected heroic. Current.lua difficulty counts:", cnt)
