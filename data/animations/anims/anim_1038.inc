
.align 2, 0
	anim_data__1038_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x2729B 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1038_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x272A3 12
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1038:
		.4byte anim_data__1038_0
		.4byte anim_data__1038_1
