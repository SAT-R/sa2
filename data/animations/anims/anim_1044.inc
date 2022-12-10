
.align 2, 0
	anim_data__1044_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x27313 28
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1044:
		.4byte anim_data__1044_0
