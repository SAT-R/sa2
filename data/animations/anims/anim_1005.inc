
.align 2, 0
	anim_data__1005_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A01 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1005_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A29 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1005_2:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A51 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1005_3:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A79 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1005_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26AA1 34
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1005:
		.4byte anim_data__1005_0
		.4byte anim_data__1005_1
		.4byte anim_data__1005_2
		.4byte anim_data__1005_3
		.4byte anim_data__1005_4
