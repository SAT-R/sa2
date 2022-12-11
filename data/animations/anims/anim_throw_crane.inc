

anim_throw_crane_variant_0:
	mGetPalette 0x64 16 0xB0
	mGetTiles 0x1AB54 64
	.4byte	1, 0

	mAnimCmd4 


anim_throw_crane:
	.4byte anim_throw_crane_variant_0
