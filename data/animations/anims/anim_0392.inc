
.align 2, 0
	anim_data__0392_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15040 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	3, 0

		mGetTiles 0x15054 25
		.4byte	8, 1

		mGetTiles 0x1506D 20
		.4byte	8, 2

		mGetTiles 0x15081 16
		.4byte	8, 3

		mAnimCmd4 

	anim_data__0392_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15091 25
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	5, 4

		mGetTiles 0x150AA 15
		.4byte	5, 5

		mGetTiles 0x150B9 16
		.4byte	5, 6

		mGetTiles 0x150C9 16
		.4byte	5, 7

		mGetTiles 0x150D9 20
		.4byte	5, 8

		mAnimCmd4 

	anim_data__0392_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x150ED 16
		.4byte	2, 9

		mGetTiles 0x150FD 16
		.4byte	2, 10

		mGetTiles 0x1510D 20
		.4byte	2, 11

		mGetTiles 0x15121 16
		.4byte	2, 12

		mGetTiles 0x15131 16
		.4byte	2, 13

		mAnimCmd4 


.align 2, 0
	anim_0392:
		.4byte anim_data__0392_0
		.4byte anim_data__0392_1
		.4byte anim_data__0392_2
