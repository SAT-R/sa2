
.align 2, 0
	anim_data__0694_0:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1CF0B 64
		mAnimCmd6 0x0 0x1613EAED
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0694_1:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1CF4B 64
		mAnimCmd6 0x0 0x1613EAED
		.4byte	6, 1

		mGetTiles 0x1CF8B 64
		.4byte	6, 2

		mGetTiles 0x1CF4B 64
		.4byte	6, 1

		mGetTiles 0x1CF8B 64
		.4byte	6, 2

		mGetTiles 0x1CF4B 64
		.4byte	6, 1

		mGetTiles 0x1CF8B 64
		.4byte	6, 2

		mJumpBack 0x24

	anim_data__0694_2:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1CFCB 64
		.4byte	5, 3

		mGetTiles 0x1D00B 64
		.4byte	3, 4

		mGetTiles 0x1CFCB 64
		.4byte	5, 3

		mGetTiles 0x1D00B 64
		.4byte	3, 4

		mGetTiles 0x1CFCB 64
		.4byte	5, 3

		mGetTiles 0x1D00B 64
		.4byte	3, 4

		mJumpBack 0x21

	anim_data__0694_3:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1D04B 64
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0694_4:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1D08B 64
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0694:
		.4byte anim_data__0694_0
		.4byte anim_data__0694_1
		.4byte anim_data__0694_2
		.4byte anim_data__0694_3
		.4byte anim_data__0694_4
