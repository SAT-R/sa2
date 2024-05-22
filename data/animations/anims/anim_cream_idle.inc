

anim_cream_idle_variant_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x4841, 12
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	5, 0

	mGetTiles 0x484D, 12
	.4byte	5, 1

	mGetTiles 0x4859, 16
	.4byte	7, 2

	mGetTiles 0x4869, 16
	.4byte	10, 3

	mGetTiles 0x4879, 16
	.4byte	3, 4

	mGetTiles 0x4889, 12
	.4byte	3, 5

	mGetTiles 0x4895, 12
	.4byte	3, 6

	mGetTiles 0x48A1, 12
	.4byte	7, 7

	mGetTiles 0x4841, 12
	.4byte	5, 0

	mGetTiles 0x48AD, 12
	.4byte	5, 8

	mGetTiles 0x4859, 16
	.4byte	7, 2

	mGetTiles 0x4869, 16
	.4byte	10, 3

	mGetTiles 0x48B9, 16
	.4byte	3, 9

	mGetTiles 0x48C9, 12
	.4byte	3, 10

	mGetTiles 0x48D5, 12
	.4byte	3, 11

	mGetTiles 0x48E1, 12
	.4byte	7, 12

	mJumpBack 0x56


anim_cream_idle:
	.4byte anim_cream_idle_variant_0
