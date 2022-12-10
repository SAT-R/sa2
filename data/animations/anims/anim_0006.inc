
.align 2, 0
	anim_data__0006_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x496 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	2, 0

		mGetTiles 0x4AA 20
		.4byte	2, 1

		mGetTiles 0x4BE 25
		.4byte	2, 2

		mGetTiles 0x4D7 20
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0006:
		.4byte anim_data__0006_0
