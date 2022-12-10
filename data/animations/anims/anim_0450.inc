
.align 2, 0
	anim_data__0450_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x179B5 20
		.4byte	3, 0

		mGetTiles 0x179C9 20
		.4byte	3, 1

		mGetTiles 0x179DD 16
		.4byte	3, 2

		mGetTiles 0x179ED 20
		.4byte	3, 3

		mGetTiles 0x17A01 25
		.4byte	3, 4

		mGetTiles 0x17A1A 16
		.4byte	3, 5

		mJumpBack 0x21

	anim_data__0450_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17A2A 15
		.4byte	3, 6

		mGetTiles 0x17A39 20
		.4byte	3, 7

		mGetTiles 0x17A4D 20
		.4byte	3, 8

		mGetTiles 0x17A61 20
		.4byte	3, 9

		mGetTiles 0x17A75 20
		.4byte	3, 10

		mGetTiles 0x17A89 20
		.4byte	3, 11

		mJumpBack 0x21

	anim_data__0450_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17A9D 16
		.4byte	3, 12

		mGetTiles 0x17AAD 16
		.4byte	3, 13

		mGetTiles 0x17ABD 16
		.4byte	3, 14

		mGetTiles 0x17ACD 16
		.4byte	3, 15

		mGetTiles 0x17ADD 16
		.4byte	3, 16

		mGetTiles 0x17AED 16
		.4byte	3, 17

		mJumpBack 0x21

	anim_data__0450_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17AFD 16
		.4byte	3, 18

		mGetTiles 0x17B0D 20
		.4byte	3, 19

		mGetTiles 0x17B21 16
		.4byte	3, 20

		mGetTiles 0x17B31 16
		.4byte	3, 21

		mGetTiles 0x17B41 20
		.4byte	3, 22

		mGetTiles 0x17B55 16
		.4byte	3, 23

		mJumpBack 0x21


.align 2, 0
	anim_0450:
		.4byte anim_data__0450_0
		.4byte anim_data__0450_1
		.4byte anim_data__0450_2
		.4byte anim_data__0450_3
