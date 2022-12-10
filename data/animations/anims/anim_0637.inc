
.align 2, 0
	anim_data__0637_0:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BDD6 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0637_1:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BDDE 12
		.4byte	7, 1

		mGetTiles 0x1BDEA 12
		.4byte	7, 2

		mJumpBack 0xD

	anim_data__0637_2:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BDF6 8
		.4byte	6, 3

		mGetTiles 0x1BDFE 12
		.4byte	5, 4

		mJumpBack 0xD


.align 2, 0
	anim_0637:
		.4byte anim_data__0637_0
		.4byte anim_data__0637_1
		.4byte anim_data__0637_2
