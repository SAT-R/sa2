
.align 2, 0
	anim_data__0516_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A447 4
		.4byte	8, 0

		mGetTiles 0x1A44B 4
		.4byte	8, 1

		mGetTiles 0x1A44F 4
		.4byte	8, 2

		mGetTiles 0x1A44B 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0516:
		.4byte anim_data__0516_0
