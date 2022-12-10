
.align 2, 0
	anim_data__0346_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x129C7 16
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	3, 0

		mGetTiles 0x129D7 16
		.4byte	3, 1

		mGetTiles 0x129E7 20
		.4byte	3, 2

		mGetTiles 0x129FB 16
		.4byte	3, 3

		mGetTiles 0x12A0B 16
		.4byte	3, 4

		mGetTiles 0x12A1B 16
		.4byte	3, 5

		mGetTiles 0x12A2B 16
		.4byte	3, 6

		mGetTiles 0x12A3B 16
		.4byte	3, 7

		mJumpBack 0x2E

	anim_data__0346_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12A4B 30
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	3, 8

		mGetTiles 0x12A69 25
		.4byte	3, 9

		mGetTiles 0x12A82 20
		.4byte	3, 10

		mGetTiles 0x12A96 25
		.4byte	3, 11

		mGetTiles 0x12AAF 30
		.4byte	3, 12

		mGetTiles 0x12ACD 25
		.4byte	3, 13

		mGetTiles 0x12AE6 30
		.4byte	3, 14

		mGetTiles 0x12B04 25
		.4byte	3, 15

		mJumpBack 0x2E

	anim_data__0346_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12B1D 30
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	3, 16

		mGetTiles 0x12B3B 25
		.4byte	3, 17

		mGetTiles 0x12B54 30
		.4byte	3, 18

		mGetTiles 0x12B72 25
		.4byte	3, 19

		mGetTiles 0x12B8B 30
		.4byte	3, 20

		mGetTiles 0x12BA9 30
		.4byte	3, 21

		mGetTiles 0x12BC7 25
		.4byte	3, 22

		mGetTiles 0x12BE0 30
		.4byte	3, 23

		mJumpBack 0x2E


.align 2, 0
	anim_0346:
		.4byte anim_data__0346_0
		.4byte anim_data__0346_1
		.4byte anim_data__0346_2
