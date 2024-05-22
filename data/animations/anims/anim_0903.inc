

anim_data__0903_0:
	mGetPalette 0x107, 16, 0x30
	.4byte	2, -1

	mGetPalette 0x108, 16, 0x30
	.4byte	2, -1

	mJumpBack 0xA


anim_0903:
	.4byte anim_data__0903_0
