
.align 2, 0
	anim_data__0624_0:
		mGetPalette 0x84 16 0xD0
		mGetTiles 0x1BB57 1
		.4byte	1, 0

		mJumpBack 0x8


.align 2, 0
	anim_0624:
		.4byte anim_data__0624_0
