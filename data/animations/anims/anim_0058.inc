
.align 2, 0
	anim_data__0058_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3111 64
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	5, 0

		mGetTiles 0x3151 64
		.4byte	5, 1

		mGetTiles 0x3191 64
		.4byte	5, 2

		mGetTiles 0x31D1 64
		.4byte	5, 3

		mGetTiles 0x3211 64
		.4byte	5, 4

		mGetTiles 0x3251 64
		.4byte	5, 5

		mGetTiles 0x3291 64
		.4byte	5, 6

		mGetTiles 0x32D1 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0058:
		.4byte anim_data__0058_0
