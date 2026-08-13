-- BossTips 版本数据占位文件（当前为空，不注册任何副本）
-- 用途：新增一个游戏大版本的攻略时，直接把数据写入本文件即可，
--       无需修改 BossTips.toc，也无需修改 BossTips.lua（主文件运行时自动发现版本）。
--
-- 需要写入的三部分：
--   1) 版本自注册（决定设置面板标签与扫描顺序，order 越小越先扫描 => 同名副本保留低版本）
--      addon.GuideData.versionInfo["18.0"] = { label = "18.0 资料片名", order = 18 }
--   2) 副本编号（Blizzard DB2：Map.db2 / JournalInstance.db2 / MapChallengeMode.db2）
--      addon.GuideData.meta["副本名"] = { mapID = 0, journalID = 0, challengeID = nil }
--   3) 攻略数据（type 必须显式标记为 "BOSS" 或 "MOB"）
--      addon.GuideData.versions["18.0"] = addon.GuideData.versions["18.0"] or {}
--      addon.GuideData.versions["18.0"]["副本名"] = {
--          ["首领名"] = { order = 1, type = "BOSS", tips = "..." },
--          ["小怪名"] = { order = 2, type = "MOB",  tips = "..." },
--      }
--
-- 重要：副本名必须与游戏内 GetInstanceInfo() 的返回值（Map.db2 的 MapName_lang）完全一致，
--       否则进入副本时插件无法匹配到攻略。
local _, addon = ...
addon.GuideData = addon.GuideData or {}
addon.GuideData.versions    = addon.GuideData.versions    or {}
addon.GuideData.mplus       = addon.GuideData.mplus       or {}
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.mplusInfo   = addon.GuideData.mplusInfo   or {}
addon.GuideData.meta        = addon.GuideData.meta        or {}
-- 本文件暂无数据。
