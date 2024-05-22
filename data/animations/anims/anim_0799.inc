

anim_data__0799_0:
	mGetPalette 0xCD, 16, 0x70
	mGetTiles 0x21521, 24
	.4byte	1, 0

	mGetTiles 0x21539, 24
	.4byte	1, 1

	mGetTiles 0x21551, 16
	.4byte	1, 2

	mJumpBack 0x12


anim_0799:
	.4byte anim_data__0799_0
