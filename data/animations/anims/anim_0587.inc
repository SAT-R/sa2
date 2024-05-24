

anim_data__0587_0:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1B236, 4
	.4byte	1, 0

	mAnimCmd4 

anim_data__0587_1:
	mGetPalette 0x63, 16, 0xB0
	mGetTiles 0x1B23A, 1
	.4byte	1, 1

	mAnimCmd4 


anim_0587:
	.4byte anim_data__0587_0
	.4byte anim_data__0587_1
