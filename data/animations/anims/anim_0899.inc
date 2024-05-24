

anim_data__0899_0:
	mGetPalette 0xFC, 16, 0x70
	.4byte	2, -1

	mGetPalette 0xFD, 16, 0x70
	.4byte	2, -1

	mJumpBack 0xA


anim_0899:
	.4byte anim_data__0899_0
