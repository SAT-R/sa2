
.align 2, 0
	anim_data__0279_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEC10 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 0

		mGetTiles 0xEC24 30
		.4byte	1, 1

		mGetTiles 0xEC42 30
		.4byte	1, 2

		mGetTiles 0xEC60 25
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0279:
		.4byte anim_data__0279_0
