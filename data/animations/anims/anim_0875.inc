
.align 2, 0
	anim_data__0875_0:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23A9C 38
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0875_1:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23AC2 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0875_2:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23ADC 28
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0875_3:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23AF8 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0875_4:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23B0E 46
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0875_5:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23B3C 30
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0875_6:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23B5A 34
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0875:
		.4byte anim_data__0875_0
		.4byte anim_data__0875_1
		.4byte anim_data__0875_2
		.4byte anim_data__0875_3
		.4byte anim_data__0875_4
		.4byte anim_data__0875_5
		.4byte anim_data__0875_6
