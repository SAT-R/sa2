

anim_data__0941_0:
	mGetPalette 0x27D, 16, 0xF0
	.4byte	40, -1

	mGetPalette 0x27E, 16, 0xF0
	.4byte	7, -1

	mGetPalette 0x27F, 16, 0xF0
	.4byte	7, -1

	mGetPalette 0x280, 16, 0xF0
	.4byte	7, -1

	mGetPalette 0x281, 16, 0xF0
	.4byte	40, -1

	mGetPalette 0x280, 16, 0xF0
	.4byte	7, -1

	mGetPalette 0x27F, 16, 0xF0
	.4byte	7, -1

	mGetPalette 0x27E, 16, 0xF0
	.4byte	7, -1

	mJumpBack 0x28


anim_0941:
	.4byte anim_data__0941_0
