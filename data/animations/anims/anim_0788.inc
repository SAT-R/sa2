
.align 2, 0
	anim_data__0788_0:
		mGetPalette 0xC6 16 0x0
		mGetTiles 0x20FB3 72
		.4byte	3, 0

		mGetTiles 0x20FFB 72
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0788_1:
		mGetPalette 0xC6 16 0x0
		mGetTiles 0x21043 56
		.4byte	3, 2

		mGetTiles 0x2107B 64
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0788_2:
		mGetPalette 0xC7 16 0x0
		mGetTiles 0x210BB 72
		.4byte	3, 4

		mGetTiles 0x21103 72
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0788_3:
		mGetPalette 0xC7 16 0x0
		mGetTiles 0x2114B 56
		.4byte	3, 6

		mGetTiles 0x21183 64
		.4byte	3, 7

		mJumpBack 0xD


.align 2, 0
	anim_0788:
		.4byte anim_data__0788_0
		.4byte anim_data__0788_1
		.4byte anim_data__0788_2
		.4byte anim_data__0788_3
