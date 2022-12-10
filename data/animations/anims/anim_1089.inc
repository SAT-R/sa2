
.align 2, 0
	anim_data__1089_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C27 6
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1089_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C2D 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1089_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C37 10
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1089_3:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C41 6
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1089_4:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C47 8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1089_5:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C4F 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1089_6:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C57 8
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_1089:
		.4byte anim_data__1089_0
		.4byte anim_data__1089_1
		.4byte anim_data__1089_2
		.4byte anim_data__1089_3
		.4byte anim_data__1089_4
		.4byte anim_data__1089_5
		.4byte anim_data__1089_6
