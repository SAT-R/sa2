

anim_data__1048_0:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x27443, 20
	.4byte	1, 0

	mAnimCmd4 

anim_data__1048_1:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x27457, 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__1048_2:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x27467, 4
	.4byte	1, 2

	mAnimCmd4 

anim_data__1048_3:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x2746B, 6
	.4byte	1, 3

	mAnimCmd4 

anim_data__1048_4:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x27471, 6
	.4byte	1, 4

	mAnimCmd4 

anim_data__1048_5:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x27477, 6
	.4byte	1, 5

	mAnimCmd4 

anim_data__1048_6:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x2747D, 6
	.4byte	1, 6

	mAnimCmd4 

anim_data__1048_7:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x27483, 6
	.4byte	1, 7

	mAnimCmd4 

anim_data__1048_8:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x27489, 6
	.4byte	1, 8

	mAnimCmd4 

anim_data__1048_9:
	mGetPalette 0x2C5, 16, 0x0
	mGetTiles 0x2748F, 20
	.4byte	1, 9

	mAnimCmd4 


anim_1048:
	.4byte anim_data__1048_0
	.4byte anim_data__1048_1
	.4byte anim_data__1048_2
	.4byte anim_data__1048_3
	.4byte anim_data__1048_4
	.4byte anim_data__1048_5
	.4byte anim_data__1048_6
	.4byte anim_data__1048_7
	.4byte anim_data__1048_8
	.4byte anim_data__1048_9
