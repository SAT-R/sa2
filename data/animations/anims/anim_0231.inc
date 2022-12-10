
.align 2, 0
	anim_data__0231_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC3B2 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC3CA 25
		.4byte	2, 1

		mGetTiles 0xC3E3 20
		.4byte	2, 2

		mGetTiles 0xC3F7 20
		.4byte	2, 3

		mGetTiles 0xC40B 24
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0231_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC423 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 5

		mGetTiles 0xC437 20
		.4byte	1, 6

		mGetTiles 0xC44B 25
		.4byte	1, 7

		mGetTiles 0xC464 20
		.4byte	1, 8

		mGetTiles 0xC478 25
		.4byte	3, 9

		mGetTiles 0xC491 20
		.4byte	3, 10

		mGetTiles 0xC4A5 25
		.4byte	3, 11

		mGetTiles 0xC4BE 20
		.4byte	3, 12

		mGetTiles 0xC4D2 20
		.4byte	3, 13

		mGetTiles 0xC4E6 25
		.4byte	3, 14

		mGetTiles 0xC4FF 25
		.4byte	3, 15

		mGetTiles 0xC518 20
		.4byte	3, 16

		mJumpBack 0x28

	anim_data__0231_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC52C 25
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	3, 17

		mGetTiles 0xC545 30
		.4byte	3, 18

		mGetTiles 0xC563 30
		.4byte	3, 19

		mGetTiles 0xC581 30
		.4byte	3, 20

		mJumpBack 0xF


.align 2, 0
	anim_0231:
		.4byte anim_data__0231_0
		.4byte anim_data__0231_1
		.4byte anim_data__0231_2
