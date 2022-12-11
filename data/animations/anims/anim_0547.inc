

anim_data__0547_0:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x1AA70 4
	.4byte	5, 0

	mGetTiles 0x1AA74 4
	.4byte	5, 1

	mGetTiles 0x1AA78 4
	.4byte	5, 2

	mGetTiles 0x1AA7C 4
	.4byte	5, 3

	mGetTiles 0x1AA80 4
	.4byte	5, 4

	mGetTiles 0x1AA84 4
	.4byte	5, 5

	mGetTiles 0x1AA78 4
	.4byte	5, 2

	mGetTiles 0x1AA7C 4
	.4byte	5, 3

	mJumpBack 0x2B


anim_0547:
	.4byte anim_data__0547_0
