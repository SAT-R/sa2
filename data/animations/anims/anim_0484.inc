
.align 2, 0
	anim_data__0484_0:
		mGetPalette 0x36 16 0xD0
		mGetTiles 0x19848 6
		.4byte	4, 0

		mGetPalette 0x36 16 0xD0
		mGetTiles 0x1984E 6
		.4byte	4, 1

		mGetPalette 0x36 16 0xD0
		mGetTiles 0x19854 6
		.4byte	4, 2

		mGetPalette 0x36 16 0xD0
		mGetTiles 0x1985A 6
		.4byte	4, 3

		mJumpBack 0x20


.align 2, 0
	anim_0484:
		.4byte anim_data__0484_0
