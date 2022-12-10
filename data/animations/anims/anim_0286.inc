
.align 2, 0
	anim_data__0286_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF987 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0xF9A5 30
		.4byte	2, 1

		mGetTiles 0xF9C3 30
		.4byte	2, 2

		mGetTiles 0xF9E1 30
		.4byte	2, 3

		mGetTiles 0xF9FF 30
		.4byte	2, 4

		mJumpBack 0xF


.align 2, 0
	anim_0286:
		.4byte anim_data__0286_0
