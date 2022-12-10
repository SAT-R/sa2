
.align 2, 0
	anim_data__0936_0:
		mGetPalette 0x232 16 0x10
		.4byte	100, -1

		mGetPalette 0x233 16 0x10
		.4byte	15, -1

		mGetPalette 0x234 16 0x10
		.4byte	15, -1

		mGetPalette 0x235 16 0x10
		.4byte	100, -1

		mGetPalette 0x234 16 0x10
		.4byte	15, -1

		mGetPalette 0x233 16 0x10
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0936:
		.4byte anim_data__0936_0
