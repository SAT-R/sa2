

anim_data__0449_0:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x1798D, 20
	.4byte	1, 0

	mAnimCmd4 

anim_data__0449_1:
	mGetPalette 0x1B, 16, 0x0
	mGetTiles 0x179A1, 20
	.4byte	1, 1

	mAnimCmd4 


anim_0449:
	.4byte anim_data__0449_0
	.4byte anim_data__0449_1
