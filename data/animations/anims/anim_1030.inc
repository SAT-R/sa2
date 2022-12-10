
.align 2, 0
	anim_data__1030_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x271C3 32
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1030:
		.4byte anim_data__1030_0
