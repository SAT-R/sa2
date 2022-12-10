

anim_data__1103_0:
	mGetPalette 0x2DB 16 0x80
	mGetTiles 0x2A581 48
	.4byte	3, 0

	mGetTiles 0x2A5B1 48
	.4byte	3, 1

	mGetTiles 0x2A5E1 48
	.4byte	3, 2

	mGetTiles 0x2A611 48
	.4byte	3, 3

	mGetTiles 0x2A641 48
	.4byte	3, 4

	mGetTiles 0x2A671 48
	.4byte	3, 5

	mGetTiles 0x2A6A1 42
	.4byte	3, 6

	mGetTiles 0x2A6CB 49
	.4byte	3, 7

	mGetTiles 0x2A6FC 56
	.4byte	3, 8

	mGetTiles 0x2A734 56
	.4byte	3, 9

	mGetTiles 0x2A76C 56
	.4byte	3, 10

	mGetTiles 0x2A7A4 56
	.4byte	3, 11

	mGetTiles 0x2A7DC 56
	.4byte	3, 12

	mAnimCmd4 

anim_data__1103_1:
	mGetPalette 0x2DB 16 0x80
	mGetTiles 0x2A7A4 56
	.4byte	3, 11

	mGetTiles 0x2A76C 56
	.4byte	3, 10

	mGetTiles 0x2A814 56
	.4byte	3, 13

	mGetTiles 0x2A76C 56
	.4byte	3, 10

	mGetTiles 0x2A7A4 56
	.4byte	3, 11

	mGetTiles 0x2A7DC 56
	.4byte	3, 12

	mJumpBack 0x21


anim_1103:
	.4byte anim_data__1103_0
	.4byte anim_data__1103_1
