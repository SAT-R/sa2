
.align 2, 0
	anim_data__0937_0:
		mGetPalette 0x236 16 0x20
		.4byte	100, -1

		mGetPalette 0x237 16 0x20
		.4byte	15, -1

		mGetPalette 0x238 16 0x20
		.4byte	15, -1

		mGetPalette 0x239 16 0x20
		.4byte	100, -1

		mGetPalette 0x238 16 0x20
		.4byte	15, -1

		mGetPalette 0x237 16 0x20
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0937:
		.4byte anim_data__0937_0
