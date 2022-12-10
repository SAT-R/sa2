
.align 2, 0
	anim_data__1105_0:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AABC 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1105_1:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAC0 2
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1105_2:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAC2 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1105_3:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAC6 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1105_4:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AACA 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1105_5:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AACE 4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1105_6:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAD2 4
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1105_7:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAD6 4
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1105_8:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AADA 4
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1105_9:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AADE 4
		.4byte	1, 9

		mAnimCmd4 


.align 2, 0
	anim_1105:
		.4byte anim_data__1105_0
		.4byte anim_data__1105_1
		.4byte anim_data__1105_2
		.4byte anim_data__1105_3
		.4byte anim_data__1105_4
		.4byte anim_data__1105_5
		.4byte anim_data__1105_6
		.4byte anim_data__1105_7
		.4byte anim_data__1105_8
		.4byte anim_data__1105_9
