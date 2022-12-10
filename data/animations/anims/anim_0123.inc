

anim_data__0123_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x6FF3 12
	.4byte	8, 0

	mGetTiles 0x6FFF 15
	.4byte	8, 1

	mGetTiles 0x700E 20
	.4byte	8, 2

	mGetTiles 0x7022 20
	.4byte	8, 3

	mGetTiles 0x7036 20
	.4byte	4, 4

	mGetTiles 0x704A 20
	.4byte	4, 5

	mGetTiles 0x7036 20
	.4byte	4, 4

	mGetTiles 0x7022 20
	.4byte	8, 3

	mGetTiles 0x705E 15
	.4byte	4, 6

	mGetTiles 0x706D 12
	.4byte	4, 7

	mGetTiles 0x7079 16
	.4byte	4, 8

	mGetTiles 0x7089 16
	.4byte	6, 9

	mGetTiles 0x7099 16
	.4byte	4, 10

	mGetTiles 0x70A9 24
	.4byte	5, 11

	mGetTiles 0x70C1 20
	.4byte	5, 12

	mGetTiles 0x70D5 24
	.4byte	5, 13

	mGetTiles 0x70ED 16
	.4byte	5, 14

	mGetTiles 0x70FD 16
	.4byte	5, 15

	mGetTiles 0x710D 16
	.4byte	5, 16

	mGetTiles 0x711D 24
	.4byte	5, 17

	mGetTiles 0x7135 20
	.4byte	5, 18

	mGetTiles 0x7149 24
	.4byte	5, 19

	mGetTiles 0x70ED 16
	.4byte	5, 14

	mGetTiles 0x7161 16
	.4byte	5, 20

	mGetTiles 0x710D 16
	.4byte	5, 16

	mJumpBack 0x3C


anim_0123:
	.4byte anim_data__0123_0
