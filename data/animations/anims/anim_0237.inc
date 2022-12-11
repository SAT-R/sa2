

anim_data__0237_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0xCCA5 64
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	2, 0

	mGetTiles 0xCCE5 64
	.4byte	2, 1

	mGetTiles 0xCD25 64
	.4byte	2, 2

	mJumpBack 0x15


anim_0237:
	.4byte anim_data__0237_0
