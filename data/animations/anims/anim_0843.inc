

anim_data__0843_0:
	mGetPalette 0xE2 16 0xE0
	mGetTiles 0x22D81 9
	.4byte	9, 0

	mGetTiles 0x22D8A 9
	.4byte	9, 1

	mGetTiles 0x22D93 9
	.4byte	9, 2

	mGetTiles 0x22D9C 9
	.4byte	9, 3

	mGetTiles 0x22DA5 9
	.4byte	9, 4

	mGetTiles 0x22DAE 9
	.4byte	9, 5

	mGetTiles 0x22D93 9
	.4byte	9, 2

	mGetTiles 0x22D8A 9
	.4byte	9, 1

	mJumpBack 0x2B

anim_data__0843_1:
	mGetPalette 0xE2 16 0xE0
	mGetTiles 0x22DB7 9
	.4byte	9, 6

	mGetTiles 0x22DC0 9
	.4byte	9, 7

	mGetTiles 0x22DC9 9
	.4byte	9, 8

	mGetTiles 0x22DD2 9
	.4byte	9, 9

	mGetTiles 0x22DDB 9
	.4byte	9, 10

	mGetTiles 0x22DE4 9
	.4byte	9, 11

	mGetTiles 0x22DC9 9
	.4byte	9, 8

	mGetTiles 0x22DC0 9
	.4byte	9, 7

	mJumpBack 0x2B

anim_data__0843_2:
	mGetPalette 0xE2 16 0xE0
	mGetTiles 0x22DED 9
	.4byte	3, 12

	mGetTiles 0x22DF6 9
	.4byte	3, 13

	mGetTiles 0x22DFF 9
	.4byte	2, 14

	mGetTiles 0x22E08 9
	.4byte	2, 15

	mJumpBack 0xA


anim_0843:
	.4byte anim_data__0843_0
	.4byte anim_data__0843_1
	.4byte anim_data__0843_2
