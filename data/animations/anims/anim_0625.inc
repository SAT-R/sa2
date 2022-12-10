
.align 2, 0
	anim_data__0625_0:
		mGetPalette 0x84 16 0xD0
		mGetTiles 0x1BB58 4
		.4byte	1, 0

		mJumpBack 0x8


.align 2, 0
	anim_0625:
		.4byte anim_data__0625_0
