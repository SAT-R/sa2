

anim_data__0962_0:
	mGetPalette 0x2B7, 16, 0x0
	mGetTiles 0x24FF2, 1
	.4byte	6, 0

	mGetTiles 0x24FF3, 2
	.4byte	6, 1

	mGetTiles 0x24FF5, 2
	.4byte	6, 2

	mGetTiles 0x24FF7, 1
	.4byte	6, 3

	mJumpBack 0x17

anim_data__0962_1:
	mGetPalette 0x2B7, 16, 0x0
	mGetTiles 0x24FF8, 1
	.4byte	6, 4

	mGetTiles 0x24FF9, 2
	.4byte	6, 5

	mGetTiles 0x24FFB, 2
	.4byte	6, 6

	mGetTiles 0x24FFD, 1
	.4byte	6, 7

	mJumpBack 0x17


anim_0962:
	.4byte anim_data__0962_0
	.4byte anim_data__0962_1
