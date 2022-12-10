

anim_data__0718_0:
	mGetPalette 0x34 16 0xD0
	mGetTiles 0x1D8B2 16
	mAnimCmd6 0x0 0x403FCFB
	.4byte	2, 0

	mGetTiles 0x1D8C2 16
	.4byte	2, 1

	mGetTiles 0x1D8D2 16
	.4byte	2, 2

	mGetTiles 0x1D8E2 16
	.4byte	2, 3

	mJumpBack 0x1A


anim_0718:
	.4byte anim_data__0718_0
