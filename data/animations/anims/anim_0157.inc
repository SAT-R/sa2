
.align 2, 0
	anim_data__0157_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8978 20
		mAnimCmd6 0x0 0xFE06E8FA
		.4byte	3, 0

		mGetTiles 0x898C 25
		.4byte	3, 1

		mGetTiles 0x89A5 20
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0157_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x89B9 20
		mAnimCmd6 0x0 0x6EAFA
		.4byte	3, 3

		mGetTiles 0x89CD 20
		.4byte	3, 4

		mGetTiles 0x89E1 15
		.4byte	3, 5

		mGetTiles 0x89F0 20
		.4byte	3, 6

		mGetTiles 0x8A04 25
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0157_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8A1D 25
		mAnimCmd6 0x0 0x406EEFA
		.4byte	3, 8

		mGetTiles 0x8A36 25
		.4byte	3, 9

		mGetTiles 0x8A4F 25
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0157:
		.4byte anim_data__0157_0
		.4byte anim_data__0157_1
		.4byte anim_data__0157_2
