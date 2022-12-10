
.align 2, 0
	anim_data__1015_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26E3F 32
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1015_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x26E5F 36
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1015_2:
		mGetPalette 0x2B6 16 0x10
		mGetTiles 0x26E83 36
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1015:
		.4byte anim_data__1015_0
		.4byte anim_data__1015_1
		.4byte anim_data__1015_2
