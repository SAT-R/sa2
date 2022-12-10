
.align 2, 0
	anim_data__0428_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16F21 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 0

		mGetTiles 0x16F2D 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	2, 1

		mGetTiles 0x16F41 20
		mAnimCmd6 0x0 0xFDF5E3E9
		.4byte	4, 2

		mGetTiles 0x16F55 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	3, 3

		mGetTiles 0x16F69 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 4

		mGetTiles 0x16F75 20
		mAnimCmd6 0x0 0xFD13E307
		.4byte	2, 5

		mGetTiles 0x16F89 24
		mAnimCmd6 0x0 0xFD15E309
		.4byte	4, 6

		mGetTiles 0x16FA1 20
		mAnimCmd6 0x0 0xFD0FE303
		.4byte	3, 7

		mGetTiles 0x16F21 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 0

		mGetTiles 0x16F2D 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	2, 1

		mGetTiles 0x16F41 20
		mAnimCmd6 0x0 0xFDF5E3E9
		.4byte	4, 2

		mGetTiles 0x16F55 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	3, 3

		mGetTiles 0x16F69 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0428:
		.4byte anim_data__0428_0
