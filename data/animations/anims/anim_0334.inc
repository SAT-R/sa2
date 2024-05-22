

anim_data__0334_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x11D07, 30
	mAnimCmd6 0x0, 0x1206F4FA
	.4byte	8, 0

	mGetTiles 0x11D25, 30
	.4byte	8, 1

	mGetTiles 0x11D43, 30
	.4byte	8, 2

	mGetTiles 0x11D25, 30
	.4byte	8, 1

	mJumpBack 0x1A


anim_0334:
	.4byte anim_data__0334_0
