
.align 2, 0
	anim_data__0061_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3561 30
		mAnimCmd6 0x0 0xF06F1FA
		.4byte	8, 0

		mGetTiles 0x357F 30
		.4byte	8, 1

		mGetTiles 0x359D 30
		.4byte	8, 2

		mGetTiles 0x357F 30
		.4byte	8, 1

		mJumpBack 0x1A


.align 2, 0
	anim_0061:
		.4byte anim_data__0061_0
