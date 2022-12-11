

anim_data__1087_0:
	mGetPalette 0x2D4 16 0x0
	mGetTiles 0x29ADC 75
	.4byte	1, 0

	mAnimCmd4 

anim_data__1087_1:
	mGetPalette 0x2D4 16 0x0
	mGetTiles 0x29B27 69
	.4byte	1, 1

	mAnimCmd4 

anim_data__1087_2:
	mGetPalette 0x2D5 16 0x10
	mGetTiles 0x29B6C 9
	.4byte	1, 2

	mAnimCmd4 

anim_data__1087_3:
	mGetPalette 0x2D4 16 0x0
	mGetTiles 0x29B75 15
	.4byte	1, 3

	mAnimCmd4 


anim_1087:
	.4byte anim_data__1087_0
	.4byte anim_data__1087_1
	.4byte anim_data__1087_2
	.4byte anim_data__1087_3
