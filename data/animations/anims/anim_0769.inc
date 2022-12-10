
.align 2, 0
	anim_data__0769_0:
		mGetPalette 0xBC 16 0x0
		mGetTiles 0x1FC5C 24
		.4byte	3, 0

		mGetTiles 0x1FC74 24
		.4byte	3, 1

		mGetTiles 0x1FC8C 24
		.4byte	3, 2

		mJumpBack 0x12

	anim_data__0769_1:
		mGetPalette 0xBC 16 0x0
		mGetTiles 0x1FCA4 16
		.4byte	1, 3

		mGetTiles 0x1FCB4 16
		.4byte	1, 4

		mGetTiles 0x1FCC4 16
		.4byte	12, 5

		mGetTiles 0x1FCD4 16
		.4byte	2, 6

		mGetTiles 0x1FCE4 16
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0769:
		.4byte anim_data__0769_0
		.4byte anim_data__0769_1
