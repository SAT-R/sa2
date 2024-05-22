

anim_data__0935_0:
	mGetPalette 0x22E, 16, 0x0
	.4byte	100, -1

	mGetPalette 0x22F, 16, 0x0
	.4byte	15, -1

	mGetPalette 0x230, 16, 0x0
	.4byte	15, -1

	mGetPalette 0x231, 16, 0x0
	.4byte	100, -1

	mGetPalette 0x230, 16, 0x0
	.4byte	15, -1

	mGetPalette 0x22F, 16, 0x0
	.4byte	15, -1

	mJumpBack 0x1E


anim_0935:
	.4byte anim_data__0935_0
