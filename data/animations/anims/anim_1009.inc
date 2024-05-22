

anim_data__1009_0:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26D03, 40
	.4byte	1, 0

	mAnimCmd4 

anim_data__1009_1:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26D2B, 40
	.4byte	1, 1

	mAnimCmd4 

anim_data__1009_2:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26D53, 40
	.4byte	1, 2

	mAnimCmd4 

anim_data__1009_3:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26D7B, 40
	.4byte	1, 3

	mAnimCmd4 

anim_data__1009_4:
	mGetPalette 0x2B1, 16, 0x60
	mGetTiles 0x26DA3, 28
	.4byte	1, 4

	mAnimCmd4 


anim_1009:
	.4byte anim_data__1009_0
	.4byte anim_data__1009_1
	.4byte anim_data__1009_2
	.4byte anim_data__1009_3
	.4byte anim_data__1009_4
