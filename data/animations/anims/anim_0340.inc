
.align 2, 0
	anim_data__0340_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12409 36
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	5, 0

		mGetTiles 0x1242D 30
		.4byte	5, 1

		mGetTiles 0x1244B 20
		.4byte	5, 2

		mGetTiles 0x1245F 30
		.4byte	5, 3

		mGetTiles 0x1247D 36
		.4byte	5, 4

		mGetTiles 0x124A1 20
		.4byte	5, 5

		mGetTiles 0x124B5 25
		.4byte	5, 6

		mGetTiles 0x124CE 20
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0340:
		.4byte anim_data__0340_0
