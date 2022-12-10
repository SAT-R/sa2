

anim_data__0815_0:
	mGetPalette 0xD2 16 0xD0
	mGetTiles 0x21B1A 30
	.4byte	8, 0

	mGetTiles 0x21B38 30
	.4byte	8, 1

	mGetTiles 0x21B56 30
	.4byte	8, 2

	mGetTiles 0x21B74 30
	.4byte	8, 3

	mJumpBack 0x17


anim_0815:
	.4byte anim_data__0815_0
