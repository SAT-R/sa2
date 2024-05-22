

anim_data__0776_0:
	mGetPalette 0xBD, 16, 0x0
	mGetTiles 0x1FECA, 64
	.4byte	2, 0

	mGetTiles 0x1FF0A, 64
	.4byte	2, 1

	mGetTiles 0x1FF4A, 64
	.4byte	2, 2

	mGetTiles 0x1FF8A, 64
	.4byte	2, 3

	mGetTiles 0x1FFCA, 64
	.4byte	2, 4

	mGetTiles 0x2000A, 64
	.4byte	2, 5

	mJumpBack 0x21


anim_0776:
	.4byte anim_data__0776_0
