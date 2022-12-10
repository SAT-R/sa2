
.align 2, 0
	anim_data__0120_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6BC3 20
		.4byte	3, 0

		mGetTiles 0x6BD7 20
		.4byte	3, 1

		mGetTiles 0x6BEB 20
		.4byte	2, 2

		mGetTiles 0x6BFF 24
		.4byte	3, 3

		mGetTiles 0x6C17 24
		.4byte	3, 4

		mJumpBack 0xA


.align 2, 0
	anim_0120:
		.4byte anim_data__0120_0
