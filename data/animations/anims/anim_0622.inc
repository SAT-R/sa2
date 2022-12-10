
.align 2, 0
	anim_data__0622_0:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB54 1
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0622_1:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB55 1
		.4byte	1, 1

		mJumpBack 0x8


.align 2, 0
	anim_0622:
		.4byte anim_data__0622_0
		.4byte anim_data__0622_1
