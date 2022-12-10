
.align 2, 0
	anim_data__1081_0:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29346 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1081_1:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x293A0 57
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1081_2:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x293D9 39
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1081_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29400 60
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1081_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x2943C 60
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1081_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29478 60
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1081_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x294B4 18
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1081_7:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x294C6 18
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1081_8:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x294D8 69
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1081_9:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x2951D 69
		.4byte	1, 9

		mAnimCmd4 


.align 2, 0
	anim_1081:
		.4byte anim_data__1081_0
		.4byte anim_data__1081_1
		.4byte anim_data__1081_2
		.4byte anim_data__1081_3
		.4byte anim_data__1081_4
		.4byte anim_data__1081_5
		.4byte anim_data__1081_6
		.4byte anim_data__1081_7
		.4byte anim_data__1081_8
		.4byte anim_data__1081_9
