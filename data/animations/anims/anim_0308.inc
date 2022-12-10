
.align 2, 0
	anim_data__0308_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10A78 20
		.4byte	3, 0

		mGetTiles 0x10A8C 20
		.4byte	3, 1

		mGetTiles 0x10AA0 25
		.4byte	3, 2

		mGetTiles 0x10AB9 20
		.4byte	3, 3

		mGetTiles 0x10ACD 20
		.4byte	3, 4

		mGetTiles 0x10AE1 25
		.4byte	3, 5

		mGetTiles 0x10AFA 25
		.4byte	3, 6

		mGetTiles 0x10B13 25
		.4byte	3, 7

		mGetTiles 0x10B2C 24
		.4byte	3, 8

		mGetTiles 0x10B44 24
		.4byte	3, 9

		mGetTiles 0x10B5C 30
		.4byte	3, 10

		mGetTiles 0x10B7A 24
		.4byte	3, 11

		mGetTiles 0x10B92 24
		.4byte	3, 12

		mGetTiles 0x10BAA 24
		.4byte	3, 13

		mGetTiles 0x10BC2 30
		.4byte	3, 14

		mGetTiles 0x10BE0 24
		.4byte	3, 15

		mJumpBack 0x28


.align 2, 0
	anim_0308:
		.4byte anim_data__0308_0
