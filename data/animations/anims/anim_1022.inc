

anim_data__1022_0:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26FB3 16
	.4byte	1, 0

	mAnimCmd4 

anim_data__1022_1:
	mGetPalette 0x2B0 16 0x10
	mGetTiles 0x26FC3 16
	.4byte	1, 1

	mAnimCmd4 

anim_data__1022_2:
	mGetPalette 0x2B1 16 0x60
	mGetTiles 0x26FD3 38
	.4byte	1, 2

	mAnimCmd4 


anim_1022:
	.4byte anim_data__1022_0
	.4byte anim_data__1022_1
	.4byte anim_data__1022_2
