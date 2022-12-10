
.align 2, 0
	anim_data__0946_0:
		mGetPalette 0x29D 16 0x80
		.4byte	10, -1

		mGetPalette 0x29E 16 0x80
		.4byte	10, -1

		mGetPalette 0x29F 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A0 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A1 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A2 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A3 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A4 16 0x80
		.4byte	10, -1

		mJumpBack 0x28


.align 2, 0
	anim_0946:
		.4byte anim_data__0946_0
