
.align 2, 0
	anim_data__0897_0:
		mGetPalette 0xF4 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF5 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF6 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF7 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF8 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF9 16 0xD0
		.4byte	1, -1

		mGetPalette 0xFA 16 0xD0
		.4byte	1, -1

		mGetPalette 0xFB 16 0xD0
		.4byte	1, -1

		mJumpBack 0x28


.align 2, 0
	anim_0897:
		.4byte anim_data__0897_0
