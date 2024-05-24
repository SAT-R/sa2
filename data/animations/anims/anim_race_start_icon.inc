

anim_race_start_icon_variant_0:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x23E12, 4
	.4byte	1, 0

	mAnimCmd4 


anim_race_start_icon:
	.4byte anim_race_start_icon_variant_0
