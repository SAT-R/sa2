
.align 2, 0
	anim_data__0000_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x0 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	6, 0

		mGetTiles 0x14 16
		.4byte	6, 1

		mGetTiles 0x24 16
		.4byte	6, 2

		mGetTiles 0x34 16
		.4byte	6, 3

		mGetTiles 0x44 20
		.4byte	6, 4

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mGetTiles 0x0 20
		.4byte	6, 0

		mGetTiles 0x14 16
		.4byte	6, 1

		mGetTiles 0x90 16
		.4byte	6, 8

		mGetTiles 0xA0 16
		.4byte	6, 9

		mGetTiles 0x44 20
		.4byte	6, 4

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mGetTiles 0x0 20
		.4byte	6, 0

		mGetTiles 0x14 16
		.4byte	6, 1

		mGetTiles 0x24 16
		.4byte	6, 2

		mGetTiles 0x34 16
		.4byte	6, 3

		mGetTiles 0x44 20
		.4byte	6, 4

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mGetTiles 0xB0 20
		.4byte	6, 10

		mGetTiles 0xC4 20
		.4byte	12, 11

		mGetTiles 0xD8 20
		.4byte	6, 12

		mGetTiles 0xC4 20
		.4byte	6, 11

		mGetTiles 0xD8 20
		.4byte	6, 12

		mGetTiles 0xC4 20
		.4byte	12, 11

		mGetTiles 0xB0 20
		.4byte	8, 10

		mGetTiles 0x0 20
		.4byte	6, 0

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mJumpBack 0xB5


.align 2, 0
	anim_0000:
		.4byte anim_data__0000_0
