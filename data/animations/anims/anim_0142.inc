

anim_data__0142_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7AD8, 24
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0x7AF0, 20
	.4byte	2, 1

	mGetTiles 0x7B04, 24
	.4byte	4, 2

	mGetTiles 0x7B1C, 20
	.4byte	6, 3

	mGetTiles 0x7B30, 24
	.4byte	2, 4

	mAnimCmd4 

anim_data__0142_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7B48, 20
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 5

	mGetTiles 0x7B5C, 20
	.4byte	2, 6

	mGetTiles 0x7B70, 20
	.4byte	2, 7

	mGetTiles 0x7B84, 30
	mAnimCmd6 0x0, 0xA06F4FA
	mAnimCmd6 0x1, 0xA0600FA
	.4byte	3, 8

	mGetTiles 0x7BA2, 30
	.4byte	3, 9

	mGetTiles 0x7BC0, 30
	.4byte	3, 10

	mJumpBack 0x15


anim_0142:
	.4byte anim_data__0142_0
	.4byte anim_data__0142_1
