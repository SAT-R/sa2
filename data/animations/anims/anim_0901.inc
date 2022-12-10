
.align 2, 0
	anim_data__0901_0:
		mGetPalette 0x101 16 0x90
		.4byte	3, -1

		mGetPalette 0x102 16 0x90
		.4byte	3, -1

		mGetPalette 0x103 16 0x90
		.4byte	3, -1

		mGetPalette 0x104 16 0x90
		.4byte	3, -1

		mGetPalette 0x105 16 0x90
		.4byte	3, -1

		mGetPalette 0x106 16 0x90
		.4byte	3, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0901:
		.4byte anim_data__0901_0
