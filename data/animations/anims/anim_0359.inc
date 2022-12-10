
.align 2, 0
	anim_data__0359_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12CE6 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 0

		mGetTiles 0x12CFA 20
		.4byte	3, 1

		mGetTiles 0x12D0E 20
		.4byte	3, 2

		mGetTiles 0x12D22 20
		.4byte	3, 3

		mGetTiles 0x12D36 20
		.4byte	3, 4

		mGetPalette 0x16 16 0x0
		mGetTiles 0x12D4A 20
		.4byte	3, 5

		mJumpBack 0x27

	anim_data__0359_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12D5E 20
		mAnimCmd6 0x0 0x8E0F8
		.4byte	3, 6

		mGetTiles 0x12D72 20
		.4byte	3, 7

		mGetTiles 0x12D86 20
		.4byte	3, 8

		mGetTiles 0x12D9A 20
		.4byte	3, 9

		mGetTiles 0x12DAE 20
		.4byte	3, 10

		mGetTiles 0x12DC2 20
		.4byte	3, 11

		mJumpBack 0x24

	anim_data__0359_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12DD6 30
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 12

		mGetTiles 0x12DF4 30
		.4byte	3, 13

		mGetTiles 0x12E12 30
		.4byte	3, 14

		mGetTiles 0x12E30 30
		.4byte	3, 15

		mGetTiles 0x12E4E 30
		.4byte	3, 16

		mGetTiles 0x12E6C 30
		.4byte	3, 17

		mJumpBack 0x24

	anim_data__0359_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12E8A 25
		.4byte	3, 18

		mGetTiles 0x12EA3 25
		.4byte	3, 19

		mGetTiles 0x12EBC 25
		.4byte	3, 20

		mGetTiles 0x12ED5 25
		.4byte	3, 21

		mGetTiles 0x12EEE 25
		.4byte	3, 22

		mGetTiles 0x12F07 25
		.4byte	3, 23

		mJumpBack 0x21


.align 2, 0
	anim_0359:
		.4byte anim_data__0359_0
		.4byte anim_data__0359_1
		.4byte anim_data__0359_2
		.4byte anim_data__0359_3
