
.align 2, 0
	anim_data__0210_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB3C1 24
		mAnimCmd6 0x0 0x1006F4F6
		.4byte	3, 0

		mGetTiles 0xB3D9 20
		.4byte	8, 1

		mGetTiles 0xB3ED 20
		.4byte	8, 2

		mGetTiles 0xB401 20
		.4byte	8, 3

		mGetTiles 0xB415 20
		.4byte	8, 4

		mAnimCmd4 

	anim_data__0210_1:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xB429 20
		mAnimCmd6 0x0 0x1308F7F8
		.4byte	5, 5

		mGetTiles 0xB43D 16
		.4byte	5, 6

		mGetTiles 0xB44D 15
		.4byte	5, 7

		mGetTiles 0xB45C 16
		.4byte	5, 8

		mGetTiles 0xB46C 16
		.4byte	5, 9

		mAnimCmd4 

	anim_data__0210_2:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xB47C 20
		.4byte	2, 10

		mGetTiles 0xB490 25
		.4byte	2, 11

		mGetTiles 0xB4A9 20
		.4byte	2, 12

		mGetTiles 0xB4BD 20
		.4byte	2, 13

		mGetTiles 0xB4D1 20
		.4byte	2, 14

		mAnimCmd4 


.align 2, 0
	anim_0210:
		.4byte anim_data__0210_0
		.4byte anim_data__0210_1
		.4byte anim_data__0210_2
