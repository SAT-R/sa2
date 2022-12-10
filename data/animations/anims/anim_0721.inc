
.align 2, 0
	anim_data__0721_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D8FF 1
		.4byte	3, 0

		mGetTiles 0x1D900 1
		.4byte	3, 1

		mGetTiles 0x1D901 1
		.4byte	3, 2

		mGetTiles 0x1D902 1
		.4byte	3, 3

		mGetTiles 0x1D903 1
		.4byte	3, 4

		mJumpBack 0x1C


.align 2, 0
	anim_0721:
		.4byte anim_data__0721_0
