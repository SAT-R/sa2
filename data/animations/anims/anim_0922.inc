
.align 2, 0
	anim_data__0922_0:
		mGetPalette 0x127 16 0x20
		.4byte	10, -1

		mGetPalette 0x128 16 0x20
		.4byte	10, -1

		mGetPalette 0x129 16 0x20
		.4byte	10, -1

		mJumpBack 0xF


.align 2, 0
	anim_0922:
		.4byte anim_data__0922_0
