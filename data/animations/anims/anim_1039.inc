
.align 2, 0
	anim_data__1039_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x272AF 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1039:
		.4byte anim_data__1039_0
