
.align 2, 0
	anim_data__0723_0:
		mGetPalette 0x9D 16 0x0
		mGetTiles 0x1D909 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0723_1:
		mGetPalette 0x9D 16 0x0
		mGetTiles 0x1D919 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0723_2:
		mGetPalette 0x9E 16 0x0
		mGetTiles 0x1D929 64
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0723:
		.4byte anim_data__0723_0
		.4byte anim_data__0723_1
		.4byte anim_data__0723_2
