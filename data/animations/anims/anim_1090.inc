

anim_data__1090_0:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x29C5F, 8
	.4byte	1, 0

	mAnimCmd4 

anim_data__1090_1:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x29C67, 10
	.4byte	1, 1

	mAnimCmd4 

anim_data__1090_2:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x29C71, 12
	.4byte	1, 2

	mAnimCmd4 


anim_1090:
	.4byte anim_data__1090_0
	.4byte anim_data__1090_1
	.4byte anim_data__1090_2
