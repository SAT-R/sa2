
.align 2, 0
	anim_data__0898_0:
		mGetPalette 0xFC 16 0x20
		.4byte	2, -1

		mGetPalette 0xFD 16 0x20
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0898:
		.4byte anim_data__0898_0
