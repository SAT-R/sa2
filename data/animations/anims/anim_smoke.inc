

anim_smoke_variant_0:
	mGetPalette 0x6E, 16, 0x40
	mGetTiles 0x1B00E, 6
	.4byte	4, 0

	mGetTiles 0x1B014, 6
	.4byte	4, 1

	mGetTiles 0x1B01A, 6
	.4byte	8, 2

	mGetTiles 0x1B020, 6
	.4byte	8, 3

	.4byte	1, -1

	mAnimCmd4 


anim_smoke:
	.4byte anim_smoke_variant_0
