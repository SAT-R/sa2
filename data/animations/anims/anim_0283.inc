
.align 2, 0
	anim_data__0283_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF74B 16
		mAnimCmd6 0x0 0x1206F4FA
		mAnimCmd6 0x1 0x1206F4FA
		.4byte	3, 0

		mGetTiles 0xF75B 16
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0283_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF76B 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0xF77B 16
		.4byte	2, 3

		mGetTiles 0xF78B 16
		.4byte	2, 4

		mGetTiles 0xF79B 16
		.4byte	2, 5

		mGetTiles 0xF7AB 16
		.4byte	2, 6

		mGetTiles 0xF7BB 16
		.4byte	2, 7

		mGetTiles 0xF7CB 16
		.4byte	2, 8

		mGetTiles 0xF7DB 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0283_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF7EB 25
		mAnimCmd6 0x0 0x406F0FA
		mAnimCmd6 0x1 0xE08F6F8
		.4byte	1, 10

		mGetTiles 0xF804 20
		.4byte	2, 11

		mGetTiles 0xF818 25
		.4byte	2, 12

		mGetTiles 0xF831 25
		.4byte	2, 13

		mJumpBack 0xF


.align 2, 0
	anim_0283:
		.4byte anim_data__0283_0
		.4byte anim_data__0283_1
		.4byte anim_data__0283_2
