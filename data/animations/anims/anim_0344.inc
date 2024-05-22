

anim_data__0344_0:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x127C1, 25
	mAnimCmd6 0x0, 0x1006F0FA
	.4byte	2, 0

	mGetTiles 0x127DA, 25
	.4byte	2, 1

	mGetTiles 0x127F3, 25
	.4byte	2, 2

	mGetTiles 0x1280C, 30
	.4byte	2, 3

	mGetTiles 0x1282A, 30
	.4byte	2, 4

	mGetTiles 0x12848, 36
	.4byte	2, 5

	mJumpBack 0x24

anim_data__0344_1:
	mGetPalette 0x16, 16, 0x0
	mGetTiles 0x1286C, 35
	mAnimCmd6 0x0, 0xE06F0FA
	.4byte	2, 6

	mGetTiles 0x1288F, 24
	.4byte	2, 7

	mGetTiles 0x128A7, 24
	.4byte	2, 8

	mGetTiles 0x128BF, 30
	.4byte	2, 9

	mGetTiles 0x128A7, 24
	.4byte	2, 8

	mGetTiles 0x1288F, 24
	.4byte	2, 7

	mJumpBack 0x24


anim_0344:
	.4byte anim_data__0344_0
	.4byte anim_data__0344_1
