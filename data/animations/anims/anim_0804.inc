
.align 2, 0
	anim_data__0804_0:
		mGetPalette 0xCE 16 0x0
		mGetTiles 0x21561 168
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0804:
		.4byte anim_data__0804_0
