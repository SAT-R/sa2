

anim_534_variant_0:
	mGetTiles 0x1A5CE, 6
	mGetPalette 0x2, 16, 0x50
	.4byte	12, 0

	.4byte	12, 1

	.4byte	12, 2

	mJumpBack 0x9


anim_534:
	.4byte anim_534_variant_0
