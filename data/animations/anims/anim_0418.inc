
.align 2, 0
	anim_data__0418_0:
		mGetPalette 0x1D 16 0x0
		mGetTiles 0x163BD 15
		mAnimCmd6 0x0 0xC06F0FA
		.4byte	1, 0

		mGetTiles 0x163CC 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 1

		mGetTiles 0x163E0 20
		.4byte	2, 2

		mGetTiles 0x163F4 20
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0418_1:
		mGetPalette 0x1D 16 0x0
		mGetTiles 0x16408 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	1, 4

		mGetTiles 0x1641C 20
		.4byte	2, 5

		mGetTiles 0x16430 20
		.4byte	2, 6

		mGetTiles 0x16444 25
		.4byte	2, 7

		mGetTiles 0x1645D 20
		.4byte	2, 8

		mGetTiles 0x16471 25
		.4byte	2, 9

		mGetTiles 0x1648A 24
		.4byte	2, 10

		mGetTiles 0x164A2 24
		.4byte	2, 11

		mGetTiles 0x164BA 24
		.4byte	2, 12

		mJumpBack 0xF


.align 2, 0
	anim_0418:
		.4byte anim_data__0418_0
		.4byte anim_data__0418_1
