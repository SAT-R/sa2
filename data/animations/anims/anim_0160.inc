
.align 2, 0
	anim_data__0160_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8BD9 20
		mAnimCmd6 0x0 0xC04F8FA
		.4byte	2, 0

		mGetTiles 0x8BED 20
		.4byte	2, 1

		mGetTiles 0x8C01 16
		.4byte	2, 2

		mGetTiles 0x8C11 20
		.4byte	2, 3

		mGetTiles 0x8C25 20
		.4byte	2, 4

		mGetTiles 0x8C39 16
		.4byte	2, 5

		mGetTiles 0x8C49 20
		.4byte	2, 6

		mGetTiles 0x8C5D 20
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0160_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8C71 20
		mAnimCmd6 0x0 0x604F4FA
		.4byte	2, 8

		mGetTiles 0x8C85 20
		.4byte	2, 9

		mGetTiles 0x8C99 16
		.4byte	2, 10

		mGetTiles 0x8CA9 20
		.4byte	2, 11

		mGetTiles 0x8CBD 20
		.4byte	2, 12

		mGetTiles 0x8CD1 16
		.4byte	2, 13

		mGetTiles 0x8CE1 20
		.4byte	2, 14

		mGetTiles 0x8CF5 20
		.4byte	2, 15

		mJumpBack 0x2E


.align 2, 0
	anim_0160:
		.4byte anim_data__0160_0
		.4byte anim_data__0160_1
