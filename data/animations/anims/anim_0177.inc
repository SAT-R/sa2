

anim_data__0177_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x922D 20
	.4byte	3, 0

	mGetTiles 0x9241 20
	.4byte	3, 1

	mGetTiles 0x9255 20
	.4byte	3, 2

	mGetTiles 0x9269 20
	.4byte	3, 3

	mGetTiles 0x927D 20
	.4byte	3, 4

	mGetTiles 0x9291 20
	.4byte	3, 5

	mJumpBack 0x21

anim_data__0177_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x92A5 20
	.4byte	3, 6

	mGetTiles 0x92B9 20
	.4byte	3, 7

	mGetTiles 0x92CD 16
	.4byte	3, 8

	mGetTiles 0x92DD 20
	.4byte	3, 9

	mGetTiles 0x92F1 20
	.4byte	3, 10

	mGetTiles 0x9305 16
	.4byte	3, 11

	mJumpBack 0x21

anim_data__0177_2:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x9315 20
	.4byte	3, 12

	mGetTiles 0x9329 25
	.4byte	3, 13

	mGetTiles 0x9342 20
	.4byte	3, 14

	mGetTiles 0x9356 20
	.4byte	3, 15

	mGetTiles 0x936A 20
	.4byte	3, 16

	mGetTiles 0x937E 20
	.4byte	3, 17

	mJumpBack 0x21

anim_data__0177_3:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x9392 16
	.4byte	3, 18

	mGetTiles 0x93A2 20
	.4byte	3, 19

	mGetTiles 0x93B6 16
	.4byte	3, 20

	mGetTiles 0x93C6 16
	.4byte	3, 21

	mGetTiles 0x93D6 16
	.4byte	3, 22

	mGetTiles 0x93E6 16
	.4byte	3, 23

	mJumpBack 0x21


anim_0177:
	.4byte anim_data__0177_0
	.4byte anim_data__0177_1
	.4byte anim_data__0177_2
	.4byte anim_data__0177_3
