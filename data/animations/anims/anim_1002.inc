

anim_data__1002_0:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x26973 34
	.4byte	1, 0

	mAnimCmd4 

anim_data__1002_1:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x26995 30
	.4byte	1, 1

	mAnimCmd4 


anim_1002:
	.4byte anim_data__1002_0
	.4byte anim_data__1002_1
