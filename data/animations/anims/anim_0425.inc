
.align 2, 0
	anim_data__0425_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16C79 24
		.4byte	8, 0

		mGetTiles 0x16C91 24
		.4byte	8, 1

		mGetTiles 0x16CA9 24
		.4byte	8, 2

		mGetTiles 0x16C91 24
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0425:
		.4byte anim_data__0425_0
