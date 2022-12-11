

anim_soundtest_cream_clap_up_variant_0:
	mGetPalette 0x2BE 16 0x50
	mGetTiles 0x25081 64
	.4byte	5, 0

	mGetTiles 0x250C1 64
	.4byte	5, 1

	mGetTiles 0x25101 64
	.4byte	5, 2

	mGetTiles 0x25141 72
	.4byte	5, 3

	mGetTiles 0x25189 72
	.4byte	5, 4

	mGetTiles 0x251D1 72
	.4byte	5, 5

	mGetTiles 0x25219 64
	.4byte	5, 6

	mGetTiles 0x25259 64
	.4byte	5, 7

	mGetTiles 0x25299 72
	.4byte	5, 8

	mGetTiles 0x25189 72
	.4byte	5, 4

	mGetTiles 0x251D1 72
	.4byte	5, 5

	mJumpBack 0x3A

anim_soundtest_cream_clap_up_variant_1:
	mGetPalette 0x2BE 16 0x50
	mGetTiles 0x252E1 40
	.4byte	1, 9

	mAnimCmd4 


anim_soundtest_cream_clap_up:
	.4byte anim_soundtest_cream_clap_up_variant_0
	.4byte anim_soundtest_cream_clap_up_variant_1
