
.align 2, 0
	anim_data__0281_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xECE7 20
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	1, 0

		mGetTiles 0xECFB 25
		.4byte	1, 1

		mGetTiles 0xED14 30
		.4byte	3, 2

		mGetTiles 0xED32 25
		.4byte	3, 3

		mJumpBack 0xA

	anim_data__0281_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xECFB 25
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	2, 1

		mGetTiles 0xECE7 20
		.4byte	2, 0

		mAnimCmd4 


.align 2, 0
	anim_0281:
		.4byte anim_data__0281_0
		.4byte anim_data__0281_1
