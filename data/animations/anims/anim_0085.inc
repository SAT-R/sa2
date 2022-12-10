
.align 2, 0
	anim_data__0085_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x43C0 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0085_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x43D4 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0085:
		.4byte anim_data__0085_0
		.4byte anim_data__0085_1
