

anim_data__0688_0:
	mGetPalette 0x96 16 0x80
	mGetTiles 0x1CDBD 4
	.4byte	3, 0

	mGetTiles 0x1CDC1 4
	.4byte	3, 1

	mGetTiles 0x1CDC5 4
	.4byte	3, 2

	mGetTiles 0x1CDC9 4
	.4byte	3, 3

	mGetTiles 0x1CDCD 4
	.4byte	3, 4

	mAnimCmd4 


anim_0688:
	.4byte anim_data__0688_0
