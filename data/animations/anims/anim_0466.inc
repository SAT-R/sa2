

anim_data__0466_0:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x18220 9
	.4byte	4, 0

	mGetTiles 0x18229 9
	.4byte	4, 1

	mGetTiles 0x18232 9
	.4byte	4, 2

	mGetTiles 0x1823B 9
	.4byte	4, 3

	mJumpBack 0x17


anim_0466:
	.4byte anim_data__0466_0
