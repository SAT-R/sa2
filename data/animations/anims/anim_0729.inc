
.align 2, 0
	anim_data__0729_0:
		mGetPalette 0xA2 16 0x0
		mGetTiles 0x1D9E7 9
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0729:
		.4byte anim_data__0729_0
