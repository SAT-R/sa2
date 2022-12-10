
.align 2, 0
	anim_data__0938_0:
		mGetPalette 0x23A 16 0x30
		.4byte	100, -1

		mGetPalette 0x23B 16 0x30
		.4byte	15, -1

		mGetPalette 0x23C 16 0x30
		.4byte	15, -1

		mGetPalette 0x23D 16 0x30
		.4byte	100, -1

		mGetPalette 0x23C 16 0x30
		.4byte	15, -1

		mGetPalette 0x23B 16 0x30
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0938:
		.4byte anim_data__0938_0
