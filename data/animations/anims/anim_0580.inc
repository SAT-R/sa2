
.align 2, 0
	anim_data__0580_0:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B029 16
		mAnimCmd6 0x0 0xFE8F0
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0580_1:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B039 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0580_2:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B03D 8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0580_3:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B045 16
		mAnimCmd6 0x0 0xF18F000
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0580:
		.4byte anim_data__0580_0
		.4byte anim_data__0580_1
		.4byte anim_data__0580_2
		.4byte anim_data__0580_3
