

anim_data__0653_0:
	mGetPalette 0x8B, 16, 0x80
	mGetTiles 0x1C6DE, 16
	.4byte	2, 0

	mGetTiles 0x1C6EE, 16
	.4byte	2, 1

	mJumpBack 0xD


anim_0653:
	.4byte anim_data__0653_0
