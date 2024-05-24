

anim_data__0642_0:
	mGetPalette 0x88, 16, 0x80
	mGetTiles 0x1C26F, 45
	.4byte	1, 0

	mAnimCmd4 

anim_data__0642_1:
	mGetPalette 0x88, 16, 0x80
	mGetTiles 0x1C29C, 45
	.4byte	1, 1

	mAnimCmd4 


anim_0642:
	.4byte anim_data__0642_0
	.4byte anim_data__0642_1
