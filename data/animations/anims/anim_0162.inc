

anim_data__0162_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x8D89 25
	mAnimCmd6 0x0 0x1006F6FA
	.4byte	2, 0

	mGetTiles 0x8DA2 25
	.4byte	2, 1

	mGetTiles 0x8DBB 25
	.4byte	2, 2

	mGetTiles 0x8DD4 16
	.4byte	2, 3

	mGetTiles 0x8DE4 25
	.4byte	2, 4

	mGetTiles 0x8DFD 25
	.4byte	2, 5

	mGetTiles 0x8E16 25
	.4byte	2, 6

	mGetTiles 0x8E2F 20
	.4byte	2, 7

	mJumpBack 0x2E

anim_data__0162_1:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x8E43 20
	mAnimCmd6 0x0 0xA06ECFA
	.4byte	2, 8

	mGetTiles 0x8E57 20
	.4byte	2, 9

	mGetTiles 0x8E6B 20
	.4byte	2, 10

	mGetTiles 0x8E7F 20
	.4byte	2, 11

	mGetTiles 0x8E6B 20
	.4byte	2, 10

	mGetTiles 0x8E57 20
	.4byte	2, 9

	mJumpBack 0x24


anim_0162:
	.4byte anim_data__0162_0
	.4byte anim_data__0162_1
