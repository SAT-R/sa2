

anim_data__1023_0:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x26FF9, 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__1023_1:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x27009, 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__1023_2:
	mGetPalette 0x2B1, 16, 0x60
	mGetTiles 0x27019, 40
	.4byte	1, 2

	mAnimCmd4 


anim_1023:
	.4byte anim_data__1023_0
	.4byte anim_data__1023_1
	.4byte anim_data__1023_2
