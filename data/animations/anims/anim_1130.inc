
.align 2, 0
	anim_data__1130_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBC3 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1130_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BC03 64
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1130:
		.4byte anim_data__1130_0
		.4byte anim_data__1130_1
