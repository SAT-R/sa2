
.align 2, 0
	anim_data__1020_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26F41 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1020_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26F51 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1020_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26F61 26
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1020:
		.4byte anim_data__1020_0
		.4byte anim_data__1020_1
		.4byte anim_data__1020_2
