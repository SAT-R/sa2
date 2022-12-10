
.align 2, 0
	anim_data__0549_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA90 4
		.4byte	5, 0

		mGetTiles 0x1AA94 4
		.4byte	5, 1

		mGetTiles 0x1AA98 4
		.4byte	5, 2

		mGetTiles 0x1AA9C 4
		.4byte	5, 3

		mGetTiles 0x1AAA0 4
		.4byte	5, 4

		mGetTiles 0x1AAA4 4
		.4byte	5, 5

		mGetTiles 0x1AA98 4
		.4byte	5, 2

		mGetTiles 0x1AA9C 4
		.4byte	5, 3

		mJumpBack 0x2B


.align 2, 0
	anim_0549:
		.4byte anim_data__0549_0
