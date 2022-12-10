
.align 2, 0
	anim_data__0881_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x23E1A 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 0

		mGetTiles 0x23E22 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 1

		mGetTiles 0x23E2A 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 2

		mGetTiles 0x23E32 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 3

		mGetTiles 0x23E3A 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 4

		mGetTiles 0x23E42 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 5

		mJumpBack 0x33


.align 2, 0
	anim_0881:
		.4byte anim_data__0881_0
