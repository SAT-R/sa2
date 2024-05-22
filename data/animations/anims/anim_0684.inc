

anim_data__0684_0:
	mGetPalette 0x8E, 16, 0xC0
	mGetTiles 0x1CC4B, 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__0684_1:
	mGetPalette 0x8E, 16, 0xC0
	mGetTiles 0x1CC53, 8
	.4byte	6, 1

	mGetTiles 0x1CC5B, 8
	.4byte	6, 2

	mGetTiles 0x1CC53, 8
	.4byte	6, 1

	mGetTiles 0x1CC5B, 8
	.4byte	6, 2

	mGetTiles 0x1CC53, 8
	.4byte	6, 1

	mGetTiles 0x1CC5B, 8
	.4byte	6, 2

	mAnimCmd4 

anim_data__0684_2:
	mGetPalette 0x8E, 16, 0xC0
	mGetTiles 0x1CC63, 8
	.4byte	8, 3

	mGetTiles 0x1CC6B, 8
	.4byte	4, 4

	mGetTiles 0x1CC63, 8
	.4byte	8, 3

	mGetTiles 0x1CC6B, 8
	.4byte	4, 4

	mGetTiles 0x1CC63, 8
	.4byte	8, 3

	mGetTiles 0x1CC6B, 8
	.4byte	4, 4

	mAnimCmd4 

anim_data__0684_3:
	mGetPalette 0x8E, 16, 0xC0
	mGetTiles 0x1CC73, 8
	.4byte	1, 5

	mAnimCmd4 


anim_0684:
	.4byte anim_data__0684_0
	.4byte anim_data__0684_1
	.4byte anim_data__0684_2
	.4byte anim_data__0684_3
