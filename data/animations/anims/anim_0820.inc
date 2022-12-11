

anim_data__0820_0:
	mGetPalette 0xBF 16 0x80
	mGetTiles 0x21CE3 30
	.4byte	3, 0

	mGetTiles 0x21D01 35
	.4byte	3, 1

	mGetTiles 0x21D24 35
	.4byte	3, 2

	mJumpBack 0x12


anim_0820:
	.4byte anim_data__0820_0
