
.align 2, 0
	anim_data__0890_0:
		mGetPalette 0xEE 16 0xB0
		mGetTiles 0x2430F 4
		.4byte	3, 0

		mGetTiles 0x24313 4
		.4byte	2, 1

		mJumpBack 0xD

	anim_data__0890_1:
		mGetPalette 0xEE 16 0xB0
		mGetTiles 0x24317 4
		.4byte	3, 2

		mGetTiles 0x2431B 4
		.4byte	2, 3

		mJumpBack 0xD

	anim_data__0890_2:
		mGetPalette 0xEE 16 0xB0
		mGetTiles 0x2431F 4
		.4byte	3, 4

		mGetTiles 0x24323 4
		.4byte	2, 5

		mJumpBack 0xD


.align 2, 0
	anim_0890:
		.4byte anim_data__0890_0
		.4byte anim_data__0890_1
		.4byte anim_data__0890_2
