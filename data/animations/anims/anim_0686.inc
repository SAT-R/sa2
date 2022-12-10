
.align 2, 0
	anim_data__0686_0:
		mGetPalette 0x8F 16 0x0
		.4byte	1, -1

		mGetPalette 0x90 16 0x0
		.4byte	1, -1

		mGetPalette 0x91 16 0x0
		.4byte	1, -1

		mGetPalette 0x92 16 0x0
		.4byte	1, -1

		mGetPalette 0x93 16 0x0
		.4byte	1, -1

		mGetPalette 0x94 16 0x0
		.4byte	1, -1

		mGetPalette 0x95 16 0x0
		.4byte	1, -1

		mJumpBack 0x23


.align 2, 0
	anim_0686:
		.4byte anim_data__0686_0
