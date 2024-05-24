

anim_data__0375_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x14688, 16
	mAnimCmd6 0x0, 0xA0AF6F6
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	3, 0

	mGetTiles 0x14698, 16
	.4byte	2, 1

	mAnimCmd4 

anim_data__0375_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x146A8, 16
	mAnimCmd6 0x0, 0xA0AF6F6
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	2, 2

	mGetTiles 0x146B8, 16
	.4byte	2, 3

	mGetTiles 0x146C8, 16
	.4byte	2, 4

	mGetTiles 0x146D8, 16
	.4byte	2, 5

	mGetTiles 0x146E8, 16
	.4byte	2, 6

	mGetTiles 0x146F8, 16
	.4byte	2, 7

	mGetTiles 0x14708, 16
	.4byte	2, 8

	mGetTiles 0x14718, 16
	.4byte	2, 9

	mJumpBack 0x31

anim_data__0375_2:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x14728, 16
	mAnimCmd6 0x0, 0xA0AF6F6
	mAnimCmd6 0x1, 0xA0AF6F6
	.4byte	1, 10

	mGetTiles 0x14738, 20
	mAnimCmd6 0x0, 0xA06F0FA
	mAnimCmd6 0x1, 0xF0BF9F6
	.4byte	2, 11

	mGetTiles 0x1474C, 25
	.4byte	2, 12

	mGetTiles 0x14765, 25
	.4byte	2, 13

	mGetTiles 0x1477E, 30
	.4byte	2, 14

	mJumpBack 0xF


anim_0375:
	.4byte anim_data__0375_0
	.4byte anim_data__0375_1
	.4byte anim_data__0375_2
