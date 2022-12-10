
.align 2, 0
	anim_data__0400_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C22 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0400_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C36 20
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0400_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C4A 15
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0400_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C59 15
		.4byte	6, 3

		mGetTiles 0x15C68 15
		.4byte	6, 4

		mGetTiles 0x15C77 15
		.4byte	8, 5

		mGetTiles 0x15C86 15
		.4byte	6, 6

		mGetTiles 0x15C59 15
		.4byte	6, 3

		mAnimCmd4 


.align 2, 0
	anim_0400:
		.4byte anim_data__0400_0
		.4byte anim_data__0400_1
		.4byte anim_data__0400_2
		.4byte anim_data__0400_3
