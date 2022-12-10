
.align 2, 0
	anim_data__0591_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0591_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mGetTiles 0x1B3BE 12
		.4byte	3, 1

		mGetTiles 0x1B3CA 12
		.4byte	2, 2

		mGetTiles 0x1B3D6 12
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0591_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mGetTiles 0x1B3BE 12
		.4byte	1, 1

		mGetTiles 0x1B3CA 12
		.4byte	1, 2

		mGetTiles 0x1B3D6 12
		.4byte	1, 3

		mJumpBack 0x17

	anim_data__0591_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mGetTiles 0x1B3BE 12
		.4byte	1, 1

		mGetTiles 0x1B3CA 12
		.4byte	2, 2

		mGetTiles 0x1B3D6 12
		.4byte	3, 3

		mAnimCmd4 


.align 2, 0
	anim_0591:
		.4byte anim_data__0591_0
		.4byte anim_data__0591_1
		.4byte anim_data__0591_2
		.4byte anim_data__0591_3
