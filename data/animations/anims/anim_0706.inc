
.align 2, 0
	anim_data__0706_0:
		mGetPalette 0x9C 16 0x80
		mGetTiles 0x1D5EB 1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0706:
		.4byte anim_data__0706_0
