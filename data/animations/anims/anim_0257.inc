

anim_data__0257_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0xE2DD 64
	mAnimCmd6 0x0 0x1304FFFA
	.4byte	2, 0

	mGetTiles 0xE31D 64
	.4byte	2, 1

	mGetTiles 0xE35D 64
	.4byte	2, 2

	mJumpBack 0x15


anim_0257:
	.4byte anim_data__0257_0
