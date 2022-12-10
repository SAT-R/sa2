
.align 2, 0
	anim_data__0641_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C02F 90
		mAnimCmd6 0x0 0xFB18C4E3
		mAnimCmd6 0x1 0x60BE4F3
		.4byte	4, 0

		mGetTiles 0x1C089 99
		.4byte	4, 1

		mGetTiles 0x1C0EC 99
		.4byte	4, 2

		mJumpBack 0x18

	anim_data__0641_1:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C14F 90
		mAnimCmd6 0x0 0xFB18C4E3
		mAnimCmd6 0x1 0x60BE4F3
		.4byte	4, 3

		mGetTiles 0x1C1A9 99
		.4byte	4, 4

		mGetTiles 0x1C20C 99
		.4byte	4, 5

		mJumpBack 0x18


.align 2, 0
	anim_0641:
		.4byte anim_data__0641_0
		.4byte anim_data__0641_1
