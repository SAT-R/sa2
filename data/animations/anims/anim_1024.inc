

anim_data__1024_0:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x27041, 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__1024_1:
	mGetPalette 0x2B0, 16, 0x10
	mGetTiles 0x27051, 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__1024_2:
	mGetPalette 0x2B1, 16, 0x60
	mGetTiles 0x27061, 36
	.4byte	1, 2

	mAnimCmd4 


anim_1024:
	.4byte anim_data__1024_0
	.4byte anim_data__1024_1
	.4byte anim_data__1024_2
