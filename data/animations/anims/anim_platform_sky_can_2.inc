

anim_platform_sky_can_2_variant_0:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1B428, 18
	mAnimCmd6 0x0, 0xFC18F6E8
	.4byte	1, 0

	mAnimCmd4 


anim_platform_sky_can_2:
	.4byte anim_platform_sky_can_2_variant_0
