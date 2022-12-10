

anim_data__1075_0:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x28D64 48
	.4byte	1, 0

	mAnimCmd4 

anim_data__1075_1:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x28D94 48
	.4byte	1, 1

	mAnimCmd4 


anim_1075:
	.4byte anim_data__1075_0
	.4byte anim_data__1075_1
