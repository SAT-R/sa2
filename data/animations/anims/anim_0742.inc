
.align 2, 0
	anim_data__0742_0:
		mGetPalette 0xA0 16 0x40
		mGetTiles 0x1F0A2 16
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0742:
		.4byte anim_data__0742_0
