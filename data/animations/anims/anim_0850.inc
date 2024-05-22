

anim_data__0850_0:
	mGetPalette 0x2, 16, 0x50
	mGetTiles 0x22FE5, 36
	.4byte	3, 0

	mGetTiles 0x23009, 36
	.4byte	3, 1

	mGetTiles 0x2302D, 36
	.4byte	3, 2

	mGetTiles 0x23051, 36
	.4byte	3, 3

	mGetTiles 0x23075, 36
	.4byte	3, 4

	mGetTiles 0x23099, 36
	.4byte	3, 5

	mJumpBack 0x21


anim_0850:
	.4byte anim_data__0850_0
