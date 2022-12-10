
.align 2, 0
	anim_data__0877_0:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23C5C 30
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0877_1:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23C7A 30
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0877_2:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23C98 38
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0877_3:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23CBE 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0877_4:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23CD4 38
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0877_5:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23CFA 22
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0877_6:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23D10 30
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0877:
		.4byte anim_data__0877_0
		.4byte anim_data__0877_1
		.4byte anim_data__0877_2
		.4byte anim_data__0877_3
		.4byte anim_data__0877_4
		.4byte anim_data__0877_5
		.4byte anim_data__0877_6
