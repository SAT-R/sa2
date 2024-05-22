

anim_data__0905_0:
	mGetPalette 0xFC, 16, 0x60
	.4byte	2, -1

	mGetPalette 0xFD, 16, 0x60
	.4byte	2, -1

	mJumpBack 0xA


anim_0905:
	.4byte anim_data__0905_0
