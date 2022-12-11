

anim_data__0548_0:
	mGetPalette 0x34 16 0x70
	mGetTiles 0x1AA88 2
	.4byte	5, 0

	mGetTiles 0x1AA8A 2
	.4byte	5, 1

	mGetTiles 0x1AA8C 2
	.4byte	5, 2

	mGetTiles 0x1AA8E 2
	.4byte	5, 3

	mJumpBack 0x17


anim_0548:
	.4byte anim_data__0548_0
