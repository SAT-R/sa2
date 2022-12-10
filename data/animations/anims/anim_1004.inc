
.align 2, 0
	anim_data__1004_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269C7 32
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1004_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269E7 26
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1004:
		.4byte anim_data__1004_0
		.4byte anim_data__1004_1
