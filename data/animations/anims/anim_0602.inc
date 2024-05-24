

anim_data__0602_0:
	mGetPalette 0x76, 16, 0xB0
	mGetTiles 0x1B6FD, 2
	.4byte	1, 0

	mAnimCmd4 

anim_data__0602_1:
	mGetPalette 0x76, 16, 0xB0
	mGetTiles 0x1B6FF, 1
	.4byte	1, 1

	mAnimCmd4 


anim_0602:
	.4byte anim_data__0602_0
	.4byte anim_data__0602_1
