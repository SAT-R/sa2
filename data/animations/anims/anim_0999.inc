
.align 2, 0
	anim_data__0999_0:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x268D5 46
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0999:
		.4byte anim_data__0999_0
