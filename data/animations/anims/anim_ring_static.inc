

anim_ring_static_variant_0:
	mGetTiles 0x1D9BD, 16
	mGetPalette 0xA1, 16, 0x60
	.4byte	8, 0

	.4byte	8, 1

	.4byte	8, 2

	.4byte	8, 3

	mJumpBack 0xB


anim_ring_static:
	.4byte anim_ring_static_variant_0
