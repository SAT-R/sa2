

anim_data__0853_0:
	mGetTiles 0x232F7, 4
	mGetPalette 0x2, 16, 0x50
	.4byte	12, 0

	.4byte	12, 1

	.4byte	12, 2

	.4byte	12, 3

	mJumpBack 0xB


anim_0853:
	.4byte anim_data__0853_0
