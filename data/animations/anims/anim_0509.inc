
.align 2, 0
	anim_data__0509_0:
		mGetPalette 0x40 16 0xC0
		mGetTiles 0x1A12B 24
		mAnimCmd6 0x0 0xA10F9EF
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A16F 24
		.4byte	3, 3

		mGetTiles 0x1A187 24
		.4byte	3, 4

		mGetTiles 0x1A19F 20
		.4byte	3, 5

		mGetTiles 0x1A1B3 24
		.4byte	3, 6

		mGetTiles 0x1A12B 24
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A12B 24
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A12B 24
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A16F 24
		.4byte	3, 3

		mGetTiles 0x1A187 24
		.4byte	3, 4

		mGetTiles 0x1A19F 20
		.4byte	3, 5

		mGetTiles 0x1A1B3 24
		.4byte	3, 6

		mGetTiles 0x1A16F 24
		.4byte	3, 3

		mGetTiles 0x1A187 24
		.4byte	3, 4

		mGetTiles 0x1A19F 20
		.4byte	3, 5

		mGetTiles 0x1A1B3 24
		.4byte	3, 6

		mJumpBack 0x92


.align 2, 0
	anim_0509:
		.4byte anim_data__0509_0
