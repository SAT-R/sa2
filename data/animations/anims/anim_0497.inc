
.align 2, 0
	anim_data__0497_0:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D50 12
		mAnimCmd6 0x0 0xAEDF6
		.4byte	30, 0

		mGetTiles 0x19D5C 12
		.4byte	5, 1

		mJumpBack 0x10

	anim_data__0497_1:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D68 12
		mAnimCmd6 0x0 0xAEDF6
		mAnimCmd6 0x1 0xF8F3
		.4byte	3, 2

		mGetTiles 0x19D74 12
		.4byte	3, 3

		mGetTiles 0x19D80 12
		.4byte	6, 4

		mAnimCmd4 

	anim_data__0497_2:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D74 12
		mAnimCmd6 0x0 0xAEDF6
		mAnimCmd6 0x1 0xF5F1
		.4byte	3, 3

		mGetTiles 0x19D68 12
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0497_3:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D8C 12
		mAnimCmd6 0x0 0xAEDF6
		.4byte	4, 5

		mGetTiles 0x19D98 12
		.4byte	4, 6

		mAnimCmd4 


.align 2, 0
	anim_0497:
		.4byte anim_data__0497_0
		.4byte anim_data__0497_1
		.4byte anim_data__0497_2
		.4byte anim_data__0497_3
