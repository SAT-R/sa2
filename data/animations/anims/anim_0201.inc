

anim_data__0201_0:
	mGetPalette 0xB, 16, 0x0
	mGetTiles 0xB036, 18
	mAnimCmd6 0x0, 0xA05F4F9
	.4byte	4, 0

	mGetTiles 0xB048, 25
	.4byte	1, 1

	mGetTiles 0xB061, 20
	.4byte	2, 2

	mGetTiles 0xB075, 20
	.4byte	3, 3

	mGetTiles 0xB089, 20
	.4byte	3, 4

	mGetTiles 0xB09D, 30
	.4byte	3, 5

	mGetTiles 0xB0BB, 25
	.4byte	3, 6

	mGetTiles 0xB0D4, 20
	.4byte	3, 7

	mGetTiles 0xB0E8, 20
	.4byte	3, 8

	mGetTiles 0xB0FC, 30
	.4byte	3, 9

	mGetTiles 0xB11A, 25
	.4byte	3, 10

	mGetTiles 0xB133, 25
	.4byte	1, 11

	mGetTiles 0xB14C, 20
	.4byte	1, 12

	mGetTiles 0xB160, 25
	.4byte	1, 13

	mGetTiles 0xB179, 35
	.4byte	2, 14

	mGetTiles 0xB19C, 35
	.4byte	2, 15

	mGetTiles 0xB1BF, 35
	.4byte	2, 16

	mJumpBack 0xF


anim_0201:
	.4byte anim_data__0201_0
