

anim_data__0342_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x125D7, 24
	mAnimCmd6 0x0, 0xA0AF8F8
	.4byte	2, 0

	mGetTiles 0x125EF, 24
	.4byte	2, 1

	mGetTiles 0x12607, 20
	.4byte	2, 2

	mGetTiles 0x1261B, 24
	.4byte	2, 3

	mGetTiles 0x12633, 24
	.4byte	2, 4

	mGetTiles 0x1264B, 20
	.4byte	2, 5

	mGetTiles 0x1265F, 25
	.4byte	2, 6

	mGetTiles 0x12678, 20
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0342_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x1268C, 24
	mAnimCmd6 0x0, 0xA0AF8F8
	.4byte	2, 8

	mGetTiles 0x126A4, 24
	.4byte	2, 9

	mGetTiles 0x126BC, 20
	.4byte	2, 10

	mGetTiles 0x126D0, 24
	.4byte	2, 11

	mGetTiles 0x126E8, 24
	.4byte	2, 12

	mGetTiles 0x12700, 20
	.4byte	2, 13

	mGetTiles 0x12714, 25
	.4byte	2, 14

	mGetTiles 0x1272D, 20
	.4byte	2, 15

	mJumpBack 0x2E


anim_0342:
	.4byte anim_data__0342_0
	.4byte anim_data__0342_1
