
.align 2, 0
	anim_data__0145_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7E47 16
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x7E57 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 1

		mGetTiles 0x7E6B 20
		.4byte	2, 2

		mGetTiles 0x7E7F 20
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0145_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7E93 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 4

		mGetTiles 0x7EA7 20
		.4byte	2, 5

		mGetTiles 0x7EBB 16
		.4byte	2, 6

		mGetTiles 0x7ECB 20
		.4byte	2, 7

		mGetTiles 0x7EDF 24
		.4byte	2, 8

		mGetTiles 0x7EF7 28
		.4byte	2, 9

		mGetTiles 0x7F13 28
		.4byte	2, 10

		mGetTiles 0x7F2F 28
		.4byte	2, 11

		mJumpBack 0xF


.align 2, 0
	anim_0145:
		.4byte anim_data__0145_0
		.4byte anim_data__0145_1
