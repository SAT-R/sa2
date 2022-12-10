
.align 2, 0
	anim_data__0867_0:
		mGetPalette 0x9F 16 0x0
		mGetTiles 0x23498 4
		.4byte	3, 0

		mGetTiles 0x2349C 4
		.4byte	3, 1

		mGetTiles 0x234A0 4
		.4byte	3, 2

		mGetTiles 0x234A4 4
		.4byte	3, 3

		mGetTiles 0x234A8 4
		.4byte	3, 4

		mGetTiles 0x234AC 4
		.4byte	3, 5

		mGetTiles 0x234B0 4
		.4byte	3, 6

		mGetTiles 0x234B4 4
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0867:
		.4byte anim_data__0867_0
