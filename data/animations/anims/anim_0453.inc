

anim_data__0453_0:
	mGetPalette 0x25, 16, 0x0
	mGetTiles 0x17C71, 16
	.4byte	2, 0

	mGetTiles 0x17C81, 16
	.4byte	2, 1

	mGetTiles 0x17C91, 16
	.4byte	2, 2

	mGetTiles 0x17CA1, 16
	.4byte	2, 3

	mGetTiles 0x17CB1, 16
	.4byte	2, 4

	mGetTiles 0x17CC1, 16
	.4byte	2, 5

	mJumpBack 0x21


anim_0453:
	.4byte anim_data__0453_0
