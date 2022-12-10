
.align 2, 0
	anim_data__1088_0:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29B84 72
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1088_1:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29BCC 75
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1088_2:
		mGetPalette 0x2D5 16 0x10
		mGetTiles 0x29C17 6
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1088_3:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29C1D 10
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1088:
		.4byte anim_data__1088_0
		.4byte anim_data__1088_1
		.4byte anim_data__1088_2
		.4byte anim_data__1088_3
