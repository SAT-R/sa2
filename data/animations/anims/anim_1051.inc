
.align 2, 0
	anim_data__1051_0:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275B3 22
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1051_1:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275C9 32
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1051_2:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275E9 22
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1051_3:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275FF 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1051_4:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x27615 10
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1051_5:
		mGetPalette 0x2C7 16 0x70
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_1051:
		.4byte anim_data__1051_0
		.4byte anim_data__1051_1
		.4byte anim_data__1051_2
		.4byte anim_data__1051_3
		.4byte anim_data__1051_4
		.4byte anim_data__1051_5
