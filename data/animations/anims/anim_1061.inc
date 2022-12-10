

anim_data__1061_0:
	mGetPalette 0x2CB 16 0x0
	mGetTiles 0x2818B 168
	.4byte	1, 0

	mAnimCmd4 

anim_data__1061_1:
	mGetPalette 0x2CB 16 0x0
	mGetTiles 0x28233 168
	.4byte	1, 1

	mAnimCmd4 

anim_data__1061_2:
	mGetPalette 0x2CB 16 0x0
	mGetTiles 0x282DB 168
	.4byte	1, 2

	mAnimCmd4 


anim_1061:
	.4byte anim_data__1061_0
	.4byte anim_data__1061_1
	.4byte anim_data__1061_2
