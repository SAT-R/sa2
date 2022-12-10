
.align 2, 0
	anim_data__1110_0:
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2AB86 30
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1110:
		.4byte anim_data__1110_0
