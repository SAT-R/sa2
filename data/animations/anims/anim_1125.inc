
.align 2, 0
	anim_data__1125_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2BB3E 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1125_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x2BB42 4
		mAnimCmd6 0x0 0x20002
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1125_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x2BB46 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1125_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x2BB4A 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1125_4:
		mGetPalette 0x9F 16 0x0
		mGetTiles 0x2BB4E 4
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1125:
		.4byte anim_data__1125_0
		.4byte anim_data__1125_1
		.4byte anim_data__1125_2
		.4byte anim_data__1125_3
		.4byte anim_data__1125_4
