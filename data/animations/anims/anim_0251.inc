
.align 2, 0
	anim_data__0251_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB9D 30
		mAnimCmd6 0x0 0xC04F8FA
		.4byte	2, 0

		mGetTiles 0xDBBB 30
		.4byte	2, 1

		mGetTiles 0xDBD9 35
		.4byte	2, 2

		mGetTiles 0xDBFC 30
		.4byte	2, 3

		mGetTiles 0xDC1A 30
		.4byte	2, 4

		mGetTiles 0xDC38 30
		.4byte	2, 5

		mGetTiles 0xDC56 28
		.4byte	2, 6

		mGetTiles 0xDC72 30
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0251_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDC90 30
		mAnimCmd6 0x0 0x604F4FA
		.4byte	2, 8

		mGetTiles 0xDCAE 30
		.4byte	2, 9

		mGetTiles 0xDCCC 35
		.4byte	2, 10

		mGetTiles 0xDCEF 30
		.4byte	2, 11

		mGetTiles 0xDD0D 30
		.4byte	2, 12

		mGetTiles 0xDD2B 30
		.4byte	2, 13

		mGetTiles 0xDD49 28
		.4byte	2, 14

		mGetTiles 0xDD65 30
		.4byte	2, 15

		mJumpBack 0x2E


.align 2, 0
	anim_0251:
		.4byte anim_data__0251_0
		.4byte anim_data__0251_1
