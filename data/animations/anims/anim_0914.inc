
.align 2, 0
	anim_data__0914_0:
		mGetPalette 0x144 16 0x70
		.4byte	9, -1

		mGetPalette 0x145 16 0x70
		.4byte	9, -1

		mGetPalette 0x146 16 0x70
		.4byte	9, -1

		mGetPalette 0x147 16 0x70
		.4byte	9, -1

		mGetPalette 0x146 16 0x70
		.4byte	9, -1

		mGetPalette 0x145 16 0x70
		.4byte	9, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0914:
		.4byte anim_data__0914_0
