

anim_data__0005_0:
	mGetPalette 0x0 16 0x0
	mGetTiles 0x46E 20
	mAnimCmd6 0x0 0x1006F0FA
	.4byte	1, 0

	mGetTiles 0x482 20
	.4byte	1, 1

	mAnimCmd4 


anim_0005:
	.4byte anim_data__0005_0
