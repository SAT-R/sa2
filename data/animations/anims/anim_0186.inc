

anim_data__0186_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0x9B6B, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x9B7B, 16
	.4byte	2, 1

	mGetTiles 0x9B8B, 16
	.4byte	2, 2

	mGetTiles 0x9B9B, 16
	.4byte	2, 3

	mGetTiles 0x9B6B, 16
	.4byte	2, 0

	mGetTiles 0x9B7B, 16
	.4byte	2, 1

	mGetTiles 0x9B8B, 16
	.4byte	2, 2

	mGetTiles 0x9B9B, 16
	.4byte	2, 3

	mJumpBack 0x31

anim_data__0186_1:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0x9BAB, 16
	.4byte	2, 4

	mGetTiles 0x9BBB, 16
	.4byte	2, 5

	mGetTiles 0x9BCB, 16
	.4byte	2, 6

	mGetTiles 0x9BDB, 16
	.4byte	2, 7

	mGetTiles 0x9BEB, 16
	.4byte	2, 8

	mGetTiles 0x9BFB, 16
	.4byte	2, 9

	mGetTiles 0x9C0B, 16
	.4byte	2, 10

	mGetTiles 0x9C1B, 16
	.4byte	2, 11

	mJumpBack 0x2B


anim_0186:
	.4byte anim_data__0186_0
	.4byte anim_data__0186_1
