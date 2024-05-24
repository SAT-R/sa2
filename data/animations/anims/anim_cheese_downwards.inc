

anim_cheese_downwards_variant_0:
	mGetPalette 0x27, 16, 0xE0
	mGetTiles 0x18274, 6
	.4byte	4, 0

	mGetTiles 0x1827A, 6
	.4byte	4, 1

	mGetTiles 0x18280, 6
	.4byte	4, 2

	mGetTiles 0x18286, 6
	.4byte	4, 3

	mGetTiles 0x18280, 6
	.4byte	4, 2

	mGetTiles 0x1827A, 6
	.4byte	4, 1

	mJumpBack 0x21


anim_cheese_downwards:
	.4byte anim_cheese_downwards_variant_0
