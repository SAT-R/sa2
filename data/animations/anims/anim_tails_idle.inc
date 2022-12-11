

anim_tails_idle_variant_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0x95F3 24
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	8, 0

	mGetTiles 0x960B 24
	.4byte	8, 1

	mGetTiles 0x9623 30
	.4byte	8, 2

	mGetTiles 0x9641 24
	.4byte	8, 3

	mGetTiles 0x9659 24
	.4byte	8, 4

	mGetTiles 0x9671 24
	.4byte	8, 5

	mGetTiles 0x9689 30
	.4byte	8, 6

	mGetTiles 0x96A7 24
	.4byte	8, 7

	mGetTiles 0x95F3 24
	.4byte	8, 0

	mGetTiles 0x96BF 24
	.4byte	8, 8

	mGetTiles 0x96D7 30
	.4byte	8, 9

	mGetTiles 0x96F5 24
	.4byte	8, 10

	mGetTiles 0x9659 24
	.4byte	8, 4

	mGetTiles 0x9671 24
	.4byte	8, 5

	mGetTiles 0x9689 30
	.4byte	8, 6

	mGetTiles 0x96A7 24
	.4byte	8, 7

	mJumpBack 0x56


anim_tails_idle:
	.4byte anim_tails_idle_variant_0
