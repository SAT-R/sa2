

anim_data__0054_0:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x2CA3, 25
	mAnimCmd6 0x0, 0x1208F2F8
	.4byte	1, 0

	mGetTiles 0x2CBC, 30
	mAnimCmd6 0x0, 0xE08F0F8
	.4byte	2, 1

	mGetTiles 0x2CDA, 20
	.4byte	2, 2

	mGetTiles 0x2CEE, 25
	.4byte	2, 3

	mJumpBack 0x12

anim_data__0054_1:
	mGetPalette 0x0, 16, 0x0
	mGetTiles 0x2D07, 24
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	2, 4

	mGetTiles 0x2D1F, 20
	.4byte	2, 5

	mGetTiles 0x2D33, 20
	.4byte	2, 6

	mGetTiles 0x2D47, 20
	.4byte	2, 7

	mGetTiles 0x2D5B, 20
	.4byte	2, 8

	mGetTiles 0x2D6F, 20
	.4byte	2, 9

	mGetTiles 0x2D83, 20
	.4byte	2, 10

	mGetTiles 0x2D97, 20
	.4byte	2, 11

	mJumpBack 0xF


anim_0054:
	.4byte anim_data__0054_0
	.4byte anim_data__0054_1
