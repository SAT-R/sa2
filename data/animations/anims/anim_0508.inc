

anim_data__0508_0:
	mGetPalette 0x3F 16 0xC0
	mGetTiles 0x1A10B 8
	mAnimCmd6 0x0 0x808F8F8
	.4byte	4, 0

	mGetTiles 0x1A113 8
	.4byte	4, 1

	mGetTiles 0x1A11B 8
	.4byte	4, 2

	mGetTiles 0x1A123 8
	.4byte	4, 3

	mJumpBack 0x1A


anim_0508:
	.4byte anim_data__0508_0
