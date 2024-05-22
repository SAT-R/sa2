

anim_data__0648_0:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1C4CE, 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0648_1:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1C4D6, 8
	.4byte	6, 1

	mGetTiles 0x1C4DE, 8
	.4byte	6, 2

	mGetTiles 0x1C4D6, 8
	.4byte	6, 1

	mGetTiles 0x1C4DE, 8
	.4byte	6, 2

	mGetTiles 0x1C4D6, 8
	.4byte	6, 1

	mGetTiles 0x1C4DE, 8
	.4byte	6, 2

	mAnimCmd4 

anim_data__0648_2:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1C4E6, 8
	.4byte	8, 3

	mGetTiles 0x1C4EE, 8
	.4byte	4, 4

	mGetTiles 0x1C4E6, 8
	.4byte	8, 3

	mGetTiles 0x1C4EE, 8
	.4byte	4, 4

	mGetTiles 0x1C4E6, 8
	.4byte	8, 3

	mGetTiles 0x1C4EE, 8
	.4byte	4, 4

	mAnimCmd4 

anim_data__0648_3:
	mGetPalette 0x86, 16, 0xC0
	mGetTiles 0x1C4F6, 8
	.4byte	1, 5

	mAnimCmd4 


anim_0648:
	.4byte anim_data__0648_0
	.4byte anim_data__0648_1
	.4byte anim_data__0648_2
	.4byte anim_data__0648_3
