
.align 2, 0
	anim_data__0982_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x262B4 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0982_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x262C6 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0982_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x262D8 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0982_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x262EA 44
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0982_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26316 17
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0982:
		.4byte anim_data__0982_0
		.4byte anim_data__0982_1
		.4byte anim_data__0982_2
		.4byte anim_data__0982_3
		.4byte anim_data__0982_4
