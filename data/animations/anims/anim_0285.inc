

anim_data__0285_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0xF949, 30
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0xF967, 16
	mAnimCmd6 0x0, 0x1C06FEFA
	.4byte	1, 1

	mGetTiles 0xF977, 16
	.4byte	1, 2

	mGetTiles 0xF967, 16
	.4byte	1, 1

	mAnimCmd4 


anim_0285:
	.4byte anim_data__0285_0
