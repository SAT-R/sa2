

anim_data__0095_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x4C19 16
	mAnimCmd6 0x0 0x808F8F8
	mAnimCmd6 0x1 0x808F8F8
	.4byte	2, 0

	mGetTiles 0x4C29 16
	.4byte	2, 1

	mGetTiles 0x4C39 16
	.4byte	2, 2

	mGetTiles 0x4C49 16
	.4byte	2, 3

	mJumpBack 0x1D

anim_data__0095_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x4C59 16
	.4byte	2, 4

	mGetTiles 0x4C69 16
	.4byte	2, 5

	mGetTiles 0x4C79 16
	.4byte	2, 6

	mGetTiles 0x4C89 16
	.4byte	2, 7

	mGetTiles 0x4C99 16
	.4byte	2, 8

	mGetTiles 0x4CA9 16
	.4byte	2, 9

	mGetTiles 0x4CB9 16
	.4byte	2, 10

	mGetTiles 0x4CC9 16
	.4byte	2, 11

	mJumpBack 0x2B


anim_0095:
	.4byte anim_data__0095_0
	.4byte anim_data__0095_1
