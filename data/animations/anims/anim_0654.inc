

anim_data__0654_0:
	mGetPalette 0x8B 16 0x80
	mGetTiles 0x1C6FE 4
	.4byte	2, 0

	mGetTiles 0x1C702 4
	.4byte	2, 1

	mJumpBack 0xD


anim_0654:
	.4byte anim_data__0654_0
