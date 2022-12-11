

anim_yellow_star_variant_0:
	mGetPalette 0x6D 16 0xB0
	mGetTiles 0x1B00A 4
	.4byte	1, 0

	mAnimCmd4 


anim_yellow_star:
	.4byte anim_yellow_star_variant_0
