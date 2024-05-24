

anim_data__0066_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x3AB1, 35
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 0

	mGetTiles 0x3AD4, 35
	.4byte	3, 1

	mGetTiles 0x3AF7, 35
	.4byte	3, 2

	mJumpBack 0x15

anim_data__0066_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x3B1A, 30
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 3

	mGetTiles 0x3B38, 24
	.4byte	3, 4

	mGetTiles 0x3B50, 18
	.4byte	3, 5

	mGetTiles 0x3B62, 24
	.4byte	3, 6

	mGetTiles 0x3B7A, 30
	.4byte	3, 7

	mAnimCmd4 

anim_data__0066_2:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x3B98, 25
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	3, 8

	mGetTiles 0x3BB1, 25
	.4byte	3, 9

	mGetTiles 0x3BCA, 30
	.4byte	3, 10

	mJumpBack 0x15


anim_0066:
	.4byte anim_data__0066_0
	.4byte anim_data__0066_1
	.4byte anim_data__0066_2
