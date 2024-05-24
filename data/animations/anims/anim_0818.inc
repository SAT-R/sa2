

anim_data__0818_0:
	mGetPalette 0x2A, 16, 0x10
	mGetTiles 0x21BC7, 24
	.4byte	1, 0

	mGetPalette 0x2A, 16, 0x20
	mGetTiles 0x21BDF, 24
	.4byte	1, 1

	mGetPalette 0x2A, 16, 0x10
	mGetTiles 0x21BF7, 24
	.4byte	1, 2

	mGetPalette 0x2A, 16, 0x20
	mGetTiles 0x21C0F, 24
	.4byte	1, 3

	mJumpBack 0x20


anim_0818:
	.4byte anim_data__0818_0
