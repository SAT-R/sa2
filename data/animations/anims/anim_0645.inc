

anim_data__0645_0:
	mGetPalette 0x88, 16, 0x80
	mGetTiles 0x1C30A, 16
	.4byte	4, 0

	mGetTiles 0x1C31A, 16
	.4byte	4, 1

	mJumpBack 0xD


anim_0645:
	.4byte anim_data__0645_0
