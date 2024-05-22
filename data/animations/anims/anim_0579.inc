

anim_data__0579_0:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x1B026, 2
	.4byte	1, 0

	mAnimCmd4 

anim_data__0579_1:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x1B028, 1
	.4byte	1, 1

	mAnimCmd4 


anim_0579:
	.4byte anim_data__0579_0
	.4byte anim_data__0579_1
