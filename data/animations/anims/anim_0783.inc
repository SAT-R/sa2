
.align 2, 0
	anim_data__0783_0:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x2071B 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0783_1:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x2072F 20
		.4byte	3, 1

		mGetTiles 0x20743 24
		.4byte	3, 2

		mGetTiles 0x2075B 24
		.4byte	3, 3

		mAnimCmd4 


.align 2, 0
	anim_0783:
		.4byte anim_data__0783_0
		.4byte anim_data__0783_1
