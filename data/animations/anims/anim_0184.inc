

anim_data__0184_0:
	mGetPalette 0x9 16 0x0
	mGetTiles 0x99B5 20
	mAnimCmd6 0x0 0x1006FCFA
	.4byte	1, 0

	mGetTiles 0x99C9 24
	.4byte	1, 1

	mGetTiles 0x99E1 18
	.4byte	6, 2

	mGetTiles 0x99F3 18
	.4byte	6, 3

	mGetTiles 0x9A05 18
	.4byte	6, 4

	mGetTiles 0x9A17 18
	.4byte	6, 5

	mGetTiles 0x9A29 18
	.4byte	6, 6

	mGetTiles 0x9A3B 18
	.4byte	6, 7

	mGetTiles 0x9A4D 18
	.4byte	6, 8

	mGetTiles 0x9A5F 18
	.4byte	6, 9

	mGetTiles 0x99E1 18
	.4byte	6, 2

	mGetTiles 0x99F3 18
	.4byte	6, 3

	mGetTiles 0x9A05 18
	.4byte	6, 4

	mGetTiles 0x9A17 18
	.4byte	6, 5

	mGetTiles 0x9A71 18
	.4byte	6, 10

	mGetTiles 0x9A83 18
	.4byte	6, 11

	mGetTiles 0x9A95 18
	.4byte	6, 12

	mGetTiles 0x9A5F 18
	.4byte	6, 9

	mJumpBack 0x50

anim_data__0184_1:
	mGetPalette 0x9 16 0x0
	mGetTiles 0x99C9 24
	mAnimCmd6 0x0 0x1006FCFA
	.4byte	1, 1

	mGetTiles 0x99B5 20
	.4byte	1, 0

	mAnimCmd4 


anim_0184:
	.4byte anim_data__0184_0
	.4byte anim_data__0184_1
