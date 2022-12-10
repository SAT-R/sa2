
.align 2, 0
	anim_data__0380_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x149E5 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 0

		mGetTiles 0x149F9 20
		mAnimCmd6 0x0 0x1008F8FA
		.4byte	6, 1

		mGetTiles 0x14A0D 24
		mAnimCmd6 0x0 0x1008F8FA
		.4byte	6, 2

		mGetTiles 0x14A25 20
		mAnimCmd6 0x0 0x1008FEFA
		.4byte	2, 3

		mAnimCmd4 

	anim_data__0380_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14A39 18
		mAnimCmd6 0x0 0xF0801FA
		mAnimCmd6 0x1 0x1101FBEE
		.4byte	2, 4

		mGetTiles 0x14A4B 24
		.4byte	2, 5

		mGetTiles 0x14A63 20
		.4byte	2, 6

		mJumpBack 0x18

	anim_data__0380_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14A77 18
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 7

		mGetTiles 0x14A89 25
		.4byte	2, 8

		mGetTiles 0x14AA2 16
		.4byte	1, 9

		mGetTiles 0x14AB2 15
		.4byte	1, 10

		mGetTiles 0x14AC1 25
		.4byte	1, 11

		mGetTiles 0x14ADA 16
		.4byte	1, 12

		mGetTiles 0x14AEA 20
		.4byte	1, 13

		mGetTiles 0x14AFE 15
		.4byte	1, 14

		mGetTiles 0x14B0D 16
		.4byte	1, 15

		mGetTiles 0x14B1D 16
		.4byte	1, 16

		mAnimCmd4 

	anim_data__0380_3:
		mGetPalette 0xE 16 0x50
		mGetTiles 0x14B2D 9
		.4byte	2, 17

		mGetTiles 0x14B36 20
		.4byte	2, 18

		mGetTiles 0x14B4A 12
		.4byte	2, 19

		mJumpBack 0x12


.align 2, 0
	anim_0380:
		.4byte anim_data__0380_0
		.4byte anim_data__0380_1
		.4byte anim_data__0380_2
		.4byte anim_data__0380_3
