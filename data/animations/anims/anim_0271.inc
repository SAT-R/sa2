
.align 2, 0
	anim_data__0271_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xE6AB 16
		.4byte	2, 0

		mGetTiles 0xE6BB 16
		.4byte	2, 1

		mGetTiles 0xE6CB 16
		.4byte	2, 2

		mGetTiles 0xE6DB 16
		.4byte	2, 3

		mGetTiles 0xE6EB 16
		.4byte	2, 4

		mGetTiles 0xE6FB 16
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0271:
		.4byte anim_data__0271_0
