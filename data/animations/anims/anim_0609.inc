
.align 2, 0
	anim_data__0609_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1B9FE 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0609_1:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA02 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0609:
		.4byte anim_data__0609_0
		.4byte anim_data__0609_1
