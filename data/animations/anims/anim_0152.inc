
.align 2, 0
	anim_data__0152_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x846F 15
		mAnimCmd6 0x0 0x405EEF9
		.4byte	8, 0

		mGetTiles 0x847E 15
		.4byte	8, 1

		mGetTiles 0x848D 15
		.4byte	8, 2

		mGetTiles 0x847E 15
		.4byte	8, 1

		mJumpBack 0x1A


.align 2, 0
	anim_0152:
		.4byte anim_data__0152_0
