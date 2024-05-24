

anim_data__0679_0:
	mGetPalette 0x8D, 16, 0x80
	mGetTiles 0x1CBEF, 2
	.4byte	3, 0

	mGetTiles 0x1CBF1, 2
	.4byte	3, 1

	mGetTiles 0x1CBF3, 2
	.4byte	3, 2

	mAnimCmd4 


anim_0679:
	.4byte anim_data__0679_0
