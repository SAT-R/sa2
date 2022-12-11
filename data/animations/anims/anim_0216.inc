

anim_data__0216_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0xBB4B 16
	.4byte	4, 0

	mGetTiles 0xBB5B 16
	.4byte	4, 1

	mGetTiles 0xBB6B 20
	.4byte	4, 2

	mGetTiles 0xBB7F 20
	.4byte	4, 3

	mGetTiles 0xBB93 20
	.4byte	4, 4

	mGetTiles 0xBBA7 25
	.4byte	4, 5

	mGetTiles 0xBBC0 20
	.4byte	4, 6

	mGetTiles 0xBBD4 25
	.4byte	4, 7

	mGetTiles 0xBBED 25
	.4byte	8, 8

	mGetTiles 0xBC06 25
	.4byte	6, 9

	mGetTiles 0xBC1F 30
	.4byte	6, 10

	mGetTiles 0xBC3D 25
	.4byte	6, 11

	mGetTiles 0xBC56 30
	.4byte	6, 12

	mGetTiles 0xBC74 30
	.4byte	6, 13

	mGetTiles 0xBC92 30
	.4byte	6, 14

	mGetTiles 0xBCB0 30
	.4byte	6, 15

	mGetTiles 0xBCCE 30
	.4byte	6, 16

	mGetTiles 0xBCEC 30
	.4byte	6, 17

	mGetTiles 0xBD0A 30
	.4byte	6, 18

	mGetTiles 0xBD28 30
	.4byte	6, 19

	mJumpBack 0x28


anim_0216:
	.4byte anim_data__0216_0
