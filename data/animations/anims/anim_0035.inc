

anim_data__0035_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x223F, 20
	.4byte	3, 0

	mGetTiles 0x2253, 20
	.4byte	3, 1

	mGetTiles 0x2267, 25
	.4byte	3, 2

	mGetTiles 0x2280, 20
	.4byte	3, 3

	mGetTiles 0x2294, 20
	.4byte	3, 4

	mGetTiles 0x22A8, 20
	.4byte	3, 5

	mGetTiles 0x22BC, 25
	.4byte	3, 6

	mGetTiles 0x22D5, 25
	.4byte	3, 7

	mGetTiles 0x22EE, 25
	.4byte	3, 8

	mGetTiles 0x2307, 25
	.4byte	3, 9

	mGetTiles 0x2320, 25
	.4byte	3, 10

	mGetTiles 0x2339, 25
	.4byte	3, 11

	mGetTiles 0x2352, 25
	.4byte	3, 12

	mGetTiles 0x236B, 25
	.4byte	3, 13

	mGetTiles 0x22BC, 25
	.4byte	3, 6

	mGetTiles 0x2384, 25
	.4byte	3, 14

	mJumpBack 0x28


anim_0035:
	.4byte anim_data__0035_0
