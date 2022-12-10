
.align 2, 0
	anim_data__0530_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A4EF 3
		.4byte	4, 0

		mGetTiles 0x1A4F2 3
		.4byte	4, 1

		mGetTiles 0x1A4F5 5
		.4byte	4, 2

		mGetTiles 0x1A4FA 5
		.4byte	4, 3

		mGetTiles 0x1A4FF 14
		.4byte	4, 4

		mGetTiles 0x1A50D 14
		.4byte	4, 5

		mGetTiles 0x1A51B 14
		.4byte	4, 6

		mGetTiles 0x1A529 14
		.4byte	4, 7

		mGetTiles 0x1A537 9
		.4byte	4, 8

		mGetTiles 0x1A540 9
		.4byte	4, 9

		mGetTiles 0x1A549 6
		.4byte	2, 10

		mGetTiles 0x1A54F 9
		.4byte	2, 11

		mJumpBack 0xA


.align 2, 0
	anim_0530:
		.4byte anim_data__0530_0
