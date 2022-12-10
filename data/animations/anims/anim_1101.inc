
.align 2, 0
	anim_data__1101_0:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A505 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1101_1:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A50D 8
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1101_2:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A515 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1101_3:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A521 8
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1101_4:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A529 8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1101_5:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A531 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1101_6:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A539 8
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_1101:
		.4byte anim_data__1101_0
		.4byte anim_data__1101_1
		.4byte anim_data__1101_2
		.4byte anim_data__1101_3
		.4byte anim_data__1101_4
		.4byte anim_data__1101_5
		.4byte anim_data__1101_6
