

anim_speeding_platform_variant_0:
	mGetPalette 0x80, 16, 0xB0
	mGetTiles 0x1BA1D, 16
	mAnimCmd6 0x0, 0x3020E0E0
	.4byte	1, 0

	mAnimCmd4 


anim_speeding_platform:
	.4byte anim_speeding_platform_variant_0
