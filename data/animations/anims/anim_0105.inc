

anim_data__0105_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x5F94, 16
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	1, 0

	mGetTiles 0x5FA4, 16
	.4byte	1, 1

	mGetTiles 0x5FB4, 16
	.4byte	1, 2

	mGetTiles 0x5FC4, 16
	.4byte	1, 3

	mGetTiles 0x5FD4, 20
	.4byte	1, 4

	mGetTiles 0x5FE8, 20
	.4byte	1, 5

	mGetTiles 0x5FFC, 20
	.4byte	3, 6

	mGetTiles 0x6010, 25
	.4byte	1, 7

	mGetTiles 0x6029, 25
	.4byte	2, 8

	mGetTiles 0x6042, 20
	.4byte	2, 9

	mGetTiles 0x6056, 25
	.4byte	2, 10

	mGetTiles 0x606F, 20
	.4byte	2, 11

	mGetTiles 0x6083, 20
	.4byte	6, 12

	mGetTiles 0x6097, 16
	.4byte	3, 13

	mGetTiles 0x60A7, 16
	.4byte	3, 14

	mAnimCmd4 


anim_0105:
	.4byte anim_data__0105_0
