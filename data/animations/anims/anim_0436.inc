
.align 2, 0
	anim_data__0436_0:
		mGetPalette 0x23 16 0x0
		mGetTiles 0x1764D 18
		mAnimCmd6 0x0 0xA0BF0FE
		.4byte	3, 0

		mGetTiles 0x1765F 24
		mAnimCmd6 0x0 0xA00F0F4
		.4byte	3, 1

		mGetTiles 0x17677 30
		mAnimCmd6 0x0 0xAFAF0EC
		.4byte	3, 2

		mGetTiles 0x17695 24
		mAnimCmd6 0x0 0xAFEF0F0
		.4byte	3, 3

		mGetTiles 0x176AD 18
		mAnimCmd6 0x0 0xA04F0F8
		.4byte	3, 4

		mGetTiles 0x176BF 24
		mAnimCmd6 0x0 0xA12F004
		.4byte	3, 5

		mGetTiles 0x176D7 30
		mAnimCmd6 0x0 0xA13F004
		.4byte	3, 6

		mGetTiles 0x176F5 24
		mAnimCmd6 0x0 0xA12F002
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0436:
		.4byte anim_data__0436_0
