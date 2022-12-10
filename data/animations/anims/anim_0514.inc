
.align 2, 0
	anim_data__0514_0:
		mGetPalette 0x42 16 0xD0
		mGetTiles 0x1A3C3 16
		mAnimCmd6 0x0 0xB09F2F7
		mAnimCmd6 0x1 0x210FFF0
		.4byte	3, 0

		mGetTiles 0x1A3D3 16
		.4byte	3, 1

		mGetTiles 0x1A3E3 24
		.4byte	3, 2

		mGetTiles 0x1A3FB 24
		.4byte	3, 3

		mGetTiles 0x1A413 24
		.4byte	3, 4

		mGetTiles 0x1A42B 16
		.4byte	3, 5

		mJumpBack 0x27


.align 2, 0
	anim_0514:
		.4byte anim_data__0514_0
