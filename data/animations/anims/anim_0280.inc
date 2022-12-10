
.align 2, 0
	anim_data__0280_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEC79 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 0

		mGetTiles 0xEC8D 30
		.4byte	2, 1

		mGetTiles 0xECAB 30
		.4byte	2, 2

		mJumpBack 0x5

	anim_data__0280_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xECC9 30
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 3

		mGetTiles 0xEC79 20
		.4byte	2, 0

		mAnimCmd4 


.align 2, 0
	anim_0280:
		.4byte anim_data__0280_0
		.4byte anim_data__0280_1
