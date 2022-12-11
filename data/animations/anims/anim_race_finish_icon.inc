

anim_race_finish_icon_variant_0:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x23E16 4
	.4byte	1, 0

	mAnimCmd4 


anim_race_finish_icon:
	.4byte anim_race_finish_icon_variant_0
