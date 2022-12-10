

anim_data__1021_0:
	mGetPalette 0x2C3 16 0x10
	mGetTiles 0x26F7B 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__1021_1:
	mGetPalette 0x2C3 16 0x10
	mGetTiles 0x26F8B 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__1021_2:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x26F9B 24
	.4byte	1, 2

	mAnimCmd4 


anim_1021:
	.4byte anim_data__1021_0
	.4byte anim_data__1021_1
	.4byte anim_data__1021_2
