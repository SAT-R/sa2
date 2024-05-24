

anim_amy_idle_variant_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x13195, 20
	mAnimCmd6 0x0, 0x1006F4FA
	.4byte	6, 0

	mGetTiles 0x131A9, 20
	.4byte	6, 1

	mGetTiles 0x131BD, 20
	.4byte	6, 2

	mGetTiles 0x131D1, 20
	.4byte	6, 3

	mGetTiles 0x131E5, 20
	.4byte	6, 4

	mGetTiles 0x131F9, 20
	.4byte	6, 5

	mGetTiles 0x1320D, 20
	.4byte	6, 6

	mGetTiles 0x13221, 20
	.4byte	6, 7

	mGetTiles 0x13195, 20
	.4byte	6, 0

	mGetTiles 0x13235, 20
	.4byte	6, 8

	mGetTiles 0x13249, 20
	.4byte	6, 9

	mGetTiles 0x1325D, 20
	.4byte	6, 10

	mGetTiles 0x131E5, 20
	.4byte	6, 4

	mGetTiles 0x131F9, 20
	.4byte	6, 5

	mGetTiles 0x1320D, 20
	.4byte	6, 6

	mGetTiles 0x13221, 20
	.4byte	6, 7

	mJumpBack 0x56


anim_amy_idle:
	.4byte anim_amy_idle_variant_0
