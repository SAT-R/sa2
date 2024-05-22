

anim_data__0751_0:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F2C6, 4
	.4byte	6, 0

	mGetTiles 0x1F2CA, 4
	.4byte	6, 1

	mGetTiles 0x1F2CE, 6
	.4byte	6, 2

	mGetTiles 0x1F2D4, 8
	.4byte	6, 3

	mGetTiles 0x1F2DC, 10
	.4byte	6, 4

	mGetTiles 0x1F2E6, 10
	.4byte	6, 5

	mGetTiles 0x1F2F0, 10
	.4byte	6, 6

	mAnimCmd4 

anim_data__0751_1:
	mGetPalette 0xB0, 16, 0x80
	mGetTiles 0x1F2F0, 10
	.4byte	1, 6

	mAnimCmd4 


anim_0751:
	.4byte anim_data__0751_0
	.4byte anim_data__0751_1
