
.align 2, 0
	anim_data__0252_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDD83 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0xDD93 16
		.4byte	2, 1

		mGetTiles 0xDDA3 16
		.4byte	2, 2

		mGetTiles 0xDDB3 16
		.4byte	2, 3

		mGetTiles 0xDDC3 16
		.4byte	2, 4

		mGetTiles 0xDDD3 16
		.4byte	2, 5

		mGetTiles 0xDDE3 16
		.4byte	2, 6

		mGetTiles 0xDDF3 16
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0252:
		.4byte anim_data__0252_0
