
.align 2, 0
	anim_data__0932_0:
		mGetPalette 0x222 16 0x20
		.4byte	100, -1

		mGetPalette 0x223 16 0x20
		.4byte	15, -1

		mGetPalette 0x224 16 0x20
		.4byte	15, -1

		mGetPalette 0x225 16 0x20
		.4byte	100, -1

		mGetPalette 0x224 16 0x20
		.4byte	15, -1

		mGetPalette 0x223 16 0x20
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0932:
		.4byte anim_data__0932_0
