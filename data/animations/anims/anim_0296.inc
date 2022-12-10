
.align 2, 0
	anim_data__0296_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFFA0 30
		mAnimCmd6 0x0 0xA0AF2FE
		.4byte	2, 0

		mGetTiles 0xFFBE 20
		mAnimCmd6 0x0 0xF0AF6FA
		.4byte	2, 1

		mGetTiles 0xFFD2 16
		mAnimCmd6 0x0 0xF7F7F7F7
		.4byte	2, 2

		mAnimCmd4 


.align 2, 0
	anim_0296:
		.4byte anim_data__0296_0
