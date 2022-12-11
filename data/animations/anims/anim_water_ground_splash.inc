

anim_water_ground_splash_variant_0:
	mGetPalette 0x2 16 0x50
	mGetTiles 0x1AAEB 12
	.4byte	2, 0

	mGetTiles 0x1AAF7 12
	.4byte	2, 1

	mGetTiles 0x1AB03 12
	.4byte	2, 2

	mJumpBack 0x12


anim_water_ground_splash:
	.4byte anim_water_ground_splash_variant_0
