

anim_data__0301_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x100FC, 25
	mAnimCmd6 0x0, 0x1006F2FA
	.4byte	3, 0

	mGetTiles 0x10115, 20
	.4byte	8, 1

	mGetTiles 0x10129, 20
	.4byte	8, 2

	mGetTiles 0x1013D, 20
	.4byte	8, 3

	mGetTiles 0x10151, 15
	.4byte	8, 4

	mJumpBack 0x5

anim_data__0301_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x10160, 30
	mAnimCmd6 0x0, 0x1806FAFA
	.4byte	5, 5

	mGetTiles 0x1017E, 24
	.4byte	5, 6

	mGetTiles 0x10196, 24
	.4byte	5, 7

	mGetTiles 0x101AE, 25
	.4byte	5, 8

	mGetTiles 0x101C7, 25
	.4byte	5, 9

	mAnimCmd4 

anim_data__0301_2:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x101E0, 20
	.4byte	5, 10

	mGetTiles 0x101F4, 16
	.4byte	3, 11

	mGetTiles 0x10204, 20
	.4byte	3, 12

	mGetTiles 0x10218, 20
	.4byte	3, 13

	mAnimCmd4 


anim_0301:
	.4byte anim_data__0301_0
	.4byte anim_data__0301_1
	.4byte anim_data__0301_2
