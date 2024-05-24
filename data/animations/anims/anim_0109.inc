

anim_data__0109_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x62ED, 24
	mAnimCmd6 0x0, 0x806F2FA
	.4byte	1, 0

	mGetTiles 0x6305, 24
	.4byte	1, 1

	mGetTiles 0x631D, 20
	.4byte	1, 2

	mGetTiles 0x6331, 25
	.4byte	3, 3

	mGetTiles 0x634A, 25
	.4byte	1, 4

	mGetTiles 0x6363, 24
	.4byte	1, 5

	mGetTiles 0x637B, 25
	.4byte	1, 6

	mGetTiles 0x6394, 25
	.4byte	2, 7

	mGetTiles 0x63AD, 20
	.4byte	2, 8

	mGetTiles 0x63C1, 25
	.4byte	2, 9

	mGetTiles 0x63DA, 20
	.4byte	2, 10

	mGetTiles 0x63EE, 20
	.4byte	4, 11

	mGetTiles 0x6402, 25
	.4byte	3, 12

	mGetTiles 0x641B, 20
	.4byte	3, 13

	mGetTiles 0x642F, 24
	.4byte	3, 14

	mGetTiles 0x6447, 28
	.4byte	3, 15

	mGetTiles 0x6463, 28
	.4byte	3, 16

	mGetTiles 0x647F, 28
	.4byte	3, 17

	mJumpBack 0xF


anim_0109:
	.4byte anim_data__0109_0
