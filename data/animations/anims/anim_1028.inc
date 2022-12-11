

anim_data__1028_0:
	mGetPalette 0x2B2 16 0x50
	mGetTiles 0x27141 40
	.4byte	1, 0

	mAnimCmd4 

anim_data__1028_1:
	mGetPalette 0x2B3 16 0x0
	mGetTiles 0x27169 24
	.4byte	1, 1

	mAnimCmd4 


anim_1028:
	.4byte anim_data__1028_0
	.4byte anim_data__1028_1
