

anim_data__0583_0:
	mGetPalette 0x70 16 0xB0
	mGetTiles 0x1B0C2 2
	.4byte	1, 0

	mAnimCmd4 

anim_data__0583_1:
	mGetPalette 0x70 16 0xB0
	mGetTiles 0x1B0C4 1
	.4byte	1, 1

	mAnimCmd4 


anim_0583:
	.4byte anim_data__0583_0
	.4byte anim_data__0583_1
