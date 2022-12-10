
.align 2, 0
	anim_data__0240_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xCE31 64
		mAnimCmd6 0x0 0xA0AFAF6
		.4byte	5, 0

		mGetTiles 0xCE71 64
		.4byte	5, 1

		mGetTiles 0xCEB1 64
		.4byte	5, 2

		mGetTiles 0xCEF1 64
		.4byte	5, 3

		mGetTiles 0xCF31 64
		.4byte	5, 4

		mGetTiles 0xCF71 64
		.4byte	5, 5

		mGetTiles 0xCFB1 64
		.4byte	5, 6

		mGetTiles 0xCFF1 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0240:
		.4byte anim_data__0240_0
