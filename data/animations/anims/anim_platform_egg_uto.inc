

anim_platform_egg_uto_variant_0:
	mGetPalette 0x7F 16 0xB0
	mGetTiles 0x1BABC 18
	mAnimCmd6 0x0 0xFC18F6E8
	.4byte	1, 0

	mJumpBack 0xB


anim_platform_egg_uto:
	.4byte anim_platform_egg_uto_variant_0
