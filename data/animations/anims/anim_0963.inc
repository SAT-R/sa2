

anim_data__0963_0:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x24FFE, 4
	.4byte	1, 0

	mJumpBack 0x8

anim_data__0963_1:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x25002, 4
	.4byte	1, 1

	mJumpBack 0x8

anim_data__0963_2:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x25006, 4
	.4byte	1, 2

	mJumpBack 0x8

anim_data__0963_3:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x2500A, 4
	.4byte	1, 3

	mJumpBack 0x8

anim_data__0963_4:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x2500E, 4
	.4byte	1, 4

	mJumpBack 0x8

anim_data__0963_5:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x25012, 4
	.4byte	1, 5

	mJumpBack 0x8

anim_data__0963_6:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x25016, 4
	.4byte	1, 6

	mJumpBack 0x8

anim_data__0963_7:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x2501A, 4
	.4byte	1, 7

	mJumpBack 0x8

anim_data__0963_8:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x2501E, 4
	.4byte	1, 8

	mJumpBack 0x8

anim_data__0963_9:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x25022, 4
	.4byte	1, 9

	mJumpBack 0x8

anim_data__0963_10:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x25026, 4
	.4byte	1, 10

	mJumpBack 0x8

anim_data__0963_11:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x2502A, 4
	.4byte	1, 11

	mJumpBack 0x8

anim_data__0963_12:
	mGetPalette 0x2B8, 16, 0x70
	.4byte	1, -1

	mAnimCmd4 

anim_data__0963_13:
	mGetPalette 0x2B9, 16, 0x80
	.4byte	1, -1

	mAnimCmd4 


anim_0963:
	.4byte anim_data__0963_0
	.4byte anim_data__0963_1
	.4byte anim_data__0963_2
	.4byte anim_data__0963_3
	.4byte anim_data__0963_4
	.4byte anim_data__0963_5
	.4byte anim_data__0963_6
	.4byte anim_data__0963_7
	.4byte anim_data__0963_8
	.4byte anim_data__0963_9
	.4byte anim_data__0963_10
	.4byte anim_data__0963_11
	.4byte anim_data__0963_12
	.4byte anim_data__0963_13
