
.align 2, 0
	anim_data__0553_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x1AABD 12
		.4byte	3, 0

		mGetTiles 0x1AAC9 12
		.4byte	4, 1

		mGetTiles 0x1AAD5 12
		.4byte	5, 2

		mGetTiles 0x1AAE1 6
		.4byte	6, 3

		mAnimCmd4 


.align 2, 0
	anim_0553:
		.4byte anim_data__0553_0
