

anim_data__0717_0:
	mGetPalette 0x9D, 16, 0x80
	mGetTiles 0x1D892, 9
	.4byte	3, 0

	mGetTiles 0x1D89B, 9
	.4byte	3, 1

	mGetTiles 0x1D8A4, 9
	.4byte	3, 2

	mGetTiles 0x1D8AD, 4
	.4byte	3, 3

	mGetTiles 0x1D8B1, 1
	.4byte	3, 4

	mAnimCmd4 


anim_0717:
	.4byte anim_data__0717_0
