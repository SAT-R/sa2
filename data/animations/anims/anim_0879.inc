
.align 2, 0
	anim_data__0879_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x23E12 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0879:
		.4byte anim_data__0879_0
