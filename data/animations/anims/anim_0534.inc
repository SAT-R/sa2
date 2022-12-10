
.align 2, 0
	anim_data__0534_0:
		mGetTiles 0x1A5CE 6
		mGetPalette 0x2 16 0x50
		.4byte	12, 0

		.4byte	12, 1

		.4byte	12, 2

		mJumpBack 0x9


.align 2, 0
	anim_0534:
		.4byte anim_data__0534_0
