

anim_leaf_forest_ground_tile_variant_0:
	mGetPalette 0x46, 16, 0xB0
	mGetTiles 0x1A5D4, 64
	.4byte	1, 0

	mAnimCmd4 


anim_leaf_forest_ground_tile:
	.4byte anim_leaf_forest_ground_tile_variant_0
