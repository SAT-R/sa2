

anim_flower_blue_small_variant_0:
	mGetPalette 0x34, 16, 0x70
	mGetTiles 0x1AAA8, 2
	.4byte	5, 0

	mGetTiles 0x1AAAA, 2
	.4byte	5, 1

	mGetTiles 0x1AAAC, 2
	.4byte	5, 2

	mGetTiles 0x1AAAE, 1
	.4byte	5, 3

	mJumpBack 0x17


anim_flower_blue_small:
	.4byte anim_flower_blue_small_variant_0
