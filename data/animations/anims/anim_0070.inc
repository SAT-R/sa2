
.align 2, 0
	anim_data__0070_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3EC8 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x3ED8 16
		.4byte	2, 1

		mGetTiles 0x3EE8 16
		.4byte	2, 2

		mGetTiles 0x3EF8 16
		.4byte	2, 3

		mGetTiles 0x3F08 16
		.4byte	2, 4

		mGetTiles 0x3F18 16
		.4byte	2, 5

		mGetTiles 0x3F28 16
		.4byte	2, 6

		mGetTiles 0x3F38 16
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0070:
		.4byte anim_data__0070_0
