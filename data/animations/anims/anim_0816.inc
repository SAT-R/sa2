

anim_data__0816_0:
	mGetPalette 0xD2 16 0xD0
	mGetTiles 0x21B92 4
	.4byte	1, 0

	mAnimCmd4 

anim_data__0816_1:
	mGetPalette 0xD2 16 0xD0
	mGetTiles 0x21B96 4
	.4byte	1, 1

	mAnimCmd4 


anim_0816:
	.4byte anim_data__0816_0
	.4byte anim_data__0816_1
