
.align 2, 0
	anim_data__0621_0:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB38 16
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0621_1:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB48 12
		.4byte	1, 1

		mJumpBack 0x8


.align 2, 0
	anim_0621:
		.4byte anim_data__0621_0
		.4byte anim_data__0621_1
