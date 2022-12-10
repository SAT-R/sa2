
.align 2, 0
	anim_data__0675_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBD1 1
		.4byte	3, 0

		mGetTiles 0x1CBD2 4
		.4byte	3, 1

		mGetTiles 0x1CBD6 4
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0675:
		.4byte anim_data__0675_0
