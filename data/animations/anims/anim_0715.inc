
.align 2, 0
	anim_data__0715_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D7C6 6
		.4byte	3, 0

		mGetTiles 0x1D7CC 6
		.4byte	3, 1

		mGetTiles 0x1D7D2 6
		.4byte	3, 2

		mGetTiles 0x1D7D8 9
		.4byte	3, 3

		mGetTiles 0x1D7E1 9
		.4byte	10, 4

		mGetTiles 0x1D7D8 9
		.4byte	3, 3

		mGetTiles 0x1D7D2 6
		.4byte	3, 2

		mGetTiles 0x1D7CC 6
		.4byte	3, 1

		mGetTiles 0x1D7C6 6
		.4byte	3, 0

		mJumpBack 0x30


.align 2, 0
	anim_0715:
		.4byte anim_data__0715_0
