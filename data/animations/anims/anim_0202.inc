
.align 2, 0
	anim_data__0202_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB1E2 20
		mAnimCmd6 0x0 0xA06F6FA
		mAnimCmd6 0x1 0xF516E9EB
		.4byte	2, 0

		mGetTiles 0xB1F6 20
		.4byte	2, 1

		mGetTiles 0xB20A 30
		.4byte	2, 2

		mGetTiles 0xB228 25
		.4byte	2, 3

		mGetTiles 0xB241 20
		.4byte	2, 4

		mGetTiles 0xB255 20
		.4byte	2, 5

		mGetTiles 0xB269 30
		.4byte	2, 6

		mGetTiles 0xB287 25
		.4byte	2, 7

		mGetTiles 0xB1E2 20
		.4byte	2, 0

		mGetTiles 0xB1F6 20
		.4byte	2, 1

		mGetTiles 0xB20A 30
		.4byte	2, 2

		mGetTiles 0xB228 25
		.4byte	2, 3

		mGetTiles 0xB2A0 20
		.4byte	2, 8

		mGetTiles 0xB2B4 20
		.4byte	2, 9

		mGetTiles 0xB2C8 30
		.4byte	2, 10

		mGetTiles 0xB287 25
		.4byte	2, 7

		mJumpBack 0x59


.align 2, 0
	anim_0202:
		.4byte anim_data__0202_0
