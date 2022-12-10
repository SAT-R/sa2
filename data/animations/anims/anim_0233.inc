
.align 2, 0
	anim_data__0233_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC7D1 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC7E9 24
		.4byte	2, 1

		mGetTiles 0xC801 20
		.4byte	4, 2

		mAnimCmd4 

	anim_data__0233_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC815 16
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 3

		mGetTiles 0xC825 20
		.4byte	2, 4

		mGetTiles 0xC839 20
		.4byte	2, 5

		mGetTiles 0xC84D 30
		.4byte	3, 6

		mGetTiles 0xC86B 25
		.4byte	3, 7

		mGetTiles 0xC884 30
		.4byte	3, 8

		mGetTiles 0xC8A2 25
		.4byte	3, 9

		mGetTiles 0xC84D 30
		.4byte	3, 6

		mGetTiles 0xC86B 25
		.4byte	3, 7

		mGetTiles 0xC884 30
		.4byte	3, 8

		mGetTiles 0xC8A2 25
		.4byte	3, 9

		mJumpBack 0x28


.align 2, 0
	anim_0233:
		.4byte anim_data__0233_0
		.4byte anim_data__0233_1
