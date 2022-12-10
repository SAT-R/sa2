
.align 2, 0
	anim_data__0837_0:
		mGetPalette 0xB2 16 0xA0
		mGetTiles 0x227C9 4
		.4byte	4, 0

		mGetTiles 0x227CD 4
		.4byte	4, 1

		mGetTiles 0x227D1 4
		.4byte	4, 2

		mGetTiles 0x227D5 4
		.4byte	4, 3

		mJumpBack 0x17

	anim_data__0837_1:
		mGetPalette 0xB2 16 0xA0
		mGetTiles 0x227D9 4
		.4byte	4, 4

		mGetTiles 0x227DD 4
		.4byte	4, 5

		mGetTiles 0x227E1 4
		.4byte	4, 6

		mGetTiles 0x227E5 4
		.4byte	4, 7

		mJumpBack 0x17

	anim_data__0837_2:
		mGetPalette 0xB3 16 0xB0
		mGetTiles 0x227E9 4
		.4byte	4, 8

		mGetTiles 0x227ED 4
		.4byte	4, 9

		mGetTiles 0x227F1 4
		.4byte	4, 10

		mGetTiles 0x227F5 4
		.4byte	4, 11

		mJumpBack 0x17

	anim_data__0837_3:
		mGetPalette 0xB3 16 0xB0
		mGetTiles 0x227F9 4
		.4byte	4, 12

		mGetTiles 0x227FD 4
		.4byte	4, 13

		mGetTiles 0x22801 4
		.4byte	4, 14

		mGetTiles 0x22805 4
		.4byte	4, 15

		mJumpBack 0x17

	anim_data__0837_4:
		mGetPalette 0xB4 16 0xC0
		mGetTiles 0x22809 4
		.4byte	4, 16

		mGetTiles 0x2280D 4
		.4byte	4, 17

		mGetTiles 0x22811 4
		.4byte	4, 18

		mGetTiles 0x22815 4
		.4byte	4, 19

		mJumpBack 0x17

	anim_data__0837_5:
		mGetPalette 0xB4 16 0xC0
		mGetTiles 0x22819 4
		.4byte	4, 20

		mGetTiles 0x2281D 4
		.4byte	4, 21

		mGetTiles 0x22821 4
		.4byte	4, 22

		mGetTiles 0x22825 4
		.4byte	4, 23

		mJumpBack 0x17

	anim_data__0837_6:
		mGetPalette 0xB1 16 0xD0
		mGetTiles 0x22829 4
		.4byte	4, 24

		mGetTiles 0x2282D 4
		.4byte	4, 25

		mGetTiles 0x22831 4
		.4byte	4, 26

		mGetTiles 0x22835 4
		.4byte	4, 27

		mJumpBack 0x17


.align 2, 0
	anim_0837:
		.4byte anim_data__0837_0
		.4byte anim_data__0837_1
		.4byte anim_data__0837_2
		.4byte anim_data__0837_3
		.4byte anim_data__0837_4
		.4byte anim_data__0837_5
		.4byte anim_data__0837_6
