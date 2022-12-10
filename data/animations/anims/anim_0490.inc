
.align 2, 0
	anim_data__0490_0:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198B3 6
		mAnimCmd6 0x0 0xCEEF4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0490_1:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198B9 6
		mAnimCmd6 0x0 0xC00F5EE
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0490:
		.4byte anim_data__0490_0
		.4byte anim_data__0490_1
