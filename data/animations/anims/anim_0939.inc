
.align 2, 0
	anim_data__0939_0:
		mGetPalette 0x23E 16 0x40
		.4byte	100, -1

		mGetPalette 0x23F 16 0x40
		.4byte	15, -1

		mGetPalette 0x240 16 0x40
		.4byte	15, -1

		mGetPalette 0x241 16 0x40
		.4byte	100, -1

		mGetPalette 0x240 16 0x40
		.4byte	15, -1

		mGetPalette 0x23F 16 0x40
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0939:
		.4byte anim_data__0939_0
