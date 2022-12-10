
.align 2, 0
	anim_data__0971_0:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x2547D 64
		.4byte	5, 0

		mGetTiles 0x254BD 64
		.4byte	5, 1

		mGetTiles 0x254FD 63
		.4byte	5, 2

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x25572 54
		.4byte	3, 4

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x254FD 63
		.4byte	3, 2

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x25572 54
		.4byte	3, 4

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x254FD 63
		.4byte	5, 2

		mGetTiles 0x254BD 64
		.4byte	5, 1

		mGetTiles 0x2547D 64
		.4byte	5, 0

		mAnimCmd4 


.align 2, 0
	anim_0971:
		.4byte anim_data__0971_0
