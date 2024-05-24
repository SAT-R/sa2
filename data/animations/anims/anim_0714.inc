

anim_data__0714_0:
	mGetTiles 0x1D7A6, 32
	mGetPalette 0x9D, 16, 0x80
	.4byte	2, 0

	.4byte	2, 1

	.4byte	2, 2

	.4byte	2, 3

	.4byte	2, 4

	.4byte	2, 5

	.4byte	2, 6

	.4byte	2, 7

	mJumpBack 0x13


anim_0714:
	.4byte anim_data__0714_0
