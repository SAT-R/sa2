
.align 2, 0
	anim_data__0053_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2B93 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	4, 0

		mGetTiles 0x2BA7 16
		.4byte	4, 1

		mGetTiles 0x2BB7 20
		.4byte	4, 2

		mGetTiles 0x2BCB 20
		.4byte	4, 3

		mGetTiles 0x2BDF 20
		.4byte	4, 4

		mGetTiles 0x2BF3 20
		.4byte	4, 5

		mGetTiles 0x2C07 20
		.4byte	4, 6

		mGetTiles 0x2C1B 20
		.4byte	4, 7

		mGetTiles 0x2C2F 20
		.4byte	4, 8

		mGetTiles 0x2C43 16
		.4byte	4, 9

		mGetTiles 0x2C53 20
		.4byte	4, 10

		mGetTiles 0x2C67 20
		.4byte	3, 11

		mGetTiles 0x2C7B 20
		.4byte	3, 12

		mGetTiles 0x2C8F 20
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0053:
		.4byte anim_data__0053_0
