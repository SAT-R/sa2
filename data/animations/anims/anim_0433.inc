

anim_data__0433_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x17388, 20
	mAnimCmd6 0x0, 0xE06F4FA
	.4byte	2, 0

	mGetTiles 0x1739C, 20
	.4byte	2, 1

	mGetTiles 0x173B0, 20
	.4byte	2, 2

	mGetTiles 0x173C4, 20
	.4byte	2, 3

	mGetTiles 0x173D8, 20
	.4byte	2, 4

	mGetTiles 0x173EC, 20
	.4byte	2, 5

	mGetTiles 0x17400, 20
	.4byte	2, 6

	mGetTiles 0x17414, 20
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0433_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x17428, 20
	mAnimCmd6 0x0, 0xE06F4FA
	.4byte	2, 8

	mGetTiles 0x1743C, 20
	.4byte	2, 9

	mGetTiles 0x17450, 20
	.4byte	2, 10

	mGetTiles 0x17464, 20
	.4byte	2, 11

	mGetTiles 0x17478, 20
	.4byte	2, 12

	mGetTiles 0x1748C, 20
	.4byte	2, 13

	mGetTiles 0x174A0, 20
	.4byte	2, 14

	mGetTiles 0x174B4, 20
	.4byte	2, 15

	mJumpBack 0x2E


anim_0433:
	.4byte anim_data__0433_0
	.4byte anim_data__0433_1
