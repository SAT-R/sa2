

anim_data__0217_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xBD46, 20
	.4byte	2, 0

	mGetTiles 0xBD5A, 20
	.4byte	2, 1

	mGetTiles 0xBD6E, 24
	.4byte	3, 2

	mGetTiles 0xBD86, 24
	.4byte	3, 3

	mGetTiles 0xBD9E, 24
	.4byte	3, 4

	mGetTiles 0xBDB6, 24
	.4byte	3, 5

	mGetTiles 0xBDCE, 24
	.4byte	3, 6

	mGetTiles 0xBDE6, 24
	.4byte	3, 7

	mGetTiles 0xBDFE, 20
	.4byte	3, 8

	mGetTiles 0xBE12, 20
	.4byte	3, 9

	mJumpBack 0x28


anim_0217:
	.4byte anim_data__0217_0
