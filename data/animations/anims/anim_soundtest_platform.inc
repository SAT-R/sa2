

anim_soundtest_platform_variant_0:
	mGetPalette 0x2C0 16 0x60
	mGetTiles 0x255A8 20
	.4byte	1, 0

	mAnimCmd4 


anim_soundtest_platform:
	.4byte anim_soundtest_platform_variant_0
