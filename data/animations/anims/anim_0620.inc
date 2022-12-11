

anim_data__0620_0:
	mGetPalette 0x83 16 0xD0
	mGetTiles 0x1BB30 4
	.4byte	1, 0

	mJumpBack 0x8

anim_data__0620_1:
	mGetPalette 0x83 16 0xD0
	mGetTiles 0x1BB34 4
	.4byte	1, 1

	mJumpBack 0x8


anim_0620:
	.4byte anim_data__0620_0
	.4byte anim_data__0620_1
