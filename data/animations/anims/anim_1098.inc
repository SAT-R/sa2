

anim_data__1098_0:
	mGetPalette 0x2D9 16 0x0
	mGetTiles 0x2A32F 36
	.4byte	1, 0

	mAnimCmd4 

anim_data__1098_1:
	mGetPalette 0x2D7 16 0x10
	mGetTiles 0x2A353 36
	.4byte	1, 1

	mAnimCmd4 

anim_data__1098_2:
	mGetPalette 0x2D9 16 0x0
	mGetTiles 0x2A377 168
	.4byte	1, 2

	mAnimCmd4 

anim_data__1098_3:
	mGetPalette 0x2D9 16 0x0
	mGetTiles 0x2A41F 168
	.4byte	1, 3

	mAnimCmd4 


anim_1098:
	.4byte anim_data__1098_0
	.4byte anim_data__1098_1
	.4byte anim_data__1098_2
	.4byte anim_data__1098_3
