

anim_data__1127_0:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB72, 4
	.4byte	1, 0

	mAnimCmd4 

anim_data__1127_1:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB76, 4
	.4byte	1, 1

	mAnimCmd4 

anim_data__1127_2:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB7A, 4
	.4byte	1, 2

	mAnimCmd4 

anim_data__1127_3:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB7E, 4
	.4byte	1, 3

	mAnimCmd4 

anim_data__1127_4:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB82, 4
	.4byte	1, 4

	mAnimCmd4 

anim_data__1127_5:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB86, 4
	.4byte	1, 5

	mAnimCmd4 

anim_data__1127_6:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB8A, 4
	.4byte	1, 6

	mAnimCmd4 

anim_data__1127_7:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB8E, 4
	.4byte	1, 7

	mAnimCmd4 

anim_data__1127_8:
	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB92, 4
	.4byte	1, 8

	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB96, 4
	.4byte	1, 9

	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB9A, 4
	.4byte	1, 10

	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BB9E, 4
	.4byte	1, 11

	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBA2, 4
	.4byte	1, 12

	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBA6, 4
	.4byte	1, 13

	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBAA, 4
	.4byte	1, 14

	mGetPalette 0xA3, 16, 0x60
	mGetTiles 0x2BBAE, 4
	.4byte	1, 15

	mJumpBack 0x40


anim_1127:
	.4byte anim_data__1127_0
	.4byte anim_data__1127_1
	.4byte anim_data__1127_2
	.4byte anim_data__1127_3
	.4byte anim_data__1127_4
	.4byte anim_data__1127_5
	.4byte anim_data__1127_6
	.4byte anim_data__1127_7
	.4byte anim_data__1127_8
