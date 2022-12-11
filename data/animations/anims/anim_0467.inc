

anim_data__0467_0:
	mGetPalette 0x27 16 0xE0
	mGetTiles 0x18244 6
	.4byte	3, 0

	mGetTiles 0x1824A 6
	.4byte	3, 1

	mGetTiles 0x18250 6
	.4byte	3, 2

	mGetTiles 0x18256 6
	.4byte	3, 3

	mGetTiles 0x1825C 6
	.4byte	3, 4

	mGetTiles 0x18262 6
	.4byte	3, 5

	mGetTiles 0x18268 6
	.4byte	3, 6

	mGetTiles 0x1826E 6
	.4byte	3, 7

	mJumpBack 0x2B


anim_0467:
	.4byte anim_data__0467_0
