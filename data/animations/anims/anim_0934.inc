

anim_data__0934_0:
	mGetPalette 0x22A, 16, 0x40
	.4byte	100, -1

	mGetPalette 0x22B, 16, 0x40
	.4byte	15, -1

	mGetPalette 0x22C, 16, 0x40
	.4byte	15, -1

	mGetPalette 0x22D, 16, 0x40
	.4byte	100, -1

	mGetPalette 0x22C, 16, 0x40
	.4byte	15, -1

	mGetPalette 0x22B, 16, 0x40
	.4byte	15, -1

	mJumpBack 0x1E


anim_0934:
	.4byte anim_data__0934_0
