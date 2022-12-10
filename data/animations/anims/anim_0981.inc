
.align 2, 0
	anim_data__0981_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26247 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0981_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26259 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0981_2:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x2626B 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0981_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2627D 38
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0981_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x262A3 17
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0981:
		.4byte anim_data__0981_0
		.4byte anim_data__0981_1
		.4byte anim_data__0981_2
		.4byte anim_data__0981_3
		.4byte anim_data__0981_4
