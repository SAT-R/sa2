

anim_data__0545_0:
	mGetPalette 0x4B 16 0x70
	mGetTiles 0x1A9B3 45
	.4byte	2, 0

	mGetTiles 0x1A9E0 45
	.4byte	2, 1

	mGetTiles 0x1AA0D 45
	.4byte	2, 2

	mJumpBack 0x12


anim_0545:
	.4byte anim_data__0545_0
