
.align 2, 0
	anim_data__0960_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24F5C 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0960_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24F6C 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0960_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x24F7C 42
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0960:
		.4byte anim_data__0960_0
		.4byte anim_data__0960_1
		.4byte anim_data__0960_2
