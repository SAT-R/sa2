
.align 2, 0
	anim_data__0461_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17F65 9
		.4byte	3, 0

		mGetTiles 0x17F6E 9
		.4byte	3, 1

		mGetTiles 0x17F77 9
		.4byte	3, 2

		mGetTiles 0x17F6E 9
		.4byte	3, 1

		mJumpBack 0x17


.align 2, 0
	anim_0461:
		.4byte anim_data__0461_0
