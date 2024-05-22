

anim_data__0931_0:
	mGetPalette 0x21E, 16, 0x10
	.4byte	100, -1

	mGetPalette 0x21F, 16, 0x10
	.4byte	15, -1

	mGetPalette 0x220, 16, 0x10
	.4byte	15, -1

	mGetPalette 0x221, 16, 0x10
	.4byte	100, -1

	mGetPalette 0x220, 16, 0x10
	.4byte	15, -1

	mGetPalette 0x21F, 16, 0x10
	.4byte	15, -1

	mJumpBack 0x1E


anim_0931:
	.4byte anim_data__0931_0
