

anim_data__0909_0:
	mGetPalette 0x127 16 0x20
	.4byte	10, -1

	mGetPalette 0x128 16 0x20
	.4byte	10, -1

	mGetPalette 0x129 16 0x20
	.4byte	10, -1

	mJumpBack 0xF


anim_0909:
	.4byte anim_data__0909_0
