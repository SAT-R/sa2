

anim_data__0863_0:
	mGetPalette 0xE4, 16, 0x0
	mGetTiles 0x23418, 4
	.4byte	3, 0

	mGetTiles 0x2341C, 4
	.4byte	3, 1

	mGetTiles 0x23420, 4
	.4byte	3, 2

	mGetTiles 0x23424, 4
	.4byte	3, 3

	mGetTiles 0x23428, 4
	.4byte	3, 4

	mGetTiles 0x2342C, 4
	.4byte	3, 5

	mGetTiles 0x23430, 4
	.4byte	3, 6

	mGetTiles 0x23434, 4
	.4byte	3, 7

	mJumpBack 0x2B


anim_0863:
	.4byte anim_data__0863_0
