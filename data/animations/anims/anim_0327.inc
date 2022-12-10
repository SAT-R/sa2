

anim_data__0327_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x1160B 20
	mAnimCmd6 0x0 0x1208F2F8
	.4byte	1, 0

	mGetTiles 0x1161F 25
	mAnimCmd6 0x0 0xE08F1F8
	.4byte	2, 1

	mGetTiles 0x11638 20
	.4byte	2, 2

	mGetTiles 0x1164C 25
	.4byte	2, 3

	mJumpBack 0x12

anim_data__0327_1:
	mGetPalette 0x16 16 0x0
	mGetTiles 0x11665 25
	mAnimCmd6 0x0 0xE06F0FA
	.4byte	2, 4

	mGetTiles 0x1167E 25
	.4byte	2, 5

	mGetTiles 0x11697 25
	.4byte	2, 6

	mGetTiles 0x116B0 30
	.4byte	2, 7

	mGetTiles 0x116CE 30
	.4byte	2, 8

	mGetTiles 0x116EC 30
	.4byte	2, 9

	mGetTiles 0x1170A 30
	.4byte	2, 10

	mGetTiles 0x11728 30
	.4byte	2, 11

	mJumpBack 0xF


anim_0327:
	.4byte anim_data__0327_0
	.4byte anim_data__0327_1
