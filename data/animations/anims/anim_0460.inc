

anim_data__0460_0:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x17EE7, 9
	.4byte	6, 0

	mGetTiles 0x17EF0, 9
	.4byte	6, 1

	mGetTiles 0x17EF9, 9
	.4byte	6, 2

	mGetTiles 0x17F02, 9
	.4byte	6, 3

	mGetTiles 0x17F0B, 9
	.4byte	6, 4

	mGetTiles 0x17F14, 9
	.4byte	6, 5

	mGetTiles 0x17F1D, 9
	.4byte	6, 6

	mGetTiles 0x17F26, 9
	.4byte	6, 7

	mGetTiles 0x17F2F, 9
	.4byte	6, 8

	mGetTiles 0x17F38, 9
	.4byte	6, 9

	mGetTiles 0x17F41, 9
	.4byte	6, 10

	mGetTiles 0x17F38, 9
	.4byte	6, 9

	mJumpBack 0x14

anim_data__0460_1:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x17F4A, 9
	.4byte	6, 11

	mGetTiles 0x17F53, 9
	.4byte	6, 12

	mGetTiles 0x17F5C, 9
	.4byte	6, 13

	mGetTiles 0x17F53, 9
	.4byte	6, 12

	mJumpBack 0x17


anim_0460:
	.4byte anim_data__0460_0
	.4byte anim_data__0460_1
