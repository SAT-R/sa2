
.align 2, 0
	anim_data__0829_0:
		mGetPalette 0xD7 16 0x30
		mGetTiles 0x21FAB 63
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0829_1:
		mGetPalette 0xD7 16 0x30
		mGetTiles 0x21FEA 63
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0829:
		.4byte anim_data__0829_0
		.4byte anim_data__0829_1
