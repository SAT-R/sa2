

anim_data__0754_0:
	mGetPalette 0xB0 16 0x80
	mGetTiles 0x1F388 4
	.4byte	6, 0

	mGetTiles 0x1F38C 4
	.4byte	6, 1

	mGetTiles 0x1F390 6
	.4byte	6, 2

	mGetTiles 0x1F396 8
	.4byte	6, 3

	mGetTiles 0x1F39E 10
	.4byte	6, 4

	mGetTiles 0x1F3A8 10
	.4byte	6, 5

	mGetTiles 0x1F3B2 18
	.4byte	6, 6

	mGetTiles 0x1F3C4 21
	.4byte	6, 7

	mGetTiles 0x1F3D9 28
	.4byte	6, 8

	mGetTiles 0x1F3F5 21
	.4byte	6, 9

	mAnimCmd4 

anim_data__0754_1:
	mGetPalette 0xB0 16 0x80
	mGetTiles 0x1F3F5 21
	.4byte	1, 9

	mAnimCmd4 


anim_0754:
	.4byte anim_data__0754_0
	.4byte anim_data__0754_1
