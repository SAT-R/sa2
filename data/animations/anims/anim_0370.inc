
.align 2, 0
	anim_data__0370_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x13614 16
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 0

		mGetTiles 0x13624 20
		.4byte	2, 1

		mGetTiles 0x13638 20
		.4byte	2, 2

		mGetTiles 0x1364C 16
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0370:
		.4byte anim_data__0370_0
