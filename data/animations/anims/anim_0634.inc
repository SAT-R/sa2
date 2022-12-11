

anim_data__0634_0:
	mGetPalette 0x85 16 0x80
	mGetTiles 0x1BD4C 9
	.4byte	2, 0

	mGetTiles 0x1BD55 9
	.4byte	2, 1

	mGetTiles 0x1BD5E 9
	.4byte	2, 2

	mGetTiles 0x1BD67 9
	.4byte	2, 3

	mJumpBack 0x17


anim_0634:
	.4byte anim_data__0634_0
