
.align 2, 0
	anim_data__0519_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A46B 4
		.4byte	8, 0

		mGetTiles 0x1A46F 4
		.4byte	8, 1

		mGetTiles 0x1A473 4
		.4byte	8, 2

		mGetTiles 0x1A46F 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0519:
		.4byte anim_data__0519_0
