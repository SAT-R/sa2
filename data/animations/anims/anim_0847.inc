
.align 2, 0
	anim_data__0847_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x22F11 20
		.4byte	2, 0

		mGetTiles 0x22F25 20
		.4byte	2, 1

		mGetTiles 0x22F39 16
		.4byte	2, 2

		mGetTiles 0x22F49 20
		.4byte	2, 3

		mJumpBack 0x17


.align 2, 0
	anim_0847:
		.4byte anim_data__0847_0
