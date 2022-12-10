
.align 2, 0
	anim_data__0243_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD2D9 28
		mAnimCmd6 0x0 0x405EEF9
		.4byte	8, 0

		mGetTiles 0xD2F5 28
		.4byte	8, 1

		mGetTiles 0xD311 28
		.4byte	8, 2

		mGetTiles 0xD2F5 28
		.4byte	8, 1

		mJumpBack 0x1A


.align 2, 0
	anim_0243:
		.4byte anim_data__0243_0
