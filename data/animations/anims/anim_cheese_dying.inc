

anim_cheese_dying_variant_0:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x18205 9
	.4byte	3, 0

	mGetTiles 0x1820E 9
	.4byte	3, 1

	mGetTiles 0x18217 9
	.4byte	3, 2

	mGetTiles 0x1820E 9
	.4byte	3, 1

	mJumpBack 0x17


anim_cheese_dying:
	.4byte anim_cheese_dying_variant_0
