
.align 2, 0
	anim_data__0636_0:
		mGetPalette 0x87 16 0x90
		mGetTiles 0x1BD94 30
		.4byte	3, 0

		mGetTiles 0x1BDB2 36
		.4byte	2, 1

		mJumpBack 0xD


.align 2, 0
	anim_0636:
		.4byte anim_data__0636_0
