

anim_cheese_469_variant_0:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x1828C, 4
	.4byte	4, 0

	mGetTiles 0x18290, 4
	.4byte	5, 1

	mGetTiles 0x18294, 4
	.4byte	5, 2

	mGetTiles 0x18298, 4
	.4byte	8, 3

	mGetTiles 0x1829C, 4
	.4byte	8, 4

	mGetTiles 0x182A0, 4
	.4byte	8, 5

	mGetTiles 0x182A4, 4
	.4byte	8, 6

	mGetTiles 0x182A8, 4
	.4byte	8, 7

	mGetTiles 0x182AC, 4
	.4byte	8, 8

	mJumpBack 0x1E


anim_cheese_469:
	.4byte anim_cheese_469_variant_0
