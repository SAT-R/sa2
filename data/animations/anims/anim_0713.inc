

anim_data__0713_0:
	mGetPalette 0x34, 16, 0xA0
	mGetTiles 0x1D766, 16
	.4byte	4, 0

	mGetTiles 0x1D776, 16
	.4byte	4, 1

	mGetTiles 0x1D786, 16
	.4byte	4, 2

	mGetTiles 0x1D796, 16
	.4byte	4, 3

	mAnimCmd4 


anim_0713:
	.4byte anim_data__0713_0
