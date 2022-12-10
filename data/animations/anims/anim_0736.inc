
.align 2, 0
	anim_data__0736_0:
		mGetPalette 0xA6 16 0x70
		mGetTiles 0x1DBF1 140
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0736_1:
		mGetPalette 0xA6 16 0x70
		mGetTiles 0x1DC7D 140
		.4byte	5, 1

		mGetTiles 0x1DD09 140
		.4byte	2, 2

		mGetTiles 0x1DD95 140
		.4byte	15, 3

		mAnimCmd4 

	anim_data__0736_2:
		mGetPalette 0xA7 16 0xB0
		mGetTiles 0x1DE21 91
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0736_3:
		mGetPalette 0xA7 16 0xB0
		mGetTiles 0x1DE7C 104
		.4byte	4, 5

		mGetTiles 0x1DEE4 117
		.4byte	4, 6

		mGetTiles 0x1DF59 130
		.4byte	4, 7

		mGetTiles 0x1DFDB 130
		.4byte	4, 8

		mGetTiles 0x1E05D 130
		.4byte	15, 9

		mAnimCmd4 

	anim_data__0736_4:
		mGetPalette 0xA8 16 0x80
		mGetTiles 0x1E0DF 130
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0736_5:
		mGetPalette 0xA8 16 0x80
		mGetTiles 0x1E161 130
		.4byte	4, 11

		mGetTiles 0x1E1E3 143
		.4byte	3, 12

		mGetTiles 0x1E272 144
		.4byte	3, 13

		mGetTiles 0x1E302 144
		.4byte	4, 14

		mGetTiles 0x1E392 144
		.4byte	15, 15

		mAnimCmd4 

	anim_data__0736_6:
		mGetPalette 0xA9 16 0x90
		mGetTiles 0x1E422 140
		.4byte	1, 16

		mAnimCmd4 

	anim_data__0736_7:
		mGetPalette 0xA9 16 0x90
		mGetTiles 0x1E4AE 140
		.4byte	4, 17

		mGetTiles 0x1E53A 140
		.4byte	3, 18

		mGetTiles 0x1E5C6 140
		.4byte	2, 19

		mGetTiles 0x1E652 140
		.4byte	15, 20

		mAnimCmd4 

	anim_data__0736_8:
		mGetPalette 0xAA 16 0xA0
		mGetTiles 0x1E6DE 130
		.4byte	1, 21

		mAnimCmd4 

	anim_data__0736_9:
		mGetPalette 0xAA 16 0xA0
		mGetTiles 0x1E760 130
		.4byte	4, 22

		mGetTiles 0x1E7E2 130
		.4byte	4, 23

		mGetTiles 0x1E864 130
		.4byte	4, 24

		mGetTiles 0x1E8E6 130
		.4byte	5, 25

		mGetTiles 0x1E968 130
		.4byte	15, 26

		mAnimCmd4 

	anim_data__0736_10:
		mGetPalette 0xAB 16 0xC0
		mGetTiles 0x1E9EA 35
		.4byte	1, 27

		mAnimCmd4 

	anim_data__0736_11:
		mGetPalette 0xAB 16 0xC0
		mGetTiles 0x1EA0D 35
		.4byte	3, 28

		mGetTiles 0x1EA30 35
		.4byte	3, 29

		mGetTiles 0x1EA53 35
		.4byte	3, 30

		mGetTiles 0x1EA76 35
		.4byte	2, 31

		mGetTiles 0x1EA99 35
		.4byte	15, 32

		mAnimCmd4 


.align 2, 0
	anim_0736:
		.4byte anim_data__0736_0
		.4byte anim_data__0736_1
		.4byte anim_data__0736_2
		.4byte anim_data__0736_3
		.4byte anim_data__0736_4
		.4byte anim_data__0736_5
		.4byte anim_data__0736_6
		.4byte anim_data__0736_7
		.4byte anim_data__0736_8
		.4byte anim_data__0736_9
		.4byte anim_data__0736_10
		.4byte anim_data__0736_11
