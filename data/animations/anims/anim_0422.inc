
.align 2, 0
	anim_data__0422_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x168A1 64
		mAnimCmd6 0x0 0x806F4FA
		.4byte	5, 0

		mGetTiles 0x168E1 64
		.4byte	5, 1

		mGetTiles 0x16921 64
		.4byte	5, 2

		mGetTiles 0x16961 64
		.4byte	5, 3

		mGetTiles 0x169A1 64
		.4byte	5, 4

		mGetTiles 0x169E1 64
		.4byte	5, 5

		mGetTiles 0x16A21 64
		.4byte	5, 6

		mGetTiles 0x16A61 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0422:
		.4byte anim_data__0422_0
