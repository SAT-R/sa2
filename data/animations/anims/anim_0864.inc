

anim_data__0864_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x23438 4
	.4byte	3, 0

	mGetTiles 0x2343C 4
	.4byte	3, 1

	mGetTiles 0x23440 4
	.4byte	3, 2

	mGetTiles 0x23444 4
	.4byte	3, 3

	mGetTiles 0x23448 4
	.4byte	3, 4

	mGetTiles 0x2344C 4
	.4byte	3, 5

	mGetTiles 0x23450 4
	.4byte	3, 6

	mGetTiles 0x23454 4
	.4byte	3, 7

	mJumpBack 0x2B


anim_0864:
	.4byte anim_data__0864_0
