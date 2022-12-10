
.align 2, 0
	anim_data__0893_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2435F 32
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0893_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2437F 40
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0893:
		.4byte anim_data__0893_0
		.4byte anim_data__0893_1
