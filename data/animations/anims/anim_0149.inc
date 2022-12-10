

anim_data__0149_0:
	mGetPalette 0x7 16 0x0
	mGetTiles 0x8227 20
	mAnimCmd6 0x0 0xA0AFAF6
	.4byte	5, 0

	mGetTiles 0x823B 16
	.4byte	5, 1

	mGetTiles 0x824B 20
	.4byte	5, 2

	mGetTiles 0x825F 16
	.4byte	5, 3

	mGetTiles 0x826F 20
	.4byte	5, 4

	mGetTiles 0x8283 16
	.4byte	5, 5

	mGetTiles 0x8293 20
	.4byte	5, 6

	mGetTiles 0x82A7 16
	.4byte	5, 7

	mJumpBack 0x2E


anim_0149:
	.4byte anim_data__0149_0
