

anim_data__0126_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x740A 20
	.4byte	2, 0

	mGetTiles 0x741E 16
	.4byte	2, 1

	mGetTiles 0x742E 16
	.4byte	2, 2

	mGetTiles 0x743E 16
	.4byte	2, 3

	mGetTiles 0x744E 16
	.4byte	2, 4

	mGetTiles 0x745E 20
	.4byte	3, 5

	mGetTiles 0x7472 16
	.4byte	3, 6

	mGetTiles 0x7482 20
	.4byte	3, 7

	mGetTiles 0x7496 25
	.4byte	3, 8

	mGetTiles 0x74AF 20
	.4byte	3, 9

	mGetTiles 0x74C3 16
	.4byte	3, 10

	mGetTiles 0x74D3 16
	.4byte	3, 11

	mGetTiles 0x74E3 16
	.4byte	3, 12

	mGetTiles 0x74F3 20
	.4byte	3, 13

	mGetTiles 0x7472 16
	.4byte	3, 6

	mGetTiles 0x7482 20
	.4byte	3, 7

	mGetTiles 0x7496 25
	.4byte	3, 8

	mGetTiles 0x74AF 20
	.4byte	3, 9

	mGetTiles 0x7507 16
	.4byte	3, 14

	mGetTiles 0x7517 16
	.4byte	3, 15

	mGetTiles 0x7527 16
	.4byte	3, 16

	mGetTiles 0x74F3 20
	.4byte	3, 13

	mJumpBack 0x50


anim_0126:
	.4byte anim_data__0126_0
