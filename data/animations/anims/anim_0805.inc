
.align 2, 0
	anim_data__0805_0:
		mGetPalette 0xCF 16 0x0
		mGetTiles 0x21609 192
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0805:
		.4byte anim_data__0805_0
