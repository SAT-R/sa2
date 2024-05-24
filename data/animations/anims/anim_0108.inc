

anim_data__0108_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x61C9, 16
	mAnimCmd6 0x0, 0xA06F4FA
	mAnimCmd6 0x1, 0x1010F0F0
	.4byte	1, 0

	mGetTiles 0x61D9, 16
	.4byte	1, 1

	mGetTiles 0x61E9, 16
	.4byte	1, 2

	mGetTiles 0x61F9, 16
	.4byte	1, 3

	mGetTiles 0x6209, 20
	mAnimCmd6 0x0, 0xA06F4FA
	mAnimCmd6 0x1, 0x1010F0F0
	.4byte	2, 4

	mGetTiles 0x621D, 20
	.4byte	2, 5

	mGetTiles 0x6231, 20
	.4byte	2, 6

	mGetTiles 0x6209, 20
	.4byte	2, 4

	mGetTiles 0x621D, 20
	.4byte	2, 5

	mGetTiles 0x6231, 20
	.4byte	2, 6

	mAnimCmd4 

anim_data__0108_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x6245, 20
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 7

	mGetTiles 0x6259, 20
	.4byte	2, 8

	mGetTiles 0x626D, 16
	.4byte	2, 9

	mGetTiles 0x627D, 20
	.4byte	2, 10

	mGetTiles 0x6291, 20
	.4byte	2, 11

	mGetTiles 0x62A5, 24
	.4byte	2, 12

	mGetTiles 0x62BD, 24
	.4byte	2, 13

	mGetTiles 0x62D5, 24
	.4byte	2, 14

	mJumpBack 0xF


anim_0108:
	.4byte anim_data__0108_0
	.4byte anim_data__0108_1
