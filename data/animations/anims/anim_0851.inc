

anim_data__0851_0:
	mGetPalette 0x2, 16, 0x50
	mGetTiles 0x230BD, 36
	.4byte	3, 0

	mGetTiles 0x230E1, 36
	.4byte	3, 1

	mGetTiles 0x230BD, 36
	.4byte	3, 0

	mGetTiles 0x230E1, 36
	.4byte	3, 1

	mGetTiles 0x23105, 36
	.4byte	3, 2

	mGetTiles 0x23129, 36
	.4byte	3, 3

	mGetTiles 0x23105, 36
	.4byte	3, 2

	mGetTiles 0x23129, 36
	.4byte	3, 3

	mGetTiles 0x2314D, 36
	.4byte	3, 4

	mGetTiles 0x23171, 36
	.4byte	3, 5

	mGetTiles 0x2314D, 36
	.4byte	3, 4

	mGetTiles 0x23171, 36
	.4byte	3, 5

	mGetTiles 0x23195, 36
	.4byte	3, 6

	mGetTiles 0x231B9, 36
	.4byte	3, 7

	mGetTiles 0x23195, 36
	.4byte	3, 6

	mGetTiles 0x231B9, 36
	.4byte	3, 7

	mJumpBack 0x53


anim_0851:
	.4byte anim_data__0851_0
