

anim_ta_white_bar_variant_0:
	mGetPalette 0xAC 16 0x30
	mGetTiles 0x2B97A 4
	.4byte	1, 0

	mAnimCmd4 


anim_ta_white_bar:
	.4byte anim_ta_white_bar_variant_0
