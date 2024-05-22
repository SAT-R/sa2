

anim_data__0110_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x649B, 16
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	2, 0

	mGetTiles 0x64AB, 16
	.4byte	4, 1

	mGetTiles 0x64BB, 25
	.4byte	4, 2

	mGetTiles 0x64D4, 24
	.4byte	4, 3

	mGetTiles 0x64EC, 24
	.4byte	4, 4

	mGetTiles 0x6504, 20
	.4byte	2, 5

	mGetTiles 0x6518, 24
	.4byte	1, 6

	mGetTiles 0x6530, 16
	.4byte	1, 7

	mGetTiles 0x649B, 16
	.4byte	2, 0

	mGetTiles 0x64AB, 16
	.4byte	4, 1

	mGetTiles 0x64BB, 25
	.4byte	4, 2

	mGetTiles 0x64D4, 24
	.4byte	4, 3

	mGetTiles 0x6540, 24
	.4byte	4, 8

	mGetTiles 0x6558, 20
	.4byte	2, 9

	mGetTiles 0x656C, 24
	.4byte	1, 10

	mGetTiles 0x6530, 16
	.4byte	1, 7

	mJumpBack 0x56

anim_data__0110_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x6584, 16
	mAnimCmd6 0x0, 0xA06F4FA
	.4byte	1, 11

	mGetTiles 0x6594, 16
	.4byte	1, 12

	mAnimCmd4 


anim_0110:
	.4byte anim_data__0110_0
	.4byte anim_data__0110_1
