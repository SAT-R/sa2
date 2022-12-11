

anim_data__0680_0:
	mGetPalette 0x8D 16 0x80
	mGetTiles 0x1CBF5 2
	.4byte	3, 0

	mGetTiles 0x1CBF7 2
	.4byte	3, 1

	mGetTiles 0x1CBF9 2
	.4byte	3, 2

	mAnimCmd4 


anim_0680:
	.4byte anim_data__0680_0
