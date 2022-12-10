

anim_data__0601_0:
	mGetPalette 0x75 16 0xB0
	mGetTiles 0x1B6F9 2
	.4byte	1, 0

	mAnimCmd4 

anim_data__0601_1:
	mGetPalette 0x75 16 0xB0
	mGetTiles 0x1B6FB 2
	.4byte	1, 1

	mAnimCmd4 


anim_0601:
	.4byte anim_data__0601_0
	.4byte anim_data__0601_1
