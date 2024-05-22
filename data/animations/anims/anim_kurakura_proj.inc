

anim_kurakura_proj_variant_0:
	mGetPalette 0x36, 16, 0xD0
	mGetTiles 0x1987E, 1
	.4byte	1, 0

	mAnimCmd4 


anim_kurakura_proj:
	.4byte anim_kurakura_proj_variant_0
