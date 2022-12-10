
.align 2, 0
	anim_data__0712_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D726 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0712:
		.4byte anim_data__0712_0
