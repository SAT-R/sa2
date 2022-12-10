
.align 2, 0
	anim_data__0417_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x162AD 20
		mAnimCmd6 0x0 0xD06F3FA
		.4byte	4, 0

		mGetTiles 0x162C1 15
		.4byte	4, 1

		mGetTiles 0x162D0 12
		.4byte	4, 2

		mGetTiles 0x162DC 16
		.4byte	4, 3

		mGetTiles 0x162EC 20
		.4byte	4, 4

		mGetTiles 0x16300 20
		.4byte	4, 5

		mGetTiles 0x16314 16
		.4byte	4, 6

		mGetTiles 0x16324 16
		.4byte	4, 7

		mGetTiles 0x16334 20
		.4byte	4, 8

		mGetTiles 0x16348 25
		.4byte	4, 9

		mGetTiles 0x16361 20
		.4byte	4, 10

		mGetTiles 0x16375 24
		.4byte	3, 11

		mGetTiles 0x1638D 24
		.4byte	3, 12

		mGetTiles 0x163A5 24
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0417:
		.4byte anim_data__0417_0
