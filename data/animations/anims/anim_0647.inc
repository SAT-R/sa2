

anim_data__0647_0:
	mGetPalette 0x88, 16, 0x80
	mGetTiles 0x1C4AA, 9
	mAnimCmd6 0x0, 0x808F9F9
	.4byte	4, 0

	mGetTiles 0x1C4B3, 9
	.4byte	4, 1

	mGetTiles 0x1C4BC, 9
	.4byte	4, 2

	mGetTiles 0x1C4C5, 9
	.4byte	4, 3

	mJumpBack 0x1A


anim_0647:
	.4byte anim_data__0647_0
