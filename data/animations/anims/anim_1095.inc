

anim_data__1095_0:
	mGetPalette 0x2D6 16 0x0
	mGetTiles 0x29E75 34
	.4byte	1, 0

	mAnimCmd4 

anim_data__1095_1:
	mGetPalette 0x2D8 16 0x10
	mGetTiles 0x29E97 28
	.4byte	1, 1

	mAnimCmd4 

anim_data__1095_2:
	mGetPalette 0x2D6 16 0x0
	mGetTiles 0x29EB3 168
	.4byte	1, 2

	mAnimCmd4 

anim_data__1095_3:
	mGetPalette 0x2D6 16 0x0
	mGetTiles 0x29F5B 168
	.4byte	1, 3

	mAnimCmd4 


anim_1095:
	.4byte anim_data__1095_0
	.4byte anim_data__1095_1
	.4byte anim_data__1095_2
	.4byte anim_data__1095_3
