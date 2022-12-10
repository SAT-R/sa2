
.align 2, 0
	anim_data__0204_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB318 25
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	6, 0

		mGetTiles 0xB331 24
		.4byte	3, 1

		mGetTiles 0xB349 30
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	6, 2

		mGetTiles 0xB367 30
		.4byte	6, 3

		mGetTiles 0xB385 30
		.4byte	6, 4

		mGetTiles 0xB3A3 30
		.4byte	6, 5

		mGetTiles 0xB349 30
		.4byte	6, 2

		mGetTiles 0xB367 30
		.4byte	6, 3

		mGetTiles 0xB385 30
		.4byte	6, 4

		mGetTiles 0xB3A3 30
		.4byte	6, 5

		mJumpBack 0x2B


.align 2, 0
	anim_0204:
		.4byte anim_data__0204_0
