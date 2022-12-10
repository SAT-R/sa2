
.align 2, 0
	anim_data__0331_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1186D 64
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	5, 0

		mGetTiles 0x118AD 64
		.4byte	5, 1

		mGetTiles 0x118ED 64
		.4byte	5, 2

		mGetTiles 0x1192D 64
		.4byte	5, 3

		mGetTiles 0x1196D 64
		.4byte	5, 4

		mGetTiles 0x119AD 64
		.4byte	5, 5

		mGetTiles 0x119ED 64
		.4byte	5, 6

		mGetTiles 0x11A2D 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0331:
		.4byte anim_data__0331_0
