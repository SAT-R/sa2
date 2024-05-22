

anim_data__0664_0:
	mGetPalette 0x8C, 16, 0x80
	mGetTiles 0x1CA79, 8
	mAnimCmd6 0x0, 0xFD05EAFA
	.4byte	3, 0

	mGetTiles 0x1CA81, 8
	.4byte	3, 1

	mGetTiles 0x1CA89, 8
	.4byte	3, 2

	mGetTiles 0x1CA91, 8
	.4byte	3, 3

	mJumpBack 0x1A


anim_0664:
	.4byte anim_data__0664_0
