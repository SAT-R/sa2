

anim_data__0933_0:
	mGetPalette 0x226, 16, 0x30
	.4byte	100, -1

	mGetPalette 0x227, 16, 0x30
	.4byte	15, -1

	mGetPalette 0x228, 16, 0x30
	.4byte	15, -1

	mGetPalette 0x229, 16, 0x30
	.4byte	100, -1

	mGetPalette 0x228, 16, 0x30
	.4byte	15, -1

	mGetPalette 0x227, 16, 0x30
	.4byte	15, -1

	mJumpBack 0x1E


anim_0933:
	.4byte anim_data__0933_0
