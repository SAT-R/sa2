
.align 2, 0
	anim_data__0702_0:
		mGetPalette 0x9A 16 0xB0
		mGetTiles 0x1D1CB 32
		mAnimCmd6 0x0 0x10C0F0
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0702:
		.4byte anim_data__0702_0
