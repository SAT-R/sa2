
.align 2, 0
	anim_data__1091_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C7D 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1091_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C89 12
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1091_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C95 8
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1091:
		.4byte anim_data__1091_0
		.4byte anim_data__1091_1
		.4byte anim_data__1091_2
