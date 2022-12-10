
.align 2, 0
	anim_data__0762_0:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F8D9 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0762_1:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F8FD 34
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0762_2:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F91F 34
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0762_3:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F941 36
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0762_4:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F965 34
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0762_5:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F987 36
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0762_6:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F9AB 32
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0762_7:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F9CB 10
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0762_8:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F9D5 38
		.4byte	1, 8

		mAnimCmd4 


.align 2, 0
	anim_0762:
		.4byte anim_data__0762_0
		.4byte anim_data__0762_1
		.4byte anim_data__0762_2
		.4byte anim_data__0762_3
		.4byte anim_data__0762_4
		.4byte anim_data__0762_5
		.4byte anim_data__0762_6
		.4byte anim_data__0762_7
		.4byte anim_data__0762_8
