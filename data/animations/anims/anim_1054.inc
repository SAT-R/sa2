

anim_data__1054_0:
	mGetPalette 0x2C8, 16, 0x60
	mGetTiles 0x27749, 24
	.4byte	1, 0

	mAnimCmd4 

anim_data__1054_1:
	mGetPalette 0x2C8, 16, 0x60
	mGetTiles 0x27761, 48
	.4byte	1, 1

	mAnimCmd4 

anim_data__1054_2:
	mGetPalette 0x2C8, 16, 0x60
	mGetTiles 0x27791, 36
	.4byte	1, 2

	mAnimCmd4 

anim_data__1054_3:
	mGetPalette 0x2C8, 16, 0x60
	mGetTiles 0x277B5, 32
	.4byte	1, 3

	mAnimCmd4 

anim_data__1054_4:
	mGetPalette 0x2C8, 16, 0x60
	mGetTiles 0x277D5, 8
	.4byte	1, 4

	mAnimCmd4 


anim_1054:
	.4byte anim_data__1054_0
	.4byte anim_data__1054_1
	.4byte anim_data__1054_2
	.4byte anim_data__1054_3
	.4byte anim_data__1054_4
