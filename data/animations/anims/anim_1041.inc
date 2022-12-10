
.align 2, 0
	anim_data__1041_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x272D7 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1041:
		.4byte anim_data__1041_0
