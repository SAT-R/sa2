
.align 2, 0
	anim_data__0339_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x122B5 42
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x122DF 42
		.4byte	3, 1

		mGetTiles 0x12309 42
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0339_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12333 36
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 3

		mGetTiles 0x12357 24
		.4byte	3, 4

		mGetTiles 0x1236F 24
		.4byte	3, 5

		mGetTiles 0x12387 30
		.4byte	3, 6

		mGetTiles 0x123A5 25
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0339_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x123BE 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 8

		mGetTiles 0x123D7 25
		.4byte	3, 9

		mGetTiles 0x123F0 25
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0339:
		.4byte anim_data__0339_0
		.4byte anim_data__0339_1
		.4byte anim_data__0339_2
