
.align 2, 0
	anim_data__0267_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE39D 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0267_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE3AD 16
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0267:
		.4byte anim_data__0267_0
		.4byte anim_data__0267_1
