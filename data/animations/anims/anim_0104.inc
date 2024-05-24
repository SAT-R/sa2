

anim_data__0104_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x5F14, 20
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0x5F28, 24
	.4byte	2, 1

	mGetTiles 0x5F40, 28
	.4byte	2, 2

	mGetTiles 0x5F5C, 28
	.4byte	2, 3

	mGetTiles 0x5F78, 28
	.4byte	2, 4

	mJumpBack 0xF


anim_0104:
	.4byte anim_data__0104_0
