

anim_data__0817_0:
	mGetPalette 0xD2, 16, 0xD0
	mGetTiles 0x21B9A, 9
	.4byte	3, 0

	mGetTiles 0x21BA3, 9
	.4byte	3, 1

	mGetTiles 0x21BAC, 9
	.4byte	3, 2

	mGetTiles 0x21BB5, 9
	.4byte	3, 3

	mGetTiles 0x21BBE, 9
	.4byte	3, 4

	mAnimCmd4 


anim_0817:
	.4byte anim_data__0817_0
