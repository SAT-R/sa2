
.align 2, 0
	anim_data__0049_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2639 20
		mAnimCmd6 0x0 0xE06F0F8
		.4byte	2, 0

		mGetTiles 0x264D 20
		.4byte	4, 1

		mGetTiles 0x2661 28
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0049_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x267D 20
		mAnimCmd6 0x0 0xE06F0FA
		mAnimCmd6 0x1 0xE0EF0F2
		.4byte	1, 3

		mGetTiles 0x2691 20
		.4byte	1, 4

		mGetTiles 0x26A5 25
		.4byte	1, 5

		mGetTiles 0x26BE 30
		.4byte	1, 6

		mGetTiles 0x26DC 20
		.4byte	1, 7

		mGetTiles 0x26F0 20
		.4byte	1, 8

		mGetTiles 0x2704 25
		.4byte	1, 9

		mGetTiles 0x271D 25
		.4byte	1, 10

		mJumpBack 0x31

	anim_data__0049_2:
		mGetPalette 0x3 16 0x50
		mGetTiles 0x2736 32
		.4byte	1, 11

		mGetTiles 0x2756 32
		.4byte	1, 12

		mGetTiles 0x2776 32
		.4byte	1, 13

		mGetTiles 0x2796 32
		.4byte	1, 14

		mGetTiles 0x27B6 32
		.4byte	1, 15

		mGetTiles 0x27D6 32
		.4byte	1, 16

		mGetTiles 0x27F6 32
		.4byte	1, 17

		mGetTiles 0x2816 32
		.4byte	1, 18

		mJumpBack 0x2B


.align 2, 0
	anim_0049:
		.4byte anim_data__0049_0
		.4byte anim_data__0049_1
		.4byte anim_data__0049_2
