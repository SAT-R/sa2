

anim_data__0523_0:
	mGetPalette 0x44 16 0x80
	mGetTiles 0x1A49B 4
	.4byte	8, 0

	mGetTiles 0x1A49F 4
	.4byte	8, 1

	mGetTiles 0x1A4A3 4
	.4byte	8, 2

	mGetTiles 0x1A49F 4
	.4byte	8, 1

	mJumpBack 0x17


anim_0523:
	.4byte anim_data__0523_0
