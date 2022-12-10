
.align 2, 0
	anim_data__0970_0:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x25369 48
		.4byte	6, 0

		mGetTiles 0x25399 48
		.4byte	4, 1

		mGetTiles 0x253C9 42
		.4byte	3, 2

		mGetTiles 0x253F3 42
		.4byte	10, 3

		mGetTiles 0x253C9 42
		.4byte	5, 2

		mGetTiles 0x25399 48
		.4byte	5, 1

		mGetTiles 0x25369 48
		.4byte	10, 0

		mGetTiles 0x2541D 48
		.4byte	5, 4

		mGetTiles 0x2544D 48
		.4byte	5, 5

		mGetTiles 0x2541D 48
		.4byte	5, 4

		mGetTiles 0x25369 48
		.4byte	5, 0

		mAnimCmd4 


.align 2, 0
	anim_0970:
		.4byte anim_data__0970_0
