
.align 2, 0
	anim_data__0396_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1548A 20
		.4byte	3, 0

		mGetTiles 0x1549E 20
		.4byte	3, 1

		mGetTiles 0x154B2 16
		.4byte	3, 2

		mGetTiles 0x154C2 16
		.4byte	6, 3

		mGetTiles 0x154D2 16
		.4byte	3, 4

		mGetTiles 0x154E2 30
		.4byte	3, 5

		mGetTiles 0x15500 42
		.4byte	3, 6

		mGetTiles 0x1552A 48
		.4byte	3, 7

		mGetTiles 0x1555A 35
		.4byte	3, 8

		mGetTiles 0x1557D 35
		.4byte	3, 9

		mGetTiles 0x155A0 35
		.4byte	3, 10

		mGetTiles 0x155C3 30
		.4byte	3, 11

		mGetTiles 0x155E1 30
		.4byte	3, 12

		mGetTiles 0x155FF 25
		.4byte	3, 13

		mGetTiles 0x15618 20
		.4byte	3, 14

		mGetTiles 0x1562C 20
		.4byte	3, 15

		mGetTiles 0x15640 20
		.4byte	3, 16

		mGetTiles 0x15654 20
		.4byte	12, 17

		mGetTiles 0x15668 20
		.4byte	3, 18

		mGetTiles 0x1567C 20
		.4byte	3, 19

		mGetTiles 0x15690 20
		.4byte	3, 20

		mGetTiles 0x156A4 20
		.4byte	8, 21

		mGetTiles 0x156B8 20
		.4byte	3, 22

		mGetTiles 0x156CC 20
		.4byte	3, 23

		mGetTiles 0x156E0 20
		.4byte	3, 24

		mGetTiles 0x156F4 20
		.4byte	12, 25

		mAnimCmd4 


.align 2, 0
	anim_0396:
		.4byte anim_data__0396_0
