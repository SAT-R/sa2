

anim_data__0037_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x23ED, 15
	.4byte	3, 0

	mGetTiles 0x23FC, 20
	.4byte	3, 1

	mGetTiles 0x2410, 25
	.4byte	3, 2

	mGetTiles 0x2429, 20
	.4byte	3, 3

	mGetTiles 0x243D, 15
	.4byte	3, 4

	mGetTiles 0x244C, 20
	.4byte	3, 5

	mGetTiles 0x2460, 25
	.4byte	3, 6

	mGetTiles 0x2479, 20
	.4byte	3, 7

	mJumpBack 0x2B

anim_data__0037_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x248D, 20
	.4byte	3, 8

	mGetTiles 0x24A1, 20
	.4byte	3, 9

	mGetTiles 0x24B5, 30
	.4byte	3, 10

	mGetTiles 0x24D3, 25
	.4byte	3, 11

	mGetTiles 0x24EC, 20
	.4byte	3, 12

	mGetTiles 0x2500, 25
	.4byte	3, 13

	mGetTiles 0x2519, 30
	.4byte	3, 14

	mGetTiles 0x2537, 25
	.4byte	3, 15

	mJumpBack 0x2B


anim_0037:
	.4byte anim_data__0037_0
	.4byte anim_data__0037_1
