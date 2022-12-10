

anim_data__0277_0:
	mGetPalette 0x16 16 0x0
	mGetTiles 0xEBA8 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0xEBB8 16
	.4byte	2, 1

	mGetTiles 0xEBC8 16
	.4byte	2, 2

	mGetTiles 0xEBD8 16
	.4byte	2, 3

	mJumpBack 0x1D


anim_0277:
	.4byte anim_data__0277_0
