
.align 2, 0
	anim_data__0988_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26597 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0988_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x265A7 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0988_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x265B7 68
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0988_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x265FB 63
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0988:
		.4byte anim_data__0988_0
		.4byte anim_data__0988_1
		.4byte anim_data__0988_2
		.4byte anim_data__0988_3
