

anim_data__0415_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1606F, 15
	mAnimCmd6 0x0, 0xA06F0FA
	.4byte	2, 0

	mGetTiles 0x1607E, 20
	.4byte	2, 1

	mGetTiles 0x16092, 20
	.4byte	4, 2

	mGetTiles 0x160A6, 15
	.4byte	2, 3

	mAnimCmd4 

anim_data__0415_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x160B5, 30
	mAnimCmd6 0x0, 0xA06F0FA
	mAnimCmd6 0x1, 0xC1AF2E6
	.4byte	2, 4

	mGetTiles 0x160D3, 20
	.4byte	2, 5

	mGetTiles 0x160E7, 30
	.4byte	2, 6

	mGetTiles 0x16105, 24
	.4byte	2, 7

	mGetTiles 0x1611D, 16
	.4byte	2, 8

	mGetTiles 0x1612D, 24
	.4byte	2, 9

	mJumpBack 0x27

anim_data__0415_2:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x160B5, 30
	mAnimCmd6 0x0, 0xA06F0F8
	.4byte	2, 4

	mGetTiles 0x16145, 25
	.4byte	2, 10

	mGetTiles 0x1615E, 20
	.4byte	2, 11

	mGetTiles 0x16172, 16
	.4byte	2, 12

	mGetTiles 0x16182, 16
	.4byte	3, 13

	mGetTiles 0x16192, 16
	.4byte	3, 14

	mGetTiles 0x161A2, 16
	.4byte	3, 15

	mJumpBack 0xF


anim_0415:
	.4byte anim_data__0415_0
	.4byte anim_data__0415_1
	.4byte anim_data__0415_2
