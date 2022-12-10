
.align 2, 0
	anim_data__1100_0:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4EB 6
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1100_1:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4F1 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1100_2:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4FB 10
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1100:
		.4byte anim_data__1100_0
		.4byte anim_data__1100_1
		.4byte anim_data__1100_2
