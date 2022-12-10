
.align 2, 0
	anim_data__0627_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BB60 4
		.4byte	2, 0

		mGetTiles 0x1BB64 4
		.4byte	2, 1

		mGetTiles 0x1BB68 4
		.4byte	2, 2

		mGetTiles 0x1BB6C 4
		.4byte	2, 3

		mGetTiles 0x1BB70 4
		.4byte	2, 4

		mGetTiles 0x1BB74 4
		.4byte	2, 5

		mGetTiles 0x1BB78 4
		.4byte	2, 6

		mGetTiles 0x1BB7C 4
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0627:
		.4byte anim_data__0627_0
