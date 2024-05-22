

anim_data__0872_0:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x23968, 10
	.4byte	2, 0

	mGetTiles 0x23972, 10
	.4byte	2, 1

	mGetTiles 0x2397C, 10
	.4byte	2, 2

	mGetTiles 0x23986, 10
	.4byte	2, 3

	mGetTiles 0x23990, 15
	.4byte	2, 4

	mGetTiles 0x2399F, 15
	.4byte	2, 5

	mAnimCmd4 


anim_0872:
	.4byte anim_data__0872_0
