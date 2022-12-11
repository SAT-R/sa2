

anim_data__0135_0:
	mGetPalette 0x7 16 0x20
	mGetTiles 0x767E 20
	.4byte	4, 0

	mGetTiles 0x7692 15
	.4byte	4, 1

	mGetTiles 0x76A1 15
	.4byte	4, 2

	mGetTiles 0x76B0 15
	.4byte	4, 3

	mGetTiles 0x76A1 15
	.4byte	4, 2

	mGetTiles 0x7692 15
	.4byte	4, 1

	mJumpBack 0x21


anim_0135:
	.4byte anim_data__0135_0
