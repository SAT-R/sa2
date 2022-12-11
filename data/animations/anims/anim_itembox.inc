

anim_itembox_variant_0:
	mGetTiles 0x1D969 16
	mGetPalette 0x34 16 0x70
	mAnimCmd6 0x0 0x10DE5F3
	.4byte	1, 0

	mAnimCmd4 


anim_itembox:
	.4byte anim_itembox_variant_0
