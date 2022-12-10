
.align 2, 0
	anim_data__0965_0:
		mGetPalette 0x2BC 16 0x20
		mGetTiles 0x2502E 10
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0965_1:
		mGetPalette 0x2BC 16 0x20
		mGetTiles 0x25038 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0965_2:
		mGetPalette 0x2BC 16 0x80
		mGetTiles 0x25042 1
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0965:
		.4byte anim_data__0965_0
		.4byte anim_data__0965_1
		.4byte anim_data__0965_2
