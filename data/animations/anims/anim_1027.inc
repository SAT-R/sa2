
.align 2, 0
	anim_data__1027_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x270FF 42
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1027_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x27129 24
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1027:
		.4byte anim_data__1027_0
		.4byte anim_data__1027_1
