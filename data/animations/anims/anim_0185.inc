
.align 2, 0
	anim_data__0185_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9AA7 24
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x9ABF 24
		.4byte	2, 1

		mGetTiles 0x9AD7 24
		.4byte	2, 2

		mGetTiles 0x9AEF 24
		.4byte	2, 3

		mGetTiles 0x9B07 24
		.4byte	2, 4

		mGetTiles 0x9B1F 24
		.4byte	2, 5

		mGetTiles 0x9B37 28
		.4byte	2, 6

		mGetTiles 0x9B53 24
		.4byte	2, 7

		mJumpBack 0x31

	anim_data__0185_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9AA7 24
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x9ABF 24
		.4byte	2, 1

		mGetTiles 0x9AD7 24
		.4byte	2, 2

		mGetTiles 0x9AEF 24
		.4byte	2, 3

		mGetTiles 0x9B07 24
		.4byte	2, 4

		mGetTiles 0x9B1F 24
		.4byte	2, 5

		mGetTiles 0x9B37 28
		.4byte	2, 6

		mGetTiles 0x9B53 24
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0185:
		.4byte anim_data__0185_0
		.4byte anim_data__0185_1
