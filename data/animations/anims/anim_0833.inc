
.align 2, 0
	anim_data__0833_0:
		mGetPalette 0xD8 16 0x30
		mGetTiles 0x22153 8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0833:
		.4byte anim_data__0833_0
