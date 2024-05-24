

anim_data__0018_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1856, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x1866, 16
	.4byte	2, 1

	mGetTiles 0x1876, 16
	.4byte	2, 2

	mGetTiles 0x1886, 16
	.4byte	2, 3

	mGetTiles 0x1896, 16
	.4byte	2, 4

	mGetTiles 0x18A6, 16
	.4byte	2, 5

	mGetTiles 0x18B6, 16
	.4byte	2, 6

	mGetTiles 0x18C6, 16
	.4byte	2, 7

	mGetTiles 0x18D6, 16
	.4byte	2, 8

	mGetTiles 0x18E6, 16
	.4byte	2, 9

	mGetTiles 0x18F6, 16
	.4byte	2, 10

	mGetTiles 0x1906, 16
	.4byte	2, 11

	mJumpBack 0x14


anim_0018:
	.4byte anim_data__0018_0
