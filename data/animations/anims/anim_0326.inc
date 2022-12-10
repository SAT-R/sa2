
.align 2, 0
	anim_data__0326_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x114BC 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	4, 0

		mGetTiles 0x114D0 20
		.4byte	4, 1

		mGetTiles 0x114E4 20
		.4byte	4, 2

		mGetTiles 0x114F8 25
		.4byte	4, 3

		mGetTiles 0x11511 25
		.4byte	4, 4

		mGetTiles 0x1152A 25
		.4byte	4, 5

		mGetTiles 0x11543 20
		.4byte	4, 6

		mGetTiles 0x11557 20
		.4byte	4, 7

		mGetTiles 0x1156B 25
		.4byte	4, 8

		mGetTiles 0x11584 20
		.4byte	4, 9

		mGetTiles 0x11598 25
		.4byte	4, 10

		mGetTiles 0x115B1 30
		.4byte	3, 11

		mGetTiles 0x115CF 30
		.4byte	3, 12

		mGetTiles 0x115ED 30
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0326:
		.4byte anim_data__0326_0
