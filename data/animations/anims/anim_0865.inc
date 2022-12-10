
.align 2, 0
	anim_data__0865_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x23458 4
		.4byte	3, 0

		mGetTiles 0x2345C 4
		.4byte	3, 1

		mGetTiles 0x23460 4
		.4byte	3, 2

		mGetTiles 0x23464 4
		.4byte	3, 3

		mGetTiles 0x23468 4
		.4byte	3, 4

		mGetTiles 0x2346C 4
		.4byte	3, 5

		mGetTiles 0x23470 4
		.4byte	3, 6

		mGetTiles 0x23474 4
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0865:
		.4byte anim_data__0865_0
