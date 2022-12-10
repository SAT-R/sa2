
.align 2, 0
	anim_data__0429_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16FB5 24
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 0

		mGetTiles 0x16FCD 24
		.4byte	2, 1

		mGetTiles 0x16FE5 30
		.4byte	2, 2

		mGetTiles 0x17003 24
		.4byte	2, 3

		mGetTiles 0x1701B 18
		.4byte	2, 4

		mGetTiles 0x1702D 24
		.4byte	2, 5

		mGetTiles 0x17045 24
		.4byte	2, 6

		mGetTiles 0x1705D 24
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0429_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17075 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 8

		mGetTiles 0x17089 20
		.4byte	3, 9

		mGetTiles 0x1709D 20
		.4byte	3, 10

		mGetTiles 0x170B1 20
		.4byte	3, 11

		mGetTiles 0x170C5 25
		.4byte	3, 12

		mAnimCmd4 

	anim_data__0429_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x170DE 24
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	3, 13

		mGetTiles 0x170F6 24
		.4byte	3, 14

		mGetTiles 0x1710E 24
		.4byte	3, 15

		mJumpBack 0x15


.align 2, 0
	anim_0429:
		.4byte anim_data__0429_0
		.4byte anim_data__0429_1
		.4byte anim_data__0429_2
