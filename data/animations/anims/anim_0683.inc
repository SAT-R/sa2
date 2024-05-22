

anim_data__0683_0:
	mGetPalette 0x8D, 16, 0x80
	mGetTiles 0x1CC3F, 4
	.4byte	4, 0

	mGetTiles 0x1CC43, 4
	.4byte	4, 1

	mGetTiles 0x1CC47, 4
	.4byte	4, 2

	mJumpBack 0x12


anim_0683:
	.4byte anim_data__0683_0
