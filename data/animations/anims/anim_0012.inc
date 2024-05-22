

anim_data__0012_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x11BE, 20
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0x11D2, 16
	mAnimCmd6 0x0, 0x1006FAFA
	.4byte	1, 1

	mGetTiles 0x11E2, 16
	.4byte	1, 2

	mGetTiles 0x11D2, 16
	.4byte	1, 1

	mAnimCmd4 


anim_0012:
	.4byte anim_data__0012_0
