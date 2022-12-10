
.align 2, 0
	anim_data__0846_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x22EB9 8
		.4byte	2, 0

		mGetTiles 0x22EC1 12
		.4byte	2, 1

		mGetTiles 0x22ECD 12
		.4byte	2, 2

		mGetTiles 0x22ED9 12
		.4byte	2, 3

		mGetTiles 0x22EE5 12
		.4byte	2, 4

		mGetTiles 0x22EF1 12
		.4byte	2, 5

		mGetTiles 0x22EFD 12
		.4byte	2, 6

		mGetTiles 0x22F09 8
		.4byte	2, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0846:
		.4byte anim_data__0846_0
