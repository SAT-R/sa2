
.align 2, 0
	anim_data__0435_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17548 25
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 0

		mGetTiles 0x17561 25
		.4byte	2, 1

		mGetTiles 0x1757A 25
		.4byte	2, 2

		mGetTiles 0x17593 20
		.4byte	2, 3

		mGetTiles 0x175A7 25
		.4byte	2, 4

		mGetTiles 0x175C0 25
		.4byte	2, 5

		mGetTiles 0x175D9 25
		.4byte	2, 6

		mGetTiles 0x175F2 16
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0435_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17602 24
		mAnimCmd6 0x0 0xC06F2FA
		.4byte	3, 8

		mGetTiles 0x1761A 18
		.4byte	3, 9

		mGetTiles 0x1762C 18
		.4byte	3, 10

		mGetTiles 0x1763E 15
		.4byte	3, 11

		mGetTiles 0x1762C 18
		.4byte	3, 10

		mGetTiles 0x1761A 18
		.4byte	3, 9

		mJumpBack 0x24


.align 2, 0
	anim_0435:
		.4byte anim_data__0435_0
		.4byte anim_data__0435_1
