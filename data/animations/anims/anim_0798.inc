

anim_data__0798_0:
	mGetPalette 0xCC 16 0x30
	mGetTiles 0x2150B 4
	.4byte	4, 0

	mGetTiles 0x2150F 4
	.4byte	4, 1

	mGetTiles 0x21513 4
	.4byte	4, 2

	mGetTiles 0x21517 4
	.4byte	4, 3

	mGetTiles 0x2151B 4
	.4byte	4, 4

	mGetTiles 0x2151F 2
	.4byte	4, 5

	mJumpBack 0x21


anim_0798:
	.4byte anim_data__0798_0
