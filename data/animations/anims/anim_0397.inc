
.align 2, 0
	anim_data__0397_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15708 20
		.4byte	3, 0

		mGetTiles 0x1571C 15
		.4byte	3, 1

		mGetTiles 0x1572B 20
		.4byte	3, 2

		mGetTiles 0x1573F 20
		.4byte	6, 3

		mGetTiles 0x15753 20
		.4byte	3, 4

		mGetTiles 0x15767 20
		.4byte	3, 5

		mGetTiles 0x1577B 20
		.4byte	3, 6

		mGetTiles 0x1578F 15
		.4byte	3, 7

		mGetTiles 0x1579E 25
		.4byte	3, 8

		mGetTiles 0x157B7 25
		.4byte	3, 9

		mGetTiles 0x157D0 15
		.4byte	6, 10

		mGetTiles 0x157DF 15
		.4byte	6, 11

		mGetTiles 0x157EE 15
		.4byte	3, 12

		mGetTiles 0x157FD 15
		.4byte	3, 13

		mGetTiles 0x1580C 20
		.4byte	3, 14

		mGetTiles 0x15820 20
		.4byte	3, 15

		mGetTiles 0x15834 20
		.4byte	3, 16

		mGetTiles 0x15848 20
		.4byte	6, 17

		mGetTiles 0x1585C 20
		.4byte	6, 18

		mGetTiles 0x15870 15
		.4byte	3, 19

		mGetTiles 0x1587F 20
		.4byte	3, 20

		mGetTiles 0x15893 15
		.4byte	8, 21

		mGetTiles 0x158A2 20
		.4byte	3, 22

		mGetTiles 0x158B6 25
		.4byte	4, 23

		mGetTiles 0x158B6 25
		.4byte	4, 23

		mGetTiles 0x158CF 25
		.4byte	4, 24

		mGetTiles 0x158E8 25
		.4byte	4, 25

		mGetTiles 0x15901 25
		.4byte	4, 26

		mGetTiles 0x1591A 25
		.4byte	4, 27

		mGetTiles 0x15933 25
		.4byte	4, 28

		mGetTiles 0x1594C 25
		.4byte	4, 29

		mGetTiles 0x15965 25
		.4byte	4, 30

		mGetTiles 0x1597E 25
		.4byte	4, 31

		mGetTiles 0x15997 25
		.4byte	4, 32

		mGetTiles 0x15933 25
		.4byte	4, 28

		mGetTiles 0x1591A 25
		.4byte	4, 27

		mJumpBack 0x3C


.align 2, 0
	anim_0397:
		.4byte anim_data__0397_0
