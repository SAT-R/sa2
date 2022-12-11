

anim_data__0129_0:
	mGetPalette 0x7 16 0x20
	mGetTiles 0x75BA 12
	.4byte	4, 0

	mGetTiles 0x75C6 12
	.4byte	4, 1

	mGetTiles 0x75D2 12
	.4byte	4, 2

	mGetTiles 0x75C6 12
	.4byte	4, 1

	mJumpBack 0x17


anim_0129:
	.4byte anim_data__0129_0
