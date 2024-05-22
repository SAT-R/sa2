

anim_data__1008_0:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26C45, 40
	.4byte	1, 0

	mAnimCmd4 

anim_data__1008_1:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26C6D, 40
	.4byte	1, 1

	mAnimCmd4 

anim_data__1008_2:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26C95, 40
	.4byte	1, 2

	mAnimCmd4 

anim_data__1008_3:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26CBD, 40
	.4byte	1, 3

	mAnimCmd4 

anim_data__1008_4:
	mGetPalette 0x2B1, 16, 0x60
	mGetTiles 0x26CE5, 30
	.4byte	1, 4

	mAnimCmd4 


anim_1008:
	.4byte anim_data__1008_0
	.4byte anim_data__1008_1
	.4byte anim_data__1008_2
	.4byte anim_data__1008_3
	.4byte anim_data__1008_4
