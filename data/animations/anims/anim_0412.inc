
.align 2, 0
	anim_data__0412_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C95 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	3, 0

		mGetTiles 0x15CA9 20
		.4byte	6, 1

		mAnimCmd4 

	anim_data__0412_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15CBD 20
		.4byte	2, 2

		mGetTiles 0x15CD1 25
		.4byte	1, 3

		mGetTiles 0x15CEA 25
		.4byte	1, 4

		mGetTiles 0x15D03 18
		.4byte	3, 5

		mGetTiles 0x15D15 18
		.4byte	3, 6

		mGetTiles 0x15D27 18
		.4byte	3, 7

		mJumpBack 0xF

	anim_data__0412_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15D39 25
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 8

		mGetTiles 0x15D52 20
		.4byte	1, 9

		mGetTiles 0x15D66 20
		.4byte	1, 10

		mGetTiles 0x15D7A 20
		.4byte	3, 11

		mGetTiles 0x15D8E 20
		.4byte	3, 12

		mGetTiles 0x15DA2 20
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0412:
		.4byte anim_data__0412_0
		.4byte anim_data__0412_1
		.4byte anim_data__0412_2
