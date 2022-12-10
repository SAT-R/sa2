
.align 2, 0
	anim_data__0792_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x214D5 15
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0792:
		.4byte anim_data__0792_0
