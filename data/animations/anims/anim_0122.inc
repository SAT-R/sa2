
.align 2, 0
	anim_data__0122_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6E43 25
		.4byte	3, 0

		mGetTiles 0x6E5C 25
		.4byte	3, 1

		mGetTiles 0x6E75 25
		.4byte	3, 2

		mGetTiles 0x6E8E 16
		.4byte	3, 3

		mGetTiles 0x6E9E 25
		.4byte	3, 4

		mGetTiles 0x6EB7 25
		.4byte	3, 5

		mGetTiles 0x6ED0 25
		.4byte	3, 6

		mGetTiles 0x6EE9 20
		.4byte	3, 7

		mGetTiles 0x6E43 25
		.4byte	3, 0

		mGetTiles 0x6E5C 25
		.4byte	3, 1

		mGetTiles 0x6E75 25
		.4byte	3, 2

		mGetTiles 0x6E8E 16
		.4byte	3, 3

		mGetTiles 0x6E9E 25
		.4byte	3, 4

		mGetTiles 0x6EB7 25
		.4byte	3, 5

		mGetTiles 0x6ED0 25
		.4byte	3, 6

		mGetTiles 0x6EE9 20
		.4byte	3, 7

		mGetPalette 0x7 16 0x0
		mGetTiles 0x6EFD 16
		.4byte	2, 8

		mGetTiles 0x6F0D 20
		.4byte	2, 9

		mGetTiles 0x6F21 20
		.4byte	2, 10

		mAnimCmd4 

	anim_data__0122_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6F35 25
		.4byte	3, 11

		mGetTiles 0x6F4E 20
		.4byte	3, 12

		mGetTiles 0x6F62 25
		.4byte	3, 13

		mGetTiles 0x6F7B 20
		.4byte	3, 14

		mJumpBack 0x17

	anim_data__0122_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6F8F 20
		.4byte	2, 15

		mGetTiles 0x6FA3 16
		.4byte	2, 16

		mGetTiles 0x6FB3 16
		.4byte	4, 17

		mGetTiles 0x6FC3 16
		.4byte	2, 18

		mGetTiles 0x6FD3 16
		.4byte	2, 19

		mGetTiles 0x6FE3 16
		.4byte	4, 20

		mAnimCmd4 


.align 2, 0
	anim_0122:
		.4byte anim_data__0122_0
		.4byte anim_data__0122_1
		.4byte anim_data__0122_2
