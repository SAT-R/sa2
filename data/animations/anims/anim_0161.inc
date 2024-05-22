

anim_data__0161_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x8D09, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x8D19, 16
	.4byte	2, 1

	mGetTiles 0x8D29, 16
	.4byte	2, 2

	mGetTiles 0x8D39, 16
	.4byte	2, 3

	mGetTiles 0x8D49, 16
	.4byte	2, 4

	mGetTiles 0x8D59, 16
	.4byte	2, 5

	mGetTiles 0x8D69, 16
	.4byte	2, 6

	mGetTiles 0x8D79, 16
	.4byte	2, 7

	mJumpBack 0x31


anim_0161:
	.4byte anim_data__0161_0
