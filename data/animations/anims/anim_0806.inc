
.align 2, 0
	anim_data__0806_0:
		mGetPalette 0xD0 16 0x0
		mGetTiles 0x216C9 210
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0806:
		.4byte anim_data__0806_0
