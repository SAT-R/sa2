

anim_water_splash_variant_0:
	mGetPalette 0x2, 16, 0x50
	mGetTiles 0x1A598, 18
	.4byte	2, 0

	mGetTiles 0x1A5AA, 18
	.4byte	2, 1

	mGetTiles 0x1A5BC, 18
	.4byte	2, 2

	mJumpBack 0x12


anim_water_splash:
	.4byte anim_water_splash_variant_0
