
.align 2, 0
	anim_data__0986_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26481 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0986_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26491 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0986_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x264A1 48
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0986_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x264D1 44
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0986:
		.4byte anim_data__0986_0
		.4byte anim_data__0986_1
		.4byte anim_data__0986_2
		.4byte anim_data__0986_3
