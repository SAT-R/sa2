
.align 2, 0
	anim_data__1099_0:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4C7 6
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1099_1:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4CD 6
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1099_2:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4D3 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1099_3:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4DF 12
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1099:
		.4byte anim_data__1099_0
		.4byte anim_data__1099_1
		.4byte anim_data__1099_2
		.4byte anim_data__1099_3
