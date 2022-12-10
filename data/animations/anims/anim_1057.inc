

anim_data__1057_0:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27913 108
	.4byte	1, 0

	mAnimCmd4 

anim_data__1057_1:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x2797F 12
	.4byte	1, 1

	mAnimCmd4 

anim_data__1057_2:
	mGetPalette 0x2CA 16 0x10
	mGetTiles 0x2798B 8
	.4byte	1, 2

	mAnimCmd4 

anim_data__1057_3:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27993 168
	.4byte	1, 3

	mAnimCmd4 

anim_data__1057_4:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27A3B 168
	.4byte	1, 4

	mAnimCmd4 

anim_data__1057_5:
	mGetPalette 0x2C9 16 0x0
	mGetTiles 0x27AE3 168
	.4byte	1, 5

	mAnimCmd4 


anim_1057:
	.4byte anim_data__1057_0
	.4byte anim_data__1057_1
	.4byte anim_data__1057_2
	.4byte anim_data__1057_3
	.4byte anim_data__1057_4
	.4byte anim_data__1057_5
