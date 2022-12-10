
.align 2, 0
	anim_data__0520_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A477 4
		.4byte	3, 0

		mGetTiles 0x1A47B 4
		.4byte	3, 1

		mGetTiles 0x1A47F 4
		.4byte	3, 2

		mJumpBack 0x12


.align 2, 0
	anim_0520:
		.4byte anim_data__0520_0
