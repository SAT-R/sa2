
.align 2, 0
	anim_data__1109_0:
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2AB60 38
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1109:
		.4byte anim_data__1109_0
