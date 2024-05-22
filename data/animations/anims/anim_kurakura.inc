

anim_kurakura_variant_0:
	mGetPalette 0x36, 16, 0xD0
	mGetTiles 0x19860, 8
	mAnimCmd6 0x0, 0xD0BF2F5
	.4byte	12, 0

	mGetTiles 0x19868, 8
	.4byte	12, 1

	mGetTiles 0x19870, 6
	.4byte	12, 2

	mGetTiles 0x19876, 8
	.4byte	12, 3

	mJumpBack 0x1A


anim_kurakura:
	.4byte anim_kurakura_variant_0
