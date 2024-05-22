

anim_data__0016_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1566, 16
	mAnimCmd6 0x0, 0x1006FAFA
	.4byte	2, 0

	mGetTiles 0x1576, 30
	mAnimCmd6 0x0, 0x100EFAF2
	mAnimCmd6 0x1, 0x1006ECE9
	.4byte	2, 1

	mGetTiles 0x1594, 18
	.4byte	2, 2

	mGetTiles 0x15A6, 24
	.4byte	1, 3

	mGetTiles 0x15BE, 30
	.4byte	1, 4

	mGetTiles 0x15DC, 30
	.4byte	1, 5

	mGetTiles 0x15FA, 36
	.4byte	1, 6

	mGetTiles 0x161E, 25
	.4byte	1, 7

	mGetTiles 0x1637, 30
	.4byte	1, 8

	mGetTiles 0x1655, 30
	.4byte	1, 9

	mGetTiles 0x1673, 20
	.4byte	1, 10

	mAnimCmd4 

anim_data__0016_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x1687, 24
	mAnimCmd6 0x0, 0x100EFEF2
	mAnimCmd6 0x1, 0x1203F8EB
	.4byte	2, 11

	mGetTiles 0x169F, 24
	.4byte	2, 12

	mGetTiles 0x16B7, 24
	.4byte	2, 13

	mJumpBack 0x18

anim_data__0016_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x16CF, 16
	mAnimCmd6 0x0, 0x1006FAFA
	.4byte	1, 14

	mGetTiles 0x16DF, 16
	.4byte	1, 15

	mGetTiles 0x16EF, 16
	.4byte	1, 16

	mAnimCmd4 

anim_data__0016_3:
	mGetPalette 0x2, 16, 0x50
	mGetTiles 0x16FF, 9
	.4byte	1, 17

	mGetTiles 0x1708, 15
	.4byte	1, 18

	mGetTiles 0x1717, 15
	.4byte	1, 19

	mGetTiles 0x16FF, 9
	.4byte	1, 17

	mGetTiles 0x1708, 15
	.4byte	1, 18

	mGetTiles 0x1717, 15
	.4byte	1, 19

	mJumpBack 0x21


anim_0016:
	.4byte anim_data__0016_0
	.4byte anim_data__0016_1
	.4byte anim_data__0016_2
	.4byte anim_data__0016_3
