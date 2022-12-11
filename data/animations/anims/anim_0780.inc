

anim_data__0780_0:
	mGetPalette 0x25 16 0x0
	mGetTiles 0x204CA 64
	.4byte	2, 0

	mGetTiles 0x2050A 64
	.4byte	2, 1

	mGetTiles 0x2054A 64
	.4byte	2, 2

	mGetTiles 0x2058A 64
	.4byte	2, 3

	mGetTiles 0x205CA 64
	.4byte	2, 4

	mGetTiles 0x2060A 64
	.4byte	2, 5

	mJumpBack 0x21


anim_0780:
	.4byte anim_data__0780_0
