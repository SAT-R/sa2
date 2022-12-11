

anim_data__1055_0:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x277DD 44
	.4byte	1, 0

	mAnimCmd4 

anim_data__1055_1:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27809 44
	.4byte	1, 1

	mAnimCmd4 

anim_data__1055_2:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x27835 38
	.4byte	1, 2

	mAnimCmd4 

anim_data__1055_3:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x2785B 32
	.4byte	1, 3

	mAnimCmd4 

anim_data__1055_4:
	mGetPalette 0x2C8 16 0x60
	mGetTiles 0x2787B 8
	.4byte	1, 4

	mAnimCmd4 


anim_1055:
	.4byte anim_data__1055_0
	.4byte anim_data__1055_1
	.4byte anim_data__1055_2
	.4byte anim_data__1055_3
	.4byte anim_data__1055_4
