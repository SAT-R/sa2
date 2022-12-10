
.align 2, 0
	anim_data__0140_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7851 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x7869 24
		.4byte	2, 1

		mGetTiles 0x7881 20
		.4byte	4, 2

		mGetTiles 0x7895 24
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0140_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x78AD 18
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 4

		mGetTiles 0x78BF 24
		.4byte	2, 5

		mGetTiles 0x78D7 30
		.4byte	2, 6

		mGetTiles 0x78F5 24
		.4byte	2, 7

		mGetTiles 0x790D 18
		.4byte	2, 8

		mGetTiles 0x791F 30
		.4byte	2, 9

		mGetTiles 0x793D 25
		.4byte	2, 10

		mGetTiles 0x7956 24
		.4byte	2, 11

		mJumpBack 0x2E


.align 2, 0
	anim_0140:
		.4byte anim_data__0140_0
		.4byte anim_data__0140_1
