
.align 2, 0
	anim_data__0841_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22A88 16
		.4byte	4, 0

		mGetTiles 0x22A98 16
		.4byte	4, 1

		mGetTiles 0x22AA8 16
		.4byte	4, 2

		mAnimCmd4 

	anim_data__0841_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22AB8 16
		.4byte	6, 3

		mGetTiles 0x22AC8 16
		.4byte	6, 4

		mGetTiles 0x22AD8 16
		.4byte	6, 5

		mGetTiles 0x22AE8 16
		.4byte	8, 6

		mGetTiles 0x22AF8 16
		.4byte	4, 7

		mGetTiles 0x22B08 16
		.4byte	4, 8

		mGetTiles 0x22B18 16
		.4byte	4, 9

		mGetTiles 0x22B28 16
		.4byte	4, 10

		mJumpBack 0x14

	anim_data__0841_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22AD8 16
		.4byte	4, 5

		mGetTiles 0x22B38 16
		.4byte	6, 11

		mGetTiles 0x22B48 20
		.4byte	6, 12

		mGetTiles 0x22B5C 16
		.4byte	6, 13

		mGetTiles 0x22B6C 16
		.4byte	6, 14

		mGetTiles 0x22B7C 12
		.4byte	1, 15

		mGetTiles 0x22B88 12
		.4byte	4, 16

		mGetTiles 0x22B7C 12
		.4byte	4, 15

		mJumpBack 0xA

	anim_data__0841_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22B94 12
		.4byte	6, 17

		mGetTiles 0x22BA0 12
		.4byte	6, 18

		mAnimCmd4 

	anim_data__0841_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22BAC 12
		.4byte	3, 19

		mGetTiles 0x22BB8 12
		.4byte	3, 20

		mGetTiles 0x22BC4 16
		.4byte	3, 21

		mGetTiles 0x22BD4 16
		.4byte	2, 22

		mGetTiles 0x22BE4 16
		.4byte	2, 23

		mGetTiles 0x22BF4 16
		.4byte	2, 24

		mJumpBack 0xF


.align 2, 0
	anim_0841:
		.4byte anim_data__0841_0
		.4byte anim_data__0841_1
		.4byte anim_data__0841_2
		.4byte anim_data__0841_3
		.4byte anim_data__0841_4
