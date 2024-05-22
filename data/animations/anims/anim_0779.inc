

anim_data__0779_0:
	mGetPalette 0xBE, 16, 0x0
	mGetTiles 0x2034A, 64
	.4byte	2, 0

	mGetTiles 0x2038A, 64
	.4byte	2, 1

	mGetTiles 0x203CA, 64
	.4byte	2, 2

	mGetTiles 0x2040A, 64
	.4byte	2, 3

	mGetTiles 0x2044A, 64
	.4byte	2, 4

	mGetTiles 0x2048A, 64
	.4byte	2, 5

	mJumpBack 0x21


anim_0779:
	.4byte anim_data__0779_0
