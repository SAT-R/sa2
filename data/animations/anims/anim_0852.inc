

anim_data__0852_0:
	mGetPalette 0x2, 16, 0x50
	mGetTiles 0x231DD, 36
	.4byte	2, 0

	mGetTiles 0x23201, 36
	.4byte	2, 1

	mGetTiles 0x23225, 36
	.4byte	2, 2

	mGetTiles 0x23249, 36
	.4byte	2, 3

	mGetTiles 0x2326D, 36
	.4byte	2, 4

	mGetTiles 0x23291, 36
	.4byte	2, 5

	mJumpBack 0x21

anim_data__0852_1:
	mGetPalette 0x2, 16, 0x50
	mGetTiles 0x232B5, 6
	.4byte	2, 6

	mGetTiles 0x232BB, 6
	.4byte	2, 7

	mGetTiles 0x232C1, 9
	.4byte	2, 8

	mGetTiles 0x232CA, 9
	.4byte	2, 9

	mGetTiles 0x232D3, 9
	.4byte	2, 10

	mGetTiles 0x232DC, 9
	.4byte	2, 11

	mGetTiles 0x232E5, 1
	.4byte	2, 12

	mGetTiles 0x232E6, 1
	.4byte	2, 13

	mGetTiles 0x232E7, 4
	.4byte	2, 14

	mGetTiles 0x232EB, 4
	.4byte	2, 15

	mGetTiles 0x232EF, 4
	.4byte	2, 16

	mGetTiles 0x232F3, 4
	.4byte	2, 17

	mAnimCmd4 


anim_0852:
	.4byte anim_data__0852_0
	.4byte anim_data__0852_1
