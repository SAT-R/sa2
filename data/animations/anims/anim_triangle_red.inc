

anim_triangle_red_variant_0:
	mGetPalette 0xBE 16 0x0
	mGetTiles 0x23478 4
	.4byte	3, 0

	mGetTiles 0x2347C 4
	.4byte	3, 1

	mGetTiles 0x23480 4
	.4byte	3, 2

	mGetTiles 0x23484 4
	.4byte	3, 3

	mGetTiles 0x23488 4
	.4byte	3, 4

	mGetTiles 0x2348C 4
	.4byte	3, 5

	mGetTiles 0x23490 4
	.4byte	3, 6

	mGetTiles 0x23494 4
	.4byte	3, 7

	mJumpBack 0x2B


anim_triangle_red:
	.4byte anim_triangle_red_variant_0
