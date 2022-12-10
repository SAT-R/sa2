
.align 2, 0
	anim_data__0414_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15EBA 20
		mAnimCmd6 0x0 0xA06F0F8
		.4byte	1, 0

		mGetTiles 0x15ECE 20
		.4byte	2, 1

		mGetTiles 0x15EE2 20
		.4byte	2, 2

		mGetTiles 0x15EF6 16
		.4byte	3, 3

		mAnimCmd4 

	anim_data__0414_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15F06 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 4

		mGetTiles 0x15F1A 20
		.4byte	2, 5

		mGetTiles 0x15F2E 24
		.4byte	3, 6

		mGetTiles 0x15F46 15
		.4byte	2, 7

		mGetTiles 0x15F55 20
		.4byte	2, 8

		mGetTiles 0x15F69 20
		.4byte	2, 9

		mGetTiles 0x15F7D 24
		.4byte	2, 10

		mGetTiles 0x15F95 24
		.4byte	2, 11

		mGetTiles 0x15FAD 20
		.4byte	2, 12

		mGetTiles 0x15FC1 25
		.4byte	2, 13

		mGetTiles 0x15FDA 24
		.4byte	2, 14

		mGetTiles 0x15FF2 25
		.4byte	2, 15

		mGetTiles 0x1600B 20
		.4byte	2, 16

		mGetTiles 0x1601F 20
		.4byte	2, 17

		mGetTiles 0x16033 20
		.4byte	3, 18

		mGetTiles 0x16047 20
		.4byte	3, 19

		mGetTiles 0x1605B 20
		.4byte	3, 20

		mJumpBack 0xF


.align 2, 0
	anim_0414:
		.4byte anim_data__0414_0
		.4byte anim_data__0414_1
