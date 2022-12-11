

anim_straw_variant_0:
	mGetPalette 0x3D 16 0xC0
	mGetTiles 0x19F4B 12
	mAnimCmd6 0x0 0xA09F8F7
	.4byte	1, 0

	mGetTiles 0x19F57 12
	.4byte	1, 1

	mGetTiles 0x19F63 12
	.4byte	1, 2

	mJumpBack 0x15


anim_straw:
	.4byte anim_straw_variant_0
