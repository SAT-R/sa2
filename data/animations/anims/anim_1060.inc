

anim_data__1060_0:
	mGetPalette 0x2CB 16 0x0
	mGetTiles 0x27F93 168
	.4byte	1, 0

	mAnimCmd4 

anim_data__1060_1:
	mGetPalette 0x2CB 16 0x0
	mGetTiles 0x2803B 168
	.4byte	1, 1

	mAnimCmd4 

anim_data__1060_2:
	mGetPalette 0x2CB 16 0x0
	mGetTiles 0x280E3 168
	.4byte	1, 2

	mAnimCmd4 


anim_1060:
	.4byte anim_data__1060_0
	.4byte anim_data__1060_1
	.4byte anim_data__1060_2
