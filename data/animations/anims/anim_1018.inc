
.align 2, 0
	anim_data__1018_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26EF1 44
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1018:
		.4byte anim_data__1018_0
