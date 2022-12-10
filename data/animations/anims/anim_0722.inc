
.align 2, 0
	anim_data__0722_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D904 1
		.4byte	3, 0

		mGetTiles 0x1D905 1
		.4byte	3, 1

		mGetTiles 0x1D906 1
		.4byte	3, 2

		mGetTiles 0x1D907 1
		.4byte	3, 3

		mGetTiles 0x1D908 1
		.4byte	3, 4

		mJumpBack 0x1C


.align 2, 0
	anim_0722:
		.4byte anim_data__0722_0
