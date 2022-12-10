

anim_data__0821_0:
	mGetPalette 0xD3 16 0xF0
	mGetTiles 0x21D47 4
	.4byte	3, 0

	mGetTiles 0x21D4B 4
	.4byte	3, 1

	mGetTiles 0x21D4F 4
	.4byte	3, 2

	mJumpBack 0x12


anim_0821:
	.4byte anim_data__0821_0
