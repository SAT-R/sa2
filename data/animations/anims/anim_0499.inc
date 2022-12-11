

anim_data__0499_0:
	mGetPalette 0x3B 16 0xC0
	mGetTiles 0x19DAC 36
	mAnimCmd6 0x0 0xE015D5EC
	mAnimCmd6 0x1 0xFC0BE0F6
	.4byte	4, 0

	mGetTiles 0x19DD0 36
	.4byte	4, 1

	mGetTiles 0x19DAC 36
	.4byte	4, 0

	mGetTiles 0x19DF4 36
	.4byte	4, 2

	mJumpBack 0x1D


anim_0499:
	.4byte anim_data__0499_0
