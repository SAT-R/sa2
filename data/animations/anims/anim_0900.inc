
.align 2, 0
	anim_data__0900_0:
		mGetPalette 0xFE 16 0x0
		.4byte	20, -1

		mGetPalette 0xFF 16 0x0
		.4byte	20, -1

		mGetPalette 0x100 16 0x0
		.4byte	20, -1

		mJumpBack 0xF

	anim_data__0900_1:
		mGetPalette 0xFF 16 0x10
		.4byte	20, -1

		mGetPalette 0x100 16 0x10
		.4byte	20, -1

		mGetPalette 0xFE 16 0x10
		.4byte	20, -1

		mJumpBack 0xF

	anim_data__0900_2:
		mGetPalette 0x100 16 0x20
		.4byte	20, -1

		mGetPalette 0xFE 16 0x20
		.4byte	20, -1

		mGetPalette 0xFF 16 0x20
		.4byte	20, -1

		mJumpBack 0xF


.align 2, 0
	anim_0900:
		.4byte anim_data__0900_0
		.4byte anim_data__0900_1
		.4byte anim_data__0900_2
