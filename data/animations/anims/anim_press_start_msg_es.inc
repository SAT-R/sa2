

anim_press_start_msg_es_variant_0:
	mGetPalette 0xE5 16 0xB0
	mGetTiles 0x2AB86 30
	.4byte	1, 0

	mAnimCmd4 


anim_press_start_msg_es:
	.4byte anim_press_start_msg_es_variant_0
