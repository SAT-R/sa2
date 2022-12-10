
.align 2, 0
	anim_data__0002_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x36E 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 0

		mGetTiles 0x37E 16
		.4byte	1, 1

		mGetTiles 0x38E 16
		.4byte	1, 2

		mGetTiles 0x39E 16
		.4byte	1, 3

		mJumpBack 0x5

	anim_data__0002_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x37E 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 1

		mGetTiles 0x36E 16
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0002:
		.4byte anim_data__0002_0
		.4byte anim_data__0002_1
