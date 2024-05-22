

anim_data__0692_0:
	mGetPalette 0x96, 16, 0x80
	mGetTiles 0x1CED3, 4
	.4byte	10, 0

	mGetTiles 0x1CED7, 4
	.4byte	10, 1

	mJumpBack 0xD


anim_0692:
	.4byte anim_data__0692_0
