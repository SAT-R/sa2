
.align 2, 0
	anim_data__0858_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x23363 4
		.4byte	3, 0

		mGetTiles 0x23367 4
		.4byte	3, 1

		mGetTiles 0x2336B 4
		.4byte	3, 2

		mGetTiles 0x2336F 4
		.4byte	3, 3

		mGetTiles 0x23373 2
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0858:
		.4byte anim_data__0858_0
