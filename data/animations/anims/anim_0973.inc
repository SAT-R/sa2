
.align 2, 0
	anim_data__0973_0:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x255BC 48
		.4byte	5, 0

		mGetTiles 0x255EC 56
		.4byte	5, 1

		mGetTiles 0x25624 48
		.4byte	10, 2

		mGetTiles 0x25654 48
		.4byte	5, 3

		mGetTiles 0x25684 56
		.4byte	10, 4

		mGetTiles 0x256BC 48
		.4byte	5, 5

		mGetTiles 0x256EC 56
		.4byte	5, 6

		mGetTiles 0x25724 48
		.4byte	10, 7

		mGetTiles 0x25754 48
		.4byte	5, 8

		mGetTiles 0x25784 56
		.4byte	10, 9

		mGetTiles 0x25784 56
		.4byte	5, 9

		mGetTiles 0x257BC 56
		.4byte	5, 10

		mGetTiles 0x257F4 56
		.4byte	10, 11

		mGetTiles 0x2582C 56
		.4byte	5, 12

		mGetTiles 0x25864 56
		.4byte	10, 13

		mGetTiles 0x25864 56
		.4byte	5, 13

		mGetTiles 0x255EC 56
		.4byte	5, 1

		mGetTiles 0x2589C 56
		.4byte	10, 14

		mGetTiles 0x258D4 56
		.4byte	5, 15

		mGetTiles 0x2590C 56
		.4byte	10, 16

		mGetTiles 0x25864 56
		.4byte	5, 13

		mJumpBack 0x6C


.align 2, 0
	anim_0973:
		.4byte anim_data__0973_0
