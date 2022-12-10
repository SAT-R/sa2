
.align 2, 0
	anim_data__1131_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BC43 48
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1131:
		.4byte anim_data__1131_0
