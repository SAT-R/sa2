

anim_press_start_msg_en_variant_0:
	mGetPalette 0xE5 16 0xB0
	mGetTiles 0x2AB10 34
	.4byte	1, 0

	mAnimCmd4 


anim_press_start_msg_en:
	.4byte anim_press_start_msg_en_variant_0
