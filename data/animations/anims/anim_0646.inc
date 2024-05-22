

anim_data__0646_0:
	mGetPalette 0x88, 16, 0xD0
	mGetTiles 0x1C32A, 64
	.4byte	1, 0

	mAnimCmd4 

anim_data__0646_1:
	mGetPalette 0x88, 16, 0xD0
	mGetTiles 0x1C36A, 64
	.4byte	3, 1

	mGetTiles 0x1C3AA, 64
	.4byte	3, 2

	mGetTiles 0x1C3EA, 64
	.4byte	3, 3

	mGetTiles 0x1C42A, 64
	.4byte	3, 4

	mGetTiles 0x1C32A, 64
	.4byte	8, 0

	mAnimCmd4 

anim_data__0646_2:
	mGetPalette 0x88, 16, 0xD0
	mGetTiles 0x1C46A, 64
	.4byte	1, 5

	mAnimCmd4 


anim_0646:
	.4byte anim_data__0646_0
	.4byte anim_data__0646_1
	.4byte anim_data__0646_2
