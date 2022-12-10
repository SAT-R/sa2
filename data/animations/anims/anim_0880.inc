
.align 2, 0
	anim_data__0880_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x23E16 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0880:
		.4byte anim_data__0880_0
