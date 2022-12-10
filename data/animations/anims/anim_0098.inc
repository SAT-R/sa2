
.align 2, 0
	anim_data__0098_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4D4D 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x4D61 20
		.4byte	4, 1

		mGetTiles 0x4D75 25
		.4byte	4, 2

		mJumpBack 0xA

	anim_data__0098_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4D8E 16
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 3

		mGetTiles 0x4D9E 16
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0098:
		.4byte anim_data__0098_0
		.4byte anim_data__0098_1
