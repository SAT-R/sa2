

anim_data__0393_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x15141, 20
	.4byte	3, 0

	mGetTiles 0x15155, 30
	.4byte	3, 1

	mGetTiles 0x15173, 30
	.4byte	2, 2

	mGetTiles 0x15191, 20
	.4byte	3, 3

	mGetTiles 0x151A5, 24
	.4byte	3, 4

	mJumpBack 0xA


anim_0393:
	.4byte anim_data__0393_0
