
.align 2, 0
	anim_data__1128_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBB2 1
		.4byte	119, 0

		mGetTiles 0x2BBB3 1
		.4byte	4, 1

		mGetTiles 0x2BBB4 1
		.4byte	4, 2

		mGetTiles 0x2BBB5 1
		.4byte	4, 3

		mGetTiles 0x2BBB6 1
		.4byte	4, 4

		mGetTiles 0x2BBB2 1
		.4byte	119, 0

		mJumpBack 0x21


.align 2, 0
	anim_1128:
		.4byte anim_data__1128_0
