

anim_cheese_hovering_variant_0:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x17D85 9
	.4byte	9, 0

	mGetTiles 0x17D8E 9
	.4byte	9, 1

	mGetTiles 0x17D97 9
	.4byte	9, 2

	mGetTiles 0x17DA0 9
	.4byte	9, 3

	mGetTiles 0x17DA9 9
	.4byte	9, 4

	mGetTiles 0x17DB2 9
	.4byte	9, 5

	mGetTiles 0x17D97 9
	.4byte	9, 2

	mGetTiles 0x17DBB 9
	.4byte	9, 6

	mJumpBack 0x2B


anim_cheese_hovering:
	.4byte anim_cheese_hovering_variant_0
