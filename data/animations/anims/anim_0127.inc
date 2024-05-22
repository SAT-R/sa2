

anim_data__0127_0:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7537, 12
	.4byte	1, 0

	mAnimCmd4 

anim_data__0127_1:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7543, 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__0127_2:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7553, 16
	.4byte	1, 2

	mAnimCmd4 

anim_data__0127_3:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x7563, 12
	.4byte	1, 3

	mAnimCmd4 

anim_data__0127_4:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x756F, 15
	.4byte	1, 4

	mAnimCmd4 

anim_data__0127_5:
	mGetPalette 0x7, 16, 0x0
	mGetTiles 0x757E, 15
	.4byte	6, 5

	mGetTiles 0x758D, 15
	.4byte	6, 6

	mGetTiles 0x759C, 15
	.4byte	8, 7

	mGetTiles 0x75AB, 15
	.4byte	6, 8

	mGetTiles 0x757E, 15
	.4byte	6, 5

	mAnimCmd4 


anim_0127:
	.4byte anim_data__0127_0
	.4byte anim_data__0127_1
	.4byte anim_data__0127_2
	.4byte anim_data__0127_3
	.4byte anim_data__0127_4
	.4byte anim_data__0127_5
