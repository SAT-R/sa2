

anim_data__1052_0:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x2761F 24
	.4byte	1, 0

	mAnimCmd4 

anim_data__1052_1:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27637 42
	.4byte	1, 1

	mAnimCmd4 

anim_data__1052_2:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27661 36
	.4byte	1, 2

	mAnimCmd4 

anim_data__1052_3:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27685 30
	.4byte	1, 3

	mAnimCmd4 

anim_data__1052_4:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x276A3 8
	.4byte	1, 4

	mAnimCmd4 


anim_1052:
	.4byte anim_data__1052_0
	.4byte anim_data__1052_1
	.4byte anim_data__1052_2
	.4byte anim_data__1052_3
	.4byte anim_data__1052_4
