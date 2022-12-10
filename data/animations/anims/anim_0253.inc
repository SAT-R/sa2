
.align 2, 0
	anim_data__0253_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDE03 30
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0xDE21 30
		.4byte	2, 1

		mGetTiles 0xDE3F 30
		.4byte	2, 2

		mGetTiles 0xDE5D 20
		.4byte	2, 3

		mGetTiles 0xDE71 30
		.4byte	2, 4

		mGetTiles 0xDE8F 30
		.4byte	2, 5

		mGetTiles 0xDEAD 30
		.4byte	2, 6

		mGetTiles 0xDECB 24
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0253_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDEE3 18
		mAnimCmd6 0x0 0xA06ECFA
		.4byte	3, 8

		mGetTiles 0xDEF5 18
		.4byte	3, 9

		mGetTiles 0xDF07 18
		.4byte	3, 10

		mGetTiles 0xDF19 18
		.4byte	3, 11

		mGetTiles 0xDF07 18
		.4byte	3, 10

		mGetTiles 0xDEF5 18
		.4byte	3, 9

		mJumpBack 0x24


.align 2, 0
	anim_0253:
		.4byte anim_data__0253_0
		.4byte anim_data__0253_1
