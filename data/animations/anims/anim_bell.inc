

anim_bell_variant_0:
	mGetPalette 0x39, 16, 0xC0
	mGetTiles 0x19A9C, 20
	mAnimCmd6 0x0, 0x1A0A02F7
	.4byte	5, 0

	mAnimCmd4 

anim_bell_variant_1:
	mGetPalette 0x39, 16, 0xC0
	mGetTiles 0x19AB0, 20
	mAnimCmd6 0x0, 0x1A0A02F7
	.4byte	5, 1

	mGetTiles 0x19AC4, 15
	.4byte	5, 2

	mGetTiles 0x19AD3, 20
	.4byte	5, 3

	mGetTiles 0x19AE7, 20
	.4byte	5, 4

	mGetTiles 0x19AFB, 15
	.4byte	5, 5

	mGetTiles 0x19B0A, 20
	.4byte	5, 6

	mGetTiles 0x19B1E, 20
	.4byte	5, 7

	mGetTiles 0x19B32, 20
	.4byte	5, 8

	mGetTiles 0x19B46, 20
	.4byte	5, 9

	mGetTiles 0x19B5A, 20
	.4byte	5, 10

	mGetTiles 0x19B6E, 20
	.4byte	5, 11

	mGetTiles 0x19B82, 20
	.4byte	5, 12

	mGetTiles 0x19B96, 20
	.4byte	5, 13

	mJumpBack 0x3C


anim_bell:
	.4byte anim_bell_variant_0
	.4byte anim_bell_variant_1
