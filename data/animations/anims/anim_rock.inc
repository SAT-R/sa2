

anim_rock_variant_0:
	mGetPalette 0x4C 16 0x90
	mGetTiles 0x1AAAF 14
	.4byte	1, 0

	mAnimCmd4 


anim_rock:
	.4byte anim_rock_variant_0
