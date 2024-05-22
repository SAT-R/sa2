

anim_data__1029_0:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x27181, 40
	.4byte	1, 0

	mAnimCmd4 

anim_data__1029_1:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x271A9, 26
	.4byte	1, 1

	mAnimCmd4 


anim_1029:
	.4byte anim_data__1029_0
	.4byte anim_data__1029_1
