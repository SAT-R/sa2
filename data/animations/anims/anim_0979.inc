
.align 2, 0
	anim_data__0979_0:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26032 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0979_1:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26064 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0979_2:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26096 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0979_3:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x260C8 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0979_4:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x260FA 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0979_5:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x2612C 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0979_6:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x2615E 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0979_7:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26190 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0979_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x261C2 24
		.4byte	1, 8

		mAnimCmd4 


.align 2, 0
	anim_0979:
		.4byte anim_data__0979_0
		.4byte anim_data__0979_1
		.4byte anim_data__0979_2
		.4byte anim_data__0979_3
		.4byte anim_data__0979_4
		.4byte anim_data__0979_5
		.4byte anim_data__0979_6
		.4byte anim_data__0979_7
		.4byte anim_data__0979_8
