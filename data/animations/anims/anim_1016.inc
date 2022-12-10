
.align 2, 0
	anim_data__1016_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26EA7 30
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1016:
		.4byte anim_data__1016_0
