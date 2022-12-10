

anim_data__0487_0:
	mGetPalette 0x36 16 0xD0
	mGetTiles 0x1987F 4
	mAnimCmd6 0x0 0x504FDFC
	.4byte	4, 0

	mGetTiles 0x19883 4
	.4byte	4, 1

	mGetTiles 0x19887 4
	.4byte	4, 2

	mGetTiles 0x1988B 4
	.4byte	4, 3

	mJumpBack 0x1A


anim_0487:
	.4byte anim_data__0487_0
