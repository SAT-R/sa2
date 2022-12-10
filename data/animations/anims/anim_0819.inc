
.align 2, 0
	anim_data__0819_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x21C27 30
		.4byte	2, 0

		mGetTiles 0x21C45 25
		.4byte	2, 1

		mGetTiles 0x21C5E 20
		.4byte	2, 2

		mGetTiles 0x21C72 20
		.4byte	2, 3

		mGetTiles 0x21C86 24
		.4byte	2, 4

		mGetTiles 0x21C9E 25
		.4byte	2, 5

		mGetTiles 0x21CB7 24
		.4byte	2, 6

		mGetTiles 0x21CCF 20
		.4byte	2, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0819:
		.4byte anim_data__0819_0
