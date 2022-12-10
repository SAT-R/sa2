
.align 2, 0
	anim_data__0643_0:
		mGetPalette 0x89 16 0x80
		mGetTiles 0x1C2C9 1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0643:
		.4byte anim_data__0643_0
