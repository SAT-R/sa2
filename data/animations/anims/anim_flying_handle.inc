

anim_flying_handle_variant_0:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1B3E2, 25
	.4byte	2, 0

	mGetTiles 0x1B3FB, 15
	.4byte	2, 1

	mGetTiles 0x1B40A, 15
	.4byte	2, 2

	mGetTiles 0x1B419, 15
	.4byte	2, 3

	mJumpBack 0x17


anim_flying_handle:
	.4byte anim_flying_handle_variant_0
