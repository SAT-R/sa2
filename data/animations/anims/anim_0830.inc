
.align 2, 0
	anim_data__0830_0:
		mGetPalette 0xD8 16 0xF0
		mGetTiles 0x22029 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0830_1:
		mGetPalette 0xD8 16 0xF0
		mGetTiles 0x22083 90
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0830:
		.4byte anim_data__0830_0
		.4byte anim_data__0830_1
