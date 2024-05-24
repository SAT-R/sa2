

anim_data__0413_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x15DB6, 20
	mAnimCmd6 0x0, 0xA06F0FA
	.4byte	1, 0

	mGetTiles 0x15DCA, 25
	.4byte	2, 1

	mGetTiles 0x15DE3, 25
	.4byte	3, 2

	mGetTiles 0x15DFC, 25
	.4byte	1, 3

	mAnimCmd4 

anim_data__0413_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x15E15, 20
	mAnimCmd6 0x0, 0xA06F0FA
	mAnimCmd6 0x1, 0xA0EF0F2
	.4byte	2, 4

	mGetTiles 0x15E29, 20
	.4byte	2, 5

	mGetTiles 0x15E3D, 20
	.4byte	2, 6

	mGetTiles 0x15E51, 20
	.4byte	2, 7

	mGetTiles 0x15E65, 20
	.4byte	2, 8

	mGetTiles 0x15E79, 20
	.4byte	2, 9

	mGetTiles 0x15E8D, 20
	.4byte	2, 10

	mGetTiles 0x15EA1, 25
	.4byte	2, 11

	mJumpBack 0x31


anim_0413:
	.4byte anim_data__0413_0
	.4byte anim_data__0413_1
