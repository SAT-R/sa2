
.align 2, 0
	anim_data__0560_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x1AAEB 12
		.4byte	2, 0

		mGetTiles 0x1AAF7 12
		.4byte	2, 1

		mGetTiles 0x1AB03 12
		.4byte	2, 2

		mJumpBack 0x12


.align 2, 0
	anim_0560:
		.4byte anim_data__0560_0
