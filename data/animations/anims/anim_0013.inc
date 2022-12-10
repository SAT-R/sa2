
.align 2, 0
	anim_data__0013_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x11F2 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x1206 20
		.4byte	2, 1

		mGetTiles 0x121A 20
		.4byte	2, 2

		mGetTiles 0x122E 20
		.4byte	2, 3

		mGetTiles 0x1242 20
		.4byte	2, 4

		mJumpBack 0xF


.align 2, 0
	anim_0013:
		.4byte anim_data__0013_0
