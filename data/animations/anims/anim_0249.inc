

anim_data__0249_0:
	mGetPalette 0x13, 16, 0x0
	mGetTiles 0xD9AE, 30
	mAnimCmd6 0x0, 0xC06F6FA
	.4byte	5, 0

	mGetTiles 0xD9CC, 24
	.4byte	5, 1

	mGetTiles 0xD9E4, 30
	.4byte	5, 2

	mGetTiles 0xDA02, 24
	.4byte	5, 3

	mGetTiles 0xDA1A, 30
	.4byte	5, 4

	mGetTiles 0xDA38, 30
	.4byte	5, 5

	mGetTiles 0xDA56, 30
	.4byte	5, 6

	mGetTiles 0xDA74, 30
	.4byte	5, 7

	mJumpBack 0x2E


anim_0249:
	.4byte anim_data__0249_0
