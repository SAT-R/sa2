

anim_data__0071_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x3F48 25
	mAnimCmd6 0x0 0x1006F0FA
	.4byte	2, 0

	mGetTiles 0x3F61 25
	.4byte	2, 1

	mGetTiles 0x3F7A 25
	.4byte	2, 2

	mGetTiles 0x3F93 25
	.4byte	2, 3

	mGetTiles 0x3FAC 20
	.4byte	2, 4

	mGetTiles 0x3FC0 25
	.4byte	2, 5

	mGetTiles 0x3FD9 25
	.4byte	2, 6

	mGetTiles 0x3FF2 25
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0071_1:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x400B 30
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 8

	mGetTiles 0x4029 24
	.4byte	2, 9

	mGetTiles 0x4041 24
	.4byte	2, 10

	mGetTiles 0x4059 30
	.4byte	2, 11

	mGetTiles 0x4041 24
	.4byte	2, 10

	mGetTiles 0x4029 24
	.4byte	2, 9

	mJumpBack 0x24


anim_0071:
	.4byte anim_data__0071_0
	.4byte anim_data__0071_1
