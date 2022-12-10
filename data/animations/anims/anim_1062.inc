
.align 2, 0
	anim_data__1062_0:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x28383 168
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1062_1:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x2842B 168
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1062_2:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x284D3 168
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1062:
		.4byte anim_data__1062_0
		.4byte anim_data__1062_1
		.4byte anim_data__1062_2
