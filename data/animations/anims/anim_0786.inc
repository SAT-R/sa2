

anim_data__0786_0:
	mGetPalette 0xC2, 16, 0x0
	mGetTiles 0x20A7B, 80
	.4byte	3, 0

	mGetTiles 0x20ACB, 80
	.4byte	3, 1

	mJumpBack 0xD

anim_data__0786_1:
	mGetPalette 0xC2, 16, 0x0
	mGetTiles 0x20B1B, 80
	.4byte	3, 2

	mGetTiles 0x20B6B, 70
	.4byte	3, 3

	mJumpBack 0xD

anim_data__0786_2:
	mGetPalette 0xC3, 16, 0x0
	mGetTiles 0x20BB1, 80
	.4byte	3, 4

	mGetTiles 0x20C01, 80
	.4byte	3, 5

	mJumpBack 0xD

anim_data__0786_3:
	mGetPalette 0xC3, 16, 0x0
	mGetTiles 0x20C51, 80
	.4byte	3, 6

	mGetTiles 0x20CA1, 70
	.4byte	3, 7

	mJumpBack 0xD


anim_0786:
	.4byte anim_data__0786_0
	.4byte anim_data__0786_1
	.4byte anim_data__0786_2
	.4byte anim_data__0786_3
