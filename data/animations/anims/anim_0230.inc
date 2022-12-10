
.align 2, 0
	anim_data__0230_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC22A 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC242 20
		.4byte	1, 1

		mGetTiles 0xC256 25
		.4byte	1, 2

		mGetTiles 0xC26F 20
		.4byte	8, 3

		mAnimCmd4 

	anim_data__0230_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC283 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	3, 4

		mGetTiles 0xC297 20
		.4byte	4, 5

		mGetTiles 0xC2AB 28
		.4byte	4, 6

		mGetTiles 0xC2C7 28
		.4byte	4, 7

		mGetTiles 0xC2E3 28
		.4byte	4, 8

		mJumpBack 0xF

	anim_data__0230_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC2FF 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 9

		mGetTiles 0xC317 25
		.4byte	4, 10

		mGetTiles 0xC330 25
		.4byte	4, 11

		mGetTiles 0xC349 35
		.4byte	3, 12

		mGetTiles 0xC36C 35
		.4byte	3, 13

		mGetTiles 0xC38F 35
		.4byte	3, 14

		mJumpBack 0xF


.align 2, 0
	anim_0230:
		.4byte anim_data__0230_0
		.4byte anim_data__0230_1
		.4byte anim_data__0230_2
