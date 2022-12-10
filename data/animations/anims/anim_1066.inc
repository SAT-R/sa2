
.align 2, 0
	anim_data__1066_0:
		mGetPalette 0x5D 16 0xF0
		mGetTiles 0x2882D 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1066:
		.4byte anim_data__1066_0
