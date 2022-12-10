
.align 2, 0
	anim_data__0336_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11EAD 16
		mAnimCmd6 0x0 0xA0EFCF6
		.4byte	2, 0

		mGetTiles 0x11EBD 20
		mAnimCmd6 0x0 0xEEEF6
		.4byte	2, 1

		mGetTiles 0x11ED1 28
		mAnimCmd6 0x0 0xFE0EE5F6
		.4byte	4, 2

		mGetTiles 0x11EED 20
		mAnimCmd6 0x0 0xEEDF6
		.4byte	3, 3

		mGetTiles 0x11F01 20
		mAnimCmd6 0x0 0x60EF6F6
		.4byte	2, 4

		mGetTiles 0x11F15 20
		mAnimCmd6 0x0 0x180E00F6
		.4byte	2, 5

		mGetTiles 0x11F29 35
		mAnimCmd6 0x0 0x200E02F6
		.4byte	4, 6

		mGetTiles 0x11F4C 25
		mAnimCmd6 0x0 0x140E00F6
		.4byte	3, 7

		mGetTiles 0x11EAD 16
		mAnimCmd6 0x0 0xA0EFCF6
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0336_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11F65 16
		mAnimCmd6 0x0 0x80EF6F6
		.4byte	2, 8

		mGetTiles 0x11F75 20
		mAnimCmd6 0x0 0x160E00F6
		.4byte	2, 9

		mGetTiles 0x11F89 28
		mAnimCmd6 0x0 0x220E02F6
		.4byte	4, 10

		mGetTiles 0x11FA5 20
		mAnimCmd6 0x0 0x160E00F6
		.4byte	3, 11

		mGetTiles 0x11FB9 20
		mAnimCmd6 0x0 0xA0EFAF6
		.4byte	2, 12

		mGetTiles 0x11FCD 20
		mAnimCmd6 0x0 0x20EEAF6
		.4byte	2, 13

		mGetTiles 0x11FE1 35
		mAnimCmd6 0x0 0x20EE4F6
		.4byte	4, 14

		mGetTiles 0x12004 25
		mAnimCmd6 0x0 0x20EEEF6
		.4byte	3, 15

		mGetTiles 0x11F65 16
		mAnimCmd6 0x0 0x80EF6F6
		.4byte	2, 8

		mAnimCmd4 


.align 2, 0
	anim_0336:
		.4byte anim_data__0336_0
		.4byte anim_data__0336_1
