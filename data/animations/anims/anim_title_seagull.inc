

anim_title_seagull_variant_0:
	mGetPalette 0xD9 16 0x90
	mGetTiles 0x220DD 3
	.4byte	8, 0

	mGetTiles 0x220E0 3
	.4byte	8, 1

	mGetTiles 0x220E3 3
	.4byte	8, 2

	mGetTiles 0x220E6 3
	.4byte	10, 3

	mGetTiles 0x220DD 3
	.4byte	8, 0

	mGetTiles 0x220E0 3
	.4byte	8, 1

	mGetTiles 0x220E3 3
	.4byte	8, 2

	mGetTiles 0x220E6 3
	.4byte	10, 3

	mJumpBack 0x2B


anim_title_seagull:
	.4byte anim_title_seagull_variant_0
