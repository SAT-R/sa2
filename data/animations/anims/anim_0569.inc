
.align 2, 0
	anim_data__0569_0:
		mGetPalette 0x66 16 0xB0
		mGetTiles 0x1ACDA 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0569_1:
		mGetPalette 0x66 16 0xB0
		mGetTiles 0x1ACDC 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0569:
		.4byte anim_data__0569_0
		.4byte anim_data__0569_1
