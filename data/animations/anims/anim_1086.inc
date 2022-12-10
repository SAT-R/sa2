
.align 2, 0
	anim_data__1086_0:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29A49 51
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1086_1:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29A7C 72
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1086_2:
		mGetPalette 0x2D5 16 0x10
		mGetTiles 0x29AC4 10
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1086_3:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29ACE 14
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1086:
		.4byte anim_data__1086_0
		.4byte anim_data__1086_1
		.4byte anim_data__1086_2
		.4byte anim_data__1086_3
