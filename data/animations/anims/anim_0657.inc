
.align 2, 0
	anim_data__0657_0:
		mGetPalette 0x8B 16 0xB0
		mGetTiles 0x1C792 6
		mAnimCmd6 0x0 0x50BFBF5
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0657_1:
		mGetPalette 0x8B 16 0xB0
		mGetTiles 0x1C798 3
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0657:
		.4byte anim_data__0657_0
		.4byte anim_data__0657_1
