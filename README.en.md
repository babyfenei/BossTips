### BossTips World of Warcraft One-Sentence Strategy Addon

First of all, I would like to thank the elder brother nga_ 以德报德 for the addon. I only made modifications and improved the current boss and trash mob data for Version 11 on the basis of his addon.

The original post address of 以德报德 is as follows: [url=https://ngabbs.com/read.php?tid=41626672]Late Dungeon One-Sentence Strategy Addon (Including data for 8 new 5-player dungeons in the War Within and the first 4 bosses in the raid)[/url]

The modified addon retains the original author's copyright and link information. You can also check it in the original author's post. If elder brother 以德报德 has any questions, this post can be deleted.

The reason for opening another post is to re-improve this addon and keep it updated in the future, because few people will scroll to the later part in the original author's post to check.

Usage method refers to the content of the original post:
Usage:
When you are in a dungeon, a button will appear near your chat box. If you haven't selected a boss, it will be disabled and display "No strategy".
If you select a boss, a box will appear with the boss strategy inside. Click "Send" to send the strategy of the selected boss to the corresponding channel.

The following contents have been modified and added to the original addon:
1. Added boss and trash mob strategies for all 5-player mythic+ and 5-player dungeons in Version 11.0 (mainly focusing on trash mobs' must-interrupt skills and one-hit kill skills).
2. The one-sentence strategy box is set to be collapsed by default (some people may feel that it blocks the game interface if it is always displayed).
3. Because of the above default collapsed state, added right-click to display (the positions of the three buttons: collapse, expand are the same). Send the strategy directly in a yell form.
4. In the expanded state, left-clicking the send button will send to the raid > party > say channel. This automatically judges the sending channel according to the current team size. If the team size is more than 5, it will be sent to the raid channel; 1-5 people, to the party channel; 1 person, to the say channel.
5. In the expanded state, right-clicking the send button will send the strategy to the yell channel.
6. Added the boss or trash mob name in the first line of all boss data, separated by {rt8} skull markers on both sides.
7. Marked key skills that need to be interrupted and others with {rt1} star icons.
8. In the personal expanded state, automatically delete the above {rt1}, {rt8} and other icons and replace || with line breaks for easy reading.
9. Fixed the problem of the order of strategy sending. Now it will be sent one by one in the order of the tips, and there will be no order errors.
10. Since there is no team test for the team sending function, whether it can be correctly sent to the raid channel remains to be tested.
11. Since this version is mainly focused on the Underhold, there is almost no play of M dungeons and raids. So whether the strategies for each boss and trash mob in this addon are correct remains to be tested.

Version 1.2.3 Update:
1. Added the function to move the button. The default button position is above the chat box. It can be moved after going online, and the position information will be saved to the wtf folder after moving. The modified position will be used when going online again and switching to other alts.
2. Added the function to move the strategy window. The default position of the strategy window is above the chat box. It can be moved after going online, and the position information will be saved to the wtf folder after moving. The modified position will be used when going online again and switching to other alts.
3. Added the function to adjust the size of the strategy window. You can click the lower right corner to adjust the window size.

Version 1.2.4 Update Preview:
1. Add mythic+ and raid related strategy data for Version 11.1.
2. Add map judgment function. The strategy button will be displayed when in a map with existing strategies. It will not be displayed in other maps (this function is pending).

Version 1.2.5 Update:
1. Added mythic+ strategy data for Version 11.1.
2. Some data of trash mobs in 11.1 mythic+ need to be actually tested in the dungeon. Only boss strategies are added temporarily.
3. The strategies are collected online and have not been tested in the dungeon. If some strategies cannot be displayed or are wrong, you can feedback by following the post.

Version 1.2.6 Update:
1. Added some trash mob strategy data for 11.1 mythic+ (excluding the workshop for the time being).
2. The strategies for Version 11.1 are basically summarized by myself through the video strategies of Bilibili UP 羽帆. There may be omissions. You can modify the relevant monster data in the addon's BossTips.lua file by yourself.

Version 1.2.7 Update:
1. Fixed the problem that the暴富矿区 cannot be loaded normally.

Version 1.2.8 Update:
1. Added the function to adjust the font size of the strategy. Left-click to increase the font size. Right-click to decrease the font size. The default font size is 18, and the adjustment range is 12-32.
2. Fixed the problem that King Mechagon cannot be loaded correctly.
3. Fixed the problem of garbled display under some fonts.

Version 1.2.9 Update:
1. Added mythic+ strategy data for Version 11.2, including Streetwise,宏图,生态园, and Hall of Atonement.
2. At present, all are manually sorted out according to the video strategies of Bilibili "于笙Ace". Some strategies may have errors or differences. You can submit corrections in the forum or gitee.
3. There is no data for trash mobs in the生态园 for the time being because there is no test server account.
4. The 4 old dungeons rotated in Season 11.2 still have the old strategies, which will be updated later depending on the time.

Please refer to the following pictures for the specific effects:
[img]./mon_202410/10/7mQ91mg-79yuZcT1kScp-gj.jpg[/img]
[img]./mon_202410/10/7mQ91mg-kfo7ZgT1kSci-gl.jpg[/img]
[img]./mon_202410/10/7mQ91mg-9uo4ZfT1kSbz-g8.jpg[/img]

In addition, thanks to the following WA authors or translation experts:
1. 艾泽拉斯制造 for [url=https://bbs.nga.cn/read.php?tid=41807459&fav=:F3C48B05C]Mythic+ Cheat Sheet for Elderly Players (Thanks to LoRexxar's teaching video sharing)[/url]. Trash mob and some boss information is referenced from this post.
2. 沢田岚 for [url=https://bbs.nga.cn/read.php?tid=41712204&fav=:FA99311C2][WA] Chinese Localization of One-Sentence Strategies in Front of All Mythic+ Bosses[/url]. Some boss information is referenced from this post.
3. Fizzle's [url=https://wago.io/VLiBvdxoU]TWW Season 1 Dungeon Boss Strats[/url]. This WA is the one-sentence strategies for all mythic+ dungeon bosses in Version 11.0 (all in English), some of which are translated and referenced.
4. Bilibili UP 羽帆 [url=https://space.bilibili.com/141341784][/url] for 11.1 video strategies.
5. Bilibili UP 于笙Ace [url=https://space.bilibili.com/506324721]for 11.2 video strategies[/url].

In addition, I have submitted this addon to gitee. If you need to modify or add boss or trash mob information, you can submit Issues to gitee, and I will update it. The submission format is as follows:
Boss/Trash Mob Name - Strategy
For example: Durotar Raider - Stink Spray must be interrupted
Of course, you can also reply by following this post.
[url=https://gitee.com/fenei/BossTips]Gitee Address[/url]