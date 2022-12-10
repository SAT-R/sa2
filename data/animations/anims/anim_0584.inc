
.align 2, 0
	anim_data__0584_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0C5 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0584_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0D1 6
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0584_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0D7 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0584_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0E3 6
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0584_4:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0E9 36
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0584_5:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B10D 25
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0584:
		.4byte anim_data__0584_0
		.4byte anim_data__0584_1
		.4byte anim_data__0584_2
		.4byte anim_data__0584_3
		.4byte anim_data__0584_4
		.4byte anim_data__0584_5
