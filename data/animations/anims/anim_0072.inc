
.align 2, 0
	anim_data__0072_0:
		mGetPalette 0x4 16 0x0
		mGetTiles 0x4077 18
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	3, 0

		mGetTiles 0x4089 30
		mAnimCmd6 0x0 0x12FFF4EE
		.4byte	3, 1

		mGetTiles 0x40A7 30
		mAnimCmd6 0x0 0x12FAF4E8
		.4byte	3, 2

		mGetTiles 0x40C5 24
		mAnimCmd6 0x0 0x12FCF4EA
		.4byte	3, 3

		mGetTiles 0x40DD 24
		mAnimCmd6 0x0 0x1206F4F7
		.4byte	3, 4

		mGetTiles 0x40F5 24
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 5

		mGetTiles 0x410D 30
		mAnimCmd6 0x0 0x1218F406
		.4byte	3, 6

		mGetTiles 0x412B 24
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0072:
		.4byte anim_data__0072_0
