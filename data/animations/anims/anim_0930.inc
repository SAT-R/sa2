

anim_data__0930_0:
	mGetPalette 0x21A, 16, 0x0
	.4byte	100, -1

	mGetPalette 0x21B, 16, 0x0
	.4byte	15, -1

	mGetPalette 0x21C, 16, 0x0
	.4byte	15, -1

	mGetPalette 0x21D, 16, 0x0
	.4byte	100, -1

	mGetPalette 0x21C, 16, 0x0
	.4byte	15, -1

	mGetPalette 0x21B, 16, 0x0
	.4byte	15, -1

	mJumpBack 0x1E


anim_0930:
	.4byte anim_data__0930_0
