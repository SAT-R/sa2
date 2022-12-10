
.align 2, 0
	anim_data__0305_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10562 20
		.4byte	5, 0

		mGetTiles 0x10576 20
		.4byte	5, 1

		mGetTiles 0x1058A 20
		.4byte	30, 2

		mGetTiles 0x1059E 20
		.4byte	3, 3

		mGetTiles 0x105B2 25
		.4byte	3, 4

		mGetTiles 0x105CB 20
		.4byte	4, 5

		mGetTiles 0x105DF 20
		.4byte	2, 6

		mGetTiles 0x105F3 25
		.4byte	2, 7

		mGetTiles 0x1060C 25
		.4byte	3, 8

		mGetTiles 0x10625 25
		.4byte	6, 9

		mGetTiles 0x1063E 25
		.4byte	2, 10

		mGetTiles 0x10657 20
		.4byte	2, 11

		mGetTiles 0x1066B 20
		.4byte	2, 12

		mGetTiles 0x1067F 24
		.4byte	3, 13

		mGetTiles 0x10697 24
		.4byte	8, 14

		mGetTiles 0x106AF 20
		.4byte	2, 15

		mGetTiles 0x106C3 20
		.4byte	2, 16

		mGetTiles 0x106D7 20
		.4byte	30, 17

		mAnimCmd4 


.align 2, 0
	anim_0305:
		.4byte anim_data__0305_0
