

anim_kyura_proj_variant_0:
	mGetPalette 0x40, 16, 0xC0
	mGetTiles 0x1A1CB, 3
	mAnimCmd6 0x0, 0xA02F7FE
	.4byte	2, 0

	mGetTiles 0x1A1CE, 3
	.4byte	2, 1

	mGetTiles 0x1A1D1, 3
	.4byte	2, 2

	mJumpBack 0x15

anim_kyura_proj_variant_1:
	mGetPalette 0x40, 16, 0xC0
	mGetTiles 0x1A1D4, 3
	mAnimCmd6 0x0, 0xA02F7FE
	.4byte	2, 3

	mGetTiles 0x1A1D7, 3
	.4byte	2, 4

	mGetTiles 0x1A1DA, 3
	.4byte	2, 5

	mGetTiles 0x1A1DD, 3
	.4byte	2, 6

	mGetTiles 0x1A1D1, 3
	.4byte	2, 2

	mGetTiles 0x1A1E0, 3
	.4byte	2, 7

	mJumpBack 0x24


anim_kyura_proj:
	.4byte anim_kyura_proj_variant_0
	.4byte anim_kyura_proj_variant_1
