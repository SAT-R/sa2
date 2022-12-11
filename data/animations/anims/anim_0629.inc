

anim_data__0629_0:
	mGetPalette 0x86 16 0xC0
	mGetTiles 0x1BBC0 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0629_1:
	mGetPalette 0x86 16 0xC0
	mGetTiles 0x1BBC8 8
	.4byte	6, 1

	mGetTiles 0x1BBD0 8
	.4byte	6, 2

	mGetTiles 0x1BBC8 8
	.4byte	6, 1

	mGetTiles 0x1BBD0 8
	.4byte	6, 2

	mGetTiles 0x1BBC8 8
	.4byte	6, 1

	mGetTiles 0x1BBD0 8
	.4byte	6, 2

	mSetIdAndVariant 629 0

anim_data__0629_2:
	mGetPalette 0x86 16 0xC0
	mGetTiles 0x1BBD8 8
	.4byte	8, 3

	mGetTiles 0x1BBE0 8
	.4byte	4, 4

	mGetTiles 0x1BBD8 8
	.4byte	8, 3

	mGetTiles 0x1BBE0 8
	.4byte	4, 4

	mGetTiles 0x1BBD8 8
	.4byte	8, 3

	mGetTiles 0x1BBE0 8
	.4byte	4, 4

	mSetIdAndVariant 629 0

anim_data__0629_3:
	mGetPalette 0x86 16 0xC0
	mGetTiles 0x1BBE8 8
	.4byte	1, 5

	mAnimCmd4 


anim_0629:
	.4byte anim_data__0629_0
	.4byte anim_data__0629_1
	.4byte anim_data__0629_2
	.4byte anim_data__0629_3
