

anim_data__0015_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x13EF, 20
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0x1403, 18
	.4byte	3, 1

	mGetTiles 0x1415, 24
	.4byte	6, 2

	mGetTiles 0x1403, 18
	.4byte	2, 1

	mGetTiles 0x142D, 25
	.4byte	2, 3

	mGetTiles 0x1446, 20
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 4

	mGetTiles 0x145A, 20
	.4byte	2, 5

	mGetTiles 0x146E, 16
	.4byte	2, 6

	mGetTiles 0x147E, 16
	mAnimCmd6 0x0, 0x808F8F8
	mAnimCmd6 0x1, 0x808F8F8
	.4byte	2, 7

	mGetTiles 0x148E, 16
	.4byte	2, 8

	mGetTiles 0x149E, 16
	.4byte	2, 9

	mGetTiles 0x14AE, 16
	.4byte	2, 10

	mJumpBack 0x1A

anim_data__0015_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x14BE, 20
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	2, 11

	mGetTiles 0x14D2, 16
	.4byte	2, 12

	mGetTiles 0x14E2, 20
	.4byte	1, 13

	mGetTiles 0x14F6, 20
	.4byte	2, 14

	mGetTiles 0x150A, 20
	.4byte	3, 15

	mGetTiles 0x151E, 20
	.4byte	3, 16

	mGetTiles 0x1532, 20
	.4byte	3, 17

	mJumpBack 0xF

anim_data__0015_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1546, 16
	.4byte	2, 18

	mGetTiles 0x1556, 16
	.4byte	2, 19

	mJumpBack 0xD


anim_0015:
	.4byte anim_data__0015_0
	.4byte anim_data__0015_1
	.4byte anim_data__0015_2
