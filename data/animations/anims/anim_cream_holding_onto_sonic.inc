

anim_cream_holding_onto_sonic_variant_0:
	mGetPalette 0x7, 16, 0x20
	mGetTiles 0x75DE, 20
	.4byte	3, 0

	mGetTiles 0x75F2, 20
	.4byte	3, 1

	mGetTiles 0x7606, 20
	.4byte	3, 2

	mGetTiles 0x761A, 25
	.4byte	3, 3

	mGetTiles 0x7633, 20
	.4byte	3, 4

	mGetTiles 0x7647, 20
	.4byte	3, 5

	mGetTiles 0x765B, 15
	.4byte	3, 6

	mGetTiles 0x766A, 20
	.4byte	3, 7

	mJumpBack 0x2B


anim_cream_holding_onto_sonic:
	.4byte anim_cream_holding_onto_sonic_variant_0
