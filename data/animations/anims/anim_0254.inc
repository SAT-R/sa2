
.align 2, 0
	anim_data__0254_0:
		mGetPalette 0x14 16 0x0
		mGetTiles 0xDF2B 25
		mAnimCmd6 0x0 0x406EEFA
		.4byte	3, 0

		mGetTiles 0xDF44 30
		mAnimCmd6 0x0 0x4FEEEF1
		.4byte	3, 1

		mGetTiles 0xDF62 25
		mAnimCmd6 0x0 0x4FCEEEC
		.4byte	3, 2

		mGetTiles 0xDF7B 20
		mAnimCmd6 0x0 0x4FEEEF0
		.4byte	3, 3

		mGetTiles 0xDF8F 25
		mAnimCmd6 0x0 0x406EEF8
		.4byte	3, 4

		mGetTiles 0xDFA8 30
		mAnimCmd6 0x0 0x412EE04
		.4byte	3, 5

		mGetTiles 0xDFC6 30
		mAnimCmd6 0x0 0x415EE06
		.4byte	3, 6

		mGetTiles 0xDFE4 25
		mAnimCmd6 0x0 0x412EE03
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0254:
		.4byte anim_data__0254_0
