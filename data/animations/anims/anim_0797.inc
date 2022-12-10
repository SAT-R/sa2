
.align 2, 0
	anim_data__0797_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x21505 6
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0797:
		.4byte anim_data__0797_0
