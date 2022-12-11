

anim_yado_proj_variant_0:
	mGetPalette 0x39 16 0xC0
	mGetTiles 0x19DA4 4
	mAnimCmd6 0x0 0x404FEFD
	.4byte	3, 0

	mGetTiles 0x19DA8 4
	.4byte	3, 1

	mJumpBack 0x10


anim_yado_proj:
	.4byte anim_yado_proj_variant_0
