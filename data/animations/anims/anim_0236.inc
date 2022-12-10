
.align 2, 0
	anim_data__0236_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xCB56 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0xCB6A 25
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	2, 1

		mGetTiles 0xCB83 25
		.4byte	2, 2

		mGetTiles 0xCB9C 25
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0236_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xCBB5 25
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	1, 4

		mGetTiles 0xCBCE 30
		.4byte	2, 5

		mGetTiles 0xCBEC 25
		.4byte	2, 6

		mGetTiles 0xCC05 25
		.4byte	2, 7

		mGetTiles 0xCC1E 20
		.4byte	2, 8

		mGetTiles 0xCC32 25
		.4byte	2, 9

		mGetTiles 0xCC4B 30
		.4byte	2, 10

		mGetTiles 0xCC69 30
		.4byte	2, 11

		mGetTiles 0xCC87 30
		.4byte	2, 12

		mJumpBack 0xF


.align 2, 0
	anim_0236:
		.4byte anim_data__0236_0
		.4byte anim_data__0236_1
