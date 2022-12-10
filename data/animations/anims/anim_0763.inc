
.align 2, 0
	anim_data__0763_0:
		mGetPalette 0xB6 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_1:
		mGetPalette 0xB7 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_2:
		mGetPalette 0xB8 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_3:
		mGetPalette 0xB9 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_4:
		mGetPalette 0xBA 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0763:
		.4byte anim_data__0763_0
		.4byte anim_data__0763_1
		.4byte anim_data__0763_2
		.4byte anim_data__0763_3
		.4byte anim_data__0763_4
