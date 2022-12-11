

anim_data__0527_0:
	mGetPalette 0x44 16 0x80
	mGetTiles 0x1A4CB 4
	.4byte	8, 0

	mGetTiles 0x1A4CF 4
	.4byte	8, 1

	mGetTiles 0x1A4D3 4
	.4byte	8, 2

	mGetTiles 0x1A4CF 4
	.4byte	8, 1

	mJumpBack 0x17


anim_0527:
	.4byte anim_data__0527_0
