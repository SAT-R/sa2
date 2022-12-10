
.align 2, 0
	anim_data__0720_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D8FA 1
		.4byte	3, 0

		mGetTiles 0x1D8FB 1
		.4byte	3, 1

		mGetTiles 0x1D8FC 1
		.4byte	3, 2

		mGetTiles 0x1D8FD 1
		.4byte	3, 3

		mGetTiles 0x1D8FE 1
		.4byte	3, 4

		mJumpBack 0x1C


.align 2, 0
	anim_0720:
		.4byte anim_data__0720_0
