
.align 2, 0
	anim_data__0991_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x266E8 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0991_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x266F8 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0991_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26708 50
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0991:
		.4byte anim_data__0991_0
		.4byte anim_data__0991_1
		.4byte anim_data__0991_2
