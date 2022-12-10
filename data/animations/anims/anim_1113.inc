
.align 2, 0
	anim_data__1113_0:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AC1C 84
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1113_1:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AC70 84
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1113_2:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2ACC4 84
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1113_3:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AD18 84
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1113_4:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AD6C 84
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1113:
		.4byte anim_data__1113_0
		.4byte anim_data__1113_1
		.4byte anim_data__1113_2
		.4byte anim_data__1113_3
		.4byte anim_data__1113_4
