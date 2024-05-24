

anim_data__0113_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x66B8, 64
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	1, 0

	mGetTiles 0x66F8, 64
	.4byte	1, 1

	mGetTiles 0x6738, 64
	.4byte	2, 2

	mGetTiles 0x6778, 64
	.4byte	1, 3

	mGetTiles 0x67B8, 64
	.4byte	1, 4

	mGetTiles 0x67F8, 64
	.4byte	1, 5

	mGetTiles 0x6838, 64
	.4byte	1, 6

	mGetTiles 0x6878, 64
	.4byte	2, 7

	mGetTiles 0x68B8, 64
	.4byte	1, 8

	mGetTiles 0x68F8, 64
	.4byte	1, 9

	mGetTiles 0x6938, 64
	.4byte	1, 10

	mGetTiles 0x6978, 64
	.4byte	2, 11

	mGetTiles 0x69B8, 64
	.4byte	2, 12

	mGetTiles 0x69F8, 64
	.4byte	2, 13

	mGetTiles 0x6A38, 64
	.4byte	2, 14

	mGetTiles 0x6A78, 64
	.4byte	2, 15

	mAnimCmd4 


anim_0113:
	.4byte anim_data__0113_0
