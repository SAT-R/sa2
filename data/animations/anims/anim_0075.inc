
.align 2, 0
	anim_data__0075_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4300 64
		mAnimCmd6 0x0 0x1007F9F9
		.4byte	2, 0

		mGetTiles 0x4340 64
		.4byte	2, 1

		mGetTiles 0x4380 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0075:
		.4byte anim_data__0075_0
