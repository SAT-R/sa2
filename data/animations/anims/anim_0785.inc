
.align 2, 0
	anim_data__0785_0:
		mGetPalette 0xC0 16 0x0
		mGetTiles 0x2081B 104
		.4byte	3, 0

		mGetTiles 0x20883 104
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0785_1:
		mGetPalette 0xC0 16 0x0
		mGetTiles 0x208EB 48
		.4byte	3, 2

		mGetTiles 0x2091B 48
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0785_2:
		mGetPalette 0xC1 16 0x0
		mGetTiles 0x2094B 104
		.4byte	3, 4

		mGetTiles 0x209B3 104
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0785_3:
		mGetPalette 0xC1 16 0x0
		mGetTiles 0x20A1B 48
		.4byte	3, 6

		mGetTiles 0x20A4B 48
		.4byte	3, 7

		mJumpBack 0xD


.align 2, 0
	anim_0785:
		.4byte anim_data__0785_0
		.4byte anim_data__0785_1
		.4byte anim_data__0785_2
		.4byte anim_data__0785_3
