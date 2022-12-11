

anim_ta_record_variant_0:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x2891D 22
	.4byte	1, 0

	mAnimCmd4 

anim_ta_record_variant_1:
	mGetPalette 0xA3 16 0x60
	mGetTiles 0x28933 8
	.4byte	1, 1

	mAnimCmd4 


anim_ta_record:
	.4byte anim_ta_record_variant_0
	.4byte anim_ta_record_variant_1
