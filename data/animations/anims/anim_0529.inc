

anim_data__0529_0:
	mGetPalette 0x44 16 0x80
	mGetTiles 0x1A4E3 4
	.4byte	8, 0

	mGetTiles 0x1A4E7 4
	.4byte	8, 1

	mGetTiles 0x1A4EB 4
	.4byte	8, 2

	mGetTiles 0x1A4E7 4
	.4byte	8, 1

	mJumpBack 0x17


anim_0529:
	.4byte anim_data__0529_0
