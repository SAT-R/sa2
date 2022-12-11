

anim_press_start_msg_jp_variant_0:
	mGetPalette 0xE5 16 0xB0
	mGetTiles 0x2AAE2 46
	.4byte	1, 0

	mAnimCmd4 


anim_press_start_msg_jp:
	.4byte anim_press_start_msg_jp_variant_0
