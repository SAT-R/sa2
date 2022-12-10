
.align 2, 0
	anim_data__0158_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8A68 20
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	5, 0

		mGetTiles 0x8A7C 16
		.4byte	5, 1

		mGetTiles 0x8A8C 20
		.4byte	5, 2

		mGetTiles 0x8AA0 16
		.4byte	5, 3

		mGetTiles 0x8AB0 20
		.4byte	5, 4

		mGetTiles 0x8AC4 16
		.4byte	5, 5

		mGetTiles 0x8AD4 20
		.4byte	5, 6

		mGetTiles 0x8AE8 16
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0158:
		.4byte anim_data__0158_0
