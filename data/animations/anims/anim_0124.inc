
.align 2, 0
	anim_data__0124_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7171 20
		.4byte	6, 0

		mGetTiles 0x7185 16
		.4byte	6, 1

		mGetTiles 0x7171 20
		.4byte	6, 0

		mGetTiles 0x7195 20
		.4byte	6, 2

		mGetTiles 0x71A9 20
		.4byte	6, 3

		mGetTiles 0x71BD 16
		.4byte	6, 4

		mGetTiles 0x71A9 20
		.4byte	6, 3

		mGetTiles 0x71CD 20
		.4byte	6, 5

		mJumpBack 0x2B

	anim_data__0124_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x71E1 16
		.4byte	4, 6

		mGetTiles 0x71F1 16
		.4byte	6, 7

		mGetTiles 0x7201 16
		.4byte	4, 8

		mGetTiles 0x7211 16
		.4byte	4, 9

		mGetTiles 0x7221 16
		.4byte	4, 10

		mGetTiles 0x7231 16
		.4byte	4, 11

		mGetTiles 0x7221 16
		.4byte	4, 10

		mGetTiles 0x7211 16
		.4byte	4, 9

		mGetTiles 0x7241 16
		.4byte	4, 12

		mGetTiles 0x7241 16
		.4byte	4, 12

		mGetTiles 0x7241 16
		.4byte	4, 12

		mGetTiles 0x7241 16
		.4byte	8, 12

		mGetTiles 0x7251 16
		.4byte	4, 13

		mGetTiles 0x7261 16
		.4byte	4, 14

		mGetTiles 0x7271 16
		.4byte	4, 15

		mGetTiles 0x7281 12
		.4byte	6, 16

		mGetTiles 0x728D 16
		.4byte	4, 17

		mGetTiles 0x729D 16
		.4byte	4, 18

		mGetTiles 0x72AD 20
		.4byte	4, 19

		mGetTiles 0x72C1 20
		.4byte	4, 20

		mGetTiles 0x72C1 20
		.4byte	4, 20

		mGetTiles 0x72C1 20
		.4byte	16, 20

		mAnimCmd4 


.align 2, 0
	anim_0124:
		.4byte anim_data__0124_0
		.4byte anim_data__0124_1
