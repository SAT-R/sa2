
.align 2, 0
	anim_data__0289_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFC50 32
		mAnimCmd6 0x0 0x1006F2FA
		mAnimCmd6 0x1 0x700E9E7
		.4byte	2, 0

		mGetTiles 0xFC70 32
		.4byte	2, 1

		mGetTiles 0xFC90 32
		.4byte	2, 2

		mGetTiles 0xFCB0 32
		.4byte	2, 3

		mGetTiles 0xFC50 32
		.4byte	2, 0

		mGetTiles 0xFC70 32
		.4byte	2, 1

		mGetTiles 0xFC90 32
		.4byte	2, 2

		mGetTiles 0xFCB0 32
		.4byte	2, 3

		mJumpBack 0x31

	anim_data__0289_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFCD0 30
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 4

		mGetTiles 0xFCEE 36
		.4byte	1, 5

		mGetTiles 0xFD12 30
		.4byte	1, 6

		mGetTiles 0xFD30 24
		.4byte	1, 7

		mGetTiles 0xFD48 20
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0289_2:
		mGetPalette 0x17 16 0x40
		mGetTiles 0xFD5C 4
		.4byte	2, 9

		mGetTiles 0xFD60 12
		.4byte	2, 10

		mGetTiles 0xFD6C 25
		.4byte	2, 11

		mGetTiles 0xFD85 30
		.4byte	2, 12

		mGetTiles 0xFDA3 20
		.4byte	2, 13

		mGetTiles 0xFDB7 18
		.4byte	2, 14

		mGetTiles 0xFDC9 18
		.4byte	2, 15

		mGetTiles 0xFDDB 6
		.4byte	2, 16

		mJumpBack 0x2B


.align 2, 0
	anim_0289:
		.4byte anim_data__0289_0
		.4byte anim_data__0289_1
		.4byte anim_data__0289_2
