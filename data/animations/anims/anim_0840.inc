
.align 2, 0
	anim_data__0840_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x228C6 16
		.4byte	8, 0

		mGetTiles 0x228D6 16
		.4byte	8, 1

		mGetTiles 0x228E6 20
		.4byte	8, 2

		mGetTiles 0x228FA 20
		.4byte	8, 3

		mGetTiles 0x2290E 16
		.4byte	8, 4

		mGetTiles 0x2291E 16
		.4byte	8, 5

		mGetTiles 0x2292E 20
		.4byte	8, 6

		mGetTiles 0x22942 20
		.4byte	8, 7

		mJumpBack 0x2B

	anim_data__0840_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22956 20
		.4byte	8, 8

		mGetTiles 0x2296A 16
		.4byte	8, 9

		mGetTiles 0x2297A 16
		.4byte	8, 10

		mGetTiles 0x2298A 20
		.4byte	8, 11

		mGetTiles 0x2299E 16
		.4byte	8, 12

		mGetTiles 0x229AE 16
		.4byte	8, 13

		mGetTiles 0x229BE 16
		.4byte	8, 14

		mGetTiles 0x229CE 20
		.4byte	8, 15

		mJumpBack 0x2B

	anim_data__0840_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x229E2 20
		.4byte	8, 16

		mGetTiles 0x229F6 20
		.4byte	8, 17

		mGetTiles 0x22A0A 25
		.4byte	8, 18

		mGetTiles 0x22A23 20
		.4byte	8, 19

		mGetTiles 0x22A37 20
		.4byte	8, 20

		mGetTiles 0x22A4B 16
		.4byte	8, 21

		mGetTiles 0x22A5B 20
		.4byte	8, 22

		mGetTiles 0x22A6F 25
		.4byte	8, 23

		mJumpBack 0x2B


.align 2, 0
	anim_0840:
		.4byte anim_data__0840_0
		.4byte anim_data__0840_1
		.4byte anim_data__0840_2
