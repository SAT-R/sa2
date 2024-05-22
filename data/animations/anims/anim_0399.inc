

anim_data__0399_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x15B3A, 16
	.4byte	2, 0

	mGetTiles 0x15B4A, 16
	.4byte	2, 1

	mGetTiles 0x15B5A, 20
	.4byte	3, 2

	mGetTiles 0x15B6E, 20
	.4byte	3, 3

	mGetTiles 0x15B82, 16
	.4byte	3, 4

	mGetTiles 0x15B92, 16
	.4byte	3, 5

	mGetTiles 0x15BA2, 20
	.4byte	3, 6

	mGetTiles 0x15BB6, 20
	.4byte	3, 7

	mGetTiles 0x15BCA, 16
	.4byte	3, 8

	mGetTiles 0x15BDA, 16
	.4byte	3, 9

	mGetTiles 0x15B5A, 20
	.4byte	3, 2

	mGetTiles 0x15B6E, 20
	.4byte	3, 3

	mGetTiles 0x15B82, 16
	.4byte	3, 4

	mGetTiles 0x15B92, 16
	.4byte	3, 5

	mGetTiles 0x15BEA, 20
	.4byte	3, 10

	mGetTiles 0x15BFE, 20
	.4byte	3, 11

	mGetTiles 0x15C12, 16
	.4byte	3, 12

	mGetTiles 0x15BDA, 16
	.4byte	3, 9

	mJumpBack 0x50


anim_0399:
	.4byte anim_data__0399_0
