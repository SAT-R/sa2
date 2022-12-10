
.align 2, 0
	anim_data__0631_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BC30 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0631:
		.4byte anim_data__0631_0
