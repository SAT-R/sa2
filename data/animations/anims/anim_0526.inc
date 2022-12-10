
.align 2, 0
	anim_data__0526_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A4BF 4
		.4byte	3, 0

		mGetTiles 0x1A4C3 4
		.4byte	3, 1

		mGetTiles 0x1A4C7 4
		.4byte	3, 2

		mJumpBack 0x12


.align 2, 0
	anim_0526:
		.4byte anim_data__0526_0
