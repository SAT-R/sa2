

anim_data__0673_0:
	mGetPalette 0x8D, 16, 0x80
	mGetTiles 0x1CBBF, 1
	.4byte	3, 0

	mGetTiles 0x1CBC0, 4
	.4byte	3, 1

	mGetTiles 0x1CBC4, 4
	.4byte	3, 2

	mAnimCmd4 


anim_0673:
	.4byte anim_data__0673_0
