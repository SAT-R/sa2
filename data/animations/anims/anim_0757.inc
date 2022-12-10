
.align 2, 0
	anim_data__0757_0:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F6FD 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0757_1:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F711 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0757_2:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F72B 26
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0757:
		.4byte anim_data__0757_0
		.4byte anim_data__0757_1
		.4byte anim_data__0757_2
