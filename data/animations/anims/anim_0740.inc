
.align 2, 0
	anim_data__0740_0:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1EFC4 54
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0740:
		.4byte anim_data__0740_0
