

anim_data__0787_0:
	mGetPalette 0xC4, 16, 0x0
	mGetTiles 0x20CE7, 99
	.4byte	3, 0

	mGetTiles 0x20D4A, 99
	.4byte	3, 1

	mJumpBack 0xD

anim_data__0787_1:
	mGetPalette 0xC4, 16, 0x0
	mGetTiles 0x20DAD, 80
	.4byte	3, 2

	mGetTiles 0x20DFD, 80
	.4byte	3, 3

	mJumpBack 0xD

anim_data__0787_2:
	mGetPalette 0xC5, 16, 0x0
	mGetTiles 0x20E4D, 99
	.4byte	3, 4

	mGetTiles 0x20EB0, 99
	.4byte	3, 5

	mJumpBack 0xD

anim_data__0787_3:
	mGetPalette 0xC5, 16, 0x0
	mGetTiles 0x20F13, 80
	.4byte	3, 6

	mGetTiles 0x20F63, 80
	.4byte	3, 7

	mJumpBack 0xD


anim_0787:
	.4byte anim_data__0787_0
	.4byte anim_data__0787_1
	.4byte anim_data__0787_2
	.4byte anim_data__0787_3
