
.align 2, 0
	anim_data__0468_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x18274 6
		.4byte	4, 0

		mGetTiles 0x1827A 6
		.4byte	4, 1

		mGetTiles 0x18280 6
		.4byte	4, 2

		mGetTiles 0x18286 6
		.4byte	4, 3

		mGetTiles 0x18280 6
		.4byte	4, 2

		mGetTiles 0x1827A 6
		.4byte	4, 1

		mJumpBack 0x21


.align 2, 0
	anim_0468:
		.4byte anim_data__0468_0
