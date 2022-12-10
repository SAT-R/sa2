
.align 2, 0
	anim_data__1034_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x2724F 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1034_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27257 8
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1034:
		.4byte anim_data__1034_0
		.4byte anim_data__1034_1
