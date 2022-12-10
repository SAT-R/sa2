
.align 2, 0
	anim_data__0456_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17DC4 9
		.4byte	3, 0

		mGetTiles 0x17DCD 9
		.4byte	3, 1

		mJumpBack 0xD


.align 2, 0
	anim_0456:
		.4byte anim_data__0456_0
