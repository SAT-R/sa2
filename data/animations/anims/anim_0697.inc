
.align 2, 0
	anim_data__0697_0:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D14B 12
		.4byte	1, 0

		mGetTiles 0x1D157 12
		.4byte	1, 1

		mGetTiles 0x1D163 12
		.4byte	1, 2

		mJumpBack 0x12


.align 2, 0
	anim_0697:
		.4byte anim_data__0697_0
