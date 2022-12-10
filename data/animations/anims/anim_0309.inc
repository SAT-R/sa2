
.align 2, 0
	anim_data__0309_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10BF8 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0309_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10C0C 20
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0309_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10C20 20
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0309_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10C34 25
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0309:
		.4byte anim_data__0309_0
		.4byte anim_data__0309_1
		.4byte anim_data__0309_2
		.4byte anim_data__0309_3
