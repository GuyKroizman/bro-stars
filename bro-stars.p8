pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include scenegameover.lua
#include enemy.lua
#include scenegame.lua
#include main.lua


__gfx__
0000000000c00c0000c0000000c00c0000c00c00c0000c00c00000c0000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c00c00000c00c000c00c0000c00c000c000c0000000c00000000000000000000000000000000000000000000000000000000000000000000000000
0070070000c00c00c00cccc000c00c0000000c0000000c0000000000000aac00000aa00000000000000000000000000000000000000000000000000000000000
0007700000cccc000ccccc0000cc0c0000c00c00009999000098880000a99a0000a99a00000aa000000000000009900000000000000000000000000000000000
00077000cccccccc00ccccc0cccc0cccccc88c0c0098880c0989980c0a9889a00a9889a000a99a00000aa0000009900000000000000000000000000000000000
007007000cccccc000ccc0000cc0ccc00cc8ccc0ccc88cc000888c80c0a99a00c0a99a00000aa000000000000000000000000000000000000000000000000000
0000000000c00c000cc0c00000c9a90000c9a9000cc9a000ccc9a00000caac00000aa00000000000000000000000000000000000000000000000000000000000
000000000000000000000000009a9000009a9000000000000c0000000c0000000c00000000000000000000000000000000000000000000000000000000000000
00000000000880000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000088000ccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000888800000ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008888880000ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088888888ccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008008000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008888000008800000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000008800000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000008800000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008888000088880000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888800888888008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888888888888888888800888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008008000080080000800800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088008800000000000800800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111188111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111188111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111177117711771777177711188111177117771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111711171117171717171111788811117111171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111777171117171771177118888881117117771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111117171117171717171188788888117117111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111771117717711717177711811811177717771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111188111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11118811111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11118811111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11118811111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11188881111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11888888111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
18888888811111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11181181111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11118811111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111881111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111188111111111111111111111111881111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111188111111111111111111111111881111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111118811111111111111111111111888811111111111111111111111111111111111111111111111111111111cc1c111111111111
11111111111111111111111111888811111111111111111111188888811111111111111111111111111111111111111111111111111111111ccc111111111111
11111111111111111111111118888881111111111111111111888888881111111111111111111111111111111111111111111111111111111ccccc1111111111
1111111111111111111111118888888811111111111111111111811811111111111111111111111111111111111111111111111111111111ccccc11111111111
111111111111111111111111118118111111111111111111111118811111111111111111111111111111111111111111111111111111111991cccc1111111111
111111111111111111111111111881111111111111111111111111111111111111111111111111111111111111111111111111111111111991c11c1111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111c11111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111881881111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111881881111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111881881111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111118888888111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111188888888811111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111888888888881111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111118118118111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111881881111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111188111111111111111111111111111111111111111111111111119911111111111111111111111111111
11111111111111111111111111111111111111111111188111111111111111111111111111111111111111111111111119911111111111111111111111111111
11111111111111111111111111111111111111111111188111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111188111111111111888811111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111188111111111118888881111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111188111111111188888888111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111888811111111111811811111111188111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111118888881111111111188111111111188111111111111111881111111111111111111111111111111111111111111111111111
11111111111111111111111111188888888111111111111111111111188111111111111111881111111111111111111111111111111111111111111111111111
11111111111111111111111111111811811111111111111111111111888811111111111111881111111111111111111111111111111111111111111111111111
11111111111111111111111111111188111111111111111111111118888881111111111118888111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111188888888111111118888888811111111111111111111111111111111111111111111111111
11111111111111111881111111111111111111111111111111111111811811111111118888888881111111111111111111111111111111111111111111111111
11111188111188111881111111111111111111111111111111111111188111111111118888118111111111111111111111111111111111111111111111111111
11111188111188111881111111111111111111111111111111111111111111118811188888881111111111111111111111111111111111111111111111111111
11111188111188118888111111111111111111111111111111111111111111118811888888811111119911111111111111881111111111111111111111111111
11111888811888888888811111111111111111111111111111111111111111118818888888881111119911111188111111881111111111111111111111111111
11118888888888888888881111111111111111111111111111111111111111188881188888888111111111111188111111881111111111111111111111111111
11188888888888888118111111111111111881111111111111111111111111888888118811811111111111111188111118888111111111111111111111111111
11111811811811811881111111111111111881111111111111111111111118888888811188111111111111111888811188888811111111111111111111111111
11111188111188111111111111111111111881111111111111111111111111181181111111111111111111118888881888888881111111111111111111111111
11111111111111111111111111111111118888111111111111881111111111118811111111111111111111188888888118118111111111111111111111111111
11111111111111111111111111111111188888811111111111881111111111111111111111111111111111111811811111881111111111111111111111111111
11111111111111111111111111111111888888881111111111881111111111111111111111111111111111111188111111111111111111111111111111111111
11111111111111111111111111111111118118111111111118888111111111111111111111111111111111111881111111111111111111188111111111111111
11111111111111111111111111111111111881111111111188888811111111111111111111111111111111111881111111111111111111188111111111111111
11111111111111111111111111111111111111111111111888888881111111111881111111111111111111111881111111111111111111188111111111111111
11111111111111111111111111111111111111111111111118118111111111111881111111111111111111118888111111111111111111888811111111111111
11111111111111111111111111111111111111111111111111881111111111111881111111111111111111188888811111111111111118888881111111111111
11111111111111111111111111111111111111111111111111111111111111118888991111111111111111888888881111111111111188888888111111111111
11111111111111111111111111111111111111111111111111111111111111188888891111111111111111188118111111111111111111811811111111111111
11111111111111111111111111111111111111111111111111111111111111888888881111111111111111888881111111111111111881188111111111111111
11111111111111111111111111111111111111111111111111111111111111118118111111111111111118888881111111111111111881111111111111111111
11188111111111111111111111111111111111111111111111111111111111111881111111111111111188888888111111111111111881111111111111111111
11188111111111111111111111111111111111111111111111111111111111111111111111111111111111811811111111111111118888111111111111111111
11188111111111111111111111111111111111111111111111111111111111111111111111111111111111188111111111111111188888811111111111111111
11888811111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111888888881111111111111111
18888881111111111111111111111111111111111111111111111111111111188111111111111111111881111111111111111111118118111111111111111111
88888888111111111111111111111111111111111111111111111111111111188111111111111111111881111111111111111111111881111111111111111111
11811811111111111188111111111111111111111111111111111111111111188111111111111111111881111111111111111111111111111111111111111111
11188111111111111188111111111111111111111111111111111111111881888811111111111111118888111111111111111111111111111111111111111111
11111111111111111188111111111111111111111111111111111111111888888881111111111111188888811111111111111111111111111111111111111111
11111111111111111888811111111111111111111188111111111111111888888888111111111111888888881111111111111111111111111111111111111111
11111111111111118888881881111111111111111188111111111199118888811811111111111111118118111111111111111111111111111111111111111111
11111111188111188888888881111111111111111188111111111199888888888111111111111111111881111111111111111111111111111111111111111111
11111111188111111811811881111111111111111888811111111111888888881111111111111111111111111111111111111111111111111111111111111111
11111111188111111188118888111111111111118888881111111111888118111111111111111111111111111111111111111111111111111111111111111111
11111111888811111111188888811111111111188888888111111118888881111111111111111111111111111111111111111111111111111111111111111111
11111118888881111111888888881111111111111811881111111188888811111111111111111111111111111111111111111111111111111111111111111111
11111188888888111111118118111111111111111188888111111888888881111111111111111111111111111111111111111111111111111111111111111111
11111111811811111111111881111111111111111188888811111118118111111111111111111111111111111111111111111111111111111111111111111111
11111111188111111111111111111111111111111888888881111111881111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111118118111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111881111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111118811111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111188111111111111111111111111111111111118811111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111188111111111111111111111111111111111118811111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111188111111111111111111111111111111111188881111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111888811111111111111111111111111111111888888111111111111111111111111111111111111111111
11111111111111111111111111111111111111111118888881111111111111111111111111111118888888811111111111111111111111111111111111111111
11111111111111111111111111111111111111111188888888111111881111111111111111111111181181111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111811811111111881111111111111118811111118811111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111188111111111881111111111111118811111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111118811111111111118888111111111111118811111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111118811111111111188888811111111111188881111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111118811111111111888888881111111111888888111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111188881111111111118118111111111118888888811111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111888888111111881111881111111111111181181111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111118888888811111881111111111111111111118811111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111181181111111881111111111111111188111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111118811111118888111111111111111188111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111188888811111111111111188111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111888888881111111111111888811111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111118118111111111111118888881111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111881111111111111188888888111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111811811111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111188111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0031310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000080000000000000275502855028550285502655025550215501e5501b550185501e550115500e550095500a5500455002550005500a5500a5500a5500a5500a5500a550000000000000000000000000000000
000000002815027150261502515024150211501f1501c150191501a15019150181501715017150181501a1501f150221502315023150221501f1501b150181501715014150141501315000000000000000000000
000200002625023250212501f2501d2501b2501925018250182500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000000001f3501d3501a35016350133501135011350103500f3500f350000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100002a6502a65029650296502a6502d6502f650316503365033650316502f6502c650276502465022650206501f6501f6501b65015650116500d6500b6500765005650036500365003650036500365003650
000c00002b750247502d7503d75000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002000001895000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
