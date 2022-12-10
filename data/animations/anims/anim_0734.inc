
.align 2, 0
	anim_data__0734_0:
		mGetPalette 0xA4 16 0x60
		mGetTiles 0x1DBD4 3
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0734:
		.4byte anim_data__0734_0
