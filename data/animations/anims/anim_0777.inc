

anim_data__0777_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x2004A, 64
	.4byte	2, 0

	mGetTiles 0x2008A, 64
	.4byte	2, 1

	mGetTiles 0x200CA, 64
	.4byte	2, 2

	mGetTiles 0x2010A, 64
	.4byte	2, 3

	mGetTiles 0x2014A, 64
	.4byte	2, 4

	mGetTiles 0x2018A, 64
	.4byte	2, 5

	mJumpBack 0x21


anim_0777:
	.4byte anim_data__0777_0
