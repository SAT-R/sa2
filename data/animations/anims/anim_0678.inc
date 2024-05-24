

anim_data__0678_0:
	mGetPalette 0x8D, 16, 0x80
	mGetTiles 0x1CBE9, 2
	.4byte	3, 0

	mGetTiles 0x1CBEB, 2
	.4byte	3, 1

	mGetTiles 0x1CBED, 2
	.4byte	3, 2

	mAnimCmd4 


anim_0678:
	.4byte anim_data__0678_0
