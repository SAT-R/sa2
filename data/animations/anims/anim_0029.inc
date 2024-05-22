

anim_data__0029_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1B17, 20
	.4byte	3, 0

	mGetTiles 0x1B2B, 25
	.4byte	3, 1

	mGetTiles 0x1B17, 20
	.4byte	12, 0

	mGetTiles 0x1B44, 16
	.4byte	2, 2

	mGetTiles 0x1B54, 20
	.4byte	3, 3

	mGetTiles 0x1B68, 20
	.4byte	3, 4

	mJumpBack 0xA


anim_0029:
	.4byte anim_data__0029_0
