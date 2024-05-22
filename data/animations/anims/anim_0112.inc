

anim_data__0112_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x6618, 16
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	6, 0

	mGetTiles 0x6628, 16
	.4byte	3, 1

	mGetTiles 0x6638, 16
	.4byte	6, 2

	mGetTiles 0x6648, 16
	.4byte	6, 3

	mGetTiles 0x6658, 16
	.4byte	6, 4

	mGetTiles 0x6668, 16
	.4byte	6, 5

	mGetTiles 0x6678, 16
	.4byte	6, 6

	mGetTiles 0x6688, 16
	.4byte	6, 7

	mGetTiles 0x6698, 16
	.4byte	6, 8

	mGetTiles 0x66A8, 16
	.4byte	6, 9

	mJumpBack 0x28


anim_0112:
	.4byte anim_data__0112_0
