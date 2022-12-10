

anim_data__0316_0:
	mGetPalette 0x19 16 0x90
	mGetTiles 0x10C8F 35
	.4byte	3, 0

	mGetTiles 0x10CB2 28
	.4byte	3, 1

	mGetTiles 0x10CCE 25
	.4byte	3, 2

	mGetTiles 0x10CE7 25
	.4byte	3, 3

	mGetTiles 0x10D00 25
	.4byte	3, 4

	mGetTiles 0x10D19 20
	.4byte	3, 5

	mGetTiles 0x10D2D 25
	.4byte	3, 6

	mGetTiles 0x10D46 25
	.4byte	3, 7

	mJumpBack 0x2B


anim_0316:
	.4byte anim_data__0316_0
