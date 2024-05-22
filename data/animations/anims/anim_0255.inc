

anim_data__0255_0:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xDFFD, 30
	mAnimCmd6 0x0, 0x1006F6FA
	.4byte	3, 0

	mGetTiles 0xE01B, 30
	.4byte	3, 1

	mGetTiles 0xE039, 30
	.4byte	3, 2

	mGetTiles 0xE057, 35
	.4byte	3, 3

	mGetTiles 0xE07A, 30
	.4byte	3, 4

	mGetTiles 0xE098, 30
	.4byte	3, 5

	mGetTiles 0xE0B6, 30
	.4byte	3, 6

	mGetTiles 0xE0D4, 35
	.4byte	3, 7

	mJumpBack 0x2E

anim_data__0255_1:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xE0F7, 30
	mAnimCmd6 0x0, 0x1408F8FC
	.4byte	3, 8

	mGetTiles 0xE115, 30
	.4byte	3, 9

	mGetTiles 0xE133, 28
	.4byte	3, 10

	mGetTiles 0xE14F, 30
	.4byte	3, 11

	mGetTiles 0xE16D, 30
	.4byte	3, 12

	mGetTiles 0xE18B, 30
	.4byte	3, 13

	mGetTiles 0xE1A9, 35
	.4byte	3, 14

	mGetTiles 0xE1CC, 30
	.4byte	3, 15

	mJumpBack 0x2E

anim_data__0255_2:
	mGetPalette 0x9, 16, 0x0
	mGetTiles 0xE1EA, 30
	mAnimCmd6 0x0, 0x1208F6FC
	.4byte	3, 16

	mGetTiles 0xE208, 30
	.4byte	3, 17

	mGetTiles 0xE226, 35
	.4byte	3, 18

	mGetTiles 0xE249, 30
	.4byte	3, 19

	mGetTiles 0xE267, 30
	.4byte	3, 20

	mGetTiles 0xE285, 30
	.4byte	3, 21

	mGetTiles 0xE2A3, 28
	.4byte	3, 22

	mGetTiles 0xE2BF, 30
	.4byte	3, 23

	mJumpBack 0x2E


anim_0255:
	.4byte anim_data__0255_0
	.4byte anim_data__0255_1
	.4byte anim_data__0255_2
