
.align 2, 0
	anim_data__0492_0:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198C1 20
		mAnimCmd6 0x0 0xFE7EF
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0492_1:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198C1 20
		mAnimCmd6 0x0 0xFE7EF
		.4byte	6, 0

		mGetTiles 0x198D5 15
		.4byte	6, 1

		mJumpBack 0x10

	anim_data__0492_2:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198E4 15
		mAnimCmd6 0x0 0xFE7EF
		.4byte	2, 2

		mGetTiles 0x198F3 20
		.4byte	2, 3

		mGetTiles 0x19907 25
		.4byte	2, 4

		mGetTiles 0x19920 25
		.4byte	2, 5

		mGetTiles 0x19939 25
		.4byte	2, 6

		mGetTiles 0x19952 25
		.4byte	2, 7

		mGetTiles 0x19939 25
		.4byte	2, 6

		mGetTiles 0x198F3 20
		.4byte	2, 3

		mGetTiles 0x198E4 15
		.4byte	2, 2

		mGetTiles 0x198C1 20
		.4byte	2, 0

		mGetTiles 0x198C1 20
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0492_3:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x1996B 25
		mAnimCmd6 0x0 0xFE7EF
		.4byte	2, 8

		mGetTiles 0x19984 25
		.4byte	2, 9

		mJumpBack 0x10

	anim_data__0492_4:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x1999D 20
		mAnimCmd6 0x0 0xFE7EF
		.4byte	2, 10

		mGetTiles 0x199B1 25
		.4byte	2, 11

		mGetTiles 0x199CA 30
		.4byte	2, 12

		mGetTiles 0x199E8 30
		.4byte	2, 13

		mGetTiles 0x19A06 30
		.4byte	2, 14

		mGetTiles 0x19A24 30
		.4byte	2, 15

		mGetTiles 0x19A06 30
		.4byte	2, 14

		mGetTiles 0x199B1 25
		.4byte	2, 11

		mGetTiles 0x1999D 20
		.4byte	2, 10

		mGetTiles 0x19984 25
		.4byte	2, 9

		mAnimCmd4 

	anim_data__0492_5:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x19A42 20
		mAnimCmd6 0x0 0xEE7F3
		.4byte	2, 16

		mGetTiles 0x19A56 20
		mAnimCmd6 0x0 0xDE7F2
		.4byte	2, 17

		mAnimCmd4 

	anim_data__0492_6:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x19A6A 25
		mAnimCmd6 0x0 0xEE7F3
		.4byte	2, 18

		mGetTiles 0x19A83 25
		mAnimCmd6 0x0 0xCE7F2
		.4byte	2, 19

		mAnimCmd4 


.align 2, 0
	anim_0492:
		.4byte anim_data__0492_0
		.4byte anim_data__0492_1
		.4byte anim_data__0492_2
		.4byte anim_data__0492_3
		.4byte anim_data__0492_4
		.4byte anim_data__0492_5
		.4byte anim_data__0492_6
