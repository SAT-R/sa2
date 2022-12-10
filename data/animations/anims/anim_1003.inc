
.align 2, 0
	anim_data__1003_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269B3 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1003_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269B3 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1003:
		.4byte anim_data__1003_0
		.4byte anim_data__1003_1
