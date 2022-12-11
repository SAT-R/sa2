

anim_data__0913_0:
	mGetPalette 0x13F 16 0x60
	.4byte	9, -1

	mGetPalette 0x140 16 0x60
	.4byte	9, -1

	mGetPalette 0x141 16 0x60
	.4byte	9, -1

	mGetPalette 0x142 16 0x60
	.4byte	9, -1

	mGetPalette 0x143 16 0x60
	.4byte	9, -1

	mGetPalette 0x140 16 0x60
	.4byte	9, -1

	mJumpBack 0x1E


anim_0913:
	.4byte anim_data__0913_0
